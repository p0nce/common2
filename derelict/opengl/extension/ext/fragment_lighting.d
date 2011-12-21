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
module derelict.opengl.extension.ext.fragment_lighting;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct EXTFragmentLighting
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_EXT_fragment_lighting") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glFragmentColorMaterialEXT, "glFragmentColorMaterialEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightModelfEXT, "glFragmentLightModelfEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightModelfvEXT, "glFragmentLightModelfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightModeliEXT, "glFragmentLightModeliEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightModelivEXT, "glFragmentLightModelivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightfEXT, "glFragmentLightfEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightfvEXT, "glFragmentLightfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightiEXT, "glFragmentLightiEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentLightivEXT, "glFragmentLightivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentMaterialfEXT, "glFragmentMaterialfEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentMaterialfvEXT, "glFragmentMaterialfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentMaterialiEXT, "glFragmentMaterialiEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glFragmentMaterialivEXT, "glFragmentMaterialivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetFragmentLightfvEXT, "glGetFragmentLightfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetFragmentLightivEXT, "glGetFragmentLightivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetFragmentMaterialfvEXT, "glGetFragmentMaterialfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetFragmentMaterialivEXT, "glGetFragmentMaterialivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glLightEnviEXT, "glLightEnviEXT"))
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
        DerelictGL.registerExtensionLoader(&EXTFragmentLighting.load);
    }
}

enum : GLenum
{
    GL_FRAGMENT_LIGHTING_EXT                            = 0x8400,
    GL_FRAGMENT_COLOR_MATERIAL_EXT                      = 0x8401,
    GL_FRAGMENT_COLOR_MATERIAL_FACE_EXT                 = 0x8402,
    GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_EXT            = 0x8403,
    GL_MAX_FRAGMENT_LIGHTS_EXT                          = 0x8404,
    GL_MAX_ACTIVE_LIGHTS_EXT                            = 0x8405,
    GL_CURRENT_RASTER_NORMAL_EXT                        = 0x8406,
    GL_LIGHT_ENV_MODE_EXT                               = 0x8407,
    GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_EXT            = 0x8408,
    GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_EXT                = 0x8409,
    GL_FRAGMENT_LIGHT_MODEL_AMBIENT_EXT                 = 0x840A,
    GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_EXT    = 0x840B,
    GL_FRAGMENT_LIGHT0_EXT                              = 0x840C,
    GL_FRAGMENT_LIGHT7_EXT                              = 0x8413,
}

extern(System):

typedef void function(GLenum,GLenum) pfglFragmentColorMaterialEXT;
typedef void function(GLenum,GLfloat) pfglFragmentLightModelfEXT;
typedef void function(GLenum,GLfloat*) pfglFragmentLightModelfvEXT;
typedef void function(GLenum,GLint) pfglFragmentLightModeliEXT;
typedef void function(GLenum,GLint*) pfglFragmentLightModelivEXT;
typedef void function(GLenum,GLenum,GLfloat) pfglFragmentLightfEXT;
typedef void function(GLenum,GLenum,GLfloat*) pfglFragmentLightfvEXT;
typedef void function(GLenum,GLenum,GLint) pfglFragmentLightiEXT;
typedef void function(GLenum,GLenum,GLint*) pfglFragmentLightivEXT;
typedef void function(GLenum,GLenum,GLfloat) pfglFragmentMaterialfEXT;
typedef void function(GLenum,GLenum,GLfloat*) pfglFragmentMaterialfvEXT;
typedef void function(GLenum,GLenum,GLint) pfglFragmentMaterialiEXT;
typedef void function(GLenum,GLenum,GLint*) pfglFragmentMaterialivEXT;
typedef void function(GLenum,GLenum,GLfloat*) pfglGetFragmentLightfvEXT;
typedef void function(GLenum,GLenum,GLint*) pfglGetFragmentLightivEXT;
typedef void function(GLenum,GLenum,GLfloat*) pfglGetFragmentMaterialfvEXT;
typedef void function(GLenum,GLenum,GLint*) pfglGetFragmentMaterialivEXT;
typedef void function(GLenum,GLint) pfglLightEnviEXT;

pfglFragmentColorMaterialEXT            glFragmentColorMaterialEXT;
pfglFragmentLightModelfEXT              glFragmentLightModelfEXT;
pfglFragmentLightModelfvEXT             glFragmentLightModelfvEXT;
pfglFragmentLightModeliEXT              glFragmentLightModeliEXT;
pfglFragmentLightModelivEXT             glFragmentLightModelivEXT;
pfglFragmentLightfEXT                   glFragmentLightfEXT;
pfglFragmentLightfvEXT                  glFragmentLightfvEXT;
pfglFragmentLightiEXT                   glFragmentLightiEXT;
pfglFragmentLightivEXT                  glFragmentLightivEXT;
pfglFragmentMaterialfEXT                glFragmentMaterialfEXT;
pfglFragmentMaterialfvEXT               glFragmentMaterialfvEXT;
pfglFragmentMaterialiEXT                glFragmentMaterialiEXT;
pfglFragmentMaterialivEXT               glFragmentMaterialivEXT;
pfglGetFragmentLightfvEXT               glGetFragmentLightfvEXT;
pfglGetFragmentLightivEXT               glGetFragmentLightivEXT;
pfglGetFragmentMaterialfvEXT            glGetFragmentMaterialfvEXT;
pfglGetFragmentMaterialivEXT            glGetFragmentMaterialivEXT;
pfglLightEnviEXT                        glLightEnviEXT;