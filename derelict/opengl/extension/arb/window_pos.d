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
 * * Neither the names 'Derelict', 'DerelictGL', nor the names of its contributors
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
module derelict.opengl.extension.arb.window_pos;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct ARBWindowPos
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_ARB_window_pos") == -1)
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2dARB, "glWindowPos2dARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2dvARB, "glWindowPos2dvARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2fARB, "glWindowPos2fARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2fvARB, "glWindowPos2fvARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPost2iARB, "glWindowPos2iARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2ivARB, "glWindowPos2ivARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2sARB, "glWindowPos2sARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos2svARB, "glWindowPos2svARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3dARB, "glWindowPos3dARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3dvARB, "glWindowPos3dvARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3fARB, "glWindowPos3fARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3fvARB, "glWindowPos3fvARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3iARB, "glWindowPos3iARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3ivARB, "glWindowPos3ivARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3sARB, "glWindowPos3sARB"))
            return false;
        if(!glBindExtFunc(cast(void**)&glWindowPos3svARB, "glWindowPos3svARB"))
            return false;

        enabled = true;
        return true;
    }

    static bool isEnabled()
    {
        return enabled;
    }
}

version(DerelictGL_NoExtensionLoaders)
{
}
else
{
    static this()
    {
        DerelictGL.registerExtensionLoader(&ARBWindowPos.load);
    }
}

extern(System):

typedef void function(GLdouble, GLdouble) pfglWindowPos2dARB;
typedef void function(GLdouble*) pfglWindowPos2dvARB;
typedef void function(GLfloat, GLfloat) pfglWindowPos2fARB;
typedef void function(GLfloat*) pfglWindowPos2fvARB;
typedef void function(GLint, GLint) pfglWindowPost2iARB;
typedef void function(GLint*) pfglWindowPos2ivARB;
typedef void function(GLshort, GLshort) pfglWindowPos2sARB;
typedef void function(GLshort*) pfglWindowPos2svARB;
typedef void function(GLdouble, GLdouble, GLdouble) pfglWindowPos3dARB;
typedef void function(GLdouble*) pfglWindowPos3dvARB;
typedef void function(GLfloat, GLfloat, GLfloat) pfglWindowPos3fARB;
typedef void function(GLfloat*) pfglWindowPos3fvARB;
typedef void function(GLint, GLint, GLint) pfglWindowPos3iARB;
typedef void function(GLint*) pfglWindowPos3ivARB;
typedef void function(GLshort, GLshort, GLshort) pfglWindowPos3sARB;
typedef void function(GLshort*) pfglWindowPos3svARB;

pfglWindowPos2dARB          glWindowPos2dARB;
pfglWindowPos2dvARB         glWindowPos2dvARB;
pfglWindowPos2fARB          glWindowPos2fARB;
pfglWindowPos2fvARB         glWindowPos2fvARB;
pfglWindowPost2iARB         glWindowPost2iARB;
pfglWindowPos2ivARB         glWindowPos2ivARB;
pfglWindowPos2sARB          glWindowPos2sARB;
pfglWindowPos2svARB         glWindowPos2svARB;
pfglWindowPos3dARB          glWindowPos3dARB;
pfglWindowPos3dvARB         glWindowPos3dvARB;
pfglWindowPos3fARB          glWindowPos3fARB;
pfglWindowPos3fvARB         glWindowPos3fvARB;
pfglWindowPos3iARB          glWindowPos3iARB;
pfglWindowPos3ivARB         glWindowPos3ivARB;
pfglWindowPos3sARB          glWindowPos3sARB;
pfglWindowPos3svARB         glWindowPos3svARB;