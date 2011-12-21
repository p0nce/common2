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
module derelict.ode.collision_trimesh;

private import derelict.ode.common;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

//==============================================================================
// FUNCTIONS
//==============================================================================
/*
 * Data storage for triangle meshes.
 */
struct dxTriMeshData {}
typedef dxTriMeshData* dTriMeshDataID;

enum {
    TRIMESH_FACE_NORMALS
}

extern(C):

/*
 * These dont make much sense now, but they will later when we add more
 * features.
 */
typedef dTriMeshDataID function() pfdGeomTriMeshDataCreate;
pfdGeomTriMeshDataCreate          dGeomTriMeshDataCreate;

typedef void function(dTriMeshDataID g) pfdGeomTriMeshDataDestroy;
pfdGeomTriMeshDataDestroy          dGeomTriMeshDataDestroy;

typedef void function(dTriMeshDataID g, int data_id, void* in_data) pfdGeomTriMeshDataSet;
pfdGeomTriMeshDataSet          dGeomTriMeshDataSet;
typedef void* function(dTriMeshDataID g, int data_id) pfdGeomTriMeshDataGet;
pfdGeomTriMeshDataGet          dGeomTriMeshDataGet;

/**
 * We need to set the last transform after each time step for
 * accurate collision response. These functions get and set that transform.
 * It is stored per geom instance, rather than per dTriMeshDataID.
 */
typedef void function(dGeomID g, dMatrix4 last_trans) pfdGeomTriMeshSetLastTransform;
pfdGeomTriMeshSetLastTransform          dGeomTriMeshSetLastTransform;
typedef dReal* function(dGeomID g) pfdGeomTriMeshGetLastTransform;
pfdGeomTriMeshGetLastTransform          dGeomTriMeshGetLastTransform;

/*
 * Build TriMesh data with single pricision used in vertex data .
 */
typedef void function(dTriMeshDataID g, void* Vertices, int VertexStride, int VertexCount, void* Indices, int IndexCount, int TriStride) pfdGeomTriMeshDataBuildSingle;
pfdGeomTriMeshDataBuildSingle          dGeomTriMeshDataBuildSingle;
/* same again with a normals array (used as trimesh-trimesh optimization) */
typedef void function(dTriMeshDataID g, void* Vertices, int VertexStride, int VertexCount, void* Indices, int IndexCount, int TriStride, void* Normals) pfdGeomTriMeshDataBuildSingle1;
pfdGeomTriMeshDataBuildSingle1          dGeomTriMeshDataBuildSingle1;
/*
* Build TriMesh data with double pricision used in vertex data .
*/
typedef void function(dTriMeshDataID g, void* Vertices, int VertexStride, int VertexCount, void* Indices, int IndexCount, int TriStride) pfdGeomTriMeshDataBuildDouble;
pfdGeomTriMeshDataBuildDouble          dGeomTriMeshDataBuildDouble;
/* same again with a normals array (used as trimesh-trimesh optimization) */
typedef void function(dTriMeshDataID g, void* Vertices, int VertexStride, int VertexCount, void* Indices, int IndexCount, int TriStride, void* Normals) pfdGeomTriMeshDataBuildDouble1;
pfdGeomTriMeshDataBuildDouble1          dGeomTriMeshDataBuildDouble1;

/*
 * Simple build. Single/double precision based on dSINGLE/dDOUBLE!
 */
typedef void function(dTriMeshDataID g, dReal* Vertices, int VertexCount, int* Indices, int IndexCount) pfdGeomTriMeshDataBuildSimple;
pfdGeomTriMeshDataBuildSimple          dGeomTriMeshDataBuildSimple;
/* same again with a normals array (used as trimesh-trimesh optimization) */
typedef void function(dTriMeshDataID g, dReal* Vertices, int VertexCount, int* Indices, int IndexCount, int* Normals) pfdGeomTriMeshDataBuildSimple1;
pfdGeomTriMeshDataBuildSimple1          dGeomTriMeshDataBuildSimple1;

/* Preprocess the trimesh data to remove mark unnecessary edges and vertices */
typedef void function(dTriMeshDataID g) pfdGeomTriMeshDataPreprocess;
pfdGeomTriMeshDataPreprocess          dGeomTriMeshDataPreprocess;

/* Get and set the internal preprocessed trimesh data buffer, for loading and saving */
typedef void function(dTriMeshDataID g, ubyte** buf, int* bufLen) pfdGeomTriMeshDataGetBuffer;
pfdGeomTriMeshDataGetBuffer          dGeomTriMeshDataGetBuffer;
typedef void function(dTriMeshDataID g, ubyte* buf) pfdGeomTriMeshDataSetBuffer;
pfdGeomTriMeshDataSetBuffer          dGeomTriMeshDataSetBuffer;


/*
 * Per triangle callback. Allows the user to say if he wants a collision with
 * a particular triangle.
 */
