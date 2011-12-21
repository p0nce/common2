module sdl.mixer.chunk;


import derelict.sdl.mixer;
import math.common;
import sdl.state;
import std.string;
import sdl.mixer.general;
import sdl.mixer.channel;
import std.string, misc.logger;


final class Chunk
{
	private
	{
		Mix_Chunk *m_handle;
		SDLMixer m_SDLMixer;
	}

	package
	{
		this(SDLMixer mixer, string filename)
		{
			m_SDLMixer = mixer;
			m_handle = Mix_LoadWAV(filename);
			if (m_handle is null) throw new SDLError(format("Unable to load the %s", filename));
		}
	}

	public
	{
		// play on a free channel
		void play(float volume)
		{
			int vol = round(clamp(volume, 0.f, 1.f)) * 127;
			if (vol <= 0) return;

			Mix_VolumeChunk(m_handle, vol);
			int index = Mix_PlayChannel(-1, m_handle, 0);

		}

		Mix_Chunk * handle()
		{
			return m_handle;
		}

		void playPosition(float volume, float distance, float angle)
		{
			int vol = round(clampf(volume * exp(-distance * 0.03), 0.f, 1.f) * 127);
			if (vol <= 0) return;
			/*
			int dist = round(clamp(volume, 0.f, 1.f) * 255);
			if (dist <= 0) dist = 0;
			if (dist >= 255) dist = 255;
			*/
			Mix_VolumeChunk(m_handle, vol);
			int index = Mix_PlayChannel(-1, m_handle, 0);
			if (index != -1)
			{

				void panLaw(float x, out float left, out float right)
				{
					x *= 0.5f;
					if (x < -0.5f) x = -0.5f;
					if (x > 0.5f) x = 0.5f;
					right = 1.f - sqr(x - 0.5f);
					left = 1.f - sqr(x + 0.5f);
				}

				float l, r;
				panLaw(sin(angle), l, r);

				int left = round(127 * l);
				int right = round(127 * r);

//				Mix_SetPanning(index, cast(ubyte)left, cast(ubyte)right);

	//			Mix_SetDistance(index, cast(ubyte)dist);
			}
		}

	}

}
