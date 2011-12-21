module sdl.mixer.general;

import misc.singleton;
import math.all;
import derelict.sdl.sdl;
import derelict.sdl.mixer;
import sdl.state;
import sdl.mixer.channel;
import sdl.mixer.chunk;
import misc.logger;

final class SDLMixer
{
	mixin Singleton;

	private
	{
		Chunk[Mix_Chunk *] m_chunkPool;
		
		bool m_initialized = false;
		SDL m_SDL;

		this(int numChannels = 16)
		{
			DerelictSDLMixer.load();
			m_SDL = SDL.instance;
			m_SDL.subSystemInit(SDL_INIT_AUDIO);
			
			int res = Mix_OpenAudio(44100, AUDIO_S16SYS, 2, 1024);

			if (res == -1) throw new SDLError("Mix_OpenAudio failed");
			
			m_initialized = true;

			Mix_AllocateChannels(numChannels);

			m_channels.length = numChannels;

			for (int i = 0; i < m_channels.length; ++i)
			{
				m_channels[i] = new Channel(this, i);
			}
		}

		~this()
		{
			info(">SDLMixer.~this");
			if (m_initialized) Mix_CloseAudio();
           // DerelictSDLMixer.unload();
			info("<SDLMixer.~this");
		}

		Channel[] m_channels;
	}
	
	alias extern(C) void function () finishCallback;

	public
	{
		Channel channel(int i)
		{
			return m_channels[i];
		}

		Chunk createChunk(char[] wavFile)
		{
			Chunk chunk = new Chunk(this, wavFile);
			m_chunkPool[chunk.handle] = chunk;

			return chunk;
		}
		
		void hookMusicFinished(finishCallback hook)
		{
			Mix_HookMusicFinished(hook);
		}
	}
}
