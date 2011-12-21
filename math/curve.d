module util.geometry.curve;

// A generic curve providing different interpolation
// indexed with float

import math.common;

class Curve(T)
{
    public
    {
        enum Sampling
        {
            NEAREST,
            LINEAR,
            HERMITE
        }
    }

    private
    {
        Vector!(T) m_points; // not especially points, could be vecX, matX, quat...

        int clampIndex(int i)
        {
            return max(0, min(i, m_points.size - 1));
        }


    }

    public
    {
        this()
        {
            m_points = new Vector!(T);
        }

        this(T[] a)
        {
            this();
            m_points.addArray(a);
        }

        this(Vector!(T) v)
        {
            this();
            m_points.addAll(v);
        }

        Vector!(T) points()
        {
            return m_points;
        }

        // x is a float index clamped to [0..count-1]
        T sample(float x, Sampling sampling)
        {
            switch(sampling)
            {
                case Sampling.LINEAR:
                {
                    final int i_part = trunc(x);
                    final float f_part = x - i_part;
                    final auto d1 = m_points[clampIndex(i_part)];
                    final auto d2 = m_points[clampIndex(i_part + 1)];
                    return d1 * (1.f - f_part) + d2 * f_part;
                }

                case Sampling.HERMITE:
                {
                    final int i_part = trunc(x);
                    final float f_part = x - i_part;
                    final T xm1 = m_points[clampIndex(i_part - 1)];
                    final T x0 = m_points[clampIndex(i_part + 0)];
                    final T x1 = m_points[clampIndex(i_part + 1)];
                    final T x2 = m_points[clampIndex(i_part + 2)];
                    return hermite(f_part, xm1, x0, x1, x2);
                }

                case Sampling.NEAREST:
                default:
                {
                    return m_points[clampIndex(round(x))];
                }
            }
        }

        T sampleSecure(float x, Sampling sampling)
        {
            if (x < 0.f) x = 0.f;
            auto max = m_points.length - (1 + 1e-7);
            if (x > max) x = max;
            return sample(x, sampling);
        }

        int length()
        {
            return m_points.size();
        }

        T * ptr()
        {
            return m_points.ptr();
        }

    }
}

alias Curve!(float) Curvef;
alias Curve!(double) Curved;
alias Curve!(real) CurveL;
