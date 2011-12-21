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
module derelict.ode.odemath;

private import derelict.ode.common;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

/*
 * 3-way dot product. dDOTpq means that elements of `a' and `b' are spaced
 * p and q indexes apart respectively. dDOT() means dDOT11.
 * in C++ we could use function templates to get all the versions of these
 * functions - but on some compilers this will result in sub-optimal code.
 */

dReal dDOTpq(in dReal* a, in dReal* b, in int p, in int q) {
    return a[0]*b[0] + a[p]*b[q] + a[2*p]*b[2*q];
}

dReal dDOT(in dReal* a, in dReal* b) { return dDOTpq(a,b,1,1); }
dReal dDOT13(in dReal* a, in dReal* b) { return dDOTpq(a,b,1,3); }
dReal dDOT31(in dReal* a, in dReal* b) { return dDOTpq(a,b,3,1); }
dReal dDOT33(in dReal* a, in dReal* b) { return dDOTpq(a,b,3,3); }
dReal dDOT14(in dReal* a, in dReal* b) { return dDOTpq(a,b,1,4); }
dReal dDOT41(in dReal* a, in dReal* b) { return dDOTpq(a,b,4,1); }
dReal dDOT44(in dReal* a, in dReal* b) { return dDOTpq(a,b,4,4); }


void dCROSS(dVector3 a, in dVector3 b, in dVector3 c) {
    a[0] = b[1]*c[2] - b[2]*c[1];
    a[1] = b[2]*c[0] - b[0]*c[2];
    a[2] = b[0]*c[1] - b[1]*c[0];
}
void dCROSSpqr(dVector3 a, in dVector3 b, in dVector3 c, in int p, in int q, in int r) {
    a[  0] = b[  q]*c[2*r] - b[2*q]*c[  r];
    a[  p] = b[2*q]*c[  0] - b[  0]*c[2*r];
    a[2*p] = b[  0]*c[  r] - b[  q]*c[  0];
}

dReal dDISTANCE(in dVector3 a, in dVector3 b) {
    return dSqrt( (a[0]-b[0])*(a[0]-b[0]) + (a[1]-b[1])*(a[1]-b[1]) + (a[2]-b[2])*(a[2]-b[2]) );
}

/*
 * function to access elements i,j in an NxM matrix A, independent of the
 * matrix storage convention.
 */
dReal dACCESS33(dReal* A, int i, int j) { return ((A)[(i)*4+(j)]); }

/*
 * functions to test for valid floating point values
 */
bool dVALIDVEC3(dReal* v) { return (!(dIsNan(v[0]) || dIsNan(v[1]) || dIsNan(v[2]))); }
bool dVALIDVEC4(dReal* v) { return (!(dIsNan(v[0]) || dIsNan(v[2]) || dIsNan(v[2]) || dIsNan(v[3]))); }
bool dVALIDMAT3(dReal* m) { return (!(dIsNan(m[0]) || dIsNan(m[1]) || dIsNan(m[2]) || dIsNan(m[3]) || dIsNan(m[4]) || dIsNan(m[5]) || dIsNan(m[6]) || dIsNan(m[7]) || dIsNan(m[8]) || dIsNan(m[9]) || dIsNan(m[10]) || dIsNan(m[11]))); }
bool dVALIDMAT4(dReal* m) { return (!(dIsNan(m[0]) || dIsNan(m[1]) || dIsNan(m[2]) || dIsNan(m[3]) || dIsNan(m[4]) || dIsNan(m[5]) || dIsNan(m[6]) || dIsNan(m[7]) || dIsNan(m[8]) || dIsNan(m[9]) || dIsNan(m[10]) || dIsNan(m[11]) || dIsNan(m[12]) || dIsNan(m[13]) || dIsNan(m[14]) || dIsNan(m[15]) )); }

void dMULTIPLYOP0_331(in dReal*A, in dReal*B, in dReal*C) {
    A[0] = dDOT(B,C);
    A[1] = dDOT((B+4),C);
    A[2] = dDOT((B+8),C);
}
alias dMULTIPLYOP0_331 dMULTIPLY0_331;

//==============================================================================
// FUNCTIONS
//==============================================================================
/* all user defined error functions have this type. error and debug functions
 * should not return.
 */
extern(C):

/*
 * normalize 3x1 and 4x1 vectors (i.e. scale them to unit length)
 */
typedef void function(dVector3 a) pfdNormalize3;
pfdNormalize3          dNormalize3;
typedef void function(dVector4 a) pfdNormalize4;
pfdNormalize4          dNormalize4;

/*
 * given a unit length "normal" vector n, generate vectors p and q vectors
 * that are an orthonormal basis for the plane space perpendicular to n.
 * i.e. this makes p,q such that n,p,q are all perpendicular to each other.
 * q will equal n x p. if n is not unit length then p will be unit length but
 * q wont be.
 */
typedef void function(dVector3 n, dVector3 p, dVector3 q) pfdPlaneSpace;
pfdPlaneSpace          dPlaneSpace;


