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
module derelict.opengl.extension.nv.vertex_program;

private
{
    import derelict.opengl.gltypes;
    import derelict.opengl.gl;
    import derelict.opengl.extension.loader;
    import derelict.util.wrapper;
}

private bool enabled = false;

struct NVVertexProgram
{
    static bool load(char[] extString)
    {
        if(extString.findStr("GL_NV_vertex_program") == -1)
            return false;

        if(!glBindExtFunc(cast(void**)&glAreProgramsResidentNV, "glAreProgramsResidentNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glBindProgramNV, "glBindProgramNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glDeleteProgramsNV, "glDeleteProgramsNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glExecuteProgramNV, "glExecuteProgramNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGenProgramsNV, "glGenProgramsNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetProgramParameterdvNV, "glGetProgramParameterdvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetProgramParameterfvNV, "glGetProgramParameterfvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetProgramivNV, "glGetProgramivNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetProgramStringNV, "glGetProgramStringNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetTrackMatrixivNV, "glGetTrackMatrixivNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetVertexAttribdvNV, "glGetVertexAttribdvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetVertexAttribfvNV, "glGetVertexAttribfvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetVertexAttribivNV, "glGetVertexAttribivNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glGetVertexAttribPointervNV, "glGetVertexAttribPointervNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glIsProgramNV, "glIsProgramNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glLoadProgramNV, "glLoadProgramNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramParameter4dNV, "glProgramParameter4dNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramParameter4dvNV, "glProgramParameter4dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramParameter4fNV, "glProgramParameter4fNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramParameter4fvNV, "glProgramParameter4fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramParameters4dvNV, "glProgramParameters4dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glProgramParameters4fvNV, "glProgramParameters4fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glRequestResidentProgramsNV, "glRequestResidentProgramsNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glTrackMatrixNV, "glTrackMatrixNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribPointerNV, "glVertexAttribPointerNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1dNV, "glVertexAttrib1dNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1dvNV, "glVertexAttrib1dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1fNV, "glVertexAttrib1fNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1fvNV, "glVertexAttrib1fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1sNV, "glVertexAttrib1sNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib1svNV, "glVertexAttrib1svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2dNV, "glVertexAttrib2dNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2dvNV, "glVertexAttrib2dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2fNV, "glVertexAttrib2fNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2fvNV, "glVertexAttrib2fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2sNV, "glVertexAttrib2sNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib2svNV, "glVertexAttrib2svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3dNV, "glVertexAttrib3dNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3dvNV, "glVertexAttrib3dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3fNV, "glVertexAttrib3fNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3fvNV, "glVertexAttrib3fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3sNV, "glVertexAttrib3sNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib3svNV, "glVertexAttrib3svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4dNV, "glVertexAttrib4dNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4dvNV, "glVertexAttrib4dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4fNV, "glVertexAttrib4fNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4fvNV, "glVertexAttrib4fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4sNV, "glVertexAttrib4sNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4svNV, "glVertexAttrib4svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4ubNV, "glVertexAttrib4ubNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttrib4ubvNV, "glVertexAttrib4ubvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs1dvNV, "glVertexAttribs1dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs1fvNV, "glVertexAttribs1fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs1svNV, "glVertexAttribs1svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs2dvNV, "glVertexAttribs2dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs2fvNV, "glVertexAttribs2fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs2svNV, "glVertexAttribs2svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs3dvNV, "glVertexAttribs3dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs3fvNV, "glVertexAttribs3fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs3svNV, "glVertexAttribs3svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs4dvNV, "glVertexAttribs4dvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs4fvNV, "glVertexAttribs4fvNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs4svNV, "glVertexAttribs4svNV"))
            return false;
        if(!glBindExtFunc(cast(void**)&glVertexAttribs4ubvNV, "glVertexAttribs4ubvNV"))
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
        DerelictGL.registerExtensionLoader(&NVVertexProgram.load);
    }
}

