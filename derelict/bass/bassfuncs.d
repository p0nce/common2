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
module derelict.bass.bassfuncs;


import derelict.util.loader;
import derelict.bass.basstypes;

package void loadBASS(SharedLib lib)
{
	bindFunc(BASS_SetConfig)("BASS_SetConfig", lib);
	bindFunc(BASS_GetConfig)("BASS_GetConfig", lib);
	bindFunc(BASS_SetConfigPtr)("BASS_SetConfigPtr", lib);
	bindFunc(BASS_GetConfigPtr)("BASS_GetConfigPtr", lib);
	bindFunc(BASS_GetVersion)("BASS_GetVersion", lib);
	bindFunc(BASS_ErrorGetCode)("BASS_ErrorGetCode", lib);
	bindFunc(BASS_GetVersion)("BASS_GetVersion", lib);
	bindFunc(BASS_GetDeviceInfo)("BASS_GetDeviceInfo", lib);
	bindFunc(BASS_Init)("BASS_Init", lib);
	bindFunc(BASS_SetDevice)("BASS_SetDevice", lib);
	bindFunc(BASS_GetDevice)("BASS_GetDevice", lib);
	bindFunc(BASS_Free)("BASS_Free", lib);
	bindFunc(BASS_GetDSoundObject)("BASS_GetDSoundObject", lib);
	bindFunc(BASS_GetInfo)("BASS_GetInfo", lib);
	bindFunc(BASS_Update)("BASS_Update", lib);
	bindFunc(BASS_GetCPU)("BASS_GetCPU", lib);
	bindFunc(BASS_Start)("BASS_Start", lib);
	bindFunc(BASS_Stop)("BASS_Stop", lib);
	bindFunc(BASS_Pause)("BASS_Pause", lib);
	
	bindFunc(BASS_SetVolume)("BASS_SetVolume", lib);
	bindFunc(BASS_GetVolume)("BASS_GetVolume", lib);
	
	bindFunc(BASS_PluginLoad)("BASS_PluginLoad", lib);
	bindFunc(BASS_PluginFree)("BASS_PluginFree", lib);
	bindFunc(BASS_PluginGetInfo)("BASS_PluginGetInfo", lib);
	bindFunc(BASS_Set3DFactors)("BASS_Set3DFactors", lib);
	bindFunc(BASS_Get3DFactors)("BASS_Get3DFactors", lib);
	bindFunc(BASS_Set3DPosition)("BASS_Set3DPosition", lib);
	bindFunc(BASS_Get3DPosition)("BASS_Get3DPosition", lib);
	bindFunc(BASS_Apply3D)("BASS_Apply3D", lib);
	bindFunc(BASS_SetEAXParameters)("BASS_SetEAXParameters", lib);
	bindFunc(BASS_GetEAXParameters)("BASS_GetEAXParameters", lib);
	
	bindFunc(BASS_MusicLoad)("BASS_MusicLoad", lib);
	bindFunc(BASS_MusicFree)("BASS_MusicFree", lib);	
	
	bindFunc(BASS_SampleLoad)("BASS_SampleLoad", lib);
	bindFunc(BASS_SampleCreate)("BASS_SampleCreate", lib);
	bindFunc(BASS_SampleFree)("BASS_SampleFree", lib);
	bindFunc(BASS_SampleSetData)("BASS_SampleSetData", lib);
	bindFunc(BASS_SampleGetData)("BASS_SampleGetData", lib);
	bindFunc(BASS_SampleGetInfo)("BASS_SampleGetInfo", lib);
	bindFunc(BASS_SampleSetInfo)("BASS_SampleSetInfo", lib);
	bindFunc(BASS_SampleGetChannel)("BASS_SampleGetChannel", lib);
	bindFunc(BASS_SampleGetChannels)("BASS_SampleGetChannels", lib);
	bindFunc(BASS_SampleStop)("BASS_SampleStop", lib);
	
	bindFunc(BASS_StreamCreate)("BASS_StreamCreate", lib);	
	bindFunc(BASS_StreamCreateFile)("BASS_StreamCreateFile", lib);
	bindFunc(BASS_StreamCreateURL)("BASS_StreamCreateURL", lib);
	bindFunc(BASS_StreamCreateFileUser)("BASS_StreamCreateFileUser", lib);
	bindFunc(BASS_StreamFree)("BASS_StreamFree", lib);
	
	bindFunc(BASS_StreamGetFilePosition)("BASS_StreamGetFilePosition", lib);
	bindFunc(BASS_StreamPutData)("BASS_StreamPutData", lib);
	bindFunc(BASS_StreamPutFileData)("BASS_StreamPutFileData", lib);
	bindFunc(BASS_RecordGetDeviceInfo)("BASS_RecordGetDeviceInfo", lib);
	bindFunc(BASS_RecordInit)("BASS_RecordInit", lib);
	bindFunc(BASS_RecordSetDevice)("BASS_RecordSetDevice", lib);
	bindFunc(BASS_RecordGetDevice)("BASS_RecordGetDevice", lib);
	bindFunc(BASS_RecordFree)("BASS_RecordFree", lib);
	bindFunc(BASS_RecordGetInfo)("BASS_RecordGetInfo", lib);
	bindFunc(BASS_RecordGetInputName)("BASS_RecordGetInputName", lib);	
	
	bindFunc(BASS_RecordSetInput)("BASS_RecordSetInput", lib);
	bindFunc(BASS_RecordGetInput)("BASS_RecordGetInput", lib);	
	bindFunc(BASS_RecordStart)("BASS_RecordStart", lib);	
	bindFunc(BASS_ChannelBytes2Seconds)("BASS_ChannelBytes2Seconds", lib);	
	bindFunc(BASS_ChannelSeconds2Bytes)("BASS_ChannelSeconds2Bytes", lib);		
	bindFunc(BASS_ChannelGetDevice)("BASS_ChannelGetDevice", lib);	
	bindFunc(BASS_ChannelSetDevice)("BASS_ChannelSetDevice", lib);	
	
	
	bindFunc(BASS_ChannelIsActive)("BASS_ChannelIsActive", lib);
	bindFunc(BASS_ChannelGetInfo)("BASS_ChannelGetInfo", lib);
	bindFunc(BASS_ChannelGetTags)("BASS_ChannelGetTags", lib);
	bindFunc(BASS_ChannelFlags)("BASS_ChannelFlags", lib);
	bindFunc(BASS_ChannelUpdate)("BASS_ChannelUpdate", lib);
	bindFunc(BASS_ChannelLock)("BASS_ChannelLock", lib);

	bindFunc(BASS_ChannelPlay)("BASS_ChannelPlay", lib);
	bindFunc(BASS_ChannelStop)("BASS_ChannelStop", lib);
	bindFunc(BASS_ChannelPause)("BASS_ChannelPause", lib);
	
	bindFunc(BASS_ChannelSetAttribute)("BASS_ChannelSetAttribute", lib);
	bindFunc(BASS_ChannelGetAttribute)("BASS_ChannelGetAttribute", lib);
	bindFunc(BASS_ChannelSlideAttribute)("BASS_ChannelSlideAttribute", lib);
	bindFunc(BASS_ChannelIsSliding)("BASS_ChannelIsSliding", lib);
	
	bindFunc(BASS_ChannelSet3DAttributes)("BASS_ChannelSet3DAttributes", lib);
	bindFunc(BASS_ChannelGet3DAttributes)("BASS_ChannelGet3DAttributes", lib);
	bindFunc(BASS_ChannelSet3DPosition)("BASS_ChannelSet3DPosition", lib);
	bindFunc(BASS_ChannelGet3DPosition)("BASS_ChannelGet3DPosition", lib);
	bindFunc(BASS_ChannelGetLength)("BASS_ChannelGetLength", lib);
	bindFunc(BASS_ChannelSetPosition)("BASS_ChannelSetPosition", lib);
	bindFunc(BASS_ChannelGetPosition)("BASS_ChannelGetPosition", lib);
	bindFunc(BASS_ChannelGetLevel)("BASS_ChannelGetLevel", lib);
	bindFunc(BASS_ChannelGetData)("BASS_ChannelGetData", lib);
	bindFunc(BASS_ChannelSetSync)("BASS_ChannelSetSync", lib);
	bindFunc(BASS_ChannelRemoveSync)("BASS_ChannelRemoveSync", lib);
	bindFunc(BASS_ChannelSetDSP)("BASS_ChannelSetDSP", lib);
	
	bindFunc(BASS_ChannelRemoveDSP)("BASS_ChannelRemoveDSP", lib);
	bindFunc(BASS_ChannelSetLink)("BASS_ChannelSetLink", lib);
	bindFunc(BASS_ChannelRemoveLink)("BASS_ChannelRemoveLink", lib);
	bindFunc(BASS_ChannelSetFX)("BASS_ChannelSetFX", lib);
	bindFunc(BASS_ChannelRemoveFX)("BASS_ChannelRemoveFX", lib);
	
	bindFunc(BASS_FXSetParameters)("BASS_FXSetParameters", lib);
	bindFunc(BASS_FXGetParameters)("BASS_FXGetParameters", lib);
	bindFunc(BASS_FXReset)("BASS_FXReset", lib);
}



