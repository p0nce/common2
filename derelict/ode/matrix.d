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
module derelict.ode.matrix;

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
typedef void function(dReal* a, int n) pfdSetZero;
typedef void function(dReal* a, int n, dReal value) pfdSetValue;
pfdSetZero       dSetZero;
pfdSetValue      dSetValue;

/* get the dot product of two n*1 vectors. if n <= 0 then
 * zero will be returned (in which case a and b need not be valid).
 */
typedef dReal function(dReal* a, dReal* b, int n) pfdDot;
pfdDot       dDot;

/* matrix multiplication. all matrices are stored in standard row format.
 * the digit refers to the argument that is transposed:
 *   0:   A = B  * C   (sizes: A:p*r B:p*q C:q*r)
 *   1:   A = B' * C   (sizes: A:p*r B:q*p C:q*r)
 *   2:   A = B  * C'  (sizes: A:p*r B:p*q C:r*q)
 * case 1,2 are equivalent to saying that the operation is A=B*C but
 * B or C are stored in standard column format.
 */
typedef void function(dReal* A, in dReal* B, in dReal* C, int p, int q, int r) pfdMultiply0;
typedef void function(dReal* A, in dReal* B, in dReal* C, int p, int q, int r) pfdMultiply1;
typedef void function(dReal* A, in dReal* B, in dReal* C, int p, int q, int r) pfdMultiply2;
pfdMultiply0       dMultiply0;
pfdMultiply1       dMultiply1;
pfdMultiply2       dMultiply2;

/* do an in-place cholesky decomposition on the lower triangle of the n*n
 * symmetric matrix A (which is stored by rows). the resulting lower triangle
 * will be such that L*L'=A. return 1 on success and 0 on failure (on failure
 * the matrix is not positive definite).
 */
typedef int function(dReal* A, int n) pfdFactorCholesky;
pfdFactorCholesky       dFactorCholesky;

/* solve for x: L*L'*x = b, and put the result back into x.
 * L is size n*n, b is size n*1. only the lower triangle of L is considered.
 */
typedef void function(dReal* L, dReal* b, int n) pfdSolveCholesky;
pfdSolveCholesky       dSolveCholesky;

/* compute the inverse of the n*n positive definite matrix A and put it in
 * Ainv. this is not especially fast. this returns 1 on success (A was
 * positive definite) or 0 on failure (not PD).
 */
typedef int function(dReal* A, dReal* Ainv, int n) pfdInvertPDMatrix;
pfdInvertPDMatrix       dInvertPDMatrix;

/* check whether an n*n matrix A is positive definite, return 1/0 (yes/no).
 * positive definite means that x'*A*x > 0 for any x. this performs a
 * cholesky decomposition of A. if the decomposition fails then the matrix
 * is not positive definite. A is stored by rows. A is not altered.
 */
typedef int function(dReal* A, int n) pfdIsPositiveDefinite;
pfdIsPositiveDefinite       dIsPositiveDefinite;

/* factorize a matrix A into L*D*L', where L is lower triangular with ones on
 * the diagonal, and D is diagonal.
 * A is an n*n matrix stored by rows, with a leading dimension of n rounded
 * up to 4. L is written into the strict lower triangle of A (the ones are not
 * written) and the reciprocal of the diagonal elements of D are written into
 * d.
 */
typedef void function(dReal* A, dReal* d, int n, int nskip) pfdFactorLDLT;
pfdFactorLDLT       dFactorLDLT;

/* solve L*x=b, where L is n*n lower triangular with ones on the diagonal,
 * and x,b are n*1. b is overwritten with x.
 * the leading dimension of L is `nskip'.
 */
typedef void function(dReal* L, dReal *b, int n, int nskip) pfdSolveL1;
pfdSolveL1       dSolveL1;


/* solve L'*x=b, where L is n*n lower triangular with ones on the diagonal,
 * and x,b are n*1. b is overwritten with x.
 * the leading dimension of L is `nskip'.
 */
typedef void function(dReal* L, dReal* b, int n, int nskip) pfdSolveL1T;
pfdSolveL1T       dSolveL1T;


/* in matlab syntax: a(1:n) = a(1:n) .* d(1:n) */
typedef void function(dReal* a, dReal* d, int n) pfdVectorScale;
pfdVectorScale       dVectorScale;


/* given `L', a n*n lower triangular matrix with ones on the diagonal,
 * and `d', a n*1 vector of the reciprocal diagonal elements of an n*n matrix
 * D, solve L*D*L'*x=b where x,b are n*1. x overwrites b.
 * the leading dimension of L is `nskip'.
 */
typedef void function(dReal* L, dReal* d, dReal* b, int n, int nskip) pfdSolveLDLT;
pfdSolveLDLT       dSolveLDLT;


/* given an L*D*L' factorization of an n*n matrix A, return the updated
 * factorization L2*D2*L2' of A plus the following "top left" matrix:
 *
 *    [ b a' ]     <-- b is a[0]
 *    [ a 0  ]     <-- a is a[1..n-1]
 *
 *   - L has size n*n, its leading dimension is nskip. L is lower triangular
 *     with ones on the diagonal. only the lower triangle of L is referenced.
 *   - d has size n. d contains the reciprocal diagonal elements of D.
 *   - a has size n.
 * the result is written into L, except that the left column of L and d[0]
 * are not actually modified. see ldltaddTL.m for further comments.
 */
typedef void function(dReal* L, dReal* d, dReal* a, int n, int nskip) pfdLDLTAddTL;
pfdLDLTAddTL       dLDLTAddTL;


/* given an L*D*L' factorization of a permuted matrix A, produce a new
 * factorization for row and column `r' removed.
 *   - A has size n1*n1, its leading dimension in nskip. A is symmetric and
 *     positive definite. only the lower triangle of A is referenced.
 *     A itself may actually be an array of row pointers.
 *   - L has size n2*n2, its leading dimension in nskip. L is lower triangular
 *     with ones on the diagonal. only the lower triangle of L is referenced.
 *   - d has size n2. d contains the reciprocal diagonal elements of D.
 *   - p is a permutation vector. it contains n2 indexes into A. each index
 *     must be in the range 0..n1-1.
 *   - r is the row/column of L to remove.
 * the new L will be written within the old L, i.e. will have the same leading
 * dimension. the last row and column of L, and the last element of d, are
 * undefined on exit.
 *
 * a fast O(n^2) algorithm is used. see ldltremove.m for further comments.
 */
typedef void function(dReal** A, int* p, dReal* L, dReal* d, int n1, int n2, int r, int nskip) pfdLDLTRemove;
pfdLDLTRemove       dLDLTRemove;


/* given an n*n matrix A (with leading dimension nskip), remove the r'th row
 * and column by moving elements. the new matrix will have the same leading
 * dimension. the last row and column of A are untouched on exit.
 */
typedef void function(dReal* A, int n, int nskip, int r) pfdRemoveRowCol;
pfdRemoveRowCol       dRemoveRowCol;