typedef int function(dGeomID TriMesh, dGeomID RefObject, int TriangleIndex) dTriCallback;

typedef void function(dGeomID g, dTriCallback* Callback) pfdGeomTriMeshSetCallback;
pfdGeomTriMeshSetCallback          dGeomTriMeshSetCallback;
typedef dTriCallback* function(dGeomID g) pfdGeomTriMeshGetCallback;
pfdGeomTriMeshGetCallback          dGeomTriMeshGetCallback;

/*
 * Per object callback. Allows the user to get the list of triangles in 1
 * shot. Maybe we should remove this one.
 */
typedef void function(dGeomID TriMesh, dGeomID RefObject, int* TriIndices, int TriCount) dTriArrayCallback;

typedef void function(dGeomID g, dTriArrayCallback* ArrayCallback) pfdGeomTriMeshSetArrayCallback;
pfdGeomTriMeshSetArrayCallback          dGeomTriMeshSetArrayCallback;
typedef dTriArrayCallback* function(dGeomID g) pfdGeomTriMeshGetArrayCallback;
pfdGeomTriMeshGetArrayCallback          dGeomTriMeshGetArrayCallback;

/*
 * Ray callback.
 * Allows the user to say if a ray collides with a triangle on barycentric
 * coords. The user can for example sample a texture with alpha transparency
 * to determine if a collision should occur.
 */
typedef int function(dGeomID TriMesh, dGeomID Ray, int TriangleIndex, dReal u, dReal v) dTriRayCallback;

typedef void function(dGeomID g, dTriRayCallback* Callback) pfdGeomTriMeshSetRayCallback;
pfdGeomTriMeshSetRayCallback          dGeomTriMeshSetRayCallback;
typedef dTriRayCallback* function(dGeomID g) pfdGeomTriMeshGetRayCallback;
pfdGeomTriMeshGetRayCallback          dGeomTriMeshGetRayCallback;

/*
 * Trimesh class
 * Construction. Callbacks are optional.
 */
typedef dGeomID function(dSpaceID space, dTriMeshDataID Data, dTriCallback* Callback, dTriArrayCallback* ArrayCallback, dTriRayCallback* RayCallback) pfdCreateTriMesh;
pfdCreateTriMesh          dCreateTriMesh;

typedef void function(dGeomID g, dTriMeshDataID Data) pfdGeomTriMeshSetData;
pfdGeomTriMeshSetData          dGeomTriMeshSetData;
typedef dTriMeshDataID function(dGeomID g) pfdGeomTriMeshGetData;
pfdGeomTriMeshGetData          dGeomTriMeshGetData;


// enable/disable/check temporal coherence
typedef void function(dGeomID g, int geomClass, int enable) pfdGeomTriMeshEnableTC;
pfdGeomTriMeshEnableTC          dGeomTriMeshEnableTC;
typedef int function(dGeomID g, int geomClass) pfdGeomTriMeshIsTCEnabled;
pfdGeomTriMeshIsTCEnabled          dGeomTriMeshIsTCEnabled;

/*
 * Clears the internal temporal coherence caches. When a geom has its
 * collision checked with a trimesh once, data is stored inside the trimesh.
 * With large worlds with lots of seperate objects this list could get huge.
 * We should be able to do this automagically.
 */
typedef void function(dGeomID g) pfdGeomTriMeshClearTCCache;
pfdGeomTriMeshClearTCCache          dGeomTriMeshClearTCCache;


/*
 * returns the TriMeshDataID
 */
typedef dTriMeshDataID function(dGeomID g) pfdGeomTriMeshGetTriMeshDataID;
pfdGeomTriMeshGetTriMeshDataID          dGeomTriMeshGetTriMeshDataID;

/*
 * Gets a triangle.
 */
typedef void function(dGeomID g, int Index, dVector3* v0, dVector3* v1, dVector3* v2) pfdGeomTriMeshGetTriangle;
pfdGeomTriMeshGetTriangle          dGeomTriMeshGetTriangle;

/*
 * Gets the point on the requested triangle and the given barycentric
 * coordinates.
 */
typedef void function(dGeomID g, int Index, dReal u, dReal v, dVector3 Out) pfdGeomTriMeshGetPoint;
pfdGeomTriMeshGetPoint          dGeomTriMeshGetPoint;

/*

This is how the strided data works:

struct StridedVertex{
    dVector3 Vertex;
    // Userdata
};
int VertexStride = sizeof(StridedVertex);

struct StridedTri{
    int Indices[3];
    // Userdata
};
int TriStride = sizeof(StridedTri);

*/


typedef int function(dGeomID g) pfdGeomTriMeshGetTriangleCount;
pfdGeomTriMeshGetTriangleCount          dGeomTriMeshGetTriangleCount;

typedef void function(dTriMeshDataID g) pfdGeomTriMeshDataUpdate;
pfdGeomTriMeshDataUpdate          dGeomTriMeshDataUpdate;

