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
module derelict.opengl.extension.nv.fragment_program;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct NVFragmentProgram
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_NV_fragment_program") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glProgramNamedParameter4fNV, "glProgramNamedParameter4fNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramNamedParameter4dNV, "glProgramNamedParameter4dNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramNamedParameter4fvNV, "glProgramNamedParameter4fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramNamedParameter4dvNV, "glProgramNamedParameter4dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetProgramNamedParameterfvNV, "glGetProgramNamedParameterfvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetProgramNamedParameterdvNV, "glGetProgramNamedParameterdvNV"))
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
        DerelictGL.registerExtensionLoader(&NVFragmentProgram.load);
    }
}

enum : GLenum
{
    GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV    = 0x8868,
    GL_FRAGMENT_PROGRAM_NV                         = 0x8870,
    GL_MAX_TEXTURE_COORDS_NV                       = 0x8871,
    GL_MAX_TEXTURE_IMAGE_UNITS_NV                  = 0x8872,
    GL_FRAGMENT_PROGRAM_BINDING_NV                 = 0x8873,
    GL_PROGRAM_ERROR_STRING_NV                     = 0x8874,
}

extern(System):

typedef void function(GLuint, GLsizei, GLubyte*, GLfloat, GLfloat, GLfloat, GLfloat) pfglProgramNamedParameter4fNV;
typedef void function(GLuint, GLsizei, GLubyte*, GLdouble, GLdouble, GLdouble, GLdouble) pfglProgramNamedParameter4dNV;
typedef void function(GLuint, GLsizei, GLubyte*, GLfloat*) pfglProgramNamedParameter4fvNV;
typedef void function(GLuint, GLsizei, GLubyte*, GLdouble*) pfglProgramNamedParameter4dvNV;
typedef void function(GLuint, GLsizei, GLubyte*, GLfloat*) pfglGetProgramNamedParameterfvNV;
typedef void function(GLuint, GLsizei, GLubyte*, GLdouble*) pfglGetProgramNamedParameterdvNV;

pfglProgramNamedParameter4fNV               glProgramNamedParameter4fNV;
pfglProgramNamedParameter4dNV               glProgramNamedParameter4dNV;
pfglProgramNamedParameter4fvNV              glProgramNamedParameter4fvNV;
pfglProgramNamedParameter4dvNV              glProgramNamedParameter4dvNV;
pfglGetProgramNamedParameterfvNV            glGetProgramNamedParameterfvNV;
pfglGetProgramNamedParameterdvNV            glGetProgramNamedParameterdvNV;
