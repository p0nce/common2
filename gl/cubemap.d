module gl.cubemap;

import gl.texture;
import gl.state;
import derelict.opengl.gl;

// not up to date

final class CubeMap : Texture
{
    public
    {
        enum Face { POS_X, NEG_X, POS_Y, NEG_Y, POS_Z, NEG_Z };

    }
    private
    {
        static const GLenum Face_toGL[6] =
        [
            GL_TEXTURE_CUBE_MAP_POSITIVE_X,
            GL_TEXTURE_CUBE_MAP_NEGATIVE_X,
            GL_TEXTURE_CUBE_MAP_POSITIVE_Y,
            GL_TEXTURE_CUBE_MAP_NEGATIVE_Y,
            GL_TEXTURE_CUBE_MAP_POSITIVE_Z,
            GL_TEXTURE_CUBE_MAP_NEGATIVE_Z,
        ];
    }


    public
    {
        this(IFormat iFormat, bool useCompression, bool sRGB)
        {
            super(GL_TEXTURE_CUBE_MAP, iFormat, false, useCompression, sRGB);
        }

        void setAllImages(int level, int width, int height, Format format, Type type, void * data, bool mipmap)
        {
            bind();

            for (Face f = Face.min; f <= Face.max; ++f)
            {
                glTexImage2D(Face_toGL[f], level, m_iFormat, width, height, 0, Format_toGL[format], Type_toGL[type], data);
            }

            if (mipmap) generateMipmaps();


            GL.check();
            m_width = width;
            m_height = height;
            m_depth = 1;
        }
    }
}
