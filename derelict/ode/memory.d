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
module derelict.ode.memory;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

//==============================================================================
// FUNCTIONS
//==============================================================================
/*
 * all user defined error functions have this type. error and debug functions
 * should not return.
 */
/* function types to allocate and free memory */
typedef void* function(size_t size) dAllocFunction;
typedef void* function(void* ptr, size_t oldsize, size_t newsize) dReallocFunction;
typedef void function (void* ptr, size_t size) dFreeFunction;

extern(C):

/*
 * set new memory management functions. if fn is 0, the default handlers are
 * used.
 */
typedef void function(dAllocFunction*)   pfdSetAllocHandler;
typedef void function(dReallocFunction*) pfdSetReallocHandler;
typedef void function(dFreeFunction*)    pfdSetFreeHandler;
pfdSetAllocHandler       dSetAllocHandler;
pfdSetReallocHandler     dSetReallocHandler;
pfdSetFreeHandler        dSetFreeHandler;

/* get current memory management functions */
typedef dAllocFunction* function()   pfdGetAllocHandler;
typedef dReallocFunction* function() pfdGetReallocHandler;
typedef dFreeFunction* function()    pfdGetFreeHandler;
pfdGetAllocHandler       dGetAllocHandler;
pfdGetReallocHandler     dGetReallocHandler;
pfdGetFreeHandler        dGetFreeHandler;

/* allocate and free memory. */
typedef void* function(size_t size) pfdAlloc;
typedef void* function(void* ptr, size_t oldsize, size_t newsize) pfdRealloc;
typedef void function(void *ptr, size_t size) pfdFree;
pfdAlloc       dAlloc;
pfdRealloc     dRealloc;
pfdFree        dFree;