enum : GLenum
{
    GL_VERTEX_PROGRAM_NV              = 0x8620,
    GL_VERTEX_STATE_PROGRAM_NV        = 0x8621,
    GL_ATTRIB_ARRAY_SIZE_NV           = 0x8623,
    GL_ATTRIB_ARRAY_STRIDE_NV         = 0x8624,
    GL_ATTRIB_ARRAY_TYPE_NV           = 0x8625,
    GL_CURRENT_ATTRIB_NV              = 0x8626,
    GL_PROGRAM_LENGTH_NV              = 0x8627,
    GL_PROGRAM_STRING_NV              = 0x8628,
    GL_MODELVIEW_PROJECTION_NV        = 0x8629,
    GL_IDENTITY_NV                    = 0x862A,
    GL_INVERSE_NV                     = 0x862B,
    GL_TRANSPOSE_NV                   = 0x862C,
    GL_INVERSE_TRANSPOSE_NV           = 0x862D,
    GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = 0x862E,
    GL_MAX_TRACK_MATRICES_NV          = 0x862F,
    GL_MATRIX0_NV                     = 0x8630,
    GL_MATRIX1_NV                     = 0x8631,
    GL_MATRIX2_NV                     = 0x8632,
    GL_MATRIX3_NV                     = 0x8633,
    GL_MATRIX4_NV                     = 0x8634,
    GL_MATRIX5_NV                     = 0x8635,
    GL_MATRIX6_NV                     = 0x8636,
    GL_MATRIX7_NV                     = 0x8637,
    GL_CURRENT_MATRIX_STACK_DEPTH_NV  = 0x8640,
    GL_CURRENT_MATRIX_NV              = 0x8641,
    GL_VERTEX_PROGRAM_POINT_SIZE_NV   = 0x8642,
    GL_VERTEX_PROGRAM_TWO_SIDE_NV     = 0x8643,
    GL_PROGRAM_PARAMETER_NV           = 0x8644,
    GL_ATTRIB_ARRAY_POINTER_NV        = 0x8645,
    GL_PROGRAM_TARGET_NV              = 0x8646,
    GL_PROGRAM_RESIDENT_NV            = 0x8647,
    GL_TRACK_MATRIX_NV                = 0x8648,
    GL_TRACK_MATRIX_TRANSFORM_NV      = 0x8649,
    GL_VERTEX_PROGRAM_BINDING_NV      = 0x864A,
    GL_PROGRAM_ERROR_POSITION_NV      = 0x864B,
    GL_VERTEX_ATTRIB_ARRAY0_NV        = 0x8650,
    GL_VERTEX_ATTRIB_ARRAY1_NV        = 0x8651,
    GL_VERTEX_ATTRIB_ARRAY2_NV        = 0x8652,
    GL_VERTEX_ATTRIB_ARRAY3_NV        = 0x8653,
    GL_VERTEX_ATTRIB_ARRAY4_NV        = 0x8654,
    GL_VERTEX_ATTRIB_ARRAY5_NV        = 0x8655,
    GL_VERTEX_ATTRIB_ARRAY6_NV        = 0x8656,
    GL_VERTEX_ATTRIB_ARRAY7_NV        = 0x8657,
    GL_VERTEX_ATTRIB_ARRAY8_NV        = 0x8658,
    GL_VERTEX_ATTRIB_ARRAY9_NV        = 0x8659,
    GL_VERTEX_ATTRIB_ARRAY10_NV       = 0x865A,
    GL_VERTEX_ATTRIB_ARRAY11_NV       = 0x865B,
    GL_VERTEX_ATTRIB_ARRAY12_NV       = 0x865C,
    GL_VERTEX_ATTRIB_ARRAY13_NV       = 0x865D,
    GL_VERTEX_ATTRIB_ARRAY14_NV       = 0x865E,
    GL_VERTEX_ATTRIB_ARRAY15_NV       = 0x865F,
    GL_MAP1_VERTEX_ATTRIB0_4_NV       = 0x8660,
    GL_MAP1_VERTEX_ATTRIB1_4_NV       = 0x8661,
    GL_MAP1_VERTEX_ATTRIB2_4_NV       = 0x8662,
    GL_MAP1_VERTEX_ATTRIB3_4_NV       = 0x8663,
    GL_MAP1_VERTEX_ATTRIB4_4_NV       = 0x8664,
    GL_MAP1_VERTEX_ATTRIB5_4_NV       = 0x8665,
    GL_MAP1_VERTEX_ATTRIB6_4_NV       = 0x8666,
    GL_MAP1_VERTEX_ATTRIB7_4_NV       = 0x8667,
    GL_MAP1_VERTEX_ATTRIB8_4_NV       = 0x8668,
    GL_MAP1_VERTEX_ATTRIB9_4_NV       = 0x8669,
    GL_MAP1_VERTEX_ATTRIB10_4_NV      = 0x866A,
    GL_MAP1_VERTEX_ATTRIB11_4_NV      = 0x866B,
    GL_MAP1_VERTEX_ATTRIB12_4_NV      = 0x866C,
    GL_MAP1_VERTEX_ATTRIB13_4_NV      = 0x866D,
    GL_MAP1_VERTEX_ATTRIB14_4_NV      = 0x866E,
    GL_MAP1_VERTEX_ATTRIB15_4_NV      = 0x866F,
    GL_MAP2_VERTEX_ATTRIB0_4_NV       = 0x8670,
    GL_MAP2_VERTEX_ATTRIB1_4_NV       = 0x8671,
    GL_MAP2_VERTEX_ATTRIB2_4_NV       = 0x8672,
    GL_MAP2_VERTEX_ATTRIB3_4_NV       = 0x8673,
    GL_MAP2_VERTEX_ATTRIB4_4_NV       = 0x8674,
    GL_MAP2_VERTEX_ATTRIB5_4_NV       = 0x8675,
    GL_MAP2_VERTEX_ATTRIB6_4_NV       = 0x8676,
    GL_MAP2_VERTEX_ATTRIB7_4_NV       = 0x8677,
    GL_MAP2_VERTEX_ATTRIB8_4_NV       = 0x8678,
    GL_MAP2_VERTEX_ATTRIB9_4_NV       = 0x8679,
    GL_MAP2_VERTEX_ATTRIB10_4_NV      = 0x867A,
    GL_MAP2_VERTEX_ATTRIB11_4_NV      = 0x867B,
    GL_MAP2_VERTEX_ATTRIB12_4_NV      = 0x867C,
    GL_MAP2_VERTEX_ATTRIB13_4_NV      = 0x867D,
    GL_MAP2_VERTEX_ATTRIB14_4_NV      = 0x867E,
    GL_MAP2_VERTEX_ATTRIB15_4_NV      = 0x867F,
}

