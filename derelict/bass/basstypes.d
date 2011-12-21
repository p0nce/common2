/*
 * Copyright (c) 2004-2008 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.bass.basstypes;

// API version
const BASSVERSION = 0x204;             

char[] BASSVERSIONTEXT = "2.4";

  // Use these to test for error from functions that return a int or long
const int DW_ERROR = -1;   // -1 (int)
const long QW_ERROR = -1;  // -1 (long)

  // Error codes returned by BASS_ErrorGetCode()
const int BASS_OK                 = 0,    // all is OK
          BASS_ERROR_MEM          = 1,    // memory error
          BASS_ERROR_FILEOPEN     = 2,    // can't open the file
          BASS_ERROR_DRIVER       = 3,    // can't find a free sound driver
          BASS_ERROR_BUFLOST      = 4,    // the sample buffer was lost
          BASS_ERROR_HANDLE       = 5,    // invalid handle
          BASS_ERROR_FORMAT       = 6,    // unsupported sample format
          BASS_ERROR_POSITION     = 7,    // invalid position
          BASS_ERROR_INIT         = 8,    // BASS_Init has not been successfully called
          BASS_ERROR_START        = 9,    // BASS_Start has not been successfully called
          BASS_ERROR_ALREADY      = 14,   // already initialized/paused/whatever
          BASS_ERROR_NOCHAN       = 18,   // can't get a free channel
          BASS_ERROR_ILLTYPE      = 19,   // an illegal type was specified
          BASS_ERROR_ILLPARAM     = 20,   // an illegal parameter was specified
          BASS_ERROR_NO3D         = 21,   // no 3D support
          BASS_ERROR_NOEAX        = 22,   // no EAX support
          BASS_ERROR_DEVICE       = 23,   // illegal device number
          BASS_ERROR_NOPLAY       = 24,   // not playing
          BASS_ERROR_FREQ         = 25,   // illegal sample rate
          BASS_ERROR_NOTFILE      = 27,   // the stream is not a file stream
          BASS_ERROR_NOHW         = 29,   // no hardware voices available
          BASS_ERROR_EMPTY        = 31,   // the MOD music has no sequence data
          BASS_ERROR_NONET        = 32,   // no internet connection could be opened
          BASS_ERROR_CREATE       = 33,   // couldn't create the file
          BASS_ERROR_NOFX         = 34,   // effects are not enabled
          BASS_ERROR_NOTAVAIL     = 37,   // requested data is not available
          BASS_ERROR_DECODE       = 38,   // the channel is a "decoding channel"
          BASS_ERROR_DX           = 39,   // a sufficient DirectX version is not installed
          BASS_ERROR_TIMEOUT      = 40,   // connection timedout
          BASS_ERROR_FILEFORM     = 41,   // unsupported file format
          BASS_ERROR_SPEAKER      = 42,   // unavailable speaker
          BASS_ERROR_VERSION      = 43,   // invalid BASS version (used by add-ons)
          BASS_ERROR_CODEC        = 44,   // codec is not available/supported
          BASS_ERROR_ENDED        = 45,   // the channel/file has ended
          BASS_ERROR_UNKNOWN      = -1;   // some other mystery problem

  // BASS_SetConfig options
const int BASS_CONFIG_BUFFER        = 0,
          BASS_CONFIG_UPDATEPERIOD  = 1,
          BASS_CONFIG_GVOL_SAMPLE   = 4,
          BASS_CONFIG_GVOL_STREAM   = 5,
          BASS_CONFIG_GVOL_MUSIC    = 6,
          BASS_CONFIG_CURVE_VOL     = 7,
          BASS_CONFIG_CURVE_PAN     = 8,
          BASS_CONFIG_FLOATDSP      = 9,
          BASS_CONFIG_3DALGORITHM   = 10,
          BASS_CONFIG_NET_TIMEOUT   = 11,
          BASS_CONFIG_NET_BUFFER    = 12,
          BASS_CONFIG_PAUSE_NOPLAY  = 13,
          BASS_CONFIG_NET_PREBUF    = 15,
          BASS_CONFIG_NET_PASSIVE   = 18,
          BASS_CONFIG_REC_BUFFER    = 19,
          BASS_CONFIG_NET_PLAYLIST  = 21,
          BASS_CONFIG_MUSIC_VIRTUAL = 22,
          BASS_CONFIG_VERIFY        = 23,
          BASS_CONFIG_UPDATETHREADS = 24;

// BASS_SetConfigPtr options
const int BASS_CONFIG_NET_AGENT     = 16,
          BASS_CONFIG_NET_PROXY     = 17;

// Initialization flags
const int BASS_DEVICE_8BITS       = 1,    // use 8 bit resolution, else 16 bit
          BASS_DEVICE_MONO        = 2,    // use mono, else stereo
          BASS_DEVICE_3D          = 4,    // enable 3D functionality
          BASS_DEVICE_LATENCY     = 256,  // calculate device latency (BASS_INFO struct)
          BASS_DEVICE_CPSPEAKERS  = 1024, // detect speakers via Windows control panel
          BASS_DEVICE_SPEAKERS    = 2048, // force enabling of speaker assignment
          BASS_DEVICE_NOSPEAKER   = 4096; // ignore speaker arrangement

// DirectSound interfaces (for use with BASS_GetDSoundObject)
const int BASS_OBJECT_DS          = 1,   // IDirectSound
          BASS_OBJECT_DS3DL       = 2;   // IDirectSound3DListener

  // BASS_DEVICEINFO flags
const int BASS_DEVICE_ENABLED     = 1,
          BASS_DEVICE_DEFAULT     = 2,
          BASS_DEVICE_INIT        = 4;

  // BASS_INFO flags (from DSOUND.H)
const int DSCAPS_CONTINUOUSRATE   = 0x00000010,     // supports all sample rates between min/maxrate
          DSCAPS_EMULDRIVER       = 0x00000020,     // device does NOT have hardware DirectSound support
          DSCAPS_CERTIFIED        = 0x00000040,     // device driver has been certified by Microsoft
          DSCAPS_SECONDARYMONO    = 0x00000100,     // mono
          DSCAPS_SECONDARYSTEREO  = 0x00000200,     // stereo
          DSCAPS_SECONDARY8BIT    = 0x00000400,     // 8 bit
          DSCAPS_SECONDARY16BIT   = 0x00000800;     // 16 bit

  // BASS_RECORDINFO flags (from DSOUND.H)
const int DSCCAPS_EMULDRIVER = DSCAPS_EMULDRIVER,  // device does NOT have hardware DirectSound recording support
          DSCCAPS_CERTIFIED = DSCAPS_CERTIFIED;    // device driver has been certified by Microsoft

  // defines for formats field of BASS_RECORDINFO (from MMSYSTEM.H)
const int WAVE_FORMAT_1M08       = 0x00000001,      // 11.025 kHz, Mono,   8-bit
          WAVE_FORMAT_1S08       = 0x00000002,      // 11.025 kHz, Stereo, 8-bit
          WAVE_FORMAT_1M16       = 0x00000004,      // 11.025 kHz, Mono,   16-bit
          WAVE_FORMAT_1S16       = 0x00000008,      // 11.025 kHz, Stereo, 16-bit
          WAVE_FORMAT_2M08       = 0x00000010,      // 22.05  kHz, Mono,   8-bit
          WAVE_FORMAT_2S08       = 0x00000020,      // 22.05  kHz, Stereo, 8-bit
          WAVE_FORMAT_2M16       = 0x00000040,      // 22.05  kHz, Mono,   16-bit
          WAVE_FORMAT_2S16       = 0x00000080,      // 22.05  kHz, Stereo, 16-bit
          WAVE_FORMAT_4M08       = 0x00000100,      // 44.1   kHz, Mono,   8-bit
          WAVE_FORMAT_4S08       = 0x00000200,      // 44.1   kHz, Stereo, 8-bit
          WAVE_FORMAT_4M16       = 0x00000400,      // 44.1   kHz, Mono,   16-bit
          WAVE_FORMAT_4S16       = 0x00000800;      // 44.1   kHz, Stereo, 16-bit

const int BASS_SAMPLE_8BITS       = 1,        // 8 bit
          BASS_SAMPLE_FLOAT       = 256,      // 32-bit floating-point
          BASS_SAMPLE_MONO        = 2,        // mono
          BASS_SAMPLE_LOOP        = 4,        // looped
          BASS_SAMPLE_3D          = 8,        // 3D functionality
          BASS_SAMPLE_SOFTWARE    = 16,       // not using hardware mixing
          BASS_SAMPLE_MUTEMAX     = 32,       // mute at max distance (3D only)
          BASS_SAMPLE_VAM         = 64,       // DX7 voice allocation & management
          BASS_SAMPLE_FX          = 128,      // old implementation of DX8 effects
          BASS_SAMPLE_OVER_VOL    = 0x10000,  // override lowest volume
          BASS_SAMPLE_OVER_POS    = 0x20000,  // override longest playing
          BASS_SAMPLE_OVER_DIST   = 0x30000;  // override furthest from listener (3D only)

const int BASS_STREAM_PRESCAN     = 0x20000,  // enable pin-point seeking/length (MP3/MP2/MP1)
          BASS_MP3_SETPOS         = BASS_STREAM_PRESCAN,
          BASS_STREAM_AUTOFREE	  = 0x40000,  // automatically free the stream when it stop/ends
          BASS_STREAM_RESTRATE	  = 0x80000,  // restrict the download rate of internet file streams
          BASS_STREAM_BLOCK       = 0x100000, // download/play internet file stream in small blocks
          BASS_STREAM_DECODE      = 0x200000, // don't play the stream, only decode (BASS_ChannelGetData)
          BASS_STREAM_STATUS      = 0x800000; // give server status info (HTTP/ICY tags) in DOWNLOADPROC

const int BASS_MUSIC_FLOAT        = BASS_SAMPLE_FLOAT,
          BASS_MUSIC_MONO         = BASS_SAMPLE_MONO,
          BASS_MUSIC_LOOP         = BASS_SAMPLE_LOOP,
          BASS_MUSIC_3D           = BASS_SAMPLE_3D,
          BASS_MUSIC_FX           = BASS_SAMPLE_FX,
          BASS_MUSIC_AUTOFREE     = BASS_STREAM_AUTOFREE,
          BASS_MUSIC_DECODE       = BASS_STREAM_DECODE,
          BASS_MUSIC_PRESCAN      = BASS_STREAM_PRESCAN, // calculate playback length
          BASS_MUSIC_CALCLEN      = BASS_MUSIC_PRESCAN,
          BASS_MUSIC_RAMP         = 0x200,      // normal ramping
          BASS_MUSIC_RAMPS        = 0x400,      // sensitive ramping
          BASS_MUSIC_SURROUND     = 0x800,      // surround sound
          BASS_MUSIC_SURROUND2    = 0x1000,     // surround sound (mode 2)
          BASS_MUSIC_FT2MOD       = 0x2000,     // play .MOD as FastTracker 2 does
          BASS_MUSIC_PT1MOD       = 0x4000,     // play .MOD as ProTracker 1 does
          BASS_MUSIC_NONINTER     = 0x10000,    // non-interpolated sample mixing
          BASS_MUSIC_SINCINTER    = 0x800000,   // sinc interpolated sample mixing
          BASS_MUSIC_POSRESET     = 0x8000,     // stop all notes when moving position
          BASS_MUSIC_POSRESETEX   = 0x400000,   // stop all notes and reset bmp/etc when moving position
          BASS_MUSIC_STOPBACK     = 0x80000,    // stop the music on a backwards jump effect
          BASS_MUSIC_NOSAMPLE     = 0x100000;   // don't load the samples

  // Speaker assignment flags
const int BASS_SPEAKER_FRONT      = 0x1000000,  // front speakers
          BASS_SPEAKER_REAR       = 0x2000000,  // rear/side speakers
          BASS_SPEAKER_CENLFE     = 0x3000000,  // center & LFE speakers (5.1)
          BASS_SPEAKER_REAR2      = 0x4000000,  // rear center speakers (7.1)
          BASS_SPEAKER_LEFT       = 0x10000000, // modifier: left
          BASS_SPEAKER_RIGHT      = 0x20000000, // modifier: right
          BASS_SPEAKER_FRONTLEFT  = BASS_SPEAKER_FRONT | BASS_SPEAKER_LEFT,
          BASS_SPEAKER_FRONTRIGHT = BASS_SPEAKER_FRONT | BASS_SPEAKER_RIGHT,
          BASS_SPEAKER_REARLEFT   = BASS_SPEAKER_REAR | BASS_SPEAKER_LEFT,
          BASS_SPEAKER_REARRIGHT  = BASS_SPEAKER_REAR | BASS_SPEAKER_RIGHT,
          BASS_SPEAKER_CENTER     = BASS_SPEAKER_CENLFE | BASS_SPEAKER_LEFT,
          BASS_SPEAKER_LFE        = BASS_SPEAKER_CENLFE | BASS_SPEAKER_RIGHT,
          BASS_SPEAKER_REAR2LEFT  = BASS_SPEAKER_REAR2 | BASS_SPEAKER_LEFT,
          BASS_SPEAKER_REAR2RIGHT = BASS_SPEAKER_REAR2 | BASS_SPEAKER_RIGHT;

const int BASS_UNICODE            = 0x80000000;

const int BASS_RECORD_PAUSE       = 0x8000; // start recording paused

  // DX7 voice allocation & management flags
const int BASS_VAM_HARDWARE       = 1,
          BASS_VAM_SOFTWARE       = 2,
          BASS_VAM_TERM_TIME      = 4,
          BASS_VAM_TERM_DIST      = 8,
          BASS_VAM_TERM_PRIO      = 16;

  // BASS_CHANNELINFO types
const int BASS_CTYPE_SAMPLE       = 1,
          BASS_CTYPE_RECORD       = 2,
          BASS_CTYPE_STREAM       = 0x10000,
          BASS_CTYPE_STREAM_OGG   = 0x10002,
          BASS_CTYPE_STREAM_MP1   = 0x10003,
          BASS_CTYPE_STREAM_MP2   = 0x10004,
          BASS_CTYPE_STREAM_MP3   = 0x10005,
          BASS_CTYPE_STREAM_AIFF  = 0x10006,
          BASS_CTYPE_STREAM_WAV   = 0x40000, // WAVE flag, LOWORD=codec
          BASS_CTYPE_STREAM_WAV_PCM = 0x50001,
          BASS_CTYPE_STREAM_WAV_FLOAT = 0x50003,
          BASS_CTYPE_MUSIC_MOD    = 0x20000,
          BASS_CTYPE_MUSIC_MTM    = 0x20001,
          BASS_CTYPE_MUSIC_S3M    = 0x20002,
          BASS_CTYPE_MUSIC_XM     = 0x20003,
          BASS_CTYPE_MUSIC_IT     = 0x20004,
          BASS_CTYPE_MUSIC_MO3    = 0x00100; // MO3 flag

  // 3D channel modes
const int BASS_3DMODE_NORMAL      = 0, // normal 3D processing
          BASS_3DMODE_RELATIVE    = 1, // position is relative to the listener
          BASS_3DMODE_OFF         = 2; // no 3D processing

  // software 3D mixing algorithms (used with BASS_CONFIG_3DALGORITHM)
const int BASS_3DALG_DEFAULT      = 0,
          BASS_3DALG_OFF          = 1,
          BASS_3DALG_FULL         = 2,
          BASS_3DALG_LIGHT        = 3;

  // EAX environments, use with BASS_SetEAXParameters
const int EAX_ENVIRONMENT_GENERIC           = 0,
          EAX_ENVIRONMENT_PADDEDCELL        = 1,
          EAX_ENVIRONMENT_ROOM              = 2,
          EAX_ENVIRONMENT_BATHROOM          = 3,
          EAX_ENVIRONMENT_LIVINGROOM        = 4,
          EAX_ENVIRONMENT_STONEROOM         = 5,
          EAX_ENVIRONMENT_AUDITORIUM        = 6,
          EAX_ENVIRONMENT_CONCERTHALL       = 7,
          EAX_ENVIRONMENT_CAVE              = 8,
          EAX_ENVIRONMENT_ARENA             = 9,
          EAX_ENVIRONMENT_HANGAR            = 10,
          EAX_ENVIRONMENT_CARPETEDHALLWAY   = 11,
          EAX_ENVIRONMENT_HALLWAY           = 12,
          EAX_ENVIRONMENT_STONECORRIDOR     = 13,
          EAX_ENVIRONMENT_ALLEY             = 14,
          EAX_ENVIRONMENT_FOREST            = 15,
          EAX_ENVIRONMENT_CITY              = 16,
          EAX_ENVIRONMENT_MOUNTAINS         = 17,
          EAX_ENVIRONMENT_QUARRY            = 18,
          EAX_ENVIRONMENT_PLAIN             = 19,
          EAX_ENVIRONMENT_PARKINGLOT        = 20,
          EAX_ENVIRONMENT_SEWERPIPE         = 21,
          EAX_ENVIRONMENT_UNDERWATER        = 22,
          EAX_ENVIRONMENT_DRUGGED           = 23,
          EAX_ENVIRONMENT_DIZZY             = 24,
          EAX_ENVIRONMENT_PSYCHOTIC         = 25,
          // total number of environments
          EAX_ENVIRONMENT_COUNT             = 26;
          
const int BASS_STREAMPROC_END = 0x80000000; // end of user stream flag


  // BASS_StreamCreateFileUser file systems
const int STREAMFILE_NOBUFFER     = 0,
          STREAMFILE_BUFFER       = 1,
          STREAMFILE_BUFFERPUSH   = 2;

  // BASS_StreamPutFileData options
const int BASS_FILEDATA_END       = 0; // end & close the file

  // BASS_StreamGetFilePosition modes
const int BASS_FILEPOS_CURRENT    = 0,
          BASS_FILEPOS_DECODE     = BASS_FILEPOS_CURRENT,
          BASS_FILEPOS_DOWNLOAD   = 1,
          BASS_FILEPOS_END        = 2,
          BASS_FILEPOS_START      = 3,
          BASS_FILEPOS_CONNECTED  = 4,
          BASS_FILEPOS_BUFFER     = 5;

  // BASS_ChannelSetSync types
const int BASS_SYNC_POS           = 0,
          BASS_SYNC_END           = 2,
          BASS_SYNC_META          = 4,
          BASS_SYNC_SLIDE         = 5,
          BASS_SYNC_STALL         = 6,
          BASS_SYNC_DOWNLOAD      = 7,
          BASS_SYNC_FREE          = 8,
          BASS_SYNC_SETPOS        = 11,
          BASS_SYNC_MUSICPOS      = 10,
          BASS_SYNC_MUSICINST     = 1,
          BASS_SYNC_MUSICFX       = 3,
          BASS_SYNC_OGG_CHANGE    = 12,
          BASS_SYNC_MIXTIME       = 0x40000000, // FLAG: sync at mixtime, else at playtime
          BASS_SYNC_ONETIME       = 0x80000000; // FLAG: sync only once, else continuously

  // BASS_ChannelIsActive return values
const int BASS_ACTIVE_STOPPED = 0,
          BASS_ACTIVE_PLAYING = 1,
          BASS_ACTIVE_STALLED = 2,
          BASS_ACTIVE_PAUSED  = 3;

  // Channel attributes
const int BASS_ATTRIB_FREQ                  = 1,
          BASS_ATTRIB_VOL                   = 2,
          BASS_ATTRIB_PAN                   = 3,
          BASS_ATTRIB_EAXMIX                = 4,
          BASS_ATTRIB_MUSIC_AMPLIFY         = 0x100,
          BASS_ATTRIB_MUSIC_PANSEP          = 0x101,
          BASS_ATTRIB_MUSIC_PSCALER         = 0x102,
          BASS_ATTRIB_MUSIC_BPM             = 0x103,
          BASS_ATTRIB_MUSIC_SPEED           = 0x104,
          BASS_ATTRIB_MUSIC_VOL_GLOBAL      = 0x105,
          BASS_ATTRIB_MUSIC_VOL_CHAN        = 0x200, // + channel #
          BASS_ATTRIB_MUSIC_VOL_INST        = 0x300; // + instrument #

  // BASS_ChannelGetData flags
const int BASS_DATA_AVAILABLE = 0,          // query how much data is buffered
          BASS_DATA_FLOAT     = 0x40000000, // flag: return floating-point sample data
          BASS_DATA_FFT256    = 0x80000000, // 256 sample FFT
          BASS_DATA_FFT512    = 0x80000001, // 512 FFT
          BASS_DATA_FFT1024   = 0x80000002, // 1024 FFT
          BASS_DATA_FFT2048   = 0x80000003, // 2048 FFT
          BASS_DATA_FFT4096   = 0x80000004, // 4096 FFT
          BASS_DATA_FFT8192   = 0x80000005, // 8192 FFT
          BASS_DATA_FFT_INDIVIDUAL = 0x10,  // FFT flag: FFT for each channel, else all combined
          BASS_DATA_FFT_NOWINDOW = 0x20;    // FFT flag: no Hanning window

  // BASS_ChannelGetTags types : what's returned
const int BASS_TAG_ID3        = 0,          // ID3v1 tags : TAG_ID3 structure
          BASS_TAG_ID3V2      = 1,          // ID3v2 tags : variable length block
          BASS_TAG_OGG        = 2,          // OGG comments : series of null-terminated UTF-8 strings
          BASS_TAG_HTTP       = 3,          // HTTP headers : series of null-terminated ANSI strings
          BASS_TAG_ICY        = 4,          // ICY headers : series of null-terminated ANSI strings
          BASS_TAG_META       = 5,          // ICY metadata : ANSI string
          BASS_TAG_VENDOR     = 9,          // OGG encoder : UTF-8 string
          BASS_TAG_LYRICS3    = 10,         // Lyric3v2 tag : ASCII string
          BASS_TAG_RIFF_INFO  = 0x100,      // RIFF "INFO" tags : series of null-terminated ANSI strings
          BASS_TAG_RIFF_BEXT  = 0x101,      // RIFF/BWF "bext" tags : TAG_BEXT structure
          BASS_TAG_RIFF_CART  = 0x102,      // RIFF/BWF "cart" tags : TAG_CART structure
          BASS_TAG_MUSIC_NAME = 0x10000,	// MOD music name : ANSI string
          BASS_TAG_MUSIC_MESSAGE = 0x10001, // MOD message : ANSI string
          BASS_TAG_MUSIC_ORDERS = 0x10002,  // MOD order list : BYTE array of pattern numbers
          BASS_TAG_MUSIC_INST = 0x10100,	// + instrument #, MOD instrument name : ANSI string
          BASS_TAG_MUSIC_SAMPLE = 0x10300;  // + sample #, MOD sample name : ANSI string

  // BASS_ChannelGetLength/GetPosition/SetPosition modes
const int BASS_POS_BYTE           = 0, // byte position
          BASS_POS_MUSIC_ORDER    = 1; // order.row position, MAKELONG(order,row)

  // BASS_RecordSetInput flags
const int BASS_INPUT_OFF    = 0x10000,
          BASS_INPUT_ON     = 0x20000;

const int BASS_INPUT_TYPE_MASK    = 0xFF000000,
          BASS_INPUT_TYPE_UNDEF   = 0x00000000,
          BASS_INPUT_TYPE_DIGITAL = 0x01000000,
          BASS_INPUT_TYPE_LINE    = 0x02000000,
          BASS_INPUT_TYPE_MIC     = 0x03000000,
          BASS_INPUT_TYPE_SYNTH   = 0x04000000,
          BASS_INPUT_TYPE_CD      = 0x05000000,
          BASS_INPUT_TYPE_PHONE   = 0x06000000,
          BASS_INPUT_TYPE_SPEAKER = 0x07000000,
          BASS_INPUT_TYPE_WAVE    = 0x08000000,
          BASS_INPUT_TYPE_AUX     = 0x09000000,
          BASS_INPUT_TYPE_ANALOG  = 0x0A000000;

const int BASS_FX_DX8_CHORUS	  = 0,
          BASS_FX_DX8_COMPRESSOR  = 1,
          BASS_FX_DX8_DISTORTION  = 2,
          BASS_FX_DX8_ECHO        = 3,
          BASS_FX_DX8_FLANGER     = 4,
          BASS_FX_DX8_GARGLE      = 5,
          BASS_FX_DX8_I3DL2REVERB = 6,
          BASS_FX_DX8_PARAMEQ     = 7,
          BASS_FX_DX8_REVERB      = 8;

const int BASS_DX8_PHASE_NEG_180 = 0,
          BASS_DX8_PHASE_NEG_90  = 1,
          BASS_DX8_PHASE_ZERO    = 2,
          BASS_DX8_PHASE_90      = 3,
          BASS_DX8_PHASE_180     = 4;
          
alias int BOOL;


alias int HMUSIC;   // MOD music handle
alias int HSAMPLE;  // sample handle
alias int HCHANNEL; // playing sample's channel handle
alias int HSTREAM;  // sample stream handle
alias int HRECORD;  // recording handle
alias int HSYNC;    // synchronizer handle
alias int HDSP;     // DSP handle
alias int HFX;      // DX8 effect handle
alias int HPLUGIN;  // Plugin handle

  // Device info structure
struct BASS_DEVICEINFO
{
	char* name;
	char* driver;
	int flags;
}
 

struct BASS_INFO 
{
	int flags;      // device capabilities (DSCAPS_xxx flags)
	int hwsize;     // size of total device hardware memory
	int hwfree;     // size of free device hardware memory
	int freesam;    // number of free sample slots in the hardware
	int free3d;     // number of free 3D sample slots in the hardware
	int minrate;    // min sample rate supported by the hardware
	int maxrate;    // max sample rate supported by the hardware
	BOOL eax;       // device supports EAX? (always FALSE if BASS_DEVICE_3D was not used)
	int minbuf;     // recommended minimum buffer length in ms (requires BASS_DEVICE_LATENCY)
	int dsver;      // DirectSound version
	int latency;    // delay (in ms) before start of playback (requires BASS_DEVICE_LATENCY)
	int initflags;  // BASS_Init "flags" parameter
	int speakers;   // number of speakers available
	int freq;       // current output rate (OSX only)
}
 

// Recording device info structure
struct BASS_RECORDINFO 
{
	int flags;      // device capabilities (DSCCAPS_xxx flags)
	int formats;    // supported standard formats (WAVE_FORMAT_xxx flags)
	int inputs;     // number of inputs
	BOOL singlein;  // only 1 input can be set at a time
	int freq;       // current input rate (OSX only)
}

// Sample info structure
struct BASS_SAMPLE 
{
	int freq;       // default playback rate
	float volume;   // default volume (0-100)
	float pan;      // default pan (-100=left, 0=middle, 100=right)
	int flags;      // BASS_SAMPLE_xxx flags
	int length;     // length (in samples, not bytes)
	int max;        // maximum simultaneous playbacks
	int origres;    // original resolution
	int chans;      // number of channels
	int mingap;     // minimum gap (ms) between creating channels
	int mode3d;     // BASS_3DMODE_xxx mode
	float mindist;  // minimum distance
	float maxdist;  // maximum distance
	int iangle;     // angle of inside projection cone
	int oangle;     // angle of outside projection cone
	float outvol;   // delta-volume outside the projection cone
	int vam;        // voice allocation/management flags (BASS_VAM_xxx)
	int priority;   // priority (0=lowest, $ffffffff=highest)
}

// Channel info structure
struct BASS_CHANNELINFO 
{
	int freq;       // default playback rate
	int chans;      // channels
	int flags;      // BASS_SAMPLE/STREAM/MUSIC/SPEAKER flags
	int ctype;      // type of channel
	int origres;    // original resolution
	HPLUGIN plugin; // plugin
	HSAMPLE sample; // sample
	char* filename; // filename
}

struct BASS_PLUGINFORM 
{
	int ctype;      // channel type
	char* name;     // format description
	char* exts;     // file extension filter (*.ext1;*.ext2;etc...)
}

struct BASS_PLUGININFO 
{
	// renamed to _version because version is a D keyword
	
	int _version;   // version (same form as BASS_GetVersion)
	int formatc;    // number of formats
	BASS_PLUGINFORM* formats; // the array of formats
}

// 3D vector (for 3D positions/velocities/orientations)
struct BASS_3DVECTOR 
{
	float x; // +=right, -=left	
	float y; // +=up, -=down
	float z; // +=front, -=behind
}

// User file stream callback functions
alias extern(C) void function(void* user) FILECLOSEPROC;
alias extern(C) long function(void* user) FILELENPROC;
alias extern(C) long function(void* buffer, int length, void* use) FILEREADPROC;
alias extern(C) BOOL function(long offset, void* user) FILESEEKPROC;


struct BASS_FILEPROCS 
{
	FILECLOSEPROC close;
	FILELENPROC length;
	FILEREADPROC read;
	FILESEEKPROC seek;
}

// ID3v1 tag structure
struct TAG_ID3 
{
	char[4] id;
	char[30] title;
	char[30] artist;
	char[30] album;
	char[4] year;
	char[30] comment;
	byte genre;
}

// BWF "bext" tag structure
align(1) struct TAG_BEXT 
{
	char[256] Description;
	char[32] Originator;
	char[32] OriginatorReference;
	char[10] OriginationDate;
	char[8] OriginationTime;
	long TimeReference;
	short Version;
	byte[64] UMID;
	byte[190] reserved;
	char CodingHistory; // ??? how to translate char[] ?
}

struct BASS_DX8_CHORUS 
{
	float fWetDryMix;
	float fDepth;
	float fFeedback;
	float fFrequency;
	int lWaveform;   // 0=triangle, 1=sine
	float fDelay;
	int lPhase;      // BASS_DX8_PHASE_xxx
}

struct BASS_DX8_COMPRESSOR 
{
	float fGain;
	float fAttack;
	float fRelease;
	float fThreshold;
	float fRatio;
	float fPredelay;
}

struct BASS_DX8_DISTORTION 
{
	float fGain;
	float fEdge;
	float fPostEQCenterFrequency;
	float fPostEQBandwidth;
	float fPreLowpassCutoff;
}

struct BASS_DX8_ECHO 
{
	float fWetDryMix;
	float fFeedback;
	float fLeftDelay;
	float fRightDelay;
	BOOL lPanDelay;
}

struct BASS_DX8_FLANGER 
{
	float fWetDryMix;
	float fDepth;
	float fFeedback;
	float fFrequency;
	int lWaveform;   // 0=triangle, 1=sine
	float fDelay;
	int lPhase;      // BASS_DX8_PHASE_xxx
}

struct BASS_DX8_GARGLE 
{
	int dwRateHz;               // Rate of modulation in hz
	int dwWaveShape;            // 0=triangle, 1=square
}

struct BASS_DX8_I3DL2REVERB 
{
	int lRoom;                // [-10000, 0]      default: -1000 mB
	int lRoomHF;              // [-10000, 0]      default: 0 mB
	float flRoomRolloffFactor;    // [0.0, 10.0]      default: 0.0
	float flDecayTime;            // [0.1, 20.0]      default: 1.49s
	float flDecayHFRatio;         // [0.1, 2.0]       default: 0.83
	float lReflections;         // [-10000, 1000]   default: -2602 mB
	float flReflectionsDelay;     // [0.0, 0.3]       default: 0.007 s
	int lReverb;              // [-10000, 2000]   default: 200 mB
	float flReverbDelay;          // [0.0, 0.1]       default: 0.011 s
	float flDiffusion;            // [0.0, 100.0]     default: 100.0 %
	float flDensity;              // [0.0, 100.0]     default: 100.0 %
	float flHFReference;          // [20.0, 20000.0]  default: 5000.0 Hz
}

struct BASS_DX8_PARAMEQ 
{
	float fCenter;
	float fBandwidth;
	float fGain;
}

struct BASS_DX8_REVERB 
{
	float fInGain;                // [-96.0,0.0]            default: 0.0 dB
	float fReverbMix;             // [-96.0,0.0]            default: 0.0 db
	float fReverbTime;            // [0.001,3000.0]         default: 1000.0 ms
	float fHighFreqRTRatio;       // [0.001,0.999]          default: 0.001
}



// callback function types



/*
  User stream callback function. NOTE: A stream function should obviously be as
  quick as possible, other streams (and MOD musics) can't be mixed until
  it's finished.
  handle : The stream that needs writing
  buffer : Buffer to write the samples in
  length : Number of bytes to write
  user   : The 'user' parameter value given when calling BASS_StreamCreate
  RETURN : Number of bytes written. Set the BASS_STREAMPROC_END flag to end
           the stream.
*/   
alias extern(C) int function(HSTREAM handle, void* buffer, int length, void* user) STREAMPROC;     				

