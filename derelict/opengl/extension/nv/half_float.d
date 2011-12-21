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
module derelict.opengl.extension.nv.half_float;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct NVHalfFloat
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_NV_half_float") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glVertex2hNV, "glVertex2hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertex2hvNV, "glVertex2hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertex3hNV, "glVertex3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertex3hvNV, "glVertex3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertex4hNV, "glVertex4hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertex4hvNV, "glVertex4hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormal3hNV, "glNormal3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormal3hvNV, "glNormal3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glColor3hNV, "glColor3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glColor3hvNV, "glColor3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glColor4hNV, "glColor4hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glColor4hvNV, "glColor4hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord1hNV, "glTexCoord1hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord1hvNV, "glTexCoord1hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord2hNV, "glTexCoord2hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord2hvNV, "glTexCoord2hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord3hNV, "glTexCoord3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord3hvNV, "glTexCoord3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord4hNV, "glTexCoord4hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTexCoord4hvNV, "glTexCoord4hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord1hNV, "glMultiTexCoord1hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord1hNV, "glMultiTexCoord1hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord1hvNV, "glMultiTexCoord1hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord2hNV, "glMultiTexCoord2hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord2hvNV, "glMultiTexCoord2hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord3hNV, "glMultiTexCoord3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord3hvNV, "glMultiTexCoord3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord4hNV, "glMultiTexCoord4hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMultiTexCoord4hvNV, "glMultiTexCoord4hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFogCoordhNV, "glFogCoordhNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFogCoordhvNV, "glFogCoordhvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3hNV, "glSecondaryColor3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glSecondaryColor3hvNV, "glSecondaryColor3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexWeighthNV, "glVertexWeighthNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexWeighthvNV, "glVertexWeighthvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1hNV, "glVertexAttrib1hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1hvNV, "glVertexAttrib1hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2hNV, "glVertexAttrib2hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2hvNV, "glVertexAttrib2hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3hNV, "glVertexAttrib3hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3hvNV, "glVertexAttrib3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4hNV, "glVertexAttrib4hNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4hvNV, "glVertexAttrib4hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs1hvNV, "glVertexAttribs1hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs2hvNV, "glVertexAttribs2hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs3hvNV, "glVertexAttribs3hvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs4hvNV, "glVertexAttribs4hvNV"))
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
        DerelictGL.registerExtensionLoader(&NVHalfFloat.load);
    }
}

typedef ushort GLhalfNV;

enum : GLenum
{
    GL_HALF_FLOAT_NV = 0x140B
}

extern(System):