extern(System):

typedef GLboolean function(GLsizei,GLuint*,GLboolean*) pfglAreProgramsResidentNV;
typedef void function(GLenum,GLuint) pfglBindProgramNV;
typedef void function(GLsizei,GLuint*) pfglDeleteProgramsNV;
typedef void function(GLenum,GLuint,GLfloat*) pfglExecuteProgramNV;
typedef void function(GLsizei,GLuint*) pfglGenProgramsNV;
typedef void function(GLenum,GLuint,GLenum,GLdouble*) pfglGetProgramParameterdvNV;
typedef void function(GLenum,GLuint,GLenum,GLfloat*) pfglGetProgramParameterfvNV;
typedef void function(GLuint,GLenum,GLint*) pfglGetProgramivNV;
typedef void function(GLuint,GLenum,GLchar*) pfglGetProgramStringNV;
typedef void function(GLenum,GLuint,GLenum,GLint*) pfglGetTrackMatrixivNV;
typedef void function(GLuint,GLenum,GLdouble*) pfglGetVertexAttribdvNV;
typedef void function(GLuint,GLenum,GLfloat*) pfglGetVertexAttribfvNV;
typedef void function(GLuint,GLenum,GLint*) pfglGetVertexAttribivNV;
typedef void function(GLuint,GLenum,GLvoid*) pfglGetVertexAttribPointervNV;
typedef GLboolean function(GLuint) pfglIsProgramNV;
typedef void function(GLenum,GLuint,GLsizei,GLchar*) pfglLoadProgramNV;
typedef void function(GLenum,GLuint,GLdouble,GLdouble,GLdouble,GLdouble) pfglProgramParameter4dNV;
typedef void function(GLenum,GLuint,GLdouble*) pfglProgramParameter4dvNV;
typedef void function(GLenum,GLuint,GLfloat,GLfloat,GLfloat,GLfloat) pfglProgramParameter4fNV;
typedef void function(GLenum,GLuint,GLfloat*) pfglProgramParameter4fvNV;
typedef void function(GLenum,GLuint,GLuint,GLdouble*) pfglProgramParameters4dvNV;
typedef void function(GLenum,GLuint,GLuint,GLfloat*) pfglProgramParameters4fvNV;
typedef void function(GLsizei,GLuint*) pfglRequestResidentProgramsNV;
typedef void function(GLenum,GLuint,GLenum,GLenum) pfglTrackMatrixNV;
typedef void function(GLuint,GLint,GLenum,GLsizei,GLvoid*) pfglVertexAttribPointerNV;
typedef void function(GLuint,GLdouble) pfglVertexAttrib1dNV;
typedef void function(GLuint,GLdouble*) pfglVertexAttrib1dvNV;
typedef void function(GLuint,GLfloat) pfglVertexAttrib1fNV;
typedef void function(GLuint,GLfloat*) pfglVertexAttrib1fvNV;
typedef void function(GLuint,GLshort) pfglVertexAttrib1sNV;
typedef void function(GLuint,GLshort*) pfglVertexAttrib1svNV;
typedef void function(GLuint,GLdouble,GLdouble) pfglVertexAttrib2dNV;
typedef void function(GLuint,GLdouble*) pfglVertexAttrib2dvNV;
typedef void function(GLuint,GLfloat,GLfloat) pfglVertexAttrib2fNV;
typedef void function(GLuint,GLfloat*) pfglVertexAttrib2fvNV;
typedef void function(GLuint,GLshort,GLshort) pfglVertexAttrib2sNV;
typedef void function(GLuint,GLshort*) pfglVertexAttrib2svNV;
typedef void function(GLuint,GLdouble,GLdouble,GLdouble) pfglVertexAttrib3dNV;
typedef void function(GLuint,GLdouble*) pfglVertexAttrib3dvNV;
typedef void function(GLuint,GLfloat,GLfloat,GLfloat) pfglVertexAttrib3fNV;
typedef void function(GLuint,GLfloat*) pfglVertexAttrib3fvNV;
typedef void function(GLuint,GLshort,GLshort,GLshort) pfglVertexAttrib3sNV;
typedef void function(GLuint,GLshort*) pfglVertexAttrib3svNV;
typedef void function(GLuint,GLdouble,GLdouble,GLdouble,GLdouble) pfglVertexAttrib4dNV;
typedef void function(GLuint,GLdouble*) pfglVertexAttrib4dvNV;
typedef void function(GLuint,GLfloat,GLfloat,GLfloat,GLfloat) pfglVertexAttrib4fNV;
typedef void function(GLuint,GLfloat*) pfglVertexAttrib4fvNV;
typedef void function(GLuint,GLshort,GLshort,GLshort,GLshort) pfglVertexAttrib4sNV;
typedef void function(GLuint,GLshort*) pfglVertexAttrib4svNV;
typedef void function(GLuint,GLubyte,GLubyte,GLubyte,GLubyte) pfglVertexAttrib4ubNV;
typedef void function(GLuint,GLubyte*) pfglVertexAttrib4ubvNV;
typedef void function(GLuint,GLsizei,GLdouble*) pfglVertexAttribs1dvNV;
typedef void function(GLuint,GLsizei,GLfloat*) pfglVertexAttribs1fvNV;
typedef void function(GLuint,GLsizei,GLshort*) pfglVertexAttribs1svNV;
typedef void function(GLuint,GLsizei,GLdouble*) pfglVertexAttribs2dvNV;
typedef void function(GLuint,GLsizei,GLfloat*) pfglVertexAttribs2fvNV;
typedef void function(GLuint,GLsizei,GLshort*) pfglVertexAttribs2svNV;
typedef void function(GLuint,GLsizei,GLdouble*) pfglVertexAttribs3dvNV;
typedef void function(GLuint,GLsizei,GLfloat*) pfglVertexAttribs3fvNV;
typedef void function(GLuint,GLsizei,GLshort*) pfglVertexAttribs3svNV;
typedef void function(GLuint,GLsizei,GLdouble*) pfglVertexAttribs4dvNV;
typedef void function(GLuint,GLsizei,GLfloat*) pfglVertexAttribs4fvNV;
typedef void function(GLuint,GLsizei,GLshort*) pfglVertexAttribs4svNV;
typedef void function(GLuint,GLsizei,GLubyte*) pfglVertexAttribs4ubvNV;

