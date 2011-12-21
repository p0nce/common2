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
module derelict.ode.misc;

private
{
    import derelict.ode.common;

    version(Tango)
    {
        import tango.stdc.stdio;
    }
    else
    {
        import std.c.stdio;
    }
}

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

//==============================================================================
// FUNCTIONS
//==============================================================================

extern(C):

/* return 1 if the random number generator is working. */
typedef int function() pfdTestRand;
pfdTestRand          dTestRand;

/* return next 32 bit random number. this uses a not-very-random linear
 * congruential method.
 */
typedef ulong function() pfdRand;
pfdRand          dRand;

/* get and set the current random number seed. */
typedef ulong function() pfdRandGetSeed;
pfdRandGetSeed          dRandGetSeed;
typedef void function(ulong s) pfdRandSetSeed;
pfdRandSetSeed          dRandSetSeed;

/* return a random integer between 0..n-1. the distribution will get worse
 * as n approaches 2^32.
 */
typedef int function(int n) pfdRandInt;
pfdRandInt          dRandInt;

/* return a random real number between 0..1 */
typedef dReal function() pfdRandReal;
pfdRandReal          dRandReal;

/* print out a matrix */
typedef void function(dReal *A, int n, int m, char *fmt, FILE *f) pfdPrintMatrix;
pfdPrintMatrix          dPrintMatrix;

/* make a random vector with entries between +/- range. A has n elements. */
typedef void function(dReal *A, int n, dReal range) pfdMakeRandomVector;
pfdMakeRandomVector          dMakeRandomVector;

/* make a random matrix with entries between +/- range. A has size n*m. */
typedef void function(dReal *A, int n, int m, dReal range) pfdMakeRandomMatrix;
pfdMakeRandomMatrix          dMakeRandomMatrix;

/* clear the upper triangle of a square matrix */
typedef void function(dReal *A, int n) pfdClearUpperTriangle;
pfdClearUpperTriangle          dClearUpperTriangle;

/* return the maximum element difference between the two n*m matrices */
typedef dReal function(dReal *A, dReal *B, int n, int m) pfdMaxDifference;
pfdMaxDifference          dMaxDifference;

/* return the maximum element difference between the lower triangle of two
 * n*n matrices */
typedef dReal function(dReal *A, dReal *B, int n) pfdMaxDifferenceLowerTriangle;
pfdMaxDifferenceLowerTriangle          dMaxDifferenceLowerTriangle;

