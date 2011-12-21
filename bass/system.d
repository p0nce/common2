module bass.system;

import derelict.bass.bass;
import bass.state;

import misc.logger;

class BASSSystem
{
    public
    {
        this(HWND hwnd)
        {
            m_bass = BASS.instance;

            bool b = 0 != BASS_Init(-1, 44100, 0, hwnd, null);
            if (!b)
            {
                warn("Cannot open audio");
                m_bass.signal;
            }
        }

        ~this()
        {
            bool b = 0 != BASS_Free();
            m_bass.test;
        }

        BASS state()
        {
            return m_bass;
        }

        void stop()
        {
            BASS_Stop();
        }
    }

    private
    {
        BASS m_bass;
    }
}
