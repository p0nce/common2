module bass.state;

import derelict.bass.bass;
import misc.singleton;
import misc.logger;
import bass.error;

class BASS
{
    mixin Singleton;

    this()
    {
        info(">bass.state.BASS.this()");
        DerelictBASS.load();
        info("<bass.state.BASS.this()");
    }

    ~this()
    {
        info(">bass.state.BASS.~this()");
        DerelictBASS.unload();
        info("<bass.state.BASS.~this()");
    }

    void check()
    {
        int err = BASS_ErrorGetCode();
        if (err != BASS_OK)
        {
            error(format("Bass error %s : %s", err, BASSErrorString(err)));
            assert(false);
        }
    }

    void signal()
    {
        int err = BASS_ErrorGetCode();
        if (err != BASS_OK)
        {
            throw new BASSError(format("Bass error %s : %s", err, BASSErrorString(err)));
        }
    }

    bool test()
    {
        int err = BASS_ErrorGetCode();
        if (err != BASS_OK)
        {
            warn(format("Bass error %s : %s", err, BASSErrorString(err)));
            return false;
        }
        else
        {
            return true;
        }
    }
}
