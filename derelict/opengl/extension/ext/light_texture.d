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
module derelict.opengl.extension.ext.light_texture;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct EXTLightTexture
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_EXT_light_texture") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glApplyTextureEXT, "glApplyTextureEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTextureLightEXT, "glTextureLightEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTextureMaterialEXT, "glTextureMaterialEXT"))
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
        DerelictGL.registerExtensionLoader(&EXTLightTexture.load);
    }
}

enum : GLenum
{
    GL_FRAGMENT_MATERIAL_EXT          = 0x8349,
    GL_FRAGMENT_NORMAL_EXT            = 0x834A,
    GL_FRAGMENT_COLOR_EXT             = 0x834C,
    GL_ATTENUATION_EXT                = 0x834D,
    GL_SHADOW_ATTENUATION_EXT         = 0x834E,
    GL_TEXTURE_APPLICATION_MODE_EXT   = 0x834F,
    GL_TEXTURE_LIGHT_EXT              = 0x8350,
    GL_TEXTURE_MATERIAL_FACE_EXT      = 0x8351,
    GL_TEXTURE_MATERIAL_PARAMETER_EXT = 0x8352,
}

extern(System):

typedef void function(GLenum) pfglApplyTextureEXT;
typedef void function(GLenum) pfglTextureLightEXT;
typedef void function(GLenum, GLenum) pfglTextureMaterialEXT;

pfglApplyTextureEXT     glApplyTextureEXT;
pfglTextureLightEXT     glTextureLightEXT;
pfglTextureMaterialEXT  glTextureMaterialEXT;
