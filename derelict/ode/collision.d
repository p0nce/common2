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
module derelict.ode.collision;

private
{
    import derelict.ode.common;
    import derelict.ode.collision_space;
    import derelict.ode.contact;
}

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

/* ************************************************************************ */
/* custom classes */

typedef void function(dGeomID, dReal aabb[6]) dGetAABBFn;
typedef int function(dGeomID o1, dGeomID o2, int flags, dContactGeom* contact, int skip) dColliderFn;
typedef  dColliderFn* function(int num) dGetColliderFnFn;
typedef void function(dGeomID o) dGeomDtorFn;
typedef int function(dGeomID o1, dGeomID o2, dReal aabb[6]) dAABBTestFn;


/* ************************************************************************ */
/* standard classes */

/* the maximum number of user classes that are supported */
enum {
    dMaxUserClasses = 4
}

/* class numbers - each geometry object needs a unique number */
enum {
    dSphereClass = 0,
    dBoxClass,
    dCapsuleClass,
    dCylinderClass,
    dPlaneClass,
    dRayClass,
    dConvexClass,
    dGeomTransformClass,
    dTriMeshClass,
    dHeightfieldClass,

    dFirstSpaceClass,
    dSimpleSpaceClass = dFirstSpaceClass,
    dHashSpaceClass,
    dQuadTreeSpaceClass,
    dLastSpaceClass = dQuadTreeSpaceClass,

    dFirstUserClass,
    dLastUserClass = dFirstUserClass + dMaxUserClasses - 1,
    dGeomNumClasses
}

struct dGeomClass {
    int bytes;
    dGetColliderFnFn* collider;
    dGetAABBFn* aabb;
    dAABBTestFn* aabb_test;
    dGeomDtorFn* dtor;
}


//==============================================================================
// FUNCTIONS
//==============================================================================
extern(C):

/**
 * @defgroup collide Collision Detection
 *
 * ODE has two main components: a dynamics simulation engine and a collision
 * detection engine. The collision engine is given information about the
 * shape of each body. At each time step it figures out which bodies touch
 * each other and passes the resulting contact point information to the user.
 * The user in turn creates contact joints between bodies.
 *
 * Using ODE's collision detection is optional - an alternative collision
 * detection system can be used as long as it can supply the right kinds of
 * contact information.
 */


/* ************************************************************************ */
/* general functions */

/**
 * @brief Destroy a geom, removing it from any space.
 *
 * Destroy a geom, removing it from any space it is in first. This one
 * function destroys a geom of any type, but to create a geom you must call
 * a creation function for that type.
 *
 * When a space is destroyed, if its cleanup mode is 1 (the default) then all
 * the geoms in that space are automatically destroyed as well.
 *
 * @param geom the geom to be destroyed.
 * @ingroup collide
 */
typedef void function(dGeomID geom) pfdGeomDestroy;
pfdGeomDestroy          dGeomDestroy;


/**
 * @brief Set the user-defined data pointer stored in the geom.
 *
 * @param geom the geom to hold the data
 * @param data the data pointer to be stored
 * @ingroup collide
 */
typedef void function(dGeomID geom, void* data) pfdGeomSetData;
pfdGeomSetData          dGeomSetData;


/**
 * @brief Get the user-defined data pointer stored in the geom.
 *
 * @param geom the geom containing the data
 * @ingroup collide
 */
typedef void* function(dGeomID geom) pfdGeomGetData;
pfdGeomGetData          dGeomGetData;


/**
 * @brief Set the body associated with a placeable geom.
 *
 * Setting a body on a geom automatically combines the position vector and
 * rotation matrix of the body and geom, so that setting the position or
 * orientation of one will set the value for both objects. Setting a body
 * ID of zero gives the geom its own position and rotation, independent
 * from any body. If the geom was previously connected to a body then its
 * new independent position/rotation is set to the current position/rotation
 * of the body.
 *
 * Calling these functions on a non-placeable geom results in a runtime
 * error in the debug build of ODE.
 *
 * @param geom the geom to connect
 * @param body the body to attach to the geom
 * @ingroup collide
 */
typedef void function(dGeomID geom, dBodyID bodyid) pfdGeomSetBody;
pfdGeomSetBody          dGeomSetBody;


/**
 * @brief Get the body associated with a placeable geom.
 * @param geom the geom to query.
 * @sa dGeomSetBody
 * @ingroup collide
 */
typedef dBodyID function(dGeomID geom) pfdGeomGetBody;
pfdGeomGetBody          dGeomGetBody;


/**
 * @brief Set the position vector of a placeable geom.
 *
 * If the geom is attached to a body, the body's position will also be changed.
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to set.
 * @param x the new X coordinate.
 * @param y the new Y coordinate.
 * @param z the new Z coordinate.
 * @sa dBodySetPosition
 * @ingroup collide
 */
typedef void function(dGeomID geom, dReal x, dReal y, dReal z) pfdGeomSetPosition;
pfdGeomSetPosition          dGeomSetPosition;


/**
 * @brief Set the rotation matrix of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will also be changed.
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to set.
 * @param R the new rotation matrix.
 * @sa dBodySetRotation
 * @ingroup collide
 */
typedef void function(dGeomID geom, dMatrix3 R) pfdGeomSetRotation;
pfdGeomSetRotation          dGeomSetRotation;