pfglAreProgramsResidentNV           glAreProgramsResidentNV;
pfglBindProgramNV                   glBindProgramNV;
pfglDeleteProgramsNV                glDeleteProgramsNV;
pfglExecuteProgramNV                glExecuteProgramNV;
pfglGenProgramsNV                   glGenProgramsNV;
pfglGetProgramParameterdvNV         glGetProgramParameterdvNV;
pfglGetProgramParameterfvNV         glGetProgramParameterfvNV;
pfglGetProgramivNV                  glGetProgramivNV;
pfglGetProgramStringNV              glGetProgramStringNV;
pfglGetTrackMatrixivNV              glGetTrackMatrixivNV;
pfglGetVertexAttribdvNV             glGetVertexAttribdvNV;
pfglGetVertexAttribfvNV             glGetVertexAttribfvNV;
pfglGetVertexAttribivNV             glGetVertexAttribivNV;
pfglGetVertexAttribPointervNV       glGetVertexAttribPointervNV;
pfglIsProgramNV                     glIsProgramNV;
pfglLoadProgramNV                   glLoadProgramNV;
pfglProgramParameter4dNV            glProgramParameter4dNV;
pfglProgramParameter4dvNV           glProgramParameter4dvNV;
pfglProgramParameter4fNV            glProgramParameter4fNV;
pfglProgramParameter4fvNV           glProgramParameter4fvNV;
pfglProgramParameters4dvNV          glProgramParameters4dvNV;
pfglProgramParameters4fvNV          glProgramParameters4fvNV;
pfglRequestResidentProgramsNV       glRequestResidentProgramsNV;
pfglTrackMatrixNV                   glTrackMatrixNV;
pfglVertexAttribPointerNV           glVertexAttribPointerNV;
pfglVertexAttrib1dNV                glVertexAttrib1dNV;
pfglVertexAttrib1dvNV               glVertexAttrib1dvNV;
pfglVertexAttrib1fNV                glVertexAttrib1fNV;
pfglVertexAttrib1fvNV               glVertexAttrib1fvNV;
pfglVertexAttrib1sNV                glVertexAttrib1sNV;
pfglVertexAttrib1svNV               glVertexAttrib1svNV;
pfglVertexAttrib2dNV                glVertexAttrib2dNV;
pfglVertexAttrib2dvNV               glVertexAttrib2dvNV;
pfglVertexAttrib2fNV                glVertexAttrib2fNV;
pfglVertexAttrib2fvNV               glVertexAttrib2fvNV;
pfglVertexAttrib2sNV                glVertexAttrib2sNV;
pfglVertexAttrib2svNV               glVertexAttrib2svNV;
pfglVertexAttrib3dNV                glVertexAttrib3dNV;
pfglVertexAttrib3dvNV               glVertexAttrib3dvNV;
pfglVertexAttrib3fNV                glVertexAttrib3fNV;
pfglVertexAttrib3fvNV               glVertexAttrib3fvNV;
pfglVertexAttrib3sNV                glVertexAttrib3sNV;
pfglVertexAttrib3svNV               glVertexAttrib3svNV;
pfglVertexAttrib4dNV                glVertexAttrib4dNV;
pfglVertexAttrib4dvNV               glVertexAttrib4dvNV;
pfglVertexAttrib4fNV                glVertexAttrib4fNV;
pfglVertexAttrib4fvNV               glVertexAttrib4fvNV;
pfglVertexAttrib4sNV                glVertexAttrib4sNV;
pfglVertexAttrib4svNV               glVertexAttrib4svNV;
pfglVertexAttrib4ubNV               glVertexAttrib4ubNV;
pfglVertexAttrib4ubvNV              glVertexAttrib4ubvNV;
pfglVertexAttribs1dvNV              glVertexAttribs1dvNV;
pfglVertexAttribs1fvNV              glVertexAttribs1fvNV;
pfglVertexAttribs1svNV              glVertexAttribs1svNV;
pfglVertexAttribs2dvNV              glVertexAttribs2dvNV;
pfglVertexAttribs2fvNV              glVertexAttribs2fvNV;
pfglVertexAttribs2svNV              glVertexAttribs2svNV;
pfglVertexAttribs3dvNV              glVertexAttribs3dvNV;
pfglVertexAttribs3fvNV              glVertexAttribs3fvNV;
pfglVertexAttribs3svNV              glVertexAttribs3svNV;
pfglVertexAttribs4dvNV              glVertexAttribs4dvNV;
pfglVertexAttribs4fvNV              glVertexAttribs4fvNV;
pfglVertexAttribs4svNV              glVertexAttribs4svNV;
pfglVertexAttribs4ubvNV             glVertexAttribs4ubvNV;