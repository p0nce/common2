module misc.devilimage;

import misc.singleton;

import derelict.devil.il;
import derelict.devil.ilu;
import derelict.devil.iltypes;
import misc.logger;

import std.string;

class DevilError : object.Exception
{
    this(char[] s)
    {
        super(s);
    }
}


private class DevilState
{
    mixin Singleton;
    private
    {
        this()
        {
            DerelictIL.load();
            DerelictILU.load();
            ilInit();
            iluInit();
        }
    }

}


final class DevilImage
{

    private
    {
        ILuint m_handle;
        static bool m_devil_loaded = false;
    }

    public
    {

        this()
        {
            DevilState.instance(); // load devIL if necessary
            if (!m_devil_loaded)
            {
                DerelictIL.load();
                DerelictILU.load();
                ilInit();
                iluInit();
                m_devil_loaded = true;
            }
            ilGenImages(1, &m_handle);

        }

        this(char[] filename)
        {
            this();
            loadImage(filename);
        }

        ~this()
        {
            ilDeleteImages(1, &m_handle);
        }

        bool loadImage(char[] filename)
        {
            ilBindImage(m_handle);

            // charge l'image
            ILboolean res = ilLoadImage(toStringz(filename));

            bool bres = false;

            switch (res)
            {
                case IL_COULD_NOT_OPEN_FILE:
                    throw new DevilError(format("devIL : Impossible d'ouvrir %s", filename));

                case IL_ILLEGAL_OPERATION:
                    throw new DevilError("devIL : Operation non reconnue");

                case IL_INVALID_EXTENSION:
                    throw new DevilError(format("devIL : format du fichier %s non reconnu", filename));

                case IL_INVALID_PARAM:
                    throw new DevilError("Parametre invalide");

                default:
                    bres = true;
                    ilConvertImage(IL_RGBA, IL_UNSIGNED_BYTE);
                    break;
            }

            return bres;
        }

        void flipVertical()
        {
            ilBindImage(m_handle);
            iluFlipImage();
        }

        void saveImage(char[] filename)
        {
            ilBindImage(m_handle);
            flipVertical();
            ilEnable(IL_FILE_OVERWRITE);
            ilSaveImage(toStringz(filename));
            flipVertical();
        }


        ubyte* data()
        {
            ilBindImage(m_handle);
            return cast(ubyte*) ilGetData();
        }

        int height()
        {
            ilBindImage(m_handle);
            return ilGetInteger(IL_IMAGE_HEIGHT);
        }

        int width()
        {
            ilBindImage(m_handle);
            return ilGetInteger(IL_IMAGE_WIDTH);
        }

        void setData(int width, int height, void* data)
        {
            ilBindImage(m_handle);
            ilTexImage( width, height, 1, 4, IL_RGBA, IL_UNSIGNED_BYTE, cast(ILvoid *) data);
        }
    }
}
