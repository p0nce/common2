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
module derelict.opengl.extension.ext.secondary_color;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct EXTSecondaryColor
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_EXT_secondary_color") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glSecondaryColor3bEXT, "glSecondaryColor3bEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3bvEXT, "glSecondaryColor3bvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3dEXT, "glSecondaryColor3dEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3dvEXT, "glSecondaryColor3dvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3fEXT, "glSecondaryColor3fEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3fvEXT, "glSecondaryColor3fvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3iEXT, "glSecondaryColor3iEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3ivEXT, "glSecondaryColor3ivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3sEXT, "glSecondaryColor3sEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3svEXT, "glSecondaryColor3svEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3ubEXT, "glSecondaryColor3ubEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3ubvEXT, "glSecondaryColor3ubvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3uiEXT, "glSecondaryColor3uiEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3uivEXT, "glSecondaryColor3uivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3usEXT, "glSecondaryColor3usEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3usvEXT, "glSecondaryColor3usvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColorPointerEXT, "glSecondaryColorPointerEXT"))
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
        DerelictGL.registerExtensionLoader(&EXTSecondaryColor.load);
    }
}

enum : GLenum
{
    GL_COLOR_SUM_EXT                       = 0x8458,
    GL_CURRENT_SECONDARY_COLOR_EXT         = 0x8459,
    GL_SECONDARY_COLOR_ARRAY_SIZE_EXT      = 0x845A,
    GL_SECONDARY_COLOR_ARRAY_TYPE_EXT      = 0x845B,
    GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT    = 0x845C,
    GL_SECONDARY_COLOR_ARRAY_POINTER_EXT   = 0x845D,
    GL_SECONDARY_COLOR_ARRAY_EXT           = 0x845E,
}

extern(System):

typedef void function(GLbyte, GLbyte, GLbyte) pfglSecondaryColor3bEXT;
typedef void function(GLbyte*) pfglSecondaryColor3bvEXT;
typedef void function(GLdouble, GLdouble, GLdouble) pfglSecondaryColor3dEXT;
typedef void function(GLdouble*) pfglSecondaryColor3dvEXT;
typedef void function(GLfloat, GLfloat, GLfloat) pfglSecondaryColor3fEXT;
typedef void function(GLfloat*) pfglSecondaryColor3fvEXT;
typedef void function(GLint, GLint, GLint) pfglSecondaryColor3iEXT;
typedef void function(GLint*) pfglSecondaryColor3ivEXT;
typedef void function(GLshort, GLshort, GLshort) pfglSecondaryColor3sEXT;
typedef void function(GLshort*) pfglSecondaryColor3svEXT;
typedef void function(GLubyte, GLubyte, GLubyte) pfglSecondaryColor3ubEXT;
typedef void function(GLubyte*) pfglSecondaryColor3ubvEXT;
typedef void function(GLuint, GLuint, GLuint) pfglSecondaryColor3uiEXT;
typedef void function(GLuint*) pfglSecondaryColor3uivEXT;
typedef void function(GLushort, GLushort, GLushort) pfglSecondaryColor3usEXT;
typedef void function(GLushort*) pfglSecondaryColor3usvEXT;
typedef void function(GLint, GLenum, GLsizei, GLvoid*) pfglSecondaryColorPointerEXT;

pfglSecondaryColor3bEXT         glSecondaryColor3bEXT;
pfglSecondaryColor3bvEXT        glSecondaryColor3bvEXT;
pfglSecondaryColor3dEXT         glSecondaryColor3dEXT;
pfglSecondaryColor3dvEXT        glSecondaryColor3dvEXT;
pfglSecondaryColor3fEXT         glSecondaryColor3fEXT;
pfglSecondaryColor3fvEXT        glSecondaryColor3fvEXT;
pfglSecondaryColor3iEXT         glSecondaryColor3iEXT;
pfglSecondaryColor3ivEXT        glSecondaryColor3ivEXT;
pfglSecondaryColor3sEXT         glSecondaryColor3sEXT;
pfglSecondaryColor3svEXT        glSecondaryColor3svEXT;
pfglSecondaryColor3ubEXT        glSecondaryColor3ubEXT;
pfglSecondaryColor3ubvEXT       glSecondaryColor3ubvEXT;
pfglSecondaryColor3uiEXT        glSecondaryColor3uiEXT;
pfglSecondaryColor3uivEXT       glSecondaryColor3uivEXT;
pfglSecondaryColor3usEXT        glSecondaryColor3usEXT;
pfglSecondaryColor3usvEXT       glSecondaryColor3usvEXT;
pfglSecondaryColorPointerEXT    glSecondaryColorPointerEXT;
