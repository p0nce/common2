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
module derelict.ode.rotation;

private import derelict.ode.common;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

//==============================================================================
// FUNCTIONS
//==============================================================================
extern(C):

/* set a vector/matrix of size n to all zeros, or to a specific value. */
typedef void function(dMatrix3 R) pfdRSetIdentity;
typedef void function(dMatrix3 R, dReal ax, dReal ay, dReal az, dReal angle) pfdRFromAxisAndAngle;
typedef void function(dMatrix3 R, dReal phi, dReal theta, dReal psi) pfdRFromEulerAngles;
typedef void function(dMatrix3 R, dReal ax, dReal ay, dReal az, dReal bx, dReal by, dReal bz) pfdRFrom2Axes;
typedef void function(dMatrix3 R, dReal ax, dReal ay, dReal az) pfdRFromZAxis;
typedef void function(dQuaternion q) pfdQSetIdentity;
typedef void function(dQuaternion q, dReal ax, dReal ay, dReal az, dReal angle) pfdQFromAxisAndAngle;
pfdRSetIdentity          dRSetIdentity;
pfdRFromAxisAndAngle     dRFromAxisAndAngle;
pfdRFromEulerAngles      dRFromEulerAngles;
pfdRFrom2Axes            dRFrom2Axes;
pfdRFromZAxis            dRFromZAxis;
pfdQSetIdentity          dQSetIdentity;
pfdQFromAxisAndAngle     dQFromAxisAndAngle;


/* Quaternion multiplication, analogous to the matrix multiplication routines. */
/* qa = rotate by qc, then qb */
typedef void function(dQuaternion qa, dQuaternion qb, dQuaternion qc) pfdQMultiply0;
pfdQMultiply0      dQMultiply0;

/* qa = rotate by qc, then by inverse of qb */
typedef void function(dQuaternion qa, dQuaternion qb, dQuaternion qc) pfdQMultiply1;
pfdQMultiply1      dQMultiply1;

/* qa = rotate by inverse of qc, then by qb */
typedef void function(dQuaternion qa, dQuaternion qb, dQuaternion qc) pfdQMultiply2;
pfdQMultiply2      dQMultiply2;

/* qa = rotate by inverse of qc, then by inverse of qb */
typedef void function(dQuaternion qa, dQuaternion qb, dQuaternion qc) pfdQMultiply3;
pfdQMultiply3      dQMultiply3;

typedef void function(dMatrix3 R, dQuaternion q) pfdRfromQ;
typedef void function(dQuaternion q, dMatrix3 R) pfdQfromR;
typedef void function(dReal dq[4], dVector3 w, dQuaternion q) pfdDQfromW;
pfdRfromQ      dRfromQ;
pfdQfromR      dQfromR;
pfdDQfromW     dDQfromW;

