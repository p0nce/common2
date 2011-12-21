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
module derelict.ode.contact;

private import derelict.ode.common;

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

enum {
    dContactMu2         = 0x001,
    dContactFDir1       = 0x002,
    dContactBounce      = 0x004,
    dContactSoftERP     = 0x008,
    dContactSoftCFM     = 0x010,
    dContactMotion1     = 0x020,
    dContactMotion2     = 0x040,
    dContactSlip1       = 0x080,
    dContactSlip2       = 0x100,

    dContactApprox0     = 0x0000,
    dContactApprox1_1   = 0x1000,
    dContactApprox1_2   = 0x2000,
    dContactApprox1     = 0x3000
}

/*
 * Depending on the type of dReal we need to align the data.
 * If dReal is of type double then D needs to be told to align the data
 * to match the C version.
 */
version (DerelictODE_DoublePrecision) {
    align(4):
}
struct dSurfaceParameters {
    /* must always be defined */
    int mode;
    dReal mu;

    /* only defined if the corresponding flag is set in mode */
    dReal mu2;
    dReal bounce;
    dReal bounce_vel;
    dReal soft_erp;
    dReal soft_cfm;
    dReal motion1,motion2;
    dReal slip1,slip2;
}

/**
 * @brief Describe the contact point between two geoms.
 *
 * If two bodies touch, or if a body touches a static feature in its
 * environment, the contact is represented by one or more "contact
 * points", described by dContactGeom.
 *
 * The convention is that if body 1 is moved along the normal vector by
 * a distance depth (or equivalently if body 2 is moved the same distance
 * in the opposite direction) then the contact depth will be reduced to
 * zero. This means that the normal vector points "in" to body 1.
 *
 * @ingroup collide
 */
struct dContactGeom {
    dVector3 pos;          ///< contact position
    dVector3 normal;       ///< normal vector
    dReal depth;           ///< penetration depth
    dGeomID g1,g2;         ///< the colliding geoms
    int side1,side2;       ///< (to be documented)
}

/* contact info used by contact joint */
struct dContact {
    dSurfaceParameters surface;
    dContactGeom geom;
    dVector3 fdir1;// = [0, 0, 0, 0];
}

