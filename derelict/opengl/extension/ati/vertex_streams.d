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
module derelict.opengl.extension.ati.vertex_streams;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct ATIVertexStreams
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_ATI_vertex_streams") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glVertexStream1sATI, "glVertexStream1sATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1svATI, "glVertexStream1svATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1iATI, "glVertexStream1iATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1ivATI, "glVertexStream1ivATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1fATI, "glVertexStream1fATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1fvATI, "glVertexStream1fvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1dATI, "glVertexStream1dATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream1dvATI, "glVertexStream1dvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2sATI, "glVertexStream2sATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2svATI, "glVertexStream2svATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2iATI, "glVertexStream2iATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2ivATI, "glVertexStream2ivATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2fATI, "glVertexStream2fATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2fvATI, "glVertexStream2fvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2dATI, "glVertexStream2dATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream2dvATI, "glVertexStream2dvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3sATI, "glVertexStream3sATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3svATI, "glVertexStream3svATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3iATI, "glVertexStream3iATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3ivATI, "glVertexStream3ivATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3fATI, "glVertexStream3fATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3fvATI, "glVertexStream3fvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3dATI, "glVertexStream3dATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream3dvATI, "glVertexStream3dvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4sATI, "glVertexStream4sATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4svATI, "glVertexStream4svATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4iATI, "glVertexStream4iATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4ivATI, "glVertexStream4ivATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4fATI, "glVertexStream4fATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4fvATI, "glVertexStream4fvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4dATI, "glVertexStream4dATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexStream4dvATI, "glVertexStream4dvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3bATI, "glNormalStream3bATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3bvATI, "glNormalStream3bvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3sATI, "glNormalStream3sATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3svATI, "glNormalStream3svATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3iATI, "glNormalStream3iATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3ivATI, "glNormalStream3ivATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3fATI, "glNormalStream3fATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3fvATI, "glNormalStream3fvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3dATI, "glNormalStream3dATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glNormalStream3dvATI, "glNormalStream3dvATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glClientActiveVertexStreamATI, "glClientActiveVertexStreamATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexBlendEnviATI, "glVertexBlendEnviATI"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexBlendEnvfATI, "glVertexBlendEnvfATI"))
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
        DerelictGL.registerExtensionLoader(&ATIVertexStreams.load);
    }
}

enum : GLenum
{
    GL_MAX_VERTEX_STREAMS_ATI         = 0x876B,
    GL_VERTEX_STREAM0_ATI             = 0x876C,
    GL_VERTEX_STREAM1_ATI             = 0x876D,
    GL_VERTEX_STREAM2_ATI             = 0x876E,
    GL_VERTEX_STREAM3_ATI             = 0x876F,
    GL_VERTEX_STREAM4_ATI             = 0x8770,
    GL_VERTEX_STREAM5_ATI             = 0x8771,
    GL_VERTEX_STREAM6_ATI             = 0x8772,
    GL_VERTEX_STREAM7_ATI             = 0x8773,
    GL_VERTEX_SOURCE_ATI              = 0x8774,
}

extern(System):

typedef void function(GLenum, GLshort)             pfglVertexStream1sATI;
typedef void function(GLenum, GLshort *)           pfglVertexStream1svATI;
typedef void function(GLenum, GLint)               pfglVertexStream1iATI;
typedef void function(GLenum, GLint *)             pfglVertexStream1ivATI;
typedef void function(GLenum, GLfloat)             pfglVertexStream1fATI;
typedef void function(GLenum, GLfloat *)           pfglVertexStream1fvATI;
typedef void function(GLenum, GLdouble)            pfglVertexStream1dATI;
typedef void function(GLenum, GLdouble *)          pfglVertexStream1dvATI;

typedef void function(GLenum, GLshort, GLshort)    pfglVertexStream2sATI;
typedef void function(GLenum, GLshort *)           pfglVertexStream2svATI;
typedef void function(GLenum, GLint, GLint)        pfglVertexStream2iATI;
typedef void function(GLenum, GLint *)             pfglVertexStream2ivATI;
typedef void function(GLenum, GLfloat, GLfloat)    pfglVertexStream2fATI;
typedef void function(GLenum, GLfloat *)           pfglVertexStream2fvATI;
typedef void function(GLenum, GLdouble, GLdouble)  pfglVertexStream2dATI;
typedef void function(GLenum, GLdouble *)          pfglVertexStream2dvATI;

typedef void function(GLenum, GLshort, GLshort, GLshort)    pfglVertexStream3sATI;
typedef void function(GLenum, GLshort *)                    pfglVertexStream3svATI;
typedef void function(GLenum, GLint, GLint, GLint)          pfglVertexStream3iATI;
typedef void function(GLenum, GLint *)                      pfglVertexStream3ivATI;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat)    pfglVertexStream3fATI;
typedef void function(GLenum, GLfloat *)                    pfglVertexStream3fvATI;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble) pfglVertexStream3dATI;
typedef void function(GLenum, GLdouble *)                   pfglVertexStream3dvATI;