/**
 * @brief Set the rotation of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will also be changed.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to set.
 * @param Q the new rotation.
 * @sa dBodySetQuaternion
 * @ingroup collide
 */
typedef void function(dGeomID geom, dQuaternion Q) pfdGeomSetQuaternion;
pfdGeomSetQuaternion          dGeomSetQuaternion;


/**
 * @brief Get the position vector of a placeable geom.
 *
 * If the geom is attached to a body, the body's position will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's position vector.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @sa dBodyGetPosition
 * @ingroup collide
 */
typedef dReal* function(dGeomID geom) pfdGeomGetPosition;
pfdGeomGetPosition          dGeomGetPosition;

/**
 * @brief Copy the position of a geom into a vector.
 * @ingroup collide
 * @param geom  the geom to query
 * @param pos   a copy of the geom position
 * @sa dGeomGetPosition
 */
typedef void function(dGeomID geom, dVector3 pos) pfdGeomCopyPosition;
pfdGeomCopyPosition          dGeomCopyPosition;

/**
 * @brief Get the rotation matrix of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's rotation matrix.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @sa dBodyGetRotation
 * @ingroup collide
 */
typedef dReal* function(dGeomID geom) pfdGeomGetRotation;
pfdGeomGetRotation          dGeomGetRotation;

/**
 * @brief Get the rotation matrix of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom   the geom to query.
 * @param R      a copy of the geom rotation
 * @sa dGeomGetRotation
 * @ingroup collide
 */
typedef void function(dGeomID geom, dMatrix3 R) pfdGeomCopyRotation;
pfdGeomCopyRotation          dGeomCopyRotation;

/**
 * @brief Get the rotation quaternion of a placeable geom.
 *
 * If the geom is attached to a body, the body's quaternion will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to query.
 * @param result a copy of the rotation quaternion.
 * @sa dBodyGetQuaternion
 * @ingroup collide
 */
typedef void function(dGeomID geom, dQuaternion result) pfdGeomGetQuaternion;
pfdGeomGetQuaternion          dGeomGetQuaternion;


/**
 * @brief Return the axis-aligned bounding box.
 *
 * Return in aabb an axis aligned bounding box that surrounds the given geom.
 * The aabb array has elements (minx, maxx, miny, maxy, minz, maxz). If the
 * geom is a space, a bounding box that surrounds all contained geoms is
 * returned.
 *
 * This function may return a pre-computed cached bounding box, if it can
 * determine that the geom has not moved since the last time the bounding
 * box was computed.
 *
 * @param geom the geom to query
 * @param aabb the returned bounding box
 * @ingroup collide
 */
typedef void function(dGeomID geom, dReal aabb[6]) pfdGeomGetAABB;
pfdGeomGetAABB          dGeomGetAABB;


/**
 * @brief Determing if a geom is a space.
 * @param geom the geom to query
 * @returns Non-zero if the geom is a space, zero otherwise.
 * @ingroup collide
 */
typedef int function(dGeomID geom) pfdGeomIsSpace;
pfdGeomIsSpace          dGeomIsSpace;


/**
 * @brief Query for the space containing a particular geom.
 * @param geom the geom to query
 * @returns The space that contains the geom, or NULL if the geom is
 *          not contained by a space.
 * @ingroup collide
 */
typedef dSpaceID function(dGeomID) pfdGeomGetSpace;
pfdGeomGetSpace          dGeomGetSpace;


/**
 * @brief Given a geom, this returns its class.
 *
 * The ODE classes are:
 *  @li dSphereClass
 *  @li dBoxClass
 *  @li dCylinderClass
 *  @li dPlaneClass
 *  @li dRayClass
 *  @li dConvexClass
 *  @li dGeomTransformClass
 *  @li dTriMeshClass
 *  @li dSimpleSpaceClass
 *  @li dHashSpaceClass
 *  @li dQuadTreeSpaceClass
 *  @li dFirstUserClass
 *  @li dLastUserClass
 *
 * User-defined class will return their own number.
 *
 * @param geom the geom to query
 * @returns The geom class ID.
 * @ingroup collide
 */
typedef int function(dGeomID geom) pfdGeomGetClass;
pfdGeomGetClass          dGeomGetClass;


/**
 * @brief Set the "category" bitfield for the given geom.
 *
 * The category bitfield is used by spaces to govern which geoms will
 * interact with each other. The bitfield is guaranteed to be at least
 * 32 bits wide. The default category values for newly created geoms
 * have all bits set.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @ingroup collide
 */
typedef void function(dGeomID geom, ulong bits) pfdGeomSetCategoryBits;
pfdGeomSetCategoryBits          dGeomSetCategoryBits;


/**
 * @brief Set the "collide" bitfield for the given geom.
 *
 * The collide bitfield is used by spaces to govern which geoms will
 * interact with each other. The bitfield is guaranteed to be at least
 * 32 bits wide. The default category values for newly created geoms
 * have all bits set.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @ingroup collide
 */
typedef void function(dGeomID geom, ulong bits) pfdGeomSetCollideBits;
pfdGeomSetCollideBits          dGeomSetCollideBits;


/**
 * @brief Get the "category" bitfield for the given geom.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @sa dGeomSetCategoryBits
 * @ingroup collide
 */
