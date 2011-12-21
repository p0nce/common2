module math.vectorop;

// common code to vec2, vec3 and vec4. Used as a mixin

import math.common : sqrt, abs;

template VectorOp(T, alias V)
{
    alias typeof(*this) VEC;

    public
    {
        final T * ptr()
        {
            return V.ptr;
        }

        VEC dup()
        {
            return *this; // because vectors are value types
        }

        T opIndex(size_t index)
        {
            return v[index];
        }

        T opIndexAssign(T value, size_t index)
        {
            return v[index] = value;
        }

        final T squaredLength()
        {
            T res = 0;
            for (int i = 0; i < V.length; i++)
            {
                res += ( V[i] * V[i] );
            }
            return res;
        }

        final T squaredDistanceTo(VEC v)
        {
            VEC u = v - *this;
            return u.squaredLength();
        }

        final T dot(VEC u)
        {
            T res = 0;
            for (int i = 0; i < V.length; i++)
            {
                res += ( V[i] * u[i]);
            }
            return res;
        }

        static if (is(T : float) || is(T : double)  || is(T : real) ) // make no sense on integers
        {
            final T length()
            {
                return cast(T) sqrt( squaredLength() );
            }

            final void normalize() // TODO : use SSE to optimize
            {
                T l2 = length();
                T rsqrt = 1 / l2;
                *this *= rsqrt;
            }

            final VEC normalized()
            {
                VEC v = *this;
                v.normalize();
                return v;
            }

            final T distanceTo(VEC v)
            {
                return cast(T) sqrt(squaredDistanceTo(v));
            }
        }
    }
}
