module math.torus3;

import math.vec3;
import math.ray;
import math.common;
import math.mat3;
import math.rootsolver;
import misc.logger;


/* ----    inttor - Intersect a ray with a torus. ------------------------    */
/*                                    */
/*                                    */
/*    Description:                            */
/*        Inttor determines the intersection of a ray with a torus.    */
/*                                    */
/*    On entry:                            */
/*        raybase = The coordinate defining the base of the        */
/*              intersecting ray.                    */
/*        raycos  = The direction cosines of the above ray.        */
/*        center  = The center location of the torus.            */
/*        radius  = The major radius of the torus.            */
/*        rplane  = The minor radius in the plane of the torus.    */
/*        rnorm   = The minor radius normal to the plane of the torus.*/
/*        tran    = A 4x4 transformation matrix that will position    */
/*              the torus at the origin and orient it such that    */
/*              the plane of the torus lyes in the x-z plane.    */
/*                                    */
/*    On return:                            */
/*        nhits   = The number of intersections the ray makes with    */
/*              the torus.                    */
/*        rhits   = The entering/leaving distances of the        */
/*              intersections.                    */
/*                                    */
/*    Returns:  True if the ray intersects the torus.            */
/*                                    */
/* --------------------------------------------------------------------    */

// 3D torus, centered in zero, perpendicular to the Z axis
struct torus3(T)
{
    public
    {
        T majorRadius;
        T minorRadiusNorm;
        T minorRadiusPlane;

        static torus3 opCall(T majorRadius, T minorRadiusNorm, T minorRadiusPlane)
        {
            torus3 r = void;
            r.majorRadius = majorRadius;
            r.minorRadiusNorm = minorRadiusNorm;
            r.minorRadiusPlane = minorRadiusPlane;
            return r;
        }
/*
        vec3!(T) normalAtPoint(vec3f n)
        {
        //    phi = atan2(

        //    vec3!(T) p = vec3!(T)(cos(theta) / minorRadiusPlane, 0, sin(theta) / minorRadiusNorm);
        //    return mat3!(T).rotateZ(phi) * p;
        }
*/
        vec3!(T) point(T theta, T phi)
        {
            vec3!(T) p = vec3!(T)(minorRadiusPlane * cos(theta) + majorRadius, 0, minorRadiusNorm * sin(theta));
            return mat3!(T).rotateZ(phi) * p;
        }

        vec3!(T) normal(T theta, T phi)
        {
            vec3!(T) p = vec3!(T)(cos(theta) / minorRadiusPlane , 0, sin(theta) / minorRadiusNorm );
            return mat3!(T).rotateZ(phi) * p;
        }

        /**
         * Return the nearest itnersection with the torus.
         */
        bool hit(ray!(T) r, out T distance, out vec3!(T) point, out vec3!(T) normal)
        {
            vec3!(T) raybase = r.start;
            vec3!(T) raycos = r.dir;
            double radius = majorRadius;
            double rplane = minorRadiusPlane;
            double rnorm = minorRadiusNorm;


        //    int    hit;            /* True if ray intersects torus    */
        //    double    rsphere;        /* Bounding sphere radius    */
        //    Vector3    Base, Dcos;        /* Transformed intersection ray    */
        //    double    rmin, rmax;        /* Root bounds            */
        //    double    yin, yout;
        //    double    rho, a0, b0;        /* Related constants        */
        //    double    f, l, t, g, q, m, u;    /* Ray dependent terms        */
        //    double    C[5];            /* Quartic coefficients        */

            int    intsph(vec3!(T) raybase, vec3!(T) raycos, vec3!(T) center, double radius, out double rin, out double rout)
            {
                double dx   = raybase.x - center.x;
                double dy   = raybase.y - center.y;
                double dz   = raybase.z - center.z;
                double bsq  = dx*raycos.x + dy*raycos.y + dz*raycos.z;
                double u    = dx*dx + dy*dy + dz*dz - radius*radius;
                double disc = bsq*bsq - u;

                int hit = (disc >= 0.0 ? 1 : 0);

                if  (hit != 0)
                {                 /* If ray hits sphere    */
                    double root = sqrt(disc);
                    rin  = -bsq - root;        /*    entering distance    */
                    rout = -bsq + root;        /*    leaving distance    */
                }

                return (hit);
            }



            /*    Compute the intersection of the ray with a bounding sphere.    */

            double rmin, rmax;
            double rsphere = radius + max(rplane,rnorm);
            int hit = intsph(raybase,raycos, vec3!(T)(0),rsphere, rmin, rmax);

            if  (hit == 0) return false;

            //*nhits  = 0;

            vec3!(T) Base = raybase;
            vec3!(T) Dcos = raycos;

            //    Bound the torus by two parallel planes rnorm from the x-z plane.

            {
                double yin  = Base.y + rmin * Dcos.y;
                double yout = Base.y + rmax * Dcos.y;

                bool hitb = !( ( (yin >  rnorm) && (yout >  rnorm) )
                            || ((yin < -rnorm) && (yout < -rnorm) ) );

                if  (!hitb) return false;
            }

            // Compute constants related to the torus.

            double rho = rplane * rplane / (rnorm * rnorm);
            double a0 = 4.0 * radius * radius;
            double b0 = radius * radius - rplane * rplane;

            // Compute ray dependent terms.

            double f = 1.0 - Dcos.y * Dcos.y;
            double l = 2.0 * (Base.x * Dcos.x + Base.z * Dcos.z);
            double t = Base.x * Base.x + Base.z * Base.z;
            double g = f + rho * Dcos.y * Dcos.y;
            double q = a0 / (g * g);
            double m = (l + 2.0 * rho * Dcos.y * Base.y) / g;
            double u = (t + rho * Base.y * Base.y + b0) / g;

            double[5] C;
            double[4] rhits;

            // Compute the coefficients of the quartic.

            C[4] = 1.0;
            C[3] = 2.0 * m;
            C[2] = m * m + 2.0 * u - q * f;
            C[1] = 2.0 * m * u - q * l;
            C[0] = u * u - q * t;

            // Use quartic root solver found in "Graphics Gems" by Jochen Schwarze.

            int nhits = solveQuartic (C.ptr, rhits.ptr);

            /* SolveQuartic returns root pairs in reversed order. */
            m = rhits[0]; u = rhits[1]; rhits[0] = u; rhits[1] = m;
            m = rhits[2]; u = rhits[3]; rhits[2] = u; rhits[3] = m;

            // retrieve the smaller > 0

            T best = T.infinity;
            bool found = false;
            for (int i = 0; i < nhits; ++i)
            {
                if ((rhits[i] > 0) && (rhits[i] < best))
                {
                    best = rhits[i];
                    found = true;
                }
            }

            if (found)
            {
                distance = best;
                point = r.progress(distance);
            //    normalAtPoint(point);
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}

alias torus3!(float) torus3f;
alias torus3!(double) torus3d;