typedef ulong function(dGeomID) pfdGeomGetCategoryBits;
pfdGeomGetCategoryBits          dGeomGetCategoryBits;


/**
 * @brief Get the "collide" bitfield for the given geom.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @sa dGeomSetCollideBits
 * @ingroup collide
 */
typedef ulong function(dGeomID) pfdGeomGetCollideBits;
pfdGeomGetCollideBits          dGeomGetCollideBits;


/**
 * @brief Enable a geom.
 *
 * Disabled geoms are completely ignored by dSpaceCollide and dSpaceCollide2,
 * although they can still be members of a space. New geoms are created in
 * the enabled state.
 *
 * @param geom   the geom to enable
 * @sa dGeomDisable
 * @sa dGeomIsEnabled
 * @ingroup collide
 */
typedef void function(dGeomID geom) pfdGeomEnable;
pfdGeomEnable          dGeomEnable;


/**
 * @brief Disable a geom.
 *
 * Disabled geoms are completely ignored by dSpaceCollide and dSpaceCollide2,
 * although they can still be members of a space. New geoms are created in
 * the enabled state.
 *
 * @param geom   the geom to disable
 * @sa dGeomDisable
 * @sa dGeomIsEnabled
 * @ingroup collide
 */
typedef void function(dGeomID geom) pfdGeomDisable;
pfdGeomDisable          dGeomDisable;


/**
 * @brief Check to see if a geom is enabled.
 *
 * Disabled geoms are completely ignored by dSpaceCollide and dSpaceCollide2,
 * although they can still be members of a space. New geoms are created in
 * the enabled state.
 *
 * @param geom   the geom to query
 * @returns Non-zero if the geom is enabled, zero otherwise.
 * @sa dGeomDisable
 * @sa dGeomIsEnabled
 * @ingroup collide
 */
typedef int function(dGeomID geom) pfdGeomIsEnabled;
pfdGeomIsEnabled          dGeomIsEnabled;

/* ************************************************************************ */
/* geom offset from body */

/**
 * @brief Set the local offset position of a geom from its body.
 *
 * Sets the geom's positional offset in local coordinates.
 * After this call, the geom will be at a new position determined from the
 * body's position and the offset.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param x the new X coordinate.
 * @param y the new Y coordinate.
 * @param z the new Z coordinate.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dReal x, dReal y, dReal z) pfdGeomSetOffsetPosition;
pfdGeomSetOffsetPosition          dGeomSetOffsetPosition;


/**
 * @brief Set the local offset rotation matrix of a geom from its body.
 *
 * Sets the geom's rotational offset in local coordinates.
 * After this call, the geom will be at a new position determined from the
 * body's position and the offset.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param R the new rotation matrix.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dMatrix3 R) pfdGeomSetOffsetRotation;
pfdGeomSetOffsetRotation          dGeomSetOffsetRotation;


/**
 * @brief Set the local offset rotation of a geom from its body.
 *
 * Sets the geom's rotational offset in local coordinates.
 * After this call, the geom will be at a new position determined from the
 * body's position and the offset.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param Q the new rotation.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dQuaternion Q) pfdGeomSetOffsetQuaternion;
pfdGeomSetOffsetQuaternion          dGeomSetOffsetQuaternion;


/**
 * @brief Set the offset position of a geom from its body.
 *
 * Sets the geom's positional offset to move it to the new world
 * coordinates.
 * After this call, the geom will be at the world position passed in,
 * and the offset will be the difference from the current body position.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param x the new X coordinate.
 * @param y the new Y coordinate.
 * @param z the new Z coordinate.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dReal x, dReal y, dReal z) pfdGeomSetOffsetWorldPosition;
pfdGeomSetOffsetWorldPosition          dGeomSetOffsetWorldPosition;


/**
 * @brief Set the offset rotation of a geom from its body.
 *
 * Sets the geom's rotational offset to orient it to the new world
 * rotation matrix.
 * After this call, the geom will be at the world orientation passed in,
 * and the offset will be the difference from the current body orientation.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param R the new rotation matrix.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dMatrix3 R) pfdGeomSetOffsetWorldRotation;
pfdGeomSetOffsetWorldRotation          dGeomSetOffsetWorldRotation;


/**
 * @brief Set the offset rotation of a geom from its body.
 *
 * Sets the geom's rotational offset to orient it to the new world
 * rotation matrix.
 * After this call, the geom will be at the world orientation passed in,
 * and the offset will be the difference from the current body orientation.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param Q the new rotation.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dQuaternion) pfdGeomSetOffsetWorldQuaternion;
pfdGeomSetOffsetWorldQuaternion          dGeomSetOffsetWorldQuaternion;


/**
 * @brief Clear any offset from the geom.
 *
 * If the geom has an offset, it is eliminated and the geom is
 * repositioned at the body's position.  If the geom has no offset,
 * this function does nothing.
 * This is more efficient than calling dGeomSetOffsetPosition(zero)
 * and dGeomSetOffsetRotation(identiy), because this function actually
 * eliminates the offset, rather than leaving it as the identity transform.
 *
 * @param geom the geom to have its offset destroyed.
 * @ingroup collide
 */
