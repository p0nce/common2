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
module derelict.opengl.extension.ext.histogram;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct EXTHistogram
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_EXT_histogram") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glGetHistogramEXT, "glGetHistogramEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetHistogramParameterfvEXT, "glGetHistogramParameterfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetHistogramParameterivEXT, "glGetHistogramParameterivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetMinmaxEXT, "glGetMinmaxEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetMinmaxParameterfvEXT, "glGetMinmaxParameterfvEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetMinmaxParameterivEXT, "glGetMinmaxParameterivEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glHistogramEXT, "glHistogramEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glMinmaxEXT, "glMinmaxEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glResetHistogramEXT, "glResetHistogramEXT"))
            return false;
        if(!glBindExtFunc(cast(void**)&glResetMinmaxEXT, "glResetMinmaxEXT"))
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
        DerelictGL.registerExtensionLoader(&EXTHistogram.load);
    }
}

enum : GLenum
{
    GL_HISTOGRAM_EXT                  = 0x8024,
    GL_PROXY_HISTOGRAM_EXT            = 0x8025,
    GL_HISTOGRAM_WIDTH_EXT            = 0x8026,
    GL_HISTOGRAM_FORMAT_EXT           = 0x8027,
    GL_HISTOGRAM_RED_SIZE_EXT         = 0x8028,
    GL_HISTOGRAM_GREEN_SIZE_EXT       = 0x8029,
    GL_HISTOGRAM_BLUE_SIZE_EXT        = 0x802A,
    GL_HISTOGRAM_ALPHA_SIZE_EXT       = 0x802B,
    GL_HISTOGRAM_LUMINANCE_SIZE_EXT   = 0x802C,
    GL_HISTOGRAM_SINK_EXT             = 0x802D,
    GL_MINMAX_EXT                     = 0x802E,
    GL_MINMAX_FORMAT_EXT              = 0x802F,
    GL_MINMAX_SINK_EXT                = 0x8030,
    GL_TABLE_TOO_LARGE_EXT            = 0x8031,
}

extern(System):

typedef void function(GLenum, GLboolean, GLenum, GLenum, GLvoid*) pfglGetHistogramEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetHistogramParameterfvEXT;
typedef void function(GLenum, GLenum, GLint*) pfglGetHistogramParameterivEXT;
typedef void function(GLenum, GLboolean, GLenum, GLenum, GLvoid*) pfglGetMinmaxEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetMinmaxParameterfvEXT;
typedef void function(GLenum, GLsizei, GLenum, GLint*) pfglGetMinmaxParameterivEXT;
typedef void function(GLenum, GLsizei, GLenum, GLboolean) pfglHistogramEXT;
typedef void function(GLenum, GLenum, GLboolean) pfglMinmaxEXT;
typedef void function(GLenum) pfglResetHistogramEXT;
typedef void function(GLenum) pfglResetMinmaxEXT;

pfglGetHistogramEXT             glGetHistogramEXT;
pfglGetHistogramParameterfvEXT  glGetHistogramParameterfvEXT;
pfglGetHistogramParameterivEXT  glGetHistogramParameterivEXT;
pfglGetMinmaxEXT                glGetMinmaxEXT;
pfglGetMinmaxParameterfvEXT     glGetMinmaxParameterfvEXT;
pfglGetMinmaxParameterivEXT     glGetMinmaxParameterivEXT;
pfglHistogramEXT                glHistogramEXT;
pfglMinmaxEXT                   glMinmaxEXT;
pfglResetHistogramEXT           glResetHistogramEXT;
pfglResetMinmaxEXT              glResetMinmaxEXT;
