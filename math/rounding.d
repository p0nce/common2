module math.rounding;


const ushort NOT_PROBLEMATIC_EXCEPTIONS = FPU_CW_EXCEPTION_MASK; // disable
//const ushort NOT_PROBLEMATIC_EXCEPTIONS = FPU_CW_INEXACT | FPU_CW_UNDERFLOW | FPU_CW_INVALID | FPU_CW_DENORMAL;



// FPU exceptions
const ushort FPU_CW_EXCEPTION_MASK = 0x003f,
            FPU_CW_INVALID = 0x0001,
            FPU_CW_DENORMAL = 0x0002,
            FPU_CW_ZERODIVIDE = 0x0004,
            FPU_CW_OVERFLOW = 0x0008,
            FPU_CW_UNDERFLOW = 0x0010,
            FPU_CW_INEXACT = 0x0020;

const ushort FPU_CW_PREC_MASK     = 0x0300;
const ushort FPU_CW_PREC_SINGLE   = 0x0000;
const ushort FPU_CW_PREC_DOUBLE   = 0x0200;
const ushort FPU_CW_PREC_EXTENDED = 0x0300;

const ushort FPU_CW_ROUND_MASK    = 0x0c00;
const ushort FPU_CW_ROUND_NEAR    = 0x0000;
const ushort FPU_CW_ROUND_DOWN    = 0x0400;
const ushort FPU_CW_ROUND_UP      = 0x0800;
const ushort FPU_CW_ROUND_CHOP    = 0x0c00;



// TODO : rounding real and double should give a long, not an int...


static ushort FPU_ROUND_TO_NEAREST = FPU_CW_ROUND_NEAR | FPU_CW_PREC_EXTENDED | NOT_PROBLEMATIC_EXCEPTIONS;
static ushort FPU_ROUND_TOWARD_MINUS_INFINITY = FPU_CW_ROUND_DOWN | FPU_CW_PREC_EXTENDED | NOT_PROBLEMATIC_EXCEPTIONS;
static ushort FPU_ROUND_TOWARD_PLUS_INFINITY = FPU_CW_ROUND_UP | FPU_CW_PREC_EXTENDED | NOT_PROBLEMATIC_EXCEPTIONS;
static ushort FPU_ROUND_TOWARD_ZERO = FPU_CW_ROUND_CHOP | FPU_CW_PREC_EXTENDED | NOT_PROBLEMATIC_EXCEPTIONS;


/+

static this()
{
    /**
     * Initialize
     */
    asm
    {
        fldcw FPU_ROUND_TOWARD_ZERO;
    }
}



/**
 * Rounds x to the nearest int.
 * Assumes round-to-nearest FPU mode.
 */
int round(float x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TO_NEAREST;
        fld x;
        fistp res;
    }
    return res;
}

/**
 * Rounds x to the nearest long.
 * Assumes round-to-nearest FPU mode.
 */
int round(double x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TO_NEAREST;
        fld x;
        fistp res;
    }
    return res;
}

/**
 * Rounds x to the nearest long.
 * Assumes round-to-nearest FPU mode.
 */
int round(real x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TO_NEAREST;
        fld x;
        fistp res;
    }
    return res;
}

/**
 * Rounds x towards zero.
 * Assumes round-to-nearest FPU mode.
 * Use SSE2 to speed up things.
 */
int trunc(float x)
{/*
    asm
    {
        movss XMM0, x;
        cvttss2si EAX, XMM0;
    }*/

    int res;
    asm
    {
        fldcw FPU_ROUND_TOWARD_ZERO;
        fld x;
        fstp res;
    //    fldcw FPU_ROUND_TO_NEAREST;
    }
    return res;
}

/**
 * Rounds x towards zero.
 * Assumes round-to-nearest FPU mode.
 */
int trunc(double x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TOWARD_ZERO;
        fld x;
        fstp dword ptr res;
    //    fldcw FPU_ROUND_TO_NEAREST;
    }
    return res;
}

/**
 * Rounds x towards zero.
 * Assumes round-to-nearest FPU mode.
 */
int trunc(real x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TOWARD_ZERO;
        fld x;
        fstp res;
    //    fldcw FPU_ROUND_TO_NEAREST;
    }
    return res;
}

/**
 * Rounds x towards zero.
 * Assumes round-to-nearest FPU mode.
 * Use SSE2 to speed up things.
 */
int floor(float x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TOWARD_MINUS_INFINITY;
        fld x;
        fstp res;
    //    fldcw FPU_ROUND_TO_NEAREST;
    }
    return res;
}

/**
 * Rounds x towards zero.
 * Assumes round-to-nearest FPU mode.
 */
int floor(double x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TOWARD_MINUS_INFINITY;
        fld x;
        fstp res;
    //    fldcw FPU_ROUND_TO_NEAREST;
    }
    return res;
}

/**
 * Rounds x towards zero.
 * Assumes round-to-nearest FPU mode.
 */
int floor(real x)
{
    int res;
    asm
    {
        fldcw FPU_ROUND_TOWARD_MINUS_INFINITY;
        fld x;
        fstp res;
    //    fldcw FPU_ROUND_TO_NEAREST;
    }
    return res;
}

int round(int x)
{
    return x;
}

int trunc(int x)
{
    return x;
}

int floor(int x)
{
    return x;
}
+/

/*
int round(T x)
{
    static if (!is(T : float))
    {
        return roundf(x);
    }
    static if (!is(T : double))
    {
        return roundd(x);
    }
    static if (!is(T : real))
    {
        return roundl(x);
    }
}

int trunc(T x)
{
    static if (!is(T : float))
    {
        return truncf(x);
    }
    static if (!is(T : double))
    {
        return truncd(x);
    }
    static if (!is(T : real))
    {
        return truncl(x);
    }
}

int floor(T x)
{
    static if (!is(T : float))
    {
        return floorf(x);
    }
    static if (!is(T : double))
    {
        return floord(x);
    }
    static if (!is(T : real))
    {
        return floorl(x);
    }
}
*/

/**
 * Rounds x to the nearest integer.
 */
int round(T)(T x)
{
    asm
    {
        fldcw FPU_ROUND_TO_NEAREST;
        fld x;
        sub ESP, 4;
        fistp dword ptr [ESP];
        pop EAX;
    }
}

/**
 * Rounds x to the nearest-to-0 integer.
 */
int trunc(T)(T x)
{
    asm
    {
        fldcw FPU_ROUND_TOWARD_ZERO;
        fld x;
        sub ESP, 4;
        fistp dword ptr [ESP];
        pop EAX;
    }
}

/**
 * Rounds x to the greatest smaller integer.
 */
int floor(T)(T x)
{
    asm
    {
        fldcw FPU_ROUND_TOWARD_MINUS_INFINITY;
        fld x;
        sub ESP, 4;
        fistp dword ptr [ESP];
        pop EAX;
    }
}

/**
 * Rounds x to the smallest greater integer.
 */
int ceil(T)(T x)
{
    asm
    {
        fldcw FPU_ROUND_TOWARD_PLUS_INFINITY;
        fld x;
        sub ESP, 4;
        fistp dword ptr [ESP];
        pop EAX;
    }
}

unittest
{
    assert(round(4.3) == 4);
    assert(round(4.7f) == 5);
    assert(round(0.f) == 0);
    assert(round(-10.6) == -11);
    assert(trunc(4.3) == 4);
    assert(trunc(4.3f) == 4);
    assert(floor(4.3) == 4);
    assert(floor(4.7f) == 4);
    assert(floor(0.f) == 0.f);
    assert(floor(-10.01) == -11);
}