const STREAMPROC STREAMPROC_DUMMY = cast(STREAMPROC)(null);  // "dummy" stream
      STREAMPROC STREAMPROC_PUSH = cast(STREAMPROC)(-1); // push stream


/*
	Internet stream download callback function.
	buffer : Buffer containing the downloaded data... NULL=end of download
	length : Number of bytes in the buffer
	user   : The 'user' parameter value given when calling BASS_StreamCreateURL
*/      
alias extern(C) void function (void* buffer, int length, void* user) DOWNLOADPROC;


/*
	Sync callback function. NOTE: a sync callback function should be very
	quick as other syncs cannot be processed until it has finished. If the
	sync is a "mixtime" sync, then other streams and MOD musics can not be
	mixed until it's finished either.
	handle : The sync that has occured
	channel: Channel that the sync occured in
	data   : Additional data associated with the sync's occurance
	user   : The 'user' parameter given when calling BASS_ChannelSetSync
*/
alias extern(C) void function (HSYNC handle, int channel, int data, void* user) SYNCPROC;


/*
	DSP callback function. NOTE: A DSP function should obviously be as quick
	as possible... other DSP functions, streams and MOD musics can not be
	processed until it's finished.
	handle : The DSP handle
	channel: Channel that the DSP is being applied to
	buffer : Buffer to apply the DSP to
	length : Number of bytes in the buffer
	user   : The 'user' parameter given when calling BASS_ChannelSetDSP
*/
alias extern(C) void function (HDSP handle, int channel, void* buffer, int length, void* user) DSPPROC;


/*
	Recording callback function.
	handle : The recording handle
	buffer : Buffer containing the recorded sample data
	length : Number of bytes
	user   : The 'user' parameter value given when calling BASS_RecordStart
	RETURN : TRUE = continue recording, FALSE = stop
*/
alias extern(C) BOOL function(HRECORD handle, void* buffer, int length, void* user) RECORDPROC;



// from windows.h

align(1) struct GUID
{
	int data1;
	short data2;
	short data3;	
	byte[8] data4;
}

alias void* HWND;