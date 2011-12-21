module sdl.mixer.channel;


import derelict.sdl.mixer;
import math.common;
import sdl.state;
import std.string;
import math.vec2, math.vec3, math.vec4;

import sdl.mixer.general;

final class Channel
{
	private
	{
		SDLMixer m_SDLMixer;
		int m_index;
	}

	package
	{
		this(SDLMixer m, int index)
		{
			m_SDLMixer = m;
			m_index = index;
		}
	}

	public
	{
		void unregisterAllEffects()
		{
			Mix_UnregisterAllEffects(m_index);
		}

		float pan(float x)
		{

			vec2f panLaw(float x)
			{
				x *= 0.5f;
				if (x < -0.5f) x = -0.5f;
				if (x > 0.5f) x = 0.5f;
				float r_gain = 1.f - sqr(x - 0.5f);
				float l_gain = 1.f - sqr(x + 0.5f);
				return vec2f(l_gain, r_gain);
			}

			vec2f volume = panLaw(x);

			int left = round(127 * volume.x);
			int right = round(127 * volume.y);

			Mix_SetPanning(m_index, cast(ubyte)left, cast(ubyte)right);
			return x;
		}

		float volume(float v)
		{
			float v2 = clamp(v, 0.f, 1.f);
			Mix_Volume(m_index, round(v2 * 127));

			return v;
		}

	}

}
