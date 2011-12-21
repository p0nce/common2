module sdl.thread;

import derelict.sdl.sdl;


class Thread
{
    private
    {
        SDL_Thread * m_handle;
    }

    public
    {
        this()
        {
            m_handle = SDL_CreateThread(&thread_callback, &this);
            assert(m_handle !is null);
        }

        int run()
        {
            return 0;
        }

        final void kill()
        {
            SDL_KillThread(m_handle);
        }

        final int wait()
        {
            int status;
            SDL_WaitThread(m_handle, &status);
            return status;
        }

    }

}

extern(C)
{
    int thread_callback( void * data )
    {
        auto t = cast(Thread)data;
        assert(t !is null);
        return t.run();
    }
}
