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
module derelict.ode.ode;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 * ODE Version 0.8
 */

private import derelict.util.loader;

public
{
    import derelict.ode.config;
    import derelict.ode.compatibility;
    import derelict.ode.common;
    import derelict.ode.contact;
    import derelict.ode.error;
    import derelict.ode.memory;
    import derelict.ode.odemath;
    import derelict.ode.matrix;
    import derelict.ode.timer;
    import derelict.ode.rotation;
    import derelict.ode.mass;
    import derelict.ode.misc;
    import derelict.ode.objects;
    import derelict.ode.collision_space;
    import derelict.ode.collision;
    import derelict.ode.collision_trimesh;
    import derelict.ode.export_dif;
}

//==============================================================================
// Loader
//==============================================================================

private void load(SharedLib lib)
{
    // error.d
    bindFunc(dSetErrorHandler)("dSetErrorHandler", lib);
    bindFunc(dSetDebugHandler)("dSetDebugHandler", lib);
    bindFunc(dSetMessageHandler)("dSetMessageHandler", lib);
    bindFunc(dGetErrorHandler)("dGetErrorHandler", lib);
    bindFunc(dGetDebugHandler)("dGetDebugHandler", lib);
    bindFunc(dGetMessageHandler)("dGetMessageHandler", lib);
    bindFunc(dError)("dError", lib);
    bindFunc(dDebug)("dDebug", lib);
    bindFunc(dMessage)("dMessage", lib);

    // memory.d
    bindFunc(dSetAllocHandler)("dSetAllocHandler", lib);
    bindFunc(dSetReallocHandler)("dSetReallocHandler", lib);
    bindFunc(dSetFreeHandler)("dSetFreeHandler", lib);
    bindFunc(dGetAllocHandler)("dGetAllocHandler", lib);
    bindFunc(dGetReallocHandler)("dGetReallocHandler", lib);
    bindFunc(dGetFreeHandler)("dGetFreeHandler", lib);
    bindFunc(dAlloc)("dAlloc", lib);
    bindFunc(dRealloc)("dRealloc", lib);
    bindFunc(dFree)("dFree", lib);

    // matrix.d
    bindFunc(dSetZero)("dSetZero", lib);
    bindFunc(dSetValue)("dSetValue", lib);
    bindFunc(dDot)("dDot", lib);
    bindFunc(dMultiply0)("dMultiply0", lib);
    bindFunc(dMultiply1)("dMultiply1", lib);
    bindFunc(dMultiply2)("dMultiply2", lib);
    bindFunc(dFactorCholesky)("dFactorCholesky", lib);
    bindFunc(dSolveCholesky)("dSolveCholesky", lib);
    bindFunc(dInvertPDMatrix)("dInvertPDMatrix", lib);
    bindFunc(dIsPositiveDefinite)("dIsPositiveDefinite", lib);
    bindFunc(dFactorLDLT)("dFactorLDLT", lib);
    bindFunc(dSolveL1)("dSolveL1", lib);
    bindFunc(dSolveL1T)("dSolveL1T", lib);
    bindFunc(dVectorScale)("dVectorScale", lib);
    bindFunc(dSolveLDLT)("dSolveLDLT", lib);
    bindFunc(dLDLTAddTL)("dLDLTAddTL", lib);
    bindFunc(dLDLTRemove)("dLDLTRemove", lib);
    bindFunc(dRemoveRowCol)("dRemoveRowCol", lib);

    // timer.d
    bindFunc(dStopwatchReset)("dStopwatchReset", lib);
    bindFunc(dStopwatchStart)("dStopwatchStart", lib);
    bindFunc(dStopwatchStop)("dStopwatchStop", lib);
    bindFunc(dStopwatchTime)("dStopwatchTime", lib);
    bindFunc(dTimerStart)("dTimerStart", lib);
    bindFunc(dTimerNow)("dTimerNow", lib);
    bindFunc(dTimerEnd)("dTimerEnd", lib);
    bindFunc(dTimerReport)("dTimerReport", lib);
    bindFunc(dTimerTicksPerSecond)("dTimerTicksPerSecond", lib);
    bindFunc(dTimerResolution)("dTimerResolution", lib);

    // rotation.d
    bindFunc(dRSetIdentity)("dRSetIdentity", lib);
    bindFunc(dRFromAxisAndAngle)("dRFromAxisAndAngle", lib);
    bindFunc(dRFromEulerAngles)("dRFromEulerAngles", lib);
    bindFunc(dRFrom2Axes)("dRFrom2Axes", lib);
    bindFunc(dRFromZAxis)("dRFromZAxis", lib);
    bindFunc(dQSetIdentity)("dQSetIdentity", lib);
    bindFunc(dQFromAxisAndAngle)("dQFromAxisAndAngle", lib);
    bindFunc(dQMultiply0)("dQMultiply0", lib);
    bindFunc(dQMultiply1)("dQMultiply1", lib);
    bindFunc(dQMultiply2)("dQMultiply2", lib);
    bindFunc(dQMultiply3)("dQMultiply3", lib);
    bindFunc(dRfromQ)("dRfromQ", lib);
    bindFunc(dQfromR)("dQfromR", lib);
    bindFunc(dDQfromW)("dDQfromW", lib);

    // mass.d
    bindFunc(dMassCheck)("dMassCheck", lib);
    bindFunc(dMassSetZero)("dMassSetZero", lib);
    bindFunc(dMassSetParameters)("dMassSetParameters", lib);
    bindFunc(dMassSetSphere)("dMassSetSphere", lib);
    bindFunc(dMassSetSphereTotal)("dMassSetSphereTotal", lib);
    bindFunc(dMassSetCapsule)("dMassSetCapsule", lib);
    bindFunc(dMassSetCapsuleTotal)("dMassSetCapsuleTotal", lib);
    bindFunc(dMassSetCylinder)("dMassSetCylinder", lib);
    bindFunc(dMassSetCylinderTotal)("dMassSetCylinderTotal", lib);
    bindFunc(dMassSetBox)("dMassSetBox", lib);
    bindFunc(dMassSetBoxTotal)("dMassSetBoxTotal", lib);
    bindFunc(dMassAdjust)("dMassAdjust", lib);
    bindFunc(dMassTranslate)("dMassTranslate", lib);
    bindFunc(dMassRotate)("dMassRotate", lib);
    bindFunc(dMassAdd)("dMassAdd", lib);
    // Added in 0.8
    bindFunc(dMassSetTrimesh)("dMassSetTrimesh", lib);

    // misc.d
    bindFunc(dTestRand)("dTestRand", lib);
    bindFunc(dRand)("dRand", lib);
    bindFunc(dRandGetSeed)("dRandGetSeed", lib);
    bindFunc(dRandSetSeed)("dRandSetSeed", lib);
    bindFunc(dRandInt)("dRandInt", lib);
    bindFunc(dRandReal)("dRandReal", lib);
    bindFunc(dPrintMatrix)("dPrintMatrix", lib);
    bindFunc(dMakeRandomVector)("dMakeRandomVector", lib);
    bindFunc(dMakeRandomMatrix)("dMakeRandomMatrix", lib);
    bindFunc(dClearUpperTriangle)("dClearUpperTriangle", lib);
    bindFunc(dMaxDifference)("dMaxDifference", lib);
    bindFunc(dMaxDifferenceLowerTriangle)("dMaxDifferenceLowerTriangle", lib);

    // objects.d
    bindFunc(dWorldCreate)("dWorldCreate", lib);
    bindFunc(dWorldDestroy)("dWorldDestroy", lib);
    bindFunc(dWorldSetGravity)("dWorldSetGravity", lib);
    bindFunc(dWorldGetGravity)("dWorldGetGravity", lib);
    bindFunc(dWorldSetERP)("dWorldSetERP", lib);
    bindFunc(dWorldGetERP)("dWorldGetERP", lib);
    bindFunc(dWorldSetCFM)("dWorldSetCFM", lib);
    bindFunc(dWorldGetCFM)("dWorldGetCFM", lib);
    bindFunc(dWorldStep)("dWorldStep", lib);
    bindFunc(dWorldImpulseToForce)("dWorldImpulseToForce", lib);
    bindFunc(dWorldQuickStep)("dWorldQuickStep", lib);
    bindFunc(dWorldSetQuickStepNumIterations)("dWorldSetQuickStepNumIterations", lib);
    bindFunc(dWorldGetQuickStepNumIterations)("dWorldGetQuickStepNumIterations", lib);
    bindFunc(dWorldSetQuickStepW)("dWorldSetQuickStepW", lib);
    bindFunc(dWorldGetQuickStepW)("dWorldGetQuickStepW", lib);
    bindFunc(dWorldSetContactMaxCorrectingVel)("dWorldSetContactMaxCorrectingVel", lib);
    bindFunc(dWorldGetContactMaxCorrectingVel)("dWorldGetContactMaxCorrectingVel", lib);
    bindFunc(dWorldSetContactSurfaceLayer)("dWorldSetContactSurfaceLayer", lib);
    bindFunc(dWorldGetContactSurfaceLayer)("dWorldGetContactSurfaceLayer", lib);
    bindFunc(dWorldStepFast1)("dWorldStepFast1", lib);
    bindFunc(dWorldSetAutoEnableDepthSF1)("dWorldSetAutoEnableDepthSF1", lib);
    bindFunc(dWorldGetAutoEnableDepthSF1)("dWorldGetAutoEnableDepthSF1", lib);
    bindFunc(dWorldGetAutoDisableLinearThreshold)("dWorldGetAutoDisableLinearThreshold", lib);
    bindFunc(dWorldSetAutoDisableLinearThreshold)("dWorldSetAutoDisableLinearThreshold", lib);
    bindFunc(dWorldGetAutoDisableAngularThreshold)("dWorldGetAutoDisableAngularThreshold", lib);
    bindFunc(dWorldSetAutoDisableAngularThreshold)("dWorldSetAutoDisableAngularThreshold", lib);
    bindFunc(dWorldGetAutoDisableSteps)("dWorldGetAutoDisableSteps", lib);
    bindFunc(dWorldSetAutoDisableSteps)("dWorldSetAutoDisableSteps", lib);
    bindFunc(dWorldGetAutoDisableTime)("dWorldGetAutoDisableTime", lib);
    bindFunc(dWorldSetAutoDisableTime)("dWorldSetAutoDisableTime", lib);
    bindFunc(dWorldGetAutoDisableFlag)("dWorldGetAutoDisableFlag", lib);
    bindFunc(dWorldSetAutoDisableFlag)("dWorldSetAutoDisableFlag", lib);
    bindFunc(dBodyGetAutoDisableLinearThreshold)("dBodyGetAutoDisableLinearThreshold", lib);
    bindFunc(dBodySetAutoDisableLinearThreshold)("dBodySetAutoDisableLinearThreshold", lib);
    bindFunc(dBodyGetAutoDisableAngularThreshold)("dBodyGetAutoDisableAngularThreshold", lib);
    bindFunc(dBodySetAutoDisableAngularThreshold)("dBodySetAutoDisableAngularThreshold", lib);
    bindFunc(dBodyGetAutoDisableSteps)("dBodyGetAutoDisableSteps", lib);
    bindFunc(dBodySetAutoDisableSteps)("dBodySetAutoDisableSteps", lib);
    bindFunc(dBodyGetAutoDisableTime)("dBodyGetAutoDisableTime", lib);
    bindFunc(dBodySetAutoDisableTime)("dBodySetAutoDisableTime", lib);
    bindFunc(dBodyGetAutoDisableFlag)("dBodyGetAutoDisableFlag", lib);
    bindFunc(dBodySetAutoDisableFlag)("dBodySetAutoDisableFlag", lib);
    bindFunc(dBodySetAutoDisableDefaults)("dBodySetAutoDisableDefaults", lib);
    bindFunc(dBodyCreate)("dBodyCreate", lib);
    bindFunc(dBodyDestroy)("dBodyDestroy", lib);
    bindFunc(dBodySetData)("dBodySetData", lib);
    bindFunc(dBodyGetData)("dBodyGetData", lib);
    bindFunc(dBodySetPosition)("dBodySetPosition", lib);
    bindFunc(dBodySetRotation)("dBodySetRotation", lib);
    bindFunc(dBodySetQuaternion)("dBodySetQuaternion", lib);
    bindFunc(dBodySetLinearVel)("dBodySetLinearVel", lib);
    bindFunc(dBodySetAngularVel)("dBodySetAngularVel", lib);
    bindFunc(dBodyGetPosition)("dBodyGetPosition", lib);
    bindFunc(dBodyCopyPosition)("dBodyCopyPosition", lib);
    bindFunc(dBodyGetRotation)("dBodyGetRotation", lib);
    bindFunc(dBodyGetQuaternion)("dBodyGetQuaternion", lib);
    bindFunc(dBodyCopyQuaternion)("dBodyCopyQuaternion", lib);
    bindFunc(dBodyGetLinearVel)("dBodyGetLinearVel", lib);
    bindFunc(dBodyGetAngularVel)("dBodyGetAngularVel", lib);
    bindFunc(dBodySetMass)("dBodySetMass", lib);
    bindFunc(dBodyGetMass)("dBodyGetMass", lib);
    bindFunc(dBodyAddForce)("dBodyAddForce", lib);
    bindFunc(dBodyAddTorque)("dBodyAddTorque", lib);
    bindFunc(dBodyAddRelForce)("dBodyAddRelForce", lib);
    bindFunc(dBodyAddRelTorque)("dBodyAddRelTorque", lib);
    bindFunc(dBodyAddForceAtPos)("dBodyAddForceAtPos", lib);
    bindFunc(dBodyAddForceAtRelPos)("dBodyAddForceAtRelPos", lib);
    bindFunc(dBodyAddRelForceAtPos)("dBodyAddRelForceAtPos", lib);
    bindFunc(dBodyAddRelForceAtRelPos)("dBodyAddRelForceAtRelPos", lib);
    bindFunc(dBodyGetForce)("dBodyGetForce", lib);
    bindFunc(dBodyGetTorque)("dBodyGetTorque", lib);
    bindFunc(dBodySetForce)("dBodySetForce", lib);
    bindFunc(dBodySetTorque)("dBodySetTorque", lib);
    bindFunc(dBodyGetRelPointPos)("dBodyGetRelPointPos", lib);
    bindFunc(dBodyGetRelPointVel)("dBodyGetRelPointVel", lib);
    bindFunc(dBodyGetPointVel)("dBodyGetPointVel", lib);
    bindFunc(dBodyGetPosRelPoint)("dBodyGetPosRelPoint", lib);
    bindFunc(dBodyVectorToWorld)("dBodyVectorToWorld", lib);
    bindFunc(dBodyVectorFromWorld)("dBodyVectorFromWorld", lib);
    bindFunc(dBodySetFiniteRotationMode)("dBodySetFiniteRotationMode", lib);
    bindFunc(dBodySetFiniteRotationAxis)("dBodySetFiniteRotationAxis", lib);
    bindFunc(dBodyGetFiniteRotationMode)("dBodyGetFiniteRotationMode", lib);
    bindFunc(dBodyGetFiniteRotationAxis)("dBodyGetFiniteRotationAxis", lib);
    bindFunc(dBodyGetNumJoints)("dBodyGetNumJoints", lib);
    bindFunc(dBodyGetJoint)("dBodyGetJoint", lib);
    bindFunc(dBodyEnable)("dBodyEnable", lib);
    bindFunc(dBodyDisable)("dBodyDisable", lib);
    bindFunc(dBodyIsEnabled)("dBodyIsEnabled", lib);
    bindFunc(dBodySetGravityMode)("dBodySetGravityMode", lib);
    bindFunc(dBodyGetGravityMode)("dBodyGetGravityMode", lib);
    bindFunc(dJointCreateBall)("dJointCreateBall", lib);
    bindFunc(dJointCreateHinge)("dJointCreateHinge", lib);
    bindFunc(dJointCreateSlider)("dJointCreateSlider", lib);
    bindFunc(dJointCreateContact)("dJointCreateContact", lib);
    bindFunc(dJointCreateHinge2)("dJointCreateHinge2", lib);
    bindFunc(dJointCreateUniversal)("dJointCreateUniversal", lib);
    bindFunc(dJointCreateFixed)("dJointCreateFixed", lib);
    bindFunc(dJointCreateNull)("dJointCreateNull", lib);
    bindFunc(dJointCreateAMotor)("dJointCreateAMotor", lib);
    bindFunc(dJointCreateLMotor)("dJointCreateLMotor", lib);
    bindFunc(dJointCreatePlane2D)("dJointCreatePlane2D", lib);
    bindFunc(dJointDestroy)("dJointDestroy", lib);
    bindFunc(dJointGroupCreate)("dJointGroupCreate", lib);
    bindFunc(dJointGroupDestroy)("dJointGroupDestroy", lib);
    bindFunc(dJointGroupEmpty)("dJointGroupEmpty", lib);
    bindFunc(dJointAttach)("dJointAttach", lib);
    bindFunc(dJointSetData)("dJointSetData", lib);
    bindFunc(dJointGetData)("dJointGetData", lib);
    bindFunc(dJointGetType)("dJointGetType", lib);
    bindFunc(dJointGetBody)("dJointGetBody", lib);
    bindFunc(dJointSetFeedback)("dJointSetFeedback", lib);
    bindFunc(dJointGetFeedback)("dJointGetFeedback", lib);
    bindFunc(dJointSetBallAnchor)("dJointSetBallAnchor", lib);
    bindFunc(dJointSetBallAnchor2)("dJointSetBallAnchor2", lib);
    bindFunc(dJointSetHingeAnchor)("dJointSetHingeAnchor", lib);
    bindFunc(dJointSetHingeAnchorDelta)("dJointSetHingeAnchorDelta", lib);
    bindFunc(dJointSetHingeAxis)("dJointSetHingeAxis", lib);
    bindFunc(dJointSetHingeParam)("dJointSetHingeParam", lib);
    bindFunc(dJointAddHingeTorque)("dJointAddHingeTorque", lib);
    bindFunc(dJointSetSliderAxis)("dJointSetSliderAxis", lib);
    bindFunc(dJointSetSliderAxisDelta)("dJointSetSliderAxisDelta", lib);
    bindFunc(dJointSetSliderParam)("dJointSetSliderParam", lib);
    bindFunc(dJointAddSliderForce)("dJointAddSliderForce", lib);
    bindFunc(dJointSetHinge2Anchor)("dJointSetHinge2Anchor", lib);
    bindFunc(dJointSetHinge2Axis1)("dJointSetHinge2Axis1", lib);
    bindFunc(dJointSetHinge2Axis2)("dJointSetHinge2Axis2", lib);
    bindFunc(dJointSetHinge2Param)("dJointSetHinge2Param", lib);
    bindFunc(dJointAddHinge2Torques)("dJointAddHinge2Torques", lib);
    bindFunc(dJointSetUniversalAnchor)("dJointSetUniversalAnchor", lib);
    bindFunc(dJointSetUniversalAxis1)("dJointSetUniversalAxis1", lib);
    bindFunc(dJointSetUniversalAxis2)("dJointSetUniversalAxis2", lib);
    bindFunc(dJointSetUniversalParam)("dJointSetUniversalParam", lib);
    bindFunc(dJointAddUniversalTorques)("dJointAddUniversalTorques", lib);
    bindFunc(dJointSetFixed)("dJointSetFixed", lib);
    bindFunc(dJointSetAMotorNumAxes)("dJointSetAMotorNumAxes", lib);
    bindFunc(dJointSetAMotorAxis)("dJointSetAMotorAxis", lib);
    bindFunc(dJointSetAMotorAngle)("dJointSetAMotorAngle", lib);
    bindFunc(dJointSetAMotorParam)("dJointSetAMotorParam", lib);
    bindFunc(dJointSetAMotorMode)("dJointSetAMotorMode", lib);
    bindFunc(dJointAddAMotorTorques)("dJointAddAMotorTorques", lib);
    bindFunc(dJointSetLMotorNumAxes)("dJointSetLMotorNumAxes", lib);
    bindFunc(dJointSetLMotorAxis)("dJointSetLMotorAxis", lib);
    bindFunc(dJointSetLMotorParam)("dJointSetLMotorParam", lib);
    bindFunc(dJointSetPlane2DXParam)("dJointSetPlane2DXParam", lib);
    bindFunc(dJointSetPlane2DYParam)("dJointSetPlane2DYParam", lib);
    bindFunc(dJointSetPlane2DAngleParam)("dJointSetPlane2DAngleParam", lib);
    bindFunc(dJointGetBallAnchor)("dJointGetBallAnchor", lib);
    bindFunc(dJointGetBallAnchor2)("dJointGetBallAnchor2", lib);
    bindFunc(dJointGetHingeAnchor)("dJointGetHingeAnchor", lib);
    bindFunc(dJointGetHingeAnchor2)("dJointGetHingeAnchor2", lib);
    bindFunc(dJointGetHingeAxis)("dJointGetHingeAxis", lib);
    bindFunc(dJointGetHingeParam)("dJointGetHingeParam", lib);
    bindFunc(dJointGetHingeAngle)("dJointGetHingeAngle", lib);
    bindFunc(dJointGetHingeAngleRate)("dJointGetHingeAngleRate", lib);
    bindFunc(dJointGetSliderPosition)("dJointGetSliderPosition", lib);
    bindFunc(dJointGetSliderPositionRate)("dJointGetSliderPositionRate", lib);
    bindFunc(dJointGetSliderAxis)("dJointGetSliderAxis", lib);
    bindFunc(dJointGetSliderParam)("dJointGetSliderParam", lib);
    bindFunc(dJointGetHinge2Anchor)("dJointGetHinge2Anchor", lib);
    bindFunc(dJointGetHinge2Anchor2)("dJointGetHinge2Anchor2", lib);
    bindFunc(dJointGetHinge2Axis1)("dJointGetHinge2Axis1", lib);
    bindFunc(dJointGetHinge2Axis2)("dJointGetHinge2Axis2", lib);
    bindFunc(dJointGetHinge2Param)("dJointGetHinge2Param", lib);
    bindFunc(dJointGetHinge2Angle1)("dJointGetHinge2Angle1", lib);
    bindFunc(dJointGetHinge2Angle1Rate)("dJointGetHinge2Angle1Rate", lib);
    bindFunc(dJointGetHinge2Angle2Rate)("dJointGetHinge2Angle2Rate", lib);
    bindFunc(dJointGetUniversalAnchor)("dJointGetUniversalAnchor", lib);
    bindFunc(dJointGetUniversalAnchor2)("dJointGetUniversalAnchor2", lib);
    bindFunc(dJointGetUniversalAxis1)("dJointGetUniversalAxis1", lib);
    bindFunc(dJointGetUniversalAxis2)("dJointGetUniversalAxis2", lib);
    bindFunc(dJointGetUniversalParam)("dJointGetUniversalParam", lib);
    bindFunc(dJointGetUniversalAngle1)("dJointGetUniversalAngle1", lib);
    bindFunc(dJointGetUniversalAngle2)("dJointGetUniversalAngle2", lib);
    bindFunc(dJointGetUniversalAngle1Rate)("dJointGetUniversalAngle1Rate", lib);
    bindFunc(dJointGetUniversalAngle2Rate)("dJointGetUniversalAngle2Rate", lib);
    bindFunc(dJointGetAMotorNumAxes)("dJointGetAMotorNumAxes", lib);
    bindFunc(dJointGetAMotorAxis)("dJointGetAMotorAxis", lib);
    bindFunc(dJointGetAMotorAxisRel)("dJointGetAMotorAxisRel", lib);
    bindFunc(dJointGetAMotorAngle)("dJointGetAMotorAngle", lib);
    bindFunc(dJointGetAMotorAngleRate)("dJointGetAMotorAngleRate", lib);
    bindFunc(dJointGetAMotorParam)("dJointGetAMotorParam", lib);
    bindFunc(dJointGetAMotorMode)("dJointGetAMotorMode", lib);
    bindFunc(dJointGetLMotorNumAxes)("dJointGetLMotorNumAxes", lib);
    bindFunc(dJointGetLMotorAxis)("dJointGetLMotorAxis", lib);
    bindFunc(dJointGetLMotorParam)("dJointGetLMotorParam", lib);
    bindFunc(dConnectingJoint)("dConnectingJoint", lib);
    bindFunc(dConnectingJointList)("dConnectingJointList", lib);
    bindFunc(dAreConnected)("dAreConnected", lib);
    bindFunc(dAreConnectedExcluding)("dAreConnectedExcluding", lib);
    // Added in 0.8
    //bindFunc(dWorldGetAutoDisableLinearAverageThreshold)("dWorldGetAutoDisableLinearAverageThreshold", lib);
    //bindFunc(dWorldSetAutoDisableLinearAverageThreshold)("dWorldSetAutoDisableLinearAverageThreshold", lib);
    //bindFunc(dWorldGetAutoDisableAngularAverageThreshold)("dWorldGetAutoDisableAngularAverageThreshold", lib);
    //bindFunc(dWorldSetAutoDisableAngularAverageThreshold)("dWorldSetAutoDisableAngularAverageThreshold", lib);
    bindFunc(dWorldGetAutoDisableAverageSamplesCount)("dWorldGetAutoDisableAverageSamplesCount", lib);
    bindFunc(dWorldSetAutoDisableAverageSamplesCount)("dWorldSetAutoDisableAverageSamplesCount", lib);
    bindFunc(dBodyGetWorld)("dBodyGetWorld", lib);
    bindFunc(dBodyCopyRotation)("dBodyCopyRotation", lib);
    bindFunc(dJointCreatePR)("dJointCreatePR", lib);
    bindFunc(dJointSetPRAnchor)("dJointSetPRAnchor", lib);
    bindFunc(dJointSetPRAxis1)("dJointSetPRAxis1", lib);
    bindFunc(dJointSetPRAxis2)("dJointSetPRAxis2", lib);
    bindFunc(dJointSetPRParam)("dJointSetPRParam", lib);
    bindFunc(dJointAddPRTorque)("dJointAddPRTorque", lib);
    bindFunc(dJointGetUniversalAngles)("dJointGetUniversalAngles", lib);
    bindFunc(dJointGetPRAnchor)("dJointGetPRAnchor", lib);
    bindFunc(dJointGetPRPosition)("dJointGetPRPosition", lib);
    bindFunc(dJointGetPRPositionRate)("dJointGetPRPositionRate", lib);
    bindFunc(dJointGetPRAxis1)("dJointGetPRAxis1", lib);
    bindFunc(dJointGetPRAxis2)("dJointGetPRAxis2", lib);
    bindFunc(dJointGetPRParam)("dJointGetPRParam", lib);


    // collision_space.d
    bindFunc(dSimpleSpaceCreate)("dSimpleSpaceCreate", lib);
    bindFunc(dHashSpaceCreate)("dHashSpaceCreate", lib);
    bindFunc(dQuadTreeSpaceCreate)("dQuadTreeSpaceCreate", lib);
    bindFunc(dSpaceDestroy)("dSpaceDestroy", lib);
    bindFunc(dHashSpaceSetLevels)("dHashSpaceSetLevels", lib);
    bindFunc(dHashSpaceGetLevels)("dHashSpaceGetLevels", lib);
    bindFunc(dSpaceSetCleanup)("dSpaceSetCleanup", lib);
    bindFunc(dSpaceGetCleanup)("dSpaceGetCleanup", lib);
    bindFunc(dSpaceAdd)("dSpaceAdd", lib);
    bindFunc(dSpaceRemove)("dSpaceRemove", lib);
    bindFunc(dSpaceQuery)("dSpaceQuery", lib);
    bindFunc(dSpaceClean)("dSpaceClean", lib);
    bindFunc(dSpaceGetNumGeoms)("dSpaceGetNumGeoms", lib);
    bindFunc(dSpaceGetGeom)("dSpaceGetGeom", lib);

    // collision.d
    bindFunc(dGeomDestroy)("dGeomDestroy", lib);
    bindFunc(dGeomSetData)("dGeomSetData", lib);
    bindFunc(dGeomGetData)("dGeomGetData", lib);
    bindFunc(dGeomSetBody)("dGeomSetBody", lib);
    bindFunc(dGeomGetBody)("dGeomGetBody", lib);
    bindFunc(dGeomSetPosition)("dGeomSetPosition", lib);
    bindFunc(dGeomSetRotation)("dGeomSetRotation", lib);
    bindFunc(dGeomSetQuaternion)("dGeomSetQuaternion", lib);
    bindFunc(dGeomGetPosition)("dGeomGetPosition", lib);
    bindFunc(dGeomGetRotation)("dGeomGetRotation", lib);
    bindFunc(dGeomGetQuaternion)("dGeomGetQuaternion", lib);
    bindFunc(dGeomGetAABB)("dGeomGetAABB", lib);
    bindFunc(dGeomIsSpace)("dGeomIsSpace", lib);
    bindFunc(dGeomGetSpace)("dGeomGetSpace", lib);
    bindFunc(dGeomGetClass)("dGeomGetClass", lib);
    bindFunc(dGeomSetCategoryBits)("dGeomSetCategoryBits", lib);
    bindFunc(dGeomSetCollideBits)("dGeomSetCollideBits", lib);
    bindFunc(dGeomGetCategoryBits)("dGeomGetCategoryBits", lib);
    bindFunc(dGeomGetCollideBits)("dGeomGetCollideBits", lib);
    bindFunc(dGeomEnable)("dGeomEnable", lib);
    bindFunc(dGeomDisable)("dGeomDisable", lib);
    bindFunc(dGeomIsEnabled)("dGeomIsEnabled", lib);
    bindFunc(dGeomSetOffsetPosition)("dGeomSetOffsetPosition", lib);
    bindFunc(dGeomSetOffsetRotation)("dGeomSetOffsetRotation", lib);
    bindFunc(dGeomSetOffsetQuaternion)("dGeomSetOffsetQuaternion", lib);
    bindFunc(dGeomSetOffsetWorldPosition)("dGeomSetOffsetWorldPosition", lib);
    bindFunc(dGeomSetOffsetWorldRotation)("dGeomSetOffsetWorldRotation", lib);
    bindFunc(dGeomSetOffsetWorldQuaternion)("dGeomSetOffsetWorldQuaternion", lib);
    bindFunc(dGeomClearOffset)("dGeomClearOffset", lib);
    bindFunc(dGeomIsOffset)("dGeomIsOffset", lib);
    bindFunc(dGeomGetOffsetPosition)("dGeomGetOffsetPosition", lib);
    bindFunc(dGeomGetOffsetRotation)("dGeomGetOffsetRotation", lib);
    bindFunc(dGeomGetOffsetQuaternion)("dGeomGetOffsetQuaternion", lib);
    bindFunc(dCollide)("dCollide", lib);
    bindFunc(dSpaceCollide)("dSpaceCollide", lib);
    bindFunc(dSpaceCollide2)("dSpaceCollide2", lib);
    bindFunc(dCreateSphere)("dCreateSphere", lib);
    bindFunc(dGeomSphereSetRadius)("dGeomSphereSetRadius", lib);
    bindFunc(dGeomSphereGetRadius)("dGeomSphereGetRadius", lib);
    bindFunc(dGeomSpherePointDepth)("dGeomSpherePointDepth", lib);
    bindFunc(dCreateConvex)("dCreateConvex", lib);
    bindFunc(dGeomSetConvex)("dGeomSetConvex", lib);
    bindFunc(dCreateBox)("dCreateBox", lib);
    bindFunc(dGeomBoxSetLengths)("dGeomBoxSetLengths", lib);
    bindFunc(dGeomBoxGetLengths)("dGeomBoxGetLengths", lib);
    bindFunc(dGeomBoxPointDepth)("dGeomBoxPointDepth", lib);
    bindFunc(dCreatePlane)("dCreatePlane", lib);
    bindFunc(dGeomPlaneSetParams)("dGeomPlaneSetParams", lib);
    bindFunc(dGeomPlaneGetParams)("dGeomPlaneGetParams", lib);
    bindFunc(dGeomPlanePointDepth)("dGeomPlanePointDepth", lib);
    bindFunc(dCreateCapsule)("dCreateCapsule", lib);
    bindFunc(dGeomCapsuleSetParams)("dGeomCapsuleSetParams", lib);
    bindFunc(dGeomCapsuleGetParams)("dGeomCapsuleGetParams", lib);
    bindFunc(dGeomCapsulePointDepth)("dGeomCapsulePointDepth", lib);
    bindFunc(dCreateCylinder)("dCreateCylinder", lib);
    bindFunc(dGeomCylinderSetParams)("dGeomCylinderSetParams", lib);
    bindFunc(dGeomCylinderGetParams)("dGeomCylinderGetParams", lib);
    bindFunc(dCreateRay)("dCreateRay", lib);
    bindFunc(dGeomRaySetLength)("dGeomRaySetLength", lib);
    bindFunc(dGeomRayGetLength)("dGeomRayGetLength", lib);
    bindFunc(dGeomRaySet)("dGeomRaySet", lib);
    bindFunc(dGeomRayGet)("dGeomRayGet", lib);
    bindFunc(dGeomRaySetParams)("dGeomRaySetParams", lib);
    bindFunc(dGeomRayGetParams)("dGeomRayGetParams", lib);
    bindFunc(dGeomRaySetClosestHit)("dGeomRaySetClosestHit", lib);
    bindFunc(dGeomRayGetClosestHit)("dGeomRayGetClosestHit", lib);
    bindFunc(dCreateGeomTransform)("dCreateGeomTransform", lib);
    bindFunc(dGeomTransformSetGeom)("dGeomTransformSetGeom", lib);
    bindFunc(dGeomTransformGetGeom)("dGeomTransformGetGeom", lib);
    bindFunc(dGeomTransformSetCleanup)("dGeomTransformSetCleanup", lib);
    bindFunc(dGeomTransformGetCleanup)("dGeomTransformGetCleanup", lib);
    bindFunc(dGeomTransformSetInfo)("dGeomTransformSetInfo", lib);
    bindFunc(dGeomTransformGetInfo)("dGeomTransformGetInfo", lib);
    bindFunc(dCreateHeightfield)("dCreateHeightfield", lib);
    bindFunc(dGeomHeightfieldDataCreate)("dGeomHeightfieldDataCreate", lib);
    bindFunc(dGeomHeightfieldDataDestroy)("dGeomHeightfieldDataDestroy", lib);
    bindFunc(dGeomHeightfieldDataBuildCallback)("dGeomHeightfieldDataBuildCallback", lib);
    bindFunc(dGeomHeightfieldDataBuildByte)("dGeomHeightfieldDataBuildByte", lib);
    bindFunc(dGeomHeightfieldDataBuildShort)("dGeomHeightfieldDataBuildShort", lib);
    bindFunc(dGeomHeightfieldDataBuildSingle)("dGeomHeightfieldDataBuildSingle", lib);
    bindFunc(dGeomHeightfieldDataBuildDouble)("dGeomHeightfieldDataBuildDouble", lib);
    bindFunc(dGeomHeightfieldDataSetBounds)("dGeomHeightfieldDataSetBounds", lib);
    bindFunc(dGeomHeightfieldSetHeightfieldData)("dGeomHeightfieldSetHeightfieldData", lib);
    bindFunc(dGeomHeightfieldGetHeightfieldData)("dGeomHeightfieldGetHeightfieldData", lib);
    bindFunc(dClosestLineSegmentPoints)("dClosestLineSegmentPoints", lib);
    bindFunc(dBoxTouchesBox)("dBoxTouchesBox", lib);
    bindFunc(dBoxBox)("dBoxBox", lib);
    bindFunc(dInfiniteAABB)("dInfiniteAABB", lib);
    bindFunc(dCloseODE)("dCloseODE", lib);
    bindFunc(dCreateGeomClass)("dCreateGeomClass", lib);
    bindFunc(dGeomGetClassData)("dGeomGetClassData", lib);
    bindFunc(dCreateGeom)("dCreateGeom", lib);
    // Added in 0.8
    bindFunc(dGeomCopyPosition)("dGeomCopyPosition", lib);
    bindFunc(dGeomCopyRotation)("dGeomCopyRotation", lib);
    bindFunc(dGeomCopyOffsetPosition)("dGeomCopyOffsetPosition", lib);
    bindFunc(dGeomCopyOffsetRotation)("dGeomCopyOffsetRotation", lib);
    bindFunc(dInitODE)("dInitODE", lib);

    // collision_trimesh.d
    bindFunc(dGeomTriMeshDataCreate)("dGeomTriMeshDataCreate", lib);
    bindFunc(dGeomTriMeshDataDestroy)("dGeomTriMeshDataDestroy", lib);
    bindFunc(dGeomTriMeshDataSet)("dGeomTriMeshDataSet", lib);
    bindFunc(dGeomTriMeshDataGet)("dGeomTriMeshDataGet", lib);
    bindFunc(dGeomTriMeshSetLastTransform)("dGeomTriMeshSetLastTransform", lib);
    bindFunc(dGeomTriMeshGetLastTransform)("dGeomTriMeshGetLastTransform", lib);
    bindFunc(dGeomTriMeshDataBuildSingle)("dGeomTriMeshDataBuildSingle", lib);
    bindFunc(dGeomTriMeshDataBuildSingle1)("dGeomTriMeshDataBuildSingle1", lib);
    bindFunc(dGeomTriMeshDataBuildDouble)("dGeomTriMeshDataBuildDouble", lib);
    bindFunc(dGeomTriMeshDataBuildDouble1)("dGeomTriMeshDataBuildDouble1", lib);
    bindFunc(dGeomTriMeshDataBuildSimple)("dGeomTriMeshDataBuildSimple", lib);
    bindFunc(dGeomTriMeshDataBuildSimple1)("dGeomTriMeshDataBuildSimple1", lib);
    bindFunc(dGeomTriMeshDataPreprocess)("dGeomTriMeshDataPreprocess", lib);
    bindFunc(dGeomTriMeshDataGetBuffer)("dGeomTriMeshDataGetBuffer", lib);
    bindFunc(dGeomTriMeshDataSetBuffer)("dGeomTriMeshDataSetBuffer", lib);
    bindFunc(dGeomTriMeshSetCallback)("dGeomTriMeshSetCallback", lib);
    bindFunc(dGeomTriMeshGetCallback)("dGeomTriMeshGetCallback", lib);
    bindFunc(dGeomTriMeshSetArrayCallback)("dGeomTriMeshSetArrayCallback", lib);
    bindFunc(dGeomTriMeshGetArrayCallback)("dGeomTriMeshGetArrayCallback", lib);
    bindFunc(dGeomTriMeshSetRayCallback)("dGeomTriMeshSetRayCallback", lib);
    bindFunc(dGeomTriMeshGetRayCallback)("dGeomTriMeshGetRayCallback", lib);
    bindFunc(dCreateTriMesh)("dCreateTriMesh", lib);
    bindFunc(dGeomTriMeshSetData)("dGeomTriMeshSetData", lib);
    bindFunc(dGeomTriMeshGetData)("dGeomTriMeshGetData", lib);
    bindFunc(dGeomTriMeshEnableTC)("dGeomTriMeshEnableTC", lib);
    bindFunc(dGeomTriMeshIsTCEnabled)("dGeomTriMeshIsTCEnabled", lib);
    bindFunc(dGeomTriMeshClearTCCache)("dGeomTriMeshClearTCCache", lib);
    bindFunc(dGeomTriMeshGetTriMeshDataID)("dGeomTriMeshGetTriMeshDataID", lib);
    bindFunc(dGeomTriMeshGetTriangle)("dGeomTriMeshGetTriangle", lib);
    bindFunc(dGeomTriMeshGetPoint)("dGeomTriMeshGetPoint", lib);
    bindFunc(dGeomTriMeshGetTriangleCount)("dGeomTriMeshGetTriangleCount", lib);
    bindFunc(dGeomTriMeshDataUpdate)("dGeomTriMeshDataUpdate", lib);
    // Added in 0.8
    bindFunc(dGeomTriMeshSetLastTransform)("dGeomTriMeshSetLastTransform", lib);
    bindFunc(dGeomTriMeshGetLastTransform)("dGeomTriMeshGetLastTransform", lib);

    // export-dif.d
    //bindFunc(dWorldExportDIF)("dWorldExportDIF", lib);

    // odemath.d
    bindFunc(dNormalize3)("dNormalize3", lib);
    bindFunc(dNormalize4)("dNormalize4", lib);
    bindFunc(dPlaneSpace)("dPlaneSpace", lib);
}

GenericLoader DerelictODE;
static this() {
    DerelictODE.setup(
        "ode.dll",
        "libode.so, libode.so.0, libode.so.0.8.0",
        "",
        &load
    );
}
