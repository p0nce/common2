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
module derelict.ode.mass;

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

version (DerelictODE_DoublePrecision)
    align(4)
// m = source
void copyMass(dMass mFrom, dMass mTo) {
    mTo.mass = mFrom.mass;
    int i = 0;
    foreach(dReal e; mFrom.c) {
        mTo.c[i++] = e;
    }
    i = 0;
    foreach(dReal e; mFrom.I) {
        mTo.I[i++] = e;
    }
}

struct dMass {
    dReal mass;
    dVector4 c;
    dMatrix3 I;

    static dMass opCall()
    { dMass ret; dMassSetZero(&ret); return ret; }
    void setZero()
    { dMassSetZero(this); }
    void setParameters(dReal themass, dReal cgx, dReal cgy, dReal cgz,
              dReal I11, dReal I22, dReal I33,
              dReal I12, dReal I13, dReal I23)
    { dMassSetParameters(this,themass,cgx,cgy,cgz,I11,I22,I33,I12,I13,I23); }
    void setSphere(dReal density, dReal radius)
    { dMassSetSphere(this,density,radius); }
    void setCappedCylinder(dReal density, int direction, dReal a, dReal b)
    { dMassSetCappedCylinder(this,density,direction,a,b); }
    void setBox(dReal density, dReal lx, dReal ly, dReal lz)
    { dMassSetBox(this,density,lx,ly,lz); }
    void adjust(dReal newmass)
    { dMassAdjust(this,newmass); }
    void translate(dReal x, dReal y, dReal z)
    { dMassTranslate(this,x,y,z); }
    void rotate( dMatrix3 R)
    { dMassRotate(this,R); }
    void add( dMass *b)
    { dMassAdd(this,b); }
}


//==============================================================================
// FUNCTIONS
//==============================================================================
extern(C):

/**
 * Check if a mass structure has valid value.
 * The function check if the mass and innertia matrix are positive definits
 *
 * @param m A mass structure to check
 *
 * @return 1 if both codition are met
 */
typedef void function(dMass* m) pfdMassCheck;
pfdMassCheck          dMassCheck;


typedef void function(dMass* m) pfdMassSetZero;
typedef void function(dMass* m, dReal themass, dReal cgx, dReal cgy, dReal cgz, dReal I11, dReal I22, dReal I33, dReal I12, dReal I13, dReal I23) pfdMassSetParameters;
typedef void function(dMass* m, dReal density, dReal radius) pfdMassSetSphere;
typedef void function(dMass* m, dReal total_mass, dReal radius) pfdMassSetSphereTotal;
typedef void function(dMass* m, dReal density, int direction, dReal radius, dReal length) pfdMassSetCapsule;
typedef void function(dMass* m, dReal total_mass, int direction, dReal radius, dReal length) pfdMassSetCapsuleTotal;
typedef void function(dMass* m, dReal density, int direction, dReal radius, dReal length) pfdMassSetCylinder;
typedef void function(dMass* m, dReal total_mass, int direction, dReal radius, dReal length) pfdMassSetCylinderTotal;
typedef void function(dMass* m, dReal density, dReal lx, dReal ly, dReal lz) pfdMassSetBox;
typedef void function(dMass* m, dReal total_mass, dReal lx, dReal ly, dReal lz) pfdMassSetBoxTotal;
typedef void function(dMass* m, dReal newmass) pfdMassAdjust;
typedef void function(dMass* m, dReal x, dReal y, dReal z) pfdMassTranslate;
typedef void function(dMass* m, dMatrix3 R) pfdMassRotate;
typedef void function(dMass* m, dMass* b) pfdMassAdd;
pfdMassSetZero            dMassSetZero;
pfdMassSetParameters      dMassSetParameters;
pfdMassSetSphere          dMassSetSphere;
pfdMassSetSphereTotal     dMassSetSphereTotal;
pfdMassSetCapsule         dMassSetCapsule;
pfdMassSetCapsuleTotal    dMassSetCapsuleTotal;
pfdMassSetCylinder        dMassSetCylinder;
pfdMassSetCylinderTotal   dMassSetCylinderTotal;
pfdMassSetBox             dMassSetBox;
pfdMassSetBoxTotal        dMassSetBoxTotal;
pfdMassAdjust             dMassAdjust;
pfdMassTranslate          dMassTranslate;
pfdMassRotate             dMassRotate;
pfdMassAdd                dMassAdd;

// Added in 0.8
typedef void function(dMass *, dReal density, dGeomID g) pfdMassSetTrimesh;
pfdMassSetTrimesh            dMassSetTrimesh;


// Backwards compatible API
alias dMassSetCapsule dMassSetCappedCylinder;
alias dMassSetCapsuleTotal dMassSetCappedCylinderTotal;