typedef void function(GLhalfNV, GLhalfNV) pfglVertex2hNV;
typedef void function(GLhalfNV*) pfglVertex2hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglVertex3hNV;
typedef void function(GLhalfNV*) pfglVertex3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglVertex4hNV;
typedef void function(GLhalfNV*) pfglVertex4hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglNormal3hNV;
typedef void function(GLhalfNV*) pfglNormal3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglColor3hNV;
typedef void function(GLhalfNV*) pfglColor3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglColor4hNV;
typedef void function(GLhalfNV*) pfglColor4hvNV;
typedef void function(GLhalfNV) pfglTexCoord1hNV;
typedef void function(GLhalfNV*) pfglTexCoord1hvNV;
typedef void function(GLhalfNV, GLhalfNV) pfglTexCoord2hNV;
typedef void function(GLhalfNV*) pfglTexCoord2hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglTexCoord3hNV;
typedef void function(GLhalfNV*) pfglTexCoord3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglTexCoord4hNV;
typedef void function(GLhalfNV*) pfglTexCoord4hvNV;
typedef void function(GLenum, GLhalfNV) pfglMultiTexCoord1hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord1hvNV;
typedef void function(GLenum, GLhalfNV, GLhalfNV) pfglMultiTexCoord2hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord2hvNV;
typedef void function(GLenum, GLhalfNV, GLhalfNV, GLhalfNV) pfglMultiTexCoord3hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord3hvNV;
typedef void function(GLenum, GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglMultiTexCoord4hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord4hvNV;
typedef void function(GLhalfNV) pfglFogCoordhNV;
typedef void function(GLhalfNV*) pfglFogCoordhvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglSecondaryColor3hNV;
typedef void function(GLhalfNV*) pfglSecondaryColor3hvNV;
typedef void function(GLhalfNV) pfglVertexWeighthNV;
typedef void function(GLhalfNV*) pfglVertexWeighthvNV;
typedef void function(GLuint, GLhalfNV) pfglVertexAttrib1hNV;
typedef void function(GLuint, GLhalfNV*) pfglVertexAttrib1hvNV;
typedef void function(GLuint, GLhalfNV, GLhalfNV) pfglVertexAttrib2hNV;
typedef void function(GLuint, GLhalfNV*) pfglVertexAttrib2hvNV;
typedef void function(GLuint, GLhalfNV, GLhalfNV, GLhalfNV) pfglVertexAttrib3hNV;
typedef void function(GLuint, GLhalfNV*) pfglVertexAttrib3hvNV;
typedef void function(GLuint, GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglVertexAttrib4hNV;
typedef void function(GLuint, GLhalfNV*) pfglVertexAttrib4hvNV;
typedef void function(GLuint, GLsizei, GLhalfNV*) pfglVertexAttribs1hvNV;
typedef void function(GLuint, GLsizei, GLhalfNV*) pfglVertexAttribs2hvNV;
typedef void function(GLuint, GLsizei, GLhalfNV*) pfglVertexAttribs3hvNV;
typedef void function(GLuint, GLsizei, GLhalfNV*) pfglVertexAttribs4hvNV;

pfglVertex2hNV                  glVertex2hNV;
pfglVertex2hvNV                 glVertex2hvNV;
pfglVertex3hNV                  glVertex3hNV;
pfglVertex3hvNV                 glVertex3hvNV;
pfglVertex4hNV                  glVertex4hNV;
pfglVertex4hvNV                 glVertex4hvNV;
pfglNormal3hNV                  glNormal3hNV;
pfglNormal3hvNV                 glNormal3hvNV;
pfglColor3hNV                   glColor3hNV;
pfglColor3hvNV                  glColor3hvNV;
pfglColor4hNV                   glColor4hNV;
pfglColor4hvNV                  glColor4hvNV;
pfglTexCoord1hNV                glTexCoord1hNV;
pfglTexCoord1hvNV               glTexCoord1hvNV;
pfglTexCoord2hNV                glTexCoord2hNV;
pfglTexCoord2hvNV               glTexCoord2hvNV;
pfglTexCoord3hNV                glTexCoord3hNV;
pfglTexCoord3hvNV               glTexCoord3hvNV;
pfglTexCoord4hNV                glTexCoord4hNV;
pfglTexCoord4hvNV               glTexCoord4hvNV;
pfglMultiTexCoord1hNV           glMultiTexCoord1hNV;
pfglMultiTexCoord1hvNV          glMultiTexCoord1hvNV;
pfglMultiTexCoord2hNV           glMultiTexCoord2hNV;
pfglMultiTexCoord2hvNV          glMultiTexCoord2hvNV;
pfglMultiTexCoord3hNV           glMultiTexCoord3hNV;
pfglMultiTexCoord3hvNV          glMultiTexCoord3hvNV;
pfglMultiTexCoord4hNV           glMultiTexCoord4hNV;
pfglMultiTexCoord4hvNV          glMultiTexCoord4hvNV;
pfglFogCoordhNV                 glFogCoordhNV;
pfglFogCoordhvNV                glFogCoordhvNV;
pfglSecondaryColor3hNV          glSecondaryColor3hNV;
pfglSecondaryColor3hvNV         glSecondaryColor3hvNV;
pfglVertexWeighthNV             glVertexWeighthNV;
pfglVertexWeighthvNV            glVertexWeighthvNV;
pfglVertexAttrib1hNV            glVertexAttrib1hNV;
pfglVertexAttrib1hvNV           glVertexAttrib1hvNV;
pfglVertexAttrib2hNV            glVertexAttrib2hNV;
pfglVertexAttrib2hvNV           glVertexAttrib2hvNV;
pfglVertexAttrib3hNV            glVertexAttrib3hNV;
pfglVertexAttrib3hvNV           glVertexAttrib3hvNV;
pfglVertexAttrib4hNV            glVertexAttrib4hNV;
pfglVertexAttrib4hvNV           glVertexAttrib4hvNV;
pfglVertexAttribs1hvNV          glVertexAttribs1hvNV;
pfglVertexAttribs2hvNV          glVertexAttribs2hvNV;
pfglVertexAttribs3hvNV          glVertexAttribs3hvNV;
pfglVertexAttribs4hvNV          glVertexAttribs4hvNV;
