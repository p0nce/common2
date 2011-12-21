module bass.channel;

import derelict.bass.bass;
import bass.system;
import misc.logger;

class BASSChannel
{
    private
    {
        HCHANNEL m_handle;
        BASSSystem m_system;
    }

    public
    {
        this(BASSSystem system, HCHANNEL handle)
        {
            m_handle = handle;
            m_system = system;
        }

        HCHANNEL handle()
        {
            return m_handle;
        }

        void play(bool restart)
        {
            auto res = BASS_ChannelPlay(m_handle, restart ? 1 : 0);

            if (res == 0)
            {
                m_system.state.signal();
            }
        }

        bool isPlaying()
        {
            int res = BASS_ChannelIsActive(handle);
            return res == BASS_ACTIVE_PLAYING;
        }

        void setVolume(float v)
        {
            // don't really care if it's a success or not
            BASS_ChannelSlideAttribute(m_handle, BASS_ATTRIB_VOL, v, 100);
        }
    }
}
