module bass.stream;

import derelict.bass.bass;
import bass.channel;
import bass.system;
import std.string;
import misc.logger;

class BASSStream : BASSChannel
{
    public
    {
        this(BASSSystem system, char[] filename)
        {
            char* filenameZ = toStringz(filename);

            HSTREAM h = BASS_StreamCreateFile(0, filenameZ, 0, 0, 0);

            if (h == 0)
            {
                warn(format("%s cannot be loaded.", filename));
                system.state.signal; // throw exception
            }

            //m_system = system;
            //m_handle = h;
            super(system, h);
            //m_channel = new BASSChannel(system, h);
        }

        ~this()
        {
            BASS_StreamFree(handle);
        }
    }
}