typedef void function(dGeomID geom) pfdGeomClearOffset;
pfdGeomClearOffset          dGeomClearOffset;


/**
 * @brief Check to see whether the geom has an offset.
 *
 * This function will return non-zero if the offset has been created.
 * Note that there is a difference between a geom with no offset,
 * and a geom with an offset that is the identity transform.
 * In the latter case, although the observed behaviour is identical,
 * there is a unnecessary computation involved because the geom will
 * be applying the transform whenever it needs to recalculate its world
 * position.
 *
 * @param geom the geom to query.
 * @returns Non-zero if the geom has an offset, zero otherwise.
 * @ingroup collide
 */
typedef int function(dGeomID geom) pfdGeomIsOffset;
pfdGeomIsOffset          dGeomIsOffset;

/**
 * @brief Get the offset position vector of a geom.
 *
 * Returns the positional offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the zero vector.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's offset vector.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @ingroup collide
 */
typedef dReal* function(dGeomID geom) pfdGeomGetOffsetPosition;
pfdGeomGetOffsetPosition          dGeomGetOffsetPosition;

/**
 * @brief Copy the offset position vector of a geom.
 *
 * Returns the positional offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the zero vector.
 *
 * @param geom   the geom to query.
 * @param pos    returns the offset position
 * @ingroup collide
 */
typedef void function(dGeomID geom, dVector3 pos) pfdGeomCopyOffsetPosition;
pfdGeomCopyOffsetPosition          dGeomCopyOffsetPosition;

/**
 * @brief Get the offset position vector of a geom.
 *
 * Returns the positional offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the zero vector.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's offset vector.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @ingroup collide
 */
typedef dReal* function(dGeomID geom) pfdGeomGetOffsetRotation;
pfdGeomGetOffsetRotation          dGeomGetOffsetRotation;

/**
 * @brief Copy the offset rotation matrix of a geom.
 *
 * Returns the rotational offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the identity
 * matrix.
 *
 * @param geom   the geom to query.
 * @param R      returns the rotation matrix.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dMatrix3 R) pfdGeomCopyOffsetRotation;
pfdGeomCopyOffsetRotation          dGeomCopyOffsetRotation;

/**
 * @brief Get the offset rotation quaternion of a geom.
 *
 * Returns the rotation offset of the geom as a quaternion.
 * If the geom has no offset, the identity quaternion is returned.
 *
 * @param geom the geom to query.
 * @param result a copy of the rotation quaternion.
 * @ingroup collide
 */
typedef void function(dGeomID geom, dQuaternion result) pfdGeomGetOffsetQuaternion;
pfdGeomGetOffsetQuaternion          dGeomGetOffsetQuaternion;

/* ************************************************************************ */
/* collision detection */

/**
 *
 * @brief Given two geoms o1 and o2 that potentially intersect,
 * generate contact information for them.
 *
 * Internally, this just calls the correct class-specific collision
 * functions for o1 and o2.
 *
 * @param o1 The first geom to test.
 * @param o2 The second geom to test.
 *
 * @param flags The flags specify how contacts should be generated if
 * the geoms touch. The lower 16 bits of flags is an integer that
 * specifies the maximum number of contact points to generate. Note
 * that if this number is zero, this function just pretends that it is
 * one -- in other words you can not ask for zero contacts. All other bits
 * in flags must be zero. In the future the other bits may be used to
 * select from different contact generation strategies.
 *
 * @param contact Points to an array of dContactGeom structures. The array
 * must be able to hold at least the maximum number of contacts. These
 * dContactGeom structures may be embedded within larger structures in the
 * array -- the skip parameter is the byte offset from one dContactGeom to
 * the next in the array. If skip is sizeof(dContactGeom) then contact
 * points to a normal (C-style) array. It is an error for skip to be smaller
 * than sizeof(dContactGeom).
 *
 * @returns If the geoms intersect, this function returns the number of contact
 * points generated (and updates the contact array), otherwise it returns 0
 * (and the contact array is not touched).
 *
 * @remarks If a space is passed as o1 or o2 then this function will collide
 * all objects contained in o1 with all objects contained in o2, and return
 * the resulting contact points. This method for colliding spaces with geoms
 * (or spaces with spaces) provides no user control over the individual
 * collisions. To get that control, use dSpaceCollide or dSpaceCollide2 instead.
 *
 * @remarks If o1 and o2 are the same geom then this function will do nothing
 * and return 0. Technically speaking an object intersects with itself, but it
 * is not useful to find contact points in this case.
 *
 * @remarks This function does not care if o1 and o2 are in the same space or not
 * (or indeed if they are in any space at all).
 *
 * @ingroup collide
 */
typedef int function(dGeomID o1, dGeomID o2, int flags, dContactGeom* contact, int skip) pfdCollide;
pfdCollide          dCollide;

/**
 * @brief Determines which pairs of geoms in a space may potentially intersect,
 * and calls the callback function for each candidate pair.
 *
 * @param space The space to test.
 *
 * @param data Passed from dSpaceCollide directly to the callback
 * function. Its meaning is user defined. The o1 and o2 arguments are the
 * geoms that may be near each other.
 *
 * @param callback A callback function is of type @ref dNearCallback.
 *
 * @remarks Other spaces that are contained within the colliding space are
 * not treated specially, i.e. they are not recursed into. The callback
 * function may be passed these contained spaces as one or both geom
 * arguments.
 *
 * @remarks dSpaceCollide() is guaranteed to pass all intersecting geom
 * pairs to the callback function, but may also pass close but
 * non-intersecting pairs. The number of these calls depends on the
 * internal algorithms used by the space. Thus you should not expect
 * that dCollide will return contacts for every pair passed to the
 * callback.
 *
 * @sa dSpaceCollide2
 * @ingroup collide
 */
