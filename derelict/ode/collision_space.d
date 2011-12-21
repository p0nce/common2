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
module derelict.ode.collision_space;

private import derelict.ode.common;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

//==============================================================================
// FUNCTIONS
//==============================================================================
/**
 * @brief User callback for geom-geom collision testing.
 *
 * @param data The user data object, as passed to dSpaceCollide.
 * @param o1   The first geom being tested.
 * @param o2   The second geom being test.
 *
 * @remarks The callback function can call dCollide on o1 and o2 to generate
 * contact points between each pair. Then these contact points may be added
 * to the simulation as contact joints. The user's callback function can of
 * course chose not to call dCollide for any pair, e.g. if the user decides
 * that those pairs should not interact.
 *
 * @ingroup collide
 */
typedef void function(void* data, dGeomID o1, dGeomID o2) dNearCallback;

extern(C):

/* set a new error, debug or warning handler. if fn is 0, the default handlers
 * are used.
 */
typedef dSpaceID function(dSpaceID space) pfdSimpleSpaceCreate;
pfdSimpleSpaceCreate          dSimpleSpaceCreate;

typedef dSpaceID function(dSpaceID space) pfdHashSpaceCreate;
pfdHashSpaceCreate          dHashSpaceCreate;

typedef dSpaceID function(dSpaceID space, dVector3 Center, dVector3 Extents, int Depth) pfdQuadTreeSpaceCreate;
pfdQuadTreeSpaceCreate          dQuadTreeSpaceCreate;

typedef void function(dSpaceID space) pfdSpaceDestroy;
pfdSpaceDestroy          dSpaceDestroy;

typedef void function(dSpaceID space, int minlevel, int maxlevel) pfdHashSpaceSetLevels;
pfdHashSpaceSetLevels          dHashSpaceSetLevels;

typedef void function(dSpaceID space, int* minlevel, int* maxlevel) pfdHashSpaceGetLevels;
pfdHashSpaceGetLevels          dHashSpaceGetLevels;

typedef void function(dSpaceID space, int mode) pfdSpaceSetCleanup;
pfdSpaceSetCleanup          dSpaceSetCleanup;

typedef int function(dSpaceID space) pfdSpaceGetCleanup;
pfdSpaceGetCleanup          dSpaceGetCleanup;

typedef void function(dSpaceID, dGeomID) pfdSpaceAdd;
pfdSpaceAdd          dSpaceAdd;

typedef void function(dSpaceID, dGeomID) pfdSpaceRemove;
pfdSpaceRemove          dSpaceRemove;

typedef int function(dSpaceID, dGeomID) pfdSpaceQuery;
pfdSpaceQuery          dSpaceQuery;

typedef void function(dSpaceID) pfdSpaceClean;
pfdSpaceClean          dSpaceClean;

typedef int function(dSpaceID) pfdSpaceGetNumGeoms;
pfdSpaceGetNumGeoms          dSpaceGetNumGeoms;

typedef dGeomID function(dSpaceID, int i) pfdSpaceGetGeom;
pfdSpaceGetGeom          dSpaceGetGeom;

