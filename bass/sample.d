module bass.sample;

import derelict.bass.bass;
import bass.channel;
import bass.system;
import std.string;
import misc.logger;

class BASSSample
{
    private
    {
        HSAMPLE m_handle;
        BASSSystem m_system;
    }

    public
    {
        this(BASSSystem system, char[] filename)
        {
            char* filenameZ = toStringz(filename);

            HSAMPLE h = BASS_SampleLoad(0, filenameZ, 0, 0, 1, BASS_SAMPLE_OVER_POS);

            if (h == 0)
            {
                warn(format("%s cannot be loaded.", filename));
                system.state.signal; // throw exception
            }

            m_handle = h;
            m_system = system;
        }

        ~this()
        {
            BASS_SampleFree(m_handle);
        }

        void play(float volume)
        {
            HCHANNEL channel = BASS_SampleGetChannel(m_handle, 0);
            if (channel == 0) return; // silent failure

            BASS_ChannelSetAttribute(m_handle, BASS_ATTRIB_VOL, volume);

            BASS_ChannelPlay(channel, 1);
        }
    }
}