typedef void function(dSpaceID space, void* data, dNearCallback* callback) pfdSpaceCollide;
pfdSpaceCollide          dSpaceCollide;


/**
 * @brief Determines which geoms from one space may potentially intersect with
 * geoms from another space, and calls the callback function for each candidate
 * pair.
 *
 * @param space1 The first space to test.
 *
 * @param space2 The second space to test.
 *
 * @param data Passed from dSpaceCollide directly to the callback
 * function. Its meaning is user defined. The o1 and o2 arguments are the
 * geoms that may be near each other.
 *
 * @param callback A callback function is of type @ref dNearCallback.
 *
 * @remarks This function can also test a single non-space geom against a
 * space. This function is useful when there is a collision hierarchy, i.e.
 * when there are spaces that contain other spaces.
 *
 * @remarks Other spaces that are contained within the colliding space are
 * not treated specially, i.e. they are not recursed into. The callback
 * function may be passed these contained spaces as one or both geom
 * arguments.
 *
 * @remarks dSpaceCollide2() is guaranteed to pass all intersecting geom
 * pairs to the callback function, but may also pass close but
 * non-intersecting pairs. The number of these calls depends on the
 * internal algorithms used by the space. Thus you should not expect
 * that dCollide will return contacts for every pair passed to the
 * callback.
 *
 * @sa dSpaceCollide
 * @ingroup collide
 */
typedef void function(dGeomID space1, dGeomID space2, void* data, dNearCallback* callback) pfdSpaceCollide2;
pfdSpaceCollide2          dSpaceCollide2;


/**
 * @defgroup collide_sphere Sphere Class
 * @ingroup collide
 */

/**
 * @brief Create a sphere geom of the given radius, and return its ID.
 *
 * @param space   a space to contain the new geom. May be null.
 * @param radius  the radius of the sphere.
 *
 * @returns A new sphere geom.
 *
 * @remarks The point of reference for a sphere is its center.
 *
 * @sa dGeomDestroy
 * @sa dGeomSphereSetRadius
 * @ingroup collide_sphere
 */
typedef dGeomID function(dSpaceID space, dReal radius) pfdCreateSphere;
pfdCreateSphere          dCreateSphere;


/**
 * @brief Set the radius of a sphere geom.
 *
 * @param sphere  the sphere to set.
 * @param radius  the new radius.
 *
 * @sa dGeomSphereGetRadius
 * @ingroup collide_sphere
 */
typedef void function(dGeomID space, dReal radius) pfdGeomSphereSetRadius;
pfdGeomSphereSetRadius          dGeomSphereSetRadius;


/**
 * @brief Retrieves the radius of a sphere geom.
 *
 * @param sphere  the sphere to query.
 *
 * @sa dGeomSphereSetRadius
 * @ingroup collide_sphere
 */
typedef dReal function(dGeomID sphere) pfdGeomSphereGetRadius;
pfdGeomSphereGetRadius          dGeomSphereGetRadius;


/**
 * @brief Calculate the depth of the a given point within a sphere.
 *
 * @param sphere  the sphere to query.
 * @param x       the X coordinate of the point.
 * @param y       the Y coordinate of the point.
 * @param z       the Z coordinate of the point.
 *
 * @returns The depth of the point. Points inside the sphere will have a
 * positive depth, points outside it will have a negative depth, and points
 * on the surface will have a depth of zero.
 *
 * @ingroup collide_sphere
 */
typedef dReal function(dGeomID sphere, dReal x, dReal y, dReal z) pfdGeomSpherePointDepth;
pfdGeomSpherePointDepth          dGeomSpherePointDepth;


//--> Convex Functions
typedef dGeomID function(dSpaceID space, dReal* _planes, uint _planecount, dReal* _points, uint _pointcount, uint* _polygons) pfdCreateConvex;
pfdCreateConvex          dCreateConvex;

typedef void function(dGeomID g, dReal *_planes, uint _count, dReal *_points, uint _pointcount, uint *_polygons) pfdGeomSetConvex;
pfdGeomSetConvex          dGeomSetConvex;
//<-- Convex Functions

/**
 * @defgroup collide_box Box Class
 * @ingroup collide
 */

/**
 * @brief Create a box geom with the provided side lengths.
 *
 * @param space   a space to contain the new geom. May be null.
 * @param lx      the length of the box along the X axis
 * @param ly      the length of the box along the Y axis
 * @param lz      the length of the box along the Z axis
 *
 * @returns A new box geom.
 *
 * @remarks The point of reference for a box is its center.
 *
 * @sa dGeomDestroy
 * @sa dGeomBoxSetLengths
 * @ingroup collide_box
 */
typedef dGeomID function(dSpaceID space, dReal lx, dReal ly, dReal lz) pfdCreateBox;
pfdCreateBox          dCreateBox;


