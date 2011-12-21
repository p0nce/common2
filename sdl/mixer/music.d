module sdl.mixer.music;

import derelict.sdl.mixer;
import math.common;
import sdl.state;
import std.string;
import misc.logger;

final class Music
{
	private
	{
		Mix_Music *m_handle;
	}

	public
	{
		this(string filename)
		{
			m_handle = Mix_LoadMUS(toStringz(filename));
			if (m_handle is null) throw new SDLError(format("Unable to load the music %s", filename));			
		}
		
		~this()
		{
			if (m_handle !is null) 
			{
				Mix_FreeMusic(m_handle);
			}
		}

		void play(bool loop)
		{
			Mix_PlayMusic(m_handle, loop ? -1 : 1);
		}

        void stop()
        {
            Mix_HaltMusic();
        }
		
		void playFadeIn(bool loop, int ms)
		{
			Mix_FadeInMusic(m_handle, loop ? -1 : 1, ms);
		}
		
		static float setVolume(float v)
		{
			int vi = round(clamp(v, 0.f,1.f) * MIX_MAX_VOLUME);
			Mix_VolumeMusic(vi);
			return v;
		}

	}
}