extern(Windows)
{
	

// Functions

BOOL function(int option, int value) BASS_SetConfig;
int function(int option) BASS_GetConfig;
BOOL function(int option, void* value) BASS_SetConfigPtr;
void* function(int option) BASS_GetConfigPtr;
int function() BASS_GetVersion; 
int function() BASS_ErrorGetCode; 
BOOL function(int device, BASS_DEVICEINFO* info) BASS_GetDeviceInfo;
BOOL function(int device, int freq, int flags, HWND win, GUID* clsid) BASS_Init;
BOOL function(int device) BASS_SetDevice;
int function() BASS_GetDevice;
BOOL function() BASS_Free;
void* function(int obj) BASS_GetDSoundObject;
BOOL function(BASS_INFO* info) BASS_GetInfo;
BOOL function(int length) BASS_Update;
float function() BASS_GetCPU;
BOOL function() BASS_Start;
BOOL function() BASS_Stop;
BOOL function() BASS_Pause;
BOOL function(float volume) BASS_SetVolume;
float function() BASS_GetVolume;

HPLUGIN function(char* filename, int flags) BASS_PluginLoad; 
BOOL function(HPLUGIN handle) BASS_PluginFree; 
BASS_PLUGININFO* function(HPLUGIN handle) BASS_PluginGetInfo; 
BOOL function(float distf, float rollf, float doppf) BASS_Set3DFactors; 
BOOL function(float* distf, float* rollf, float* doppf) BASS_Get3DFactors; 
BOOL function(BASS_3DVECTOR* pos, BASS_3DVECTOR* vel, BASS_3DVECTOR* front, BASS_3DVECTOR* top) BASS_Set3DPosition; 
BOOL function(BASS_3DVECTOR* pos, BASS_3DVECTOR* vel, BASS_3DVECTOR* front, BASS_3DVECTOR* top) BASS_Get3DPosition; 
void function() BASS_Apply3D; 
BOOL function(int env, float vol, float decay, float damp) BASS_SetEAXParameters; 
BOOL function(int* env, float* vol, float* decay, float* damp) BASS_GetEAXParameters; 

HMUSIC function(BOOL mem, void* f, long offset, int length, int flags, int freq) BASS_MusicLoad; 
BOOL function(HMUSIC handle) BASS_MusicFree;

HSAMPLE function(BOOL mem, void* f, long offset, int length, int max, int flags) BASS_SampleLoad; 
HSAMPLE function(int length, int freq, int chans, int max, int flags) BASS_SampleCreate; 
BOOL function(HSAMPLE handle) BASS_SampleFree; 
BOOL function(HSAMPLE handle, void* buffer) BASS_SampleSetData; 
BOOL function(HSAMPLE handle, void* buffer) BASS_SampleGetData; 
BOOL function(HSAMPLE handle, BASS_SAMPLE* info) BASS_SampleGetInfo; 
BOOL function(HSAMPLE handle, BASS_SAMPLE* info) BASS_SampleSetInfo; 
HCHANNEL function(HSAMPLE handle, BOOL onlynew) BASS_SampleGetChannel; 
int function(HSAMPLE handle, HCHANNEL* channels) BASS_SampleGetChannels; 
BOOL function(HSAMPLE handle) BASS_SampleStop; 

HSTREAM function(int freq, int chans, int flags, STREAMPROC proc, void* user) BASS_StreamCreate;
HSTREAM function(BOOL mem, void* f, long offset, long length, int flags) BASS_StreamCreateFile;
HSTREAM function(char* url, int offset, int flags, DOWNLOADPROC proc, void* user) BASS_StreamCreateURL; 
HSTREAM function(int system, int flags, BASS_FILEPROCS* procs, void* user) BASS_StreamCreateFileUser; 
BOOL function(HSTREAM handle) BASS_StreamFree;

long function(HSTREAM handle, int mode) BASS_StreamGetFilePosition; 
int function(HSTREAM handle, void* buffer, int length) BASS_StreamPutData; 
int function(HSTREAM handle, void* buffer, int length) BASS_StreamPutFileData; 

BOOL function(int device, BASS_DEVICEINFO* info) BASS_RecordGetDeviceInfo; 
BOOL function(int device) BASS_RecordInit; 
BOOL function(int device) BASS_RecordSetDevice; 
int function() BASS_RecordGetDevice; 
BOOL function() BASS_RecordFree; 
BOOL function(BASS_RECORDINFO* info) BASS_RecordGetInfo; 
char* function(int input) BASS_RecordGetInputName;
BOOL function(int input, int flags, float volume) BASS_RecordSetInput;
int function(int input, float* volume) BASS_RecordGetInput; 
HRECORD function(int freq, int chans, int flags, RECORDPROC proc, void* user) BASS_RecordStart;
double function(int handle, long pos) BASS_ChannelBytes2Seconds;
long function(int handle, double pos) BASS_ChannelSeconds2Bytes;
int function(int handle) BASS_ChannelGetDevice;
BOOL function(int handle, int device) BASS_ChannelSetDevice;

int function(int handle) BASS_ChannelIsActive;


BOOL function(int handle, BASS_CHANNELINFO* info) BASS_ChannelGetInfo;
char* function(HSTREAM handle, int tags) BASS_ChannelGetTags;
int function(int handle, int flags, int mask) BASS_ChannelFlags; 
BOOL function(int handle, int length) BASS_ChannelUpdate; 
BOOL function(int handle, BOOL lock) BASS_ChannelLock;
BOOL function(int handle, BOOL restart) BASS_ChannelPlay;
BOOL function(int handle) BASS_ChannelStop;
BOOL function(int handle) BASS_ChannelPause;

BOOL function(int handle, int attrib, float value) BASS_ChannelSetAttribute; 
BOOL function(int handle, int attrib, float* value) BASS_ChannelGetAttribute; 
BOOL function(int handle, int attrib, float value, int time) BASS_ChannelSlideAttribute; 
BOOL function(int handle, int attrib) BASS_ChannelIsSliding;

BOOL function(int handle, int mode, float min, float max, int iangle, int oangle, int outvol) BASS_ChannelSet3DAttributes; 
BOOL function(int handle, int* mode, float* min, float* max, int* iangle, int* oangle, int* outvol) BASS_ChannelGet3DAttributes; 
BOOL function(int handle, BASS_3DVECTOR* pos, BASS_3DVECTOR* orient, BASS_3DVECTOR* vel) BASS_ChannelSet3DPosition; 
BOOL function(int handle, BASS_3DVECTOR* pos, BASS_3DVECTOR* orient, BASS_3DVECTOR* vel) BASS_ChannelGet3DPosition; 
long function(int handle, int mode) BASS_ChannelGetLength; 
BOOL function(int handle, long pos, int mode) BASS_ChannelSetPosition; 
long function(int handle, int mode) BASS_ChannelGetPosition; 
int function(int handle) BASS_ChannelGetLevel; 
int function(int handle, void* buffer, int length) BASS_ChannelGetData;
HSYNC function(int handle, int type, long param, SYNCPROC proc, void* user) BASS_ChannelSetSync; 
BOOL function(int handle, HSYNC sync) BASS_ChannelRemoveSync; 
HDSP function(int handle, DSPPROC proc, void* user, int priority) BASS_ChannelSetDSP;
BOOL function(int handle, HDSP dsp) BASS_ChannelRemoveDSP; 
BOOL function(int handle, int chan) BASS_ChannelSetLink; 
BOOL function(int handle, int chan) BASS_ChannelRemoveLink; 
HFX function(int handle, int type, int priority) BASS_ChannelSetFX;
BOOL function(int handle, HFX fx) BASS_ChannelRemoveFX;

BOOL function(HFX handle, void* par) BASS_FXSetParameters;
BOOL function(HFX handle, void* par) BASS_FXGetParameters;
BOOL function(HFX handle) BASS_FXReset;

}