/**
 * @brief Set the side lengths of the given box.
 *
 * @param box  the box to set
 * @param lx      the length of the box along the X axis
 * @param ly      the length of the box along the Y axis
 * @param lz      the length of the box along the Z axis
 *
 * @sa dGeomBoxGetLengths
 * @ingroup collide_box
 */
typedef void function(dGeomID box, dReal lx, dReal ly, dReal lz) pfdGeomBoxSetLengths;
pfdGeomBoxSetLengths          dGeomBoxSetLengths;


/**
 * @brief Get the side lengths of a box.
 *
 * @param box     the box to query
 * @param result  the returned side lengths
 *
 * @sa dGeomBoxSetLengths
 * @ingroup collide_box
 */
typedef void function(dGeomID box, dVector3 result) pfdGeomBoxGetLengths;
pfdGeomBoxGetLengths          dGeomBoxGetLengths;


/**
 * @brief Return the depth of a point in a box.
 *
 * @param box  the box to query
 * @param x    the X coordinate of the point to test.
 * @param y    the Y coordinate of the point to test.
 * @param z    the Z coordinate of the point to test.
 *
 * @returns The depth of the point. Points inside the box will have a
 * positive depth, points outside it will have a negative depth, and points
 * on the surface will have a depth of zero.
 */
typedef dReal function(dGeomID box, dReal x, dReal y, dReal z) pfdGeomBoxPointDepth;
pfdGeomBoxPointDepth          dGeomBoxPointDepth;


typedef dGeomID function(dSpaceID space, dReal a, dReal b, dReal c, dReal d) pfdCreatePlane;
pfdCreatePlane          dCreatePlane;

typedef void function(dGeomID plane, dReal a, dReal b, dReal c, dReal d) pfdGeomPlaneSetParams;
pfdGeomPlaneSetParams          dGeomPlaneSetParams;

typedef void function(dGeomID plane, dVector4 result) pfdGeomPlaneGetParams;
pfdGeomPlaneGetParams          dGeomPlaneGetParams;

typedef dReal function(dGeomID plane, dReal x, dReal y, dReal z) pfdGeomPlanePointDepth;
pfdGeomPlanePointDepth          dGeomPlanePointDepth;

typedef dGeomID function(dSpaceID space, dReal radius, dReal length) pfdCreateCapsule;
pfdCreateCapsule          dCreateCapsule;

typedef void function(dGeomID ccylinder, dReal radius, dReal length) pfdGeomCapsuleSetParams;
pfdGeomCapsuleSetParams          dGeomCapsuleSetParams;

typedef void function(dGeomID ccylinder, dReal* radius, dReal* length) pfdGeomCapsuleGetParams;
pfdGeomCapsuleGetParams          dGeomCapsuleGetParams;

typedef dReal function(dGeomID ccylinder, dReal x, dReal y, dReal z) pfdGeomCapsulePointDepth;
pfdGeomCapsulePointDepth          dGeomCapsulePointDepth;

// For now we want to have a backwards compatible C-API, note: C++ API is not.
alias dCreateCapsule          dCreateCCylinder;
alias dGeomCapsuleSetParams   dGeomCCylinderSetParams;
alias dGeomCapsuleGetParams   dGeomCCylinderGetParams;
alias dGeomCapsulePointDepth  dGeomCCylinderPointDepth;
alias dCapsuleClass           dCCylinderClass;

typedef dGeomID function(dSpaceID space, dReal radius, dReal length) pfdCreateCylinder;
pfdCreateCylinder          dCreateCylinder;

typedef void function(dGeomID cylinder, dReal radius, dReal length) pfdGeomCylinderSetParams;
pfdGeomCylinderSetParams          dGeomCylinderSetParams;

typedef void function(dGeomID cylinder, dReal* radius, dReal* length) pfdGeomCylinderGetParams;
pfdGeomCylinderGetParams          dGeomCylinderGetParams;

typedef dGeomID function(dSpaceID space, dReal length) pfdCreateRay;
pfdCreateRay          dCreateRay;

typedef void function(dGeomID ray, dReal length) pfdGeomRaySetLength;
pfdGeomRaySetLength          dGeomRaySetLength;

typedef dReal function(dGeomID ray) pfdGeomRayGetLength;
pfdGeomRayGetLength          dGeomRayGetLength;

typedef void function(dGeomID ray, dReal px, dReal py, dReal pz, dReal dx, dReal dy, dReal dz) pfdGeomRaySet;
pfdGeomRaySet          dGeomRaySet;

typedef void function(dGeomID ray, dVector3 start, dVector3 dir) pfdGeomRayGet;
pfdGeomRayGet          dGeomRayGet;

/*
 * Set/get ray flags that influence ray collision detection.
 * These flags are currently only noticed by the trimesh collider, because
 * they can make a major differences there.
 */
typedef void function(dGeomID g, int FirstContact, int BackfaceCull) pfdGeomRaySetParams;
pfdGeomRaySetParams          dGeomRaySetParams;

typedef void function(dGeomID g, int* FirstContact, int* BackfaceCull) pfdGeomRayGetParams;
pfdGeomRayGetParams          dGeomRayGetParams;