typedef void function(GLenum, GLshort, GLshort, GLshort, GLshort)     pfglVertexStream4sATI;
typedef void function(GLenum, GLshort *)                              pfglVertexStream4svATI;
typedef void function(GLenum, GLint, GLint, GLint, GLint)             pfglVertexStream4iATI;
typedef void function(GLenum, GLint *)                                pfglVertexStream4ivATI;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat, GLfloat)     pfglVertexStream4fATI;
typedef void function(GLenum, GLfloat *)                              pfglVertexStream4fvATI;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble, GLdouble) pfglVertexStream4dATI;
typedef void function(GLenum, GLdouble *)                             pfglVertexStream4dvATI;

typedef void function(GLenum, GLbyte, GLbyte, GLbyte)       pfglNormalStream3bATI;
typedef void function(GLenum, GLbyte *)                     pfglNormalStream3bvATI;
typedef void function(GLenum, GLshort, GLshort, GLshort)    pfglNormalStream3sATI;
typedef void function(GLenum, GLshort *)                    pfglNormalStream3svATI;
typedef void function(GLenum, GLint, GLint, GLint)          pfglNormalStream3iATI;
typedef void function(GLenum, GLint *)                      pfglNormalStream3ivATI;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat)    pfglNormalStream3fATI;
typedef void function(GLenum, GLfloat *)                    pfglNormalStream3fvATI;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble) pfglNormalStream3dATI;
typedef void function(GLenum, GLdouble *)                   pfglNormalStream3dvATI;

typedef void function(GLenum)                   pfglClientActiveVertexStreamATI;
typedef void function(GLenum, GLint)            pfglVertexBlendEnviATI;
typedef void function(GLenum, GLfloat)          pfglVertexBlendEnvfATI;

pfglVertexStream1sATI       glVertexStream1sATI;
pfglVertexStream1svATI      glVertexStream1svATI;
pfglVertexStream1iATI       glVertexStream1iATI;
pfglVertexStream1ivATI      glVertexStream1ivATI;
pfglVertexStream1fATI       glVertexStream1fATI;
pfglVertexStream1fvATI      glVertexStream1fvATI;
pfglVertexStream1dATI       glVertexStream1dATI;
pfglVertexStream1dvATI      glVertexStream1dvATI;

pfglVertexStream2sATI       glVertexStream2sATI;
pfglVertexStream2svATI      glVertexStream2svATI;
pfglVertexStream2iATI       glVertexStream2iATI;
pfglVertexStream2ivATI      glVertexStream2ivATI;
pfglVertexStream2fATI       glVertexStream2fATI;
pfglVertexStream2fvATI      glVertexStream2fvATI;
pfglVertexStream2dATI       glVertexStream2dATI;
pfglVertexStream2dvATI      glVertexStream2dvATI;

pfglVertexStream3sATI       glVertexStream3sATI;
pfglVertexStream3svATI      glVertexStream3svATI;
pfglVertexStream3iATI       glVertexStream3iATI;
pfglVertexStream3ivATI      glVertexStream3ivATI;
pfglVertexStream3fATI       glVertexStream3fATI;
pfglVertexStream3fvATI      glVertexStream3fvATI;
pfglVertexStream3dATI       glVertexStream3dATI;
pfglVertexStream3dvATI      glVertexStream3dvATI;

pfglVertexStream4sATI       glVertexStream4sATI;
pfglVertexStream4svATI      glVertexStream4svATI;
pfglVertexStream4iATI       glVertexStream4iATI;
pfglVertexStream4ivATI      glVertexStream4ivATI;
pfglVertexStream4fATI       glVertexStream4fATI;
pfglVertexStream4fvATI      glVertexStream4fvATI;
pfglVertexStream4dATI       glVertexStream4dATI;
pfglVertexStream4dvATI      glVertexStream4dvATI;

pfglNormalStream3bATI       glNormalStream3bATI;
pfglNormalStream3bvATI      glNormalStream3bvATI;
pfglNormalStream3sATI       glNormalStream3sATI;
pfglNormalStream3svATI      glNormalStream3svATI;
pfglNormalStream3iATI       glNormalStream3iATI;
pfglNormalStream3ivATI      glNormalStream3ivATI;
pfglNormalStream3fATI       glNormalStream3fATI;
pfglNormalStream3fvATI      glNormalStream3fvATI;
pfglNormalStream3dATI       glNormalStream3dATI;
pfglNormalStream3dvATI      glNormalStream3dvATI;

pfglClientActiveVertexStreamATI      glClientActiveVertexStreamATI;
pfglVertexBlendEnviATI               glVertexBlendEnviATI;
pfglVertexBlendEnvfATI               glVertexBlendEnvfATI;