int BASS_SPEAKER_N(int n)
{
	return n << 24;	
}

/*
  This function is defined in the implementation part of this unit.
  It is not part of BASS.DLL but an extra function which makes it easier
  to set the predefined EAX environments.
  env    : a EAX_ENVIRONMENT_xxx constant
*/

BOOL BASS_SetEAXPreset(int env)
{
	switch (env)
	{
		case EAX_ENVIRONMENT_GENERIC:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_GENERIC, 0.5, 1.493, 0.5);
    	case EAX_ENVIRONMENT_PADDEDCELL:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_PADDEDCELL, 0.25, 0.1, 0);
    	case EAX_ENVIRONMENT_ROOM:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_ROOM, 0.417, 0.4, 0.666);
    	case EAX_ENVIRONMENT_BATHROOM:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_BATHROOM, 0.653, 1.499, 0.166);
    	case EAX_ENVIRONMENT_LIVINGROOM:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_LIVINGROOM, 0.208, 0.478, 0);
    	case EAX_ENVIRONMENT_STONEROOM:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_STONEROOM, 0.5, 2.309, 0.888);
    	case EAX_ENVIRONMENT_AUDITORIUM:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_AUDITORIUM, 0.403, 4.279, 0.5);
    	case EAX_ENVIRONMENT_CONCERTHALL:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_CONCERTHALL, 0.5, 3.961, 0.5);
    	case EAX_ENVIRONMENT_CAVE:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_CAVE, 0.5, 2.886, 1.304);
    	case EAX_ENVIRONMENT_ARENA:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_ARENA, 0.361, 7.284, 0.332);
    	case EAX_ENVIRONMENT_HANGAR:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_HANGAR, 0.5, 10.0, 0.3);
    	case EAX_ENVIRONMENT_CARPETEDHALLWAY:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_CARPETEDHALLWAY, 0.153, 0.259, 2.0);
    	case EAX_ENVIRONMENT_HALLWAY:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_HALLWAY, 0.361, 1.493, 0);
    	case EAX_ENVIRONMENT_STONECORRIDOR:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_STONECORRIDOR, 0.444, 2.697, 0.638);
    	case EAX_ENVIRONMENT_ALLEY:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_ALLEY, 0.25, 1.752, 0.776);
    	case EAX_ENVIRONMENT_FOREST:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_FOREST, 0.111, 3.145, 0.472);
    	case EAX_ENVIRONMENT_CITY:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_CITY, 0.111, 2.767, 0.224);
    	case EAX_ENVIRONMENT_MOUNTAINS:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_MOUNTAINS, 0.194, 7.841, 0.472);
    	case EAX_ENVIRONMENT_QUARRY:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_QUARRY, 1, 1.499, 0.5);
    	case EAX_ENVIRONMENT_PLAIN:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_PLAIN, 0.097, 2.767, 0.224);
    	case EAX_ENVIRONMENT_PARKINGLOT:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_PARKINGLOT, 0.208, 1.652, 1.5);
    	case EAX_ENVIRONMENT_SEWERPIPE:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_SEWERPIPE, 0.652, 2.886, 0.25);
    	case EAX_ENVIRONMENT_UNDERWATER:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_UNDERWATER, 1, 1.499, 0);
    	case EAX_ENVIRONMENT_DRUGGED:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_DRUGGED, 0.875, 8.392, 1.388);
    	case EAX_ENVIRONMENT_DIZZY:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_DIZZY, 0.139, 17.234, 0.666);
    	case EAX_ENVIRONMENT_PSYCHOTIC:
			return BASS_SetEAXParameters(EAX_ENVIRONMENT_PSYCHOTIC, 0.486, 7.563, 0.806);
    	default:
			return 0;
	}
}



GenericLoader DerelictBASS;

static this() {
    DerelictBASS.setup(
        "bass.dll",
        "", // bass not portable
        "", // ???
        &loadBASS
    );
}