typedef void function(dGeomID g, int closestHit) pfdGeomRaySetClosestHit;
pfdGeomRaySetClosestHit          dGeomRaySetClosestHit;

typedef int function(dGeomID g) pfdGeomRayGetClosestHit;
pfdGeomRayGetClosestHit          dGeomRayGetClosestHit;


typedef dGeomID function(dSpaceID space) pfdCreateGeomTransform;
pfdCreateGeomTransform          dCreateGeomTransform;

typedef void function(dGeomID g, dGeomID obj) pfdGeomTransformSetGeom;
pfdGeomTransformSetGeom          dGeomTransformSetGeom;

typedef dGeomID function(dGeomID g) pfdGeomTransformGetGeom;
pfdGeomTransformGetGeom          dGeomTransformGetGeom;

typedef void function(dGeomID g, int mode) pfdGeomTransformSetCleanup;
pfdGeomTransformSetCleanup          dGeomTransformSetCleanup;

typedef int function(dGeomID g) pfdGeomTransformGetCleanup;
pfdGeomTransformGetCleanup          dGeomTransformGetCleanup;

typedef void function(dGeomID g, int mode) pfdGeomTransformSetInfo;
pfdGeomTransformSetInfo          dGeomTransformSetInfo;

typedef int function(dGeomID g) pfdGeomTransformGetInfo;
pfdGeomTransformGetInfo          dGeomTransformGetInfo;


/* ************************************************************************ */
/* heightfield functions */


// Data storage for heightfield data.
private struct dxHeightfieldData {}
typedef dxHeightfieldData* dHeightfieldDataID;


/**
 * @brief Callback prototype
 *
 * Used by the callback heightfield data type to sample a height for a
 * given cell position.
 *
 * @param p_user_data User data specified when creating the dHeightfieldDataID
 * @param x The index of a sample in the local x axis. It is a value
 * in the range zero to ( nWidthSamples - 1 ).
 * @param x The index of a sample in the local z axis. It is a value
 * in the range zero to ( nDepthSamples - 1 ).
 *
 * @return The sample height which is then scaled and offset using the
 * values specified when the heightfield data was created.
 *
 * @ingroup collide
 */
typedef dReal function( void* p_user_data, int x, int z ) dHeightfieldGetHeight;



/**
 * @brief Creates a heightfield geom.
 *
 * Uses the information in the given dHeightfieldDataID to construct
 * a geom representing a heightfield in a collision space.
 *
 * @param space The space to add the geom to.
 * @param data The dHeightfieldDataID created by dGeomHeightfieldDataCreate and
 * setup by dGeomHeightfieldDataBuildCallback, dGeomHeightfieldDataBuildByte,
 * dGeomHeightfieldDataBuildShort or dGeomHeightfieldDataBuildFloat.
 * @param bPlaceable If non-zero this geom can be transformed in the world using the
 * usual functions such as dGeomSetPosition and dGeomSetRotation. If the geom is
 * not set as placeable, then it uses a fixed orientation where the global y axis
 * represents the dynamic 'height' of the heightfield.
 *
 * @return A geom id to reference this geom in other calls.
 *
 * @ingroup collide
 */
typedef dGeomID function(dSpaceID space, dHeightfieldDataID data, int bPlaceable) pfdCreateHeightfield;
pfdCreateHeightfield          dCreateHeightfield;


/**
 * @brief Creates a new empty dHeightfieldDataID.
 *
 * Allocates a new dHeightfieldDataID and returns it. You must call
 * dGeomHeightfieldDataDestroy to destroy it after the geom has been removed.
 * The dHeightfieldDataID value is used when specifying a data format type.
 *
 * @return A dHeightfieldDataID for use with dGeomHeightfieldDataBuildCallback,
 * dGeomHeightfieldDataBuildByte, dGeomHeightfieldDataBuildShort or
 * dGeomHeightfieldDataBuildFloat.
 * @ingroup collide
 */
typedef dHeightfieldDataID function() pfdGeomHeightfieldDataCreate;
pfdGeomHeightfieldDataCreate          dGeomHeightfieldDataCreate;


