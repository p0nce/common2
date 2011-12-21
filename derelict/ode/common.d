/*
 * Copyright (c) 2004-2008 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictODE', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.ode.common;

private
{
    version(Tango)
    {
        import tango.stdc.math;
    }
    else
    {
        import std.math;
    }
}

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 * ODE Version 0.8
 */

/*
 * The ODE library could have been compiled with float or double defined for dReal.
 * The default is to use doubles.
 * Note: Something to consider is alignment between C and D. Gregor Richards
 * clued me in to the idea that C compilers may have aligned doubles differently
 * than the default D configuration. In light of this some structures need to
 * have the alignment explicity stated as done below to the dJointFeedback
 * structure.
 */

// floating point data type, vector, matrix and quaternion types
version (DerelictODE_DoublePrecision) {
    alias double dReal;
    //pragma(msg, "Using Double Precision");
} else version (DerelictODE_SinglePrecision) {
    alias float dReal;
} else {
    alias double dReal;
}

/* round an integer up to a multiple of 4, except that 0 and 1 are unmodified
 * (used to compute matrix leading dimensions)
 */
int dPAD(int a) { return (((a) > 1) ? ((((a)-1)|3)+1) : (a)); }

/* these types are mainly just used in headers */
typedef dReal[4] dVector3;
typedef dReal[4] dVector4;
typedef dReal[4*3] dMatrix3;
typedef dReal[4*4] dMatrix4;
typedef dReal[8*6] dMatrix6;
alias dVector4 dQuaternion;

//==============================================================================
// MACROS
//==============================================================================
/* scalar math functions */
dReal dRecip(dReal x) { return ((1.0/(x))); }              /* reciprocal */
dReal dSqrt(dReal x) { return (sqrt(x)); }                 /* square root */
dReal dRecipSqrt(dReal x) { return ((1.0/sqrt(x))); }      /* reciprocal square root */
dReal dSin(dReal x) { return (sin(x)); }                   /* sine */
dReal dCos(dReal x) { return (cos(x)); }                   /* cosine */
dReal dFabs(dReal x) { return (fabs(x)); }                 /* absolute value */
dReal dAtan2(dReal y, dReal x) { return (atan2(y,x)); } /* arc tangent with 2 args */

dReal dFMod(dReal a, dReal b)
{
    version(Tango)
    {
        return modf(a,&b);
    }
    else
    {
        real c;
        return modf(a,c);
    }

}

dReal dIsNan(dReal x) { return (isnan(x)); }
dReal dCopySign(dReal a, dReal b) { return (copysign(a,b)); }

/* internal object types (all prefixed with `dx') */
private {

    struct dxWorld {}       /* dynamics world */
    struct dxSpace {}       /* collision space */
    struct dxBody {}        /* rigid body (dynamics object) */
    struct dxGeom {}        /* geometry (collision object) */
    struct dxJoint {}
    struct dxJointNode {}
    struct dxJointGroup {}
}

typedef dxWorld* dWorldID;
typedef dxSpace* dSpaceID;
typedef dxBody* dBodyID;
typedef dxGeom* dGeomID;
typedef dxJoint* dJointID;
typedef dxJointGroup* dJointGroupID;

/* error numbers */
enum {
    d_ERR_UNKNOWN = 0,  /* unknown error */
    d_ERR_IASSERT,      /* internal assertion failed */
    d_ERR_UASSERT,      /* user assertion failed */
    d_ERR_LCP           /* user assertion failed */
}

/* joint type numbers */
enum {
    dJointTypeNone = 0,     /* or "unknown" */
    dJointTypeBall,
    dJointTypeHinge,
    dJointTypeSlider,
    dJointTypeContact,
    dJointTypeUniversal,
    dJointTypeHinge2,
    dJointTypeFixed,
    dJointTypeNull,
    dJointTypeAMotor,
    dJointTypeLMotor,
    dJointTypePlane2D,
    dJointTypePR    // added in 0.8
}

/* standard joint parameter names. */
enum {
    /* parameters for limits and motors */
    dParamLoStop = 0,
    dParamHiStop,
    dParamVel,
    dParamFMax,
    dParamFudgeFactor,
    dParamBounce,
    dParamCFM,
    dParamStopERP,
    dParamStopCFM,
    /* parameters for suspension */
    dParamSuspensionERP,
    dParamSuspensionCFM,

    dParamLoStop2 = 0x100,
    dParamHiStop2,
    dParamVel2,
    dParamFMax2,
    dParamFudgeFactor2,
    dParamBounce2,
    dParamCFM2,
    dParamStopERP2,
    dParamStopCFM2,
    /* parameters for suspension */
    dParamSuspensionERP2,
    dParamSuspensionCFM2,

    dParamLoStop3 = 0x200,
    dParamHiStop3,
    dParamVel3,
    dParamFMax3,
    dParamFudgeFactor3,
    dParamBounce3,
    dParamCFM3,
    dParamStopERP3,
    dParamStopCFM3,
    /* parameters for suspension */
    dParamSuspensionERP3,
    dParamSuspensionCFM3,

    /*
     * add a multiple of this constant to the basic parameter numbers to get
     * the parameters for the second, third etc axes.
     */
    dParamGroup = 0x100
}

/* angular motor mode numbers */
enum {
    dAMotorUser = 0,
    dAMotorEuler = 1
}

/* joint force feedback information */
version (DerelictODE_DoublePrecision) {
    align(4):
}
struct dJointFeedback {
    dVector3 f1;        /* force applied to body 1 */
    dVector3 t1;        /* torque applied to body 1 */
    dVector3 f2;        /* force applied to body 2 */
    dVector3 t2;        /* torque applied to body 2 */
}

