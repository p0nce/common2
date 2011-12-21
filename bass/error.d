module bass.error;

import std.string;

class BASSError : object.Exception
{
    this(char[] s)
    {
        super(s);
    }
}

char[] BASSErrorString(int errCode)
{
    switch(errCode)
    {
        case 0: return "BASS_OK";
        case 1: return "BASS_ERROR_MEM";
        case 2: return "BASS_ERROR_FILEOPEN";
        case 3: return "BASS_ERROR_DRIVER";
        case 4: return "BASS_ERROR_BUFLOST";
        case 5: return "BASS_ERROR_HANDLE";
        case 6: return "BASS_ERROR_FORMAT";
        case 7: return "BASS_ERROR_POSITION";
        case 8: return "BASS_ERROR_INIT";
        case 9: return "BASS_ERROR_START";
        case 14: return "BASS_ERROR_ALREADY";
        case 18: return "BASS_ERROR_NOCHAN";
        case 19: return "BASS_ERROR_ILLTYPE";
        case 20: return "BASS_ERROR_ILLPARAM";
        case 21: return "BASS_ERROR_NO3D";
        case 22: return "BASS_ERROR_NOEAX";
        case 23: return "BASS_ERROR_DEVICE";
        case 24: return "BASS_ERROR_NOPLAY";
        case 25: return "BASS_ERROR_FREQ";
        case 27: return "BASS_ERROR_NOTFILE";
        case 29: return "BASS_ERROR_NOHW";
        case 31: return "BASS_ERROR_EMPTY";
        case 32: return "BASS_ERROR_NONET";
        case 33: return "BASS_ERROR_CREATE";
        case 34: return "BASS_ERROR_NOFX";
        case 37: return "BASS_ERROR_NOTAVAIL";
        case 38: return "BASS_ERROR_DECODE";
        case 39: return "BASS_ERROR_DX";
        case 40: return "BASS_ERROR_TIMEOUT";
        case 41: return "BASS_ERROR_FILEFORM";
        case 42: return "BASS_ERROR_SPEAKER";
        case 43: return "BASS_ERROR_VERSION";
        case 44: return "BASS_ERROR_CODEC";
        case 45: return "BASS_ERROR_ENDED";
        case -1: return "BASS_ERROR_UNKNOWN";
        default: return "unknown BASS error";
    }
}