/**
 * @brief Destroys a dHeightfieldDataID.
 *
 * Deallocates a given dHeightfieldDataID and all managed resources.
 *
 * @param d A dHeightfieldDataID created by dGeomHeightfieldDataCreate
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d) pfdGeomHeightfieldDataDestroy;
pfdGeomHeightfieldDataDestroy          dGeomHeightfieldDataDestroy;


/**
 * @brief Configures a dHeightfieldDataID to use a callback to
 * retrieve height data.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is computed by
 * the user and it should use the given callback when determining
 * the height of a given element of it's shape.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d, void* pUserData, dHeightfieldGetHeight* pCallback, dReal width, dReal depth, int widthSamples, int depthSamples, dReal scale, dReal offset, dReal thickness, int bWrap) pfdGeomHeightfieldDataBuildCallback;
pfdGeomHeightfieldDataBuildCallback          dGeomHeightfieldDataBuildCallback;

/**
 * @brief Configures a dHeightfieldDataID to use height data in byte format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of bytes (8 bit unsigned) representing the height at each sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d, ubyte* pHeightData, int bCopyHeightData, dReal width, dReal depth, int widthSamples, int depthSamples, dReal scale, dReal offset, dReal thickness, int bWrap) pfdGeomHeightfieldDataBuildByte;
pfdGeomHeightfieldDataBuildByte          dGeomHeightfieldDataBuildByte;

/**
 * @brief Configures a dHeightfieldDataID to use height data in short format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of shorts (16 bit signed) representing the height at each sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d, short* pHeightData, int bCopyHeightData, dReal width, dReal depth, int widthSamples, int depthSamples, dReal scale, dReal offset, dReal thickness, int bWrap) pfdGeomHeightfieldDataBuildShort;
pfdGeomHeightfieldDataBuildShort          dGeomHeightfieldDataBuildShort;

/**
 * @brief Configures a dHeightfieldDataID to use height data in
 * single precision floating point format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of single precision floats representing the height at each
 * sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d, float* pHeightData, int bCopyHeightData, dReal width, dReal depth, int widthSamples, int depthSamples, dReal scale, dReal offset, dReal thickness, int bWrap) pfdGeomHeightfieldDataBuildSingle;
pfdGeomHeightfieldDataBuildSingle          dGeomHeightfieldDataBuildSingle;

/**
 * @brief Configures a dHeightfieldDataID to use height data in
 * double precision floating point format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of double precision floats representing the height at each
 * sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d, double* pHeightData, int bCopyHeightData, dReal width, dReal depth, int widthSamples, int depthSamples, dReal scale, dReal offset, dReal thickness, int bWrap) pfdGeomHeightfieldDataBuildDouble;
pfdGeomHeightfieldDataBuildDouble          dGeomHeightfieldDataBuildDouble;

/**
 * @brief Manually set the minimum and maximum height bounds.
 *
 * This call allows you to set explicit min / max values after initial
 * creation typically for callback heightfields which default to + /- infinity,
 * or those whose data has changed. This must be set prior to binding with a
 * geom, as the the AABB is not recomputed after it's first generation.
 *
 * @remarks The minimum and maximum values are used to compute the AABB
 * for the heightfield which is used for early rejection of collisions.
 * A close fit will yield a more efficient collision check.
 *
 * @param d A dHeightfieldDataID created by dGeomHeightfieldDataCreate
 * @param min_height The new minimum height value. Scale, offset and thickness is then applied.
 * @param max_height The new maximum height value. Scale and offset is then applied.
 * @ingroup collide
 */
typedef void function(dHeightfieldDataID d, dReal minHeight, dReal maxHeight) pfdGeomHeightfieldDataSetBounds;
pfdGeomHeightfieldDataSetBounds          dGeomHeightfieldDataSetBounds;


/**
 * @brief Assigns a dHeightfieldDataID to a heightfield geom.
 *
 * Associates the given dHeightfieldDataID with a heightfield geom.
 * This is done without affecting the GEOM_PLACEABLE flag.
 *
 * @param g A geom created by dCreateHeightfield
 * @param d A dHeightfieldDataID created by dGeomHeightfieldDataCreate
 * @ingroup collide
 */
typedef void function(dGeomID g, dHeightfieldDataID d) pfdGeomHeightfieldSetHeightfieldData;
pfdGeomHeightfieldSetHeightfieldData          dGeomHeightfieldSetHeightfieldData;


/**
 * @brief Gets the dHeightfieldDataID bound to a heightfield geom.
 *
 * Returns the dHeightfieldDataID associated with a heightfield geom.
 *
 * @param g A geom created by dCreateHeightfield
 * @return The dHeightfieldDataID which may be NULL if none was assigned.
 * @ingroup collide
 */
typedef dHeightfieldDataID function(dGeomID g) pfdGeomHeightfieldGetHeightfieldData;
pfdGeomHeightfieldGetHeightfieldData          dGeomHeightfieldGetHeightfieldData;



/* ************************************************************************ */
/* utility functions */
typedef void function(dVector3 a1, dVector3 a2, dVector3 b1, dVector3 b2, dVector3 cp1, dVector3 cp2) pfdClosestLineSegmentPoints;
pfdClosestLineSegmentPoints          dClosestLineSegmentPoints;

typedef int function(dVector3 _p1, dMatrix3 R1, dVector3 side1, dVector3 _p2, dMatrix3 R2, dVector3 side2) pfdBoxTouchesBox;
pfdBoxTouchesBox          dBoxTouchesBox;

typedef int function(dVector3 p1, dMatrix3 R1, dVector3 side1, dVector3 p2, dMatrix3 R2, dVector3 side2, dVector3 normal, dReal* depth, int* return_code, int maxc, dContactGeom* contact, int skip) pfdBoxBox;
pfdBoxBox          dBoxBox;

typedef void function(dGeomID geom, dReal aabb[6]) pfdInfiniteAABB;
pfdInfiniteAABB          dInfiniteAABB;

typedef void function() pfdInitODE;
pfdInitODE          dInitODE;

typedef void function() pfdCloseODE;
pfdCloseODE          dCloseODE;

typedef int function(dGeomClass* classptr) pfdCreateGeomClass;
pfdCreateGeomClass          dCreateGeomClass;

typedef void* function(dGeomID) pfdGeomGetClassData;
pfdGeomGetClassData          dGeomGetClassData;

typedef dGeomID function(int classnum) pfdCreateGeom;
pfdCreateGeom          dCreateGeom;


