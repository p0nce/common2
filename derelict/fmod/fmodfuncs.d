module derelict.fmod.fmodfuncs;

/* ========================================================================================== */
/* FUNCTION PROTOTYPES                                                                        */
/* ========================================================================================== */

private {
    import derelict.fmod.fmodtypes;
    import derelict.fmod.fmodcodec;
    import derelict.fmod.fmoddsp;

    import derelict.util.loader;
}
/*
version(Windows) {
    extern(Windows):
} else {
    extern(C):
}
*/
extern(C):

/*
    FMOD global system functions (optional).
*/

typedef FMOD_RESULT function(void *poolmem, int poollen, FMOD_MEMORY_ALLOCCALLBACK useralloc, FMOD_MEMORY_REALLOCCALLBACK userrealloc, FMOD_MEMORY_FREECALLBACK userfree) pfFMOD_Memory_Initialize;
typedef FMOD_RESULT function(int *currentalloced, int *maxalloced) pfFMOD_Memory_GetStats;
typedef FMOD_RESULT function(FMOD_DEBUGLEVEL level) pfFMOD_Debug_SetLevel;
typedef FMOD_RESULT function(FMOD_DEBUGLEVEL *level) pfFMOD_Debug_GetLevel;
typedef FMOD_RESULT function(int busy) pfFMOD_File_SetDiskBusy;
typedef FMOD_RESULT function(int *busy) pfFMOD_File_GetDiskBusy;

pfFMOD_Memory_Initialize FMOD_Memory_Initialize;
pfFMOD_Memory_GetStats FMOD_Memory_GetStats;
pfFMOD_Debug_SetLevel FMOD_Debug_SetLevel;
pfFMOD_Debug_GetLevel FMOD_Debug_GetLevel;
pfFMOD_File_SetDiskBusy FMOD_File_SetDiskBusy;
pfFMOD_File_GetDiskBusy FMOD_File_GetDiskBusy;

/*
    FMOD System factory functions.  Use this to create an FMOD System Instance.  below you will see FMOD_System_Init/Close to get started.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM **system) pfFMOD_System_Create;
typedef FMOD_RESULT function(FMOD_SYSTEM *system) pfFMOD_System_Release;

pfFMOD_System_Create FMOD_System_Create;
pfFMOD_System_Release FMOD_System_Release;


/*
    'System' API
*/

/*
     Pre-init functions.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_OUTPUTTYPE output) pfFMOD_System_SetOutput;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_OUTPUTTYPE *output) pfFMOD_System_GetOutput;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *numdrivers) pfFMOD_System_GetNumDrivers;

typedef FMOD_RESULT function(FMOD_SYSTEM *system, int id, char *  name, int namelen, FMOD_GUID * guid ) pfFMOD_System_GetDriverInfo;

typedef FMOD_RESULT function(FMOD_SYSTEM *system, int id, FMOD_CAPS *caps, int *minfrequency, int *maxfrequency, FMOD_SPEAKERMODE *controlpanelspeakermode) pfFMOD_System_GetDriverCaps;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int driver) pfFMOD_System_SetDriver;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *driver) pfFMOD_System_GetDriver;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int min2d, int max2d, int min3d, int max3d) pfFMOD_System_SetHardwareChannels;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int numsoftwarechannels) pfFMOD_System_SetSoftwareChannels;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *numsoftwarechannels) pfFMOD_System_GetSoftwareChannels;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int samplerate, FMOD_SOUND_FORMAT format, int numoutputchannels, int maxinputchannels, FMOD_DSP_RESAMPLER resamplemethod) pfFMOD_System_SetSoftwareFormat;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *samplerate, FMOD_SOUND_FORMAT *format, int *numoutputchannels, int *maxinputchannels, FMOD_DSP_RESAMPLER *resamplemethod, int *bits) pfFMOD_System_GetSoftwareFormat;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, uint bufferlength, int numbuffers) pfFMOD_System_SetDSPBufferSize;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, uint *bufferlength, int *numbuffers) pfFMOD_System_GetDSPBufferSize;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_FILE_OPENCALLBACK useropen, FMOD_FILE_CLOSECALLBACK userclose, FMOD_FILE_READCALLBACK userread, FMOD_FILE_SEEKCALLBACK userseek, int blocksize) pfFMOD_System_SetFileSystem;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_FILE_OPENCALLBACK useropen, FMOD_FILE_CLOSECALLBACK userclose, FMOD_FILE_READCALLBACK userread, FMOD_FILE_SEEKCALLBACK userseek) pfFMOD_System_AttachFileSystem;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_ADVANCEDSETTINGS *settings) pfFMOD_System_SetAdvancedSettings;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_ADVANCEDSETTINGS *settings) pfFMOD_System_GetAdvancedSettings;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_SPEAKERMODE speakermode) pfFMOD_System_SetSpeakerMode;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_SPEAKERMODE *speakermode) pfFMOD_System_GetSpeakerMode;

pfFMOD_System_SetOutput FMOD_System_SetOutput;
pfFMOD_System_GetOutput FMOD_System_GetOutput;
pfFMOD_System_GetNumDrivers FMOD_System_GetNumDrivers;
pfFMOD_System_GetDriverInfo FMOD_System_GetDriverInfo;
pfFMOD_System_GetDriverCaps FMOD_System_GetDriverCaps;


pfFMOD_System_SetDriver FMOD_System_SetDriver;
pfFMOD_System_GetDriver FMOD_System_GetDriver;
pfFMOD_System_SetHardwareChannels FMOD_System_SetHardwareChannels;
pfFMOD_System_SetSoftwareChannels FMOD_System_SetSoftwareChannels;
pfFMOD_System_GetSoftwareChannels FMOD_System_GetSoftwareChannels;
pfFMOD_System_SetSoftwareFormat FMOD_System_SetSoftwareFormat;
pfFMOD_System_GetSoftwareFormat FMOD_System_GetSoftwareFormat;
pfFMOD_System_SetDSPBufferSize FMOD_System_SetDSPBufferSize;
pfFMOD_System_GetDSPBufferSize FMOD_System_GetDSPBufferSize;
pfFMOD_System_SetFileSystem FMOD_System_SetFileSystem;
pfFMOD_System_AttachFileSystem FMOD_System_AttachFileSystem;
pfFMOD_System_SetAdvancedSettings FMOD_System_SetAdvancedSettings;
pfFMOD_System_GetAdvancedSettings FMOD_System_GetAdvancedSettings;
pfFMOD_System_SetSpeakerMode FMOD_System_SetSpeakerMode;
pfFMOD_System_GetSpeakerMode FMOD_System_GetSpeakerMode;

/*
     Plug-in support
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *path) pfFMOD_System_SetPluginPath;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *filename, FMOD_PLUGINTYPE *plugintype, int *index) pfFMOD_System_LoadPlugin;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int *numplugins) pfFMOD_System_GetNumPlugins;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int index, char *name, int namelen, uint *_version) pfFMOD_System_GetPluginInfo;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int index) pfFMOD_System_UnloadPlugin;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int index) pfFMOD_System_SetOutputByPlugin;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *index) pfFMOD_System_GetOutputByPlugin;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_CODEC_DESCRIPTION *description) pfFMOD_System_CreateCodec;

pfFMOD_System_SetPluginPath FMOD_System_SetPluginPath;
pfFMOD_System_LoadPlugin FMOD_System_LoadPlugin;
pfFMOD_System_GetNumPlugins FMOD_System_GetNumPlugins;
pfFMOD_System_GetPluginInfo FMOD_System_GetPluginInfo;
pfFMOD_System_UnloadPlugin FMOD_System_UnloadPlugin;
pfFMOD_System_SetOutputByPlugin FMOD_System_SetOutputByPlugin;
pfFMOD_System_GetOutputByPlugin FMOD_System_GetOutputByPlugin;
pfFMOD_System_CreateCodec FMOD_System_CreateCodec;

/*
     Init/Close
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, int maxchannels, FMOD_INITFLAGS flags, void *extradriverdata) pfFMOD_System_Init;
typedef FMOD_RESULT function(FMOD_SYSTEM *system) pfFMOD_System_Close;

pfFMOD_System_Init FMOD_System_Init;
pfFMOD_System_Close FMOD_System_Close;

/*
     General post-init system functions
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system) pfFMOD_System_Update;

typedef FMOD_RESULT function(FMOD_SYSTEM *system, float dopplerscale, float distancefactor, float rolloffscale) pfFMOD_System_Set3DSettings;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, float *dopplerscale, float *distancefactor, float *rolloffscale) pfFMOD_System_Get3DSettings;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int numlisteners) pfFMOD_System_Set3DNumListeners;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *numlisteners) pfFMOD_System_Get3DNumListeners;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int listener, FMOD_VECTOR *pos, FMOD_VECTOR *vel, FMOD_VECTOR *forward, FMOD_VECTOR *up) pfFMOD_System_Set3DListenerAttributes;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int listener, FMOD_VECTOR *pos, FMOD_VECTOR *vel, FMOD_VECTOR *forward, FMOD_VECTOR *up) pfFMOD_System_Get3DListenerAttributes;

////typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_SPEAKER speaker, float x, float y) pfFMOD_System_SetSpeakerPosition;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_SPEAKER speaker, float *x, float *y) pfFMOD_System_GetSpeakerPosition;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, uint filebuffersize, FMOD_TIMEUNIT filebuffersizetype) pfFMOD_System_SetStreamBufferSize;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, uint *filebuffersize, FMOD_TIMEUNIT *filebuffersizetype) pfFMOD_System_GetStreamBufferSize;

pfFMOD_System_Update FMOD_System_Update;

pfFMOD_System_Set3DSettings FMOD_System_Set3DSettings;
pfFMOD_System_Get3DSettings FMOD_System_Get3DSettings;
pfFMOD_System_Set3DNumListeners FMOD_System_Set3DNumListeners;
pfFMOD_System_Get3DNumListeners FMOD_System_Get3DNumListeners;
pfFMOD_System_Set3DListenerAttributes FMOD_System_Set3DListenerAttributes;
pfFMOD_System_Get3DListenerAttributes FMOD_System_Get3DListenerAttributes;

////pfFMOD_System_SetSpeakerPosition FMOD_System_SetSpeakerPosition;
////pfFMOD_System_GetSpeakerPosition FMOD_System_GetSpeakerPosition;
pfFMOD_System_SetStreamBufferSize FMOD_System_SetStreamBufferSize;
pfFMOD_System_GetStreamBufferSize FMOD_System_GetStreamBufferSize;

/*
     System information functions.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *_version) pfFMOD_System_GetVersion;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, void **handle) pfFMOD_System_GetOutputHandle;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *channels) pfFMOD_System_GetChannelsPlaying;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *num2d, int *num3d, int *total) pfFMOD_System_GetHardwareChannels;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, float *dsp, float *stream, float *update, float *total) pfFMOD_System_GetCPUUsage;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *currentalloced, int *maxalloced, int *total) pfFMOD_System_GetSoundRAM;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *numdrives) pfFMOD_System_GetNumCDROMDrives;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int drive, char *drivename, int drivenamelen, char *scsiname, int scsinamelen, char *devicename, int devicenamelen) pfFMOD_System_GetCDROMDriveName;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, float *spectrumarray, int numvalues, int channeloffset, FMOD_DSP_FFT_WINDOW windowtype) pfFMOD_System_GetSpectrum;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, float *wavearray, int numvalues, int channeloffset) pfFMOD_System_GetWaveData;

pfFMOD_System_GetVersion FMOD_System_GetVersion;
pfFMOD_System_GetOutputHandle FMOD_System_GetOutputHandle;
pfFMOD_System_GetChannelsPlaying FMOD_System_GetChannelsPlaying;
pfFMOD_System_GetHardwareChannels FMOD_System_GetHardwareChannels;
pfFMOD_System_GetCPUUsage FMOD_System_GetCPUUsage;
pfFMOD_System_GetSoundRAM FMOD_System_GetSoundRAM;
pfFMOD_System_GetNumCDROMDrives FMOD_System_GetNumCDROMDrives;
pfFMOD_System_GetCDROMDriveName FMOD_System_GetCDROMDriveName;
pfFMOD_System_GetSpectrum FMOD_System_GetSpectrum;
pfFMOD_System_GetWaveData FMOD_System_GetWaveData;

/*
     Sound/DSP/Channel/FX creation and retrieval.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO *exinfo, FMOD_SOUND **sound) pfFMOD_System_CreateSound;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO *exinfo, FMOD_SOUND **sound) pfFMOD_System_CreateStream;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_DSP_DESCRIPTION *description, FMOD_DSP **dsp) pfFMOD_System_CreateDSP;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_DSP_TYPE type, FMOD_DSP **dsp) pfFMOD_System_CreateDSPByType;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, int index, FMOD_DSP **dsp) pfFMOD_System_CreateDSPByIndex;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *name, FMOD_CHANNELGROUP **channelgroup) pfFMOD_System_CreateChannelGroup;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_REVERB **reverb, FMOD_BOOL physical) pfFMOD_System_Create3DReverb;

typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_CHANNELINDEX channelid, FMOD_SOUND *sound, FMOD_BOOL paused, FMOD_CHANNEL **channel) pfFMOD_System_PlaySound;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_CHANNELINDEX channelid, FMOD_DSP *dsp, FMOD_BOOL paused, FMOD_CHANNEL **channel) pfFMOD_System_PlayDSP;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int channelid, FMOD_CHANNEL **channel) pfFMOD_System_GetChannel;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_CHANNELGROUP **channelgroup) pfFMOD_System_GetMasterChannelGroup;

pfFMOD_System_CreateSound FMOD_System_CreateSound;
pfFMOD_System_CreateStream FMOD_System_CreateStream;
pfFMOD_System_CreateDSP FMOD_System_CreateDSP;
pfFMOD_System_CreateDSPByType FMOD_System_CreateDSPByType;
////pfFMOD_System_CreateDSPByIndex FMOD_System_CreateDSPByIndex;
pfFMOD_System_CreateChannelGroup FMOD_System_CreateChannelGroup;
////pfFMOD_System_Create3DReverb FMOD_System_Create3DReverb;

pfFMOD_System_PlaySound FMOD_System_PlaySound;
pfFMOD_System_PlayDSP FMOD_System_PlayDSP;
pfFMOD_System_GetChannel FMOD_System_GetChannel;
pfFMOD_System_GetMasterChannelGroup FMOD_System_GetMasterChannelGroup;

/*
     Reverb API
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop) pfFMOD_System_SetReverbProperties;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop) pfFMOD_System_GetReverbProperties;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop) pfFMOD_System_Set3DReverbAmbientProperties;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_REVERB_PROPERTIES *prop) pfFMOD_System_Get3DReverbAmbientProperties;

pfFMOD_System_SetReverbProperties FMOD_System_SetReverbProperties;
pfFMOD_System_GetReverbProperties FMOD_System_GetReverbProperties;
////pfFMOD_System_Set3DReverbAmbientProperties FMOD_System_Set3DReverbAmbientProperties;
////pfFMOD_System_Get3DReverbAmbientProperties FMOD_System_Get3DReverbAmbientProperties;

/*
     System level DSP access.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_DSP **dsp) pfFMOD_System_GetDSPHead;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_DSP *dsp) pfFMOD_System_AddDSP;
typedef FMOD_RESULT function(FMOD_SYSTEM *system) pfFMOD_System_LockDSP;
typedef FMOD_RESULT function(FMOD_SYSTEM *system) pfFMOD_System_UnlockDSP;

pfFMOD_System_GetDSPHead FMOD_System_GetDSPHead;
pfFMOD_System_AddDSP FMOD_System_AddDSP;
pfFMOD_System_LockDSP FMOD_System_LockDSP;
pfFMOD_System_UnlockDSP FMOD_System_UnlockDSP;

/*
     Recording API.
*/

////typedef FMOD_RESULT function(FMOD_SYSTEM *system, int driver) pfFMOD_System_SetRecordDriver;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *driver) pfFMOD_System_GetRecordDriver;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *numdrivers) pfFMOD_System_GetRecordNumDrivers;
////typedef FMOD_RESULT function(FMOD_SYSTEM *system, int id, char *name, int namelen) pfFMOD_System_GetRecordDriverName;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, uint *position) pfFMOD_System_GetRecordPosition;

typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_SOUND *sound, FMOD_BOOL loop) pfFMOD_System_RecordStart;
typedef FMOD_RESULT function(FMOD_SYSTEM *system) pfFMOD_System_RecordStop;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, FMOD_BOOL *recording) pfFMOD_System_IsRecording;

////pfFMOD_System_SetRecordDriver FMOD_System_SetRecordDriver;
////pfFMOD_System_GetRecordDriver FMOD_System_GetRecordDriver;
pfFMOD_System_GetRecordNumDrivers FMOD_System_GetRecordNumDrivers;
////pfFMOD_System_GetRecordDriverName FMOD_System_GetRecordDriverName;
pfFMOD_System_GetRecordPosition FMOD_System_GetRecordPosition;

pfFMOD_System_RecordStart FMOD_System_RecordStart;
pfFMOD_System_RecordStop FMOD_System_RecordStop;
pfFMOD_System_IsRecording FMOD_System_IsRecording;

/*
     Geometry API.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, int maxpolygons, int maxvertices, FMOD_GEOMETRY **geometry) pfFMOD_System_CreateGeometry;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, float maxworldsize) pfFMOD_System_SetGeometrySettings;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, float *maxworldsize) pfFMOD_System_GetGeometrySettings;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, void *data, int datasize, FMOD_GEOMETRY **geometry) pfFMOD_System_LoadGeometry;

pfFMOD_System_CreateGeometry FMOD_System_CreateGeometry;
pfFMOD_System_SetGeometrySettings FMOD_System_SetGeometrySettings;
pfFMOD_System_GetGeometrySettings FMOD_System_GetGeometrySettings;
pfFMOD_System_LoadGeometry FMOD_System_LoadGeometry;

/*
     Network functions.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *proxy) pfFMOD_System_SetNetworkProxy;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, char *proxy, int proxylen) pfFMOD_System_GetNetworkProxy;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int timeout) pfFMOD_System_SetNetworkTimeout;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, int *timeout) pfFMOD_System_GetNetworkTimeout;

pfFMOD_System_SetNetworkProxy FMOD_System_SetNetworkProxy;
pfFMOD_System_GetNetworkProxy FMOD_System_GetNetworkProxy;
pfFMOD_System_SetNetworkTimeout FMOD_System_SetNetworkTimeout;
pfFMOD_System_GetNetworkTimeout FMOD_System_GetNetworkTimeout;

/*
     Userdata set/get.
*/

typedef FMOD_RESULT function(FMOD_SYSTEM *system, void *userdata) pfFMOD_System_SetUserData;
typedef FMOD_RESULT function(FMOD_SYSTEM *system, void **userdata) pfFMOD_System_GetUserData;

pfFMOD_System_SetUserData FMOD_System_SetUserData;
pfFMOD_System_GetUserData FMOD_System_GetUserData;

/*
    'Sound' API
*/

pfFMOD_Sound_Release FMOD_Sound_Release;
pfFMOD_Sound_GetSystemObject FMOD_Sound_GetSystemObject;

typedef FMOD_RESULT function(FMOD_SOUND *sound) pfFMOD_Sound_Release;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_SYSTEM **system) pfFMOD_Sound_GetSystemObject;

/*
     Standard sound manipulation functions.
*/

typedef FMOD_RESULT function(FMOD_SOUND *sound, uint offset, uint length, void **ptr1, void **ptr2, uint *len1, uint *len2) pfFMOD_Sound_Lock;
typedef FMOD_RESULT function(FMOD_SOUND *sound, void *ptr1, void *ptr2, uint len1, uint len2) pfFMOD_Sound_Unlock;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float frequency, float volume, float pan, int priority) pfFMOD_Sound_SetDefaults;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float *frequency, float *volume, float *pan, int *priority) pfFMOD_Sound_GetDefaults;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float frequencyvar, float volumevar, float panvar) pfFMOD_Sound_SetVariations;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float *frequencyvar, float *volumevar, float *panvar) pfFMOD_Sound_GetVariations;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float min, float max) pfFMOD_Sound_Set3DMinMaxDistance;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float *min, float *max) pfFMOD_Sound_Get3DMinMaxDistance;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float insideconeangle, float outsideconeangle, float outsidevolume) pfFMOD_Sound_Set3DConeSettings;
typedef FMOD_RESULT function(FMOD_SOUND *sound, float *insideconeangle, float *outsideconeangle, float *outsidevolume) pfFMOD_Sound_Get3DConeSettings;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_VECTOR *points, int numpoints) pfFMOD_Sound_Set3DCustomRolloff;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_VECTOR **points, int *numpoints) pfFMOD_Sound_Get3DCustomRolloff;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int index, FMOD_SOUND *subsound) pfFMOD_Sound_SetSubSound;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int index, FMOD_SOUND **subsound) pfFMOD_Sound_GetSubSound;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int *subsoundlist, int numsubsounds) pfFMOD_Sound_SetSubSoundSentence;
typedef FMOD_RESULT function(FMOD_SOUND *sound, char *name, int namelen) pfFMOD_Sound_GetName;
typedef FMOD_RESULT function(FMOD_SOUND *sound, uint *length, FMOD_TIMEUNIT lengthtype) pfFMOD_Sound_GetLength;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_SOUND_TYPE *type, FMOD_SOUND_FORMAT *format, int *channels, int *bits) pfFMOD_Sound_GetFormat;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int *numsubsounds) pfFMOD_Sound_GetNumSubSounds;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int *numtags, int *numtagsupdated) pfFMOD_Sound_GetNumTags;
typedef FMOD_RESULT function(FMOD_SOUND *sound, char *name, int index, FMOD_TAG *tag) pfFMOD_Sound_GetTag;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_OPENSTATE *openstate, uint *percentbuffered, FMOD_BOOL *starving) pfFMOD_Sound_GetOpenState;
typedef FMOD_RESULT function(FMOD_SOUND *sound, void *buffer, uint lenbytes, uint *read) pfFMOD_Sound_ReadData;
typedef FMOD_RESULT function(FMOD_SOUND *sound, uint pcm) pfFMOD_Sound_SeekData;

pfFMOD_Sound_Lock FMOD_Sound_Lock;
pfFMOD_Sound_Unlock FMOD_Sound_Unlock;
pfFMOD_Sound_SetDefaults FMOD_Sound_SetDefaults;
pfFMOD_Sound_GetDefaults FMOD_Sound_GetDefaults;
pfFMOD_Sound_SetVariations FMOD_Sound_SetVariations;
pfFMOD_Sound_GetVariations FMOD_Sound_GetVariations;
pfFMOD_Sound_Set3DMinMaxDistance FMOD_Sound_Set3DMinMaxDistance;
pfFMOD_Sound_Get3DMinMaxDistance FMOD_Sound_Get3DMinMaxDistance;
pfFMOD_Sound_Set3DConeSettings FMOD_Sound_Set3DConeSettings;
pfFMOD_Sound_Get3DConeSettings FMOD_Sound_Get3DConeSettings;
pfFMOD_Sound_Set3DCustomRolloff FMOD_Sound_Set3DCustomRolloff;
pfFMOD_Sound_Get3DCustomRolloff FMOD_Sound_Get3DCustomRolloff;
pfFMOD_Sound_SetSubSound FMOD_Sound_SetSubSound;
pfFMOD_Sound_GetSubSound FMOD_Sound_GetSubSound;
pfFMOD_Sound_SetSubSoundSentence FMOD_Sound_SetSubSoundSentence;
pfFMOD_Sound_GetName FMOD_Sound_GetName;
pfFMOD_Sound_GetLength FMOD_Sound_GetLength;
pfFMOD_Sound_GetFormat FMOD_Sound_GetFormat;
pfFMOD_Sound_GetNumSubSounds FMOD_Sound_GetNumSubSounds;
pfFMOD_Sound_GetNumTags FMOD_Sound_GetNumTags;
pfFMOD_Sound_GetTag FMOD_Sound_GetTag;
pfFMOD_Sound_GetOpenState FMOD_Sound_GetOpenState;
pfFMOD_Sound_ReadData FMOD_Sound_ReadData;
pfFMOD_Sound_SeekData FMOD_Sound_SeekData;

/*
     Synchronization point API.  These points can come from markers embedded in wav files, and can also generate channel callbacks.
*/

typedef FMOD_RESULT function(FMOD_SOUND *sound, int *numsyncpoints) pfFMOD_Sound_GetNumSyncPoints;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int index, FMOD_SYNCPOINT **point) pfFMOD_Sound_GetSyncPoint;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_SYNCPOINT *point, char *name, int namelen, uint *offset, FMOD_TIMEUNIT offsettype) pfFMOD_Sound_GetSyncPointInfo;
typedef FMOD_RESULT function(FMOD_SOUND *sound, uint offset, FMOD_TIMEUNIT offsettype, char *name, FMOD_SYNCPOINT **point) pfFMOD_Sound_AddSyncPoint;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_SYNCPOINT *point) pfFMOD_Sound_DeleteSyncPoint;

pfFMOD_Sound_GetNumSyncPoints FMOD_Sound_GetNumSyncPoints;
pfFMOD_Sound_GetSyncPoint FMOD_Sound_GetSyncPoint;
pfFMOD_Sound_GetSyncPointInfo FMOD_Sound_GetSyncPointInfo;
pfFMOD_Sound_AddSyncPoint FMOD_Sound_AddSyncPoint;
pfFMOD_Sound_DeleteSyncPoint FMOD_Sound_DeleteSyncPoint;

/*
     Functions also in Channel class but here they are the 'default' to save having to change it in Channel all the time.
*/

typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_MODE mode) pfFMOD_Sound_SetMode;
typedef FMOD_RESULT function(FMOD_SOUND *sound, FMOD_MODE *mode) pfFMOD_Sound_GetMode;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int loopcount) pfFMOD_Sound_SetLoopCount;
typedef FMOD_RESULT function(FMOD_SOUND *sound, int *loopcount) pfFMOD_Sound_GetLoopCount;
typedef FMOD_RESULT function(FMOD_SOUND *sound, uint loopstart, FMOD_TIMEUNIT loopstarttype, uint loopend, FMOD_TIMEUNIT loopendtype) pfFMOD_Sound_SetLoopPoints;
typedef FMOD_RESULT function(FMOD_SOUND *sound, uint *loopstart, FMOD_TIMEUNIT loopstarttype, uint *loopend, FMOD_TIMEUNIT loopendtype) pfFMOD_Sound_GetLoopPoints;

pfFMOD_Sound_SetMode FMOD_Sound_SetMode;
pfFMOD_Sound_GetMode FMOD_Sound_GetMode;
pfFMOD_Sound_SetLoopCount FMOD_Sound_SetLoopCount;
pfFMOD_Sound_GetLoopCount FMOD_Sound_GetLoopCount;
pfFMOD_Sound_SetLoopPoints FMOD_Sound_SetLoopPoints;
pfFMOD_Sound_GetLoopPoints FMOD_Sound_GetLoopPoints;

/*
     Userdata set/get.
*/

typedef FMOD_RESULT function(FMOD_SOUND *sound, void *userdata) pfFMOD_Sound_SetUserData;
typedef FMOD_RESULT function(FMOD_SOUND *sound, void **userdata) pfFMOD_Sound_GetUserData;

pfFMOD_Sound_SetUserData FMOD_Sound_SetUserData;
pfFMOD_Sound_GetUserData FMOD_Sound_GetUserData;

/*
    'Channel' API
*/

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_SYSTEM **system) pfFMOD_Channel_GetSystemObject;

typedef FMOD_RESULT function(FMOD_CHANNEL *channel) pfFMOD_Channel_Stop;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_BOOL paused) pfFMOD_Channel_SetPaused;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_BOOL *paused) pfFMOD_Channel_GetPaused;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float volume) pfFMOD_Channel_SetVolume;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *volume) pfFMOD_Channel_GetVolume;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float frequency) pfFMOD_Channel_SetFrequency;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *frequency) pfFMOD_Channel_GetFrequency;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float pan) pfFMOD_Channel_SetPan;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *pan) pfFMOD_Channel_GetPan;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, uint startdelay, uint enddelay) pfFMOD_Channel_SetDelay;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, uint *startdelay, uint *enddelay) pfFMOD_Channel_GetDelay;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float frontleft, float frontright, float center, float lfe, float backleft, float backright, float sideleft, float sideright) pfFMOD_Channel_SetSpeakerMix;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *frontleft, float *frontright, float *center, float *lfe, float *backleft, float *backright, float *sideleft, float *sideright) pfFMOD_Channel_GetSpeakerMix;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_SPEAKER speaker, float *levels, int numlevels) pfFMOD_Channel_SetSpeakerLevels;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_SPEAKER speaker, float *levels, int numlevels) pfFMOD_Channel_GetSpeakerLevels;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_BOOL mute) pfFMOD_Channel_SetMute;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_BOOL *mute) pfFMOD_Channel_GetMute;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, int priority) pfFMOD_Channel_SetPriority;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, int *priority) pfFMOD_Channel_GetPriority;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, uint position, FMOD_TIMEUNIT postype) pfFMOD_Channel_SetPosition;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, uint *position, FMOD_TIMEUNIT postype) pfFMOD_Channel_GetPosition;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_REVERB_CHANNELPROPERTIES *prop) pfFMOD_Channel_SetReverbProperties;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_REVERB_CHANNELPROPERTIES *prop) pfFMOD_Channel_GetReverbProperties;

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_CHANNELGROUP *channelgroup) pfFMOD_Channel_SetChannelGroup;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_CHANNELGROUP **channelgroup) pfFMOD_Channel_GetChannelGroup;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_CHANNEL_CALLBACKTYPE type, FMOD_CHANNEL_CALLBACK callback, int command) pfFMOD_Channel_SetCallback;

pfFMOD_Channel_GetSystemObject FMOD_Channel_GetSystemObject;

pfFMOD_Channel_Stop FMOD_Channel_Stop;
pfFMOD_Channel_SetPaused FMOD_Channel_SetPaused;
pfFMOD_Channel_GetPaused FMOD_Channel_GetPaused;
pfFMOD_Channel_SetVolume FMOD_Channel_SetVolume;
pfFMOD_Channel_GetVolume FMOD_Channel_GetVolume;
pfFMOD_Channel_SetFrequency FMOD_Channel_SetFrequency;
pfFMOD_Channel_GetFrequency FMOD_Channel_GetFrequency;
pfFMOD_Channel_SetPan FMOD_Channel_SetPan;
pfFMOD_Channel_GetPan FMOD_Channel_GetPan;
pfFMOD_Channel_SetDelay FMOD_Channel_SetDelay;
pfFMOD_Channel_GetDelay FMOD_Channel_GetDelay;
pfFMOD_Channel_SetSpeakerMix FMOD_Channel_SetSpeakerMix;
pfFMOD_Channel_GetSpeakerMix FMOD_Channel_GetSpeakerMix;
pfFMOD_Channel_SetSpeakerLevels FMOD_Channel_SetSpeakerLevels;
pfFMOD_Channel_GetSpeakerLevels FMOD_Channel_GetSpeakerLevels;
pfFMOD_Channel_SetMute FMOD_Channel_SetMute;
pfFMOD_Channel_GetMute FMOD_Channel_GetMute;
pfFMOD_Channel_SetPriority FMOD_Channel_SetPriority;
pfFMOD_Channel_GetPriority FMOD_Channel_GetPriority;
pfFMOD_Channel_SetPosition FMOD_Channel_SetPosition;
pfFMOD_Channel_GetPosition FMOD_Channel_GetPosition;
pfFMOD_Channel_SetReverbProperties FMOD_Channel_SetReverbProperties;
pfFMOD_Channel_GetReverbProperties FMOD_Channel_GetReverbProperties;

pfFMOD_Channel_SetChannelGroup FMOD_Channel_SetChannelGroup;
pfFMOD_Channel_GetChannelGroup FMOD_Channel_GetChannelGroup;
pfFMOD_Channel_SetCallback FMOD_Channel_SetCallback;

/*
     3D functionality.
*/

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_VECTOR *pos, FMOD_VECTOR *vel) pfFMOD_Channel_Set3DAttributes;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_VECTOR *pos, FMOD_VECTOR *vel) pfFMOD_Channel_Get3DAttributes;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float mindistance, float maxdistance) pfFMOD_Channel_Set3DMinMaxDistance;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *mindistance, float *maxdistance) pfFMOD_Channel_Get3DMinMaxDistance;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float insideconeangle, float outsideconeangle, float outsidevolume) pfFMOD_Channel_Set3DConeSettings;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *insideconeangle, float *outsideconeangle, float *outsidevolume) pfFMOD_Channel_Get3DConeSettings;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_VECTOR *orientation) pfFMOD_Channel_Set3DConeOrientation;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_VECTOR *orientation) pfFMOD_Channel_Get3DConeOrientation;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_VECTOR *points, int numpoints) pfFMOD_Channel_Set3DCustomRolloff;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_VECTOR **points, int *numpoints) pfFMOD_Channel_Get3DCustomRolloff;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float directocclusion, float reverbocclusion) pfFMOD_Channel_Set3DOcclusion;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *directocclusion, float *reverbocclusion) pfFMOD_Channel_Get3DOcclusion;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float angle) pfFMOD_Channel_Set3DSpread;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *angle) pfFMOD_Channel_Get3DSpread;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float level) pfFMOD_Channel_Set3DPanLevel;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *level) pfFMOD_Channel_Get3DPanLevel;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float level) pfFMOD_Channel_Set3DDopplerLevel;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *level) pfFMOD_Channel_Get3DDopplerLevel;

pfFMOD_Channel_Set3DAttributes FMOD_Channel_Set3DAttributes;
pfFMOD_Channel_Get3DAttributes FMOD_Channel_Get3DAttributes;
pfFMOD_Channel_Set3DMinMaxDistance FMOD_Channel_Set3DMinMaxDistance;
pfFMOD_Channel_Get3DMinMaxDistance FMOD_Channel_Get3DMinMaxDistance;
pfFMOD_Channel_Set3DConeSettings FMOD_Channel_Set3DConeSettings;
pfFMOD_Channel_Get3DConeSettings FMOD_Channel_Get3DConeSettings;
pfFMOD_Channel_Set3DConeOrientation FMOD_Channel_Set3DConeOrientation;
pfFMOD_Channel_Get3DConeOrientation FMOD_Channel_Get3DConeOrientation;
pfFMOD_Channel_Set3DCustomRolloff FMOD_Channel_Set3DCustomRolloff;
pfFMOD_Channel_Get3DCustomRolloff FMOD_Channel_Get3DCustomRolloff;
pfFMOD_Channel_Set3DOcclusion FMOD_Channel_Set3DOcclusion;
pfFMOD_Channel_Get3DOcclusion FMOD_Channel_Get3DOcclusion;
pfFMOD_Channel_Set3DSpread FMOD_Channel_Set3DSpread;
pfFMOD_Channel_Get3DSpread FMOD_Channel_Get3DSpread;
pfFMOD_Channel_Set3DPanLevel FMOD_Channel_Set3DPanLevel;
pfFMOD_Channel_Get3DPanLevel FMOD_Channel_Get3DPanLevel;
pfFMOD_Channel_Set3DDopplerLevel FMOD_Channel_Set3DDopplerLevel;
pfFMOD_Channel_Get3DDopplerLevel FMOD_Channel_Get3DDopplerLevel;

/*
     DSP functionality only for channels playing sounds created with FMOD_SOFTWARE.
*/

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_DSP **dsp) pfFMOD_Channel_GetDSPHead;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_DSP *dsp) pfFMOD_Channel_AddDSP;

pfFMOD_Channel_GetDSPHead FMOD_Channel_GetDSPHead;
pfFMOD_Channel_AddDSP FMOD_Channel_AddDSP;

/*
     Information only functions.
*/

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_BOOL *isplaying) pfFMOD_Channel_IsPlaying;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_BOOL *isvirtual) pfFMOD_Channel_IsVirtual;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *audibility) pfFMOD_Channel_GetAudibility;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_SOUND **sound) pfFMOD_Channel_GetCurrentSound;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *spectrumarray, int numvalues, int channeloffset, FMOD_DSP_FFT_WINDOW windowtype) pfFMOD_Channel_GetSpectrum;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, float *wavearray, int numvalues, int channeloffset) pfFMOD_Channel_GetWaveData;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, int *index) pfFMOD_Channel_GetIndex;

pfFMOD_Channel_IsPlaying FMOD_Channel_IsPlaying;
pfFMOD_Channel_IsVirtual FMOD_Channel_IsVirtual;
pfFMOD_Channel_GetAudibility FMOD_Channel_GetAudibility;
pfFMOD_Channel_GetCurrentSound FMOD_Channel_GetCurrentSound;
pfFMOD_Channel_GetSpectrum FMOD_Channel_GetSpectrum;
pfFMOD_Channel_GetWaveData FMOD_Channel_GetWaveData;
pfFMOD_Channel_GetIndex FMOD_Channel_GetIndex;

/*
     Functions also found in Sound class but here they can be set per channel.
*/

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_MODE mode) pfFMOD_Channel_SetMode;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, FMOD_MODE *mode) pfFMOD_Channel_GetMode;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, int loopcount) pfFMOD_Channel_SetLoopCount;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, int *loopcount) pfFMOD_Channel_GetLoopCount;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, uint loopstart, FMOD_TIMEUNIT loopstarttype, uint loopend, FMOD_TIMEUNIT loopendtype) pfFMOD_Channel_SetLoopPoints;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, uint *loopstart, FMOD_TIMEUNIT loopstarttype, uint *loopend, FMOD_TIMEUNIT loopendtype) pfFMOD_Channel_GetLoopPoints;

pfFMOD_Channel_SetMode FMOD_Channel_SetMode;
pfFMOD_Channel_GetMode FMOD_Channel_GetMode;
pfFMOD_Channel_SetLoopCount FMOD_Channel_SetLoopCount;
pfFMOD_Channel_GetLoopCount FMOD_Channel_GetLoopCount;
pfFMOD_Channel_SetLoopPoints FMOD_Channel_SetLoopPoints;
pfFMOD_Channel_GetLoopPoints FMOD_Channel_GetLoopPoints;

/*
     Userdata set/get.
*/

typedef FMOD_RESULT function(FMOD_CHANNEL *channel, void *userdata) pfFMOD_Channel_SetUserData;
typedef FMOD_RESULT function(FMOD_CHANNEL *channel, void **userdata) pfFMOD_Channel_GetUserData;

pfFMOD_Channel_SetUserData FMOD_Channel_SetUserData;
pfFMOD_Channel_GetUserData FMOD_Channel_GetUserData;

/*
    'ChannelGroup' API
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup) pfFMOD_ChannelGroup_Release;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_SYSTEM **system) pfFMOD_ChannelGroup_GetSystemObject;

pfFMOD_ChannelGroup_Release FMOD_ChannelGroup_Release;
pfFMOD_ChannelGroup_GetSystemObject FMOD_ChannelGroup_GetSystemObject;

/*
     Channelgroup scale values.  (changes attributes relative to the channels, doesn't overwrite them)
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float volume) pfFMOD_ChannelGroup_SetVolume;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float *volume) pfFMOD_ChannelGroup_GetVolume;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float pitch) pfFMOD_ChannelGroup_SetPitch;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float *pitch) pfFMOD_ChannelGroup_GetPitch;

pfFMOD_ChannelGroup_SetVolume FMOD_ChannelGroup_SetVolume;
pfFMOD_ChannelGroup_GetVolume FMOD_ChannelGroup_GetVolume;
pfFMOD_ChannelGroup_SetPitch FMOD_ChannelGroup_SetPitch;
pfFMOD_ChannelGroup_GetPitch FMOD_ChannelGroup_GetPitch;

/*
     Channelgroup override values.  (recursively overwrites whatever settings the channels had)
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup) pfFMOD_ChannelGroup_Stop;
////typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL paused) pfFMOD_ChannelGroup_OverridePaused;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float volume) pfFMOD_ChannelGroup_OverrideVolume;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float frequency) pfFMOD_ChannelGroup_OverrideFrequency;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float pan) pfFMOD_ChannelGroup_OverridePan;
////typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL mute) pfFMOD_ChannelGroup_OverrideMute;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_REVERB_CHANNELPROPERTIES *prop) pfFMOD_ChannelGroup_OverrideReverbProperties;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_VECTOR *pos, FMOD_VECTOR *vel) pfFMOD_ChannelGroup_Override3DAttributes;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float frontleft, float frontright, float center, float lfe, float backleft, float backright, float sideleft, float sideright) pfFMOD_ChannelGroup_OverrideSpeakerMix;

pfFMOD_ChannelGroup_Stop FMOD_ChannelGroup_Stop;
////pfFMOD_ChannelGroup_OverridePaused FMOD_ChannelGroup_OverridePaused;
pfFMOD_ChannelGroup_OverrideVolume FMOD_ChannelGroup_OverrideVolume;
pfFMOD_ChannelGroup_OverrideFrequency FMOD_ChannelGroup_OverrideFrequency;
pfFMOD_ChannelGroup_OverridePan FMOD_ChannelGroup_OverridePan;
////pfFMOD_ChannelGroup_OverrideMute FMOD_ChannelGroup_OverrideMute;
pfFMOD_ChannelGroup_OverrideReverbProperties FMOD_ChannelGroup_OverrideReverbProperties;
pfFMOD_ChannelGroup_Override3DAttributes FMOD_ChannelGroup_Override3DAttributes;
pfFMOD_ChannelGroup_OverrideSpeakerMix FMOD_ChannelGroup_OverrideSpeakerMix;

/*
     Nested channel groups.
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELGROUP *group) pfFMOD_ChannelGroup_AddGroup;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, int *numgroups) pfFMOD_ChannelGroup_GetNumGroups;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, int index, FMOD_CHANNELGROUP **group) pfFMOD_ChannelGroup_GetGroup;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELGROUP **group) pfFMOD_ChannelGroup_GetParentGroup;

pfFMOD_ChannelGroup_AddGroup FMOD_ChannelGroup_AddGroup;
pfFMOD_ChannelGroup_GetNumGroups FMOD_ChannelGroup_GetNumGroups;
pfFMOD_ChannelGroup_GetGroup FMOD_ChannelGroup_GetGroup;
pfFMOD_ChannelGroup_GetParentGroup FMOD_ChannelGroup_GetParentGroup;

/*
     DSP functionality only for channel groups playing sounds created with FMOD_SOFTWARE.
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_DSP **dsp) pfFMOD_ChannelGroup_GetDSPHead;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, FMOD_DSP *dsp) pfFMOD_ChannelGroup_AddDSP;

pfFMOD_ChannelGroup_GetDSPHead FMOD_ChannelGroup_GetDSPHead;
pfFMOD_ChannelGroup_AddDSP FMOD_ChannelGroup_AddDSP;

/*
     Information only functions.
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, char *name, int namelen) pfFMOD_ChannelGroup_GetName;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, int *numchannels) pfFMOD_ChannelGroup_GetNumChannels;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, int index, FMOD_CHANNEL **channel) pfFMOD_ChannelGroup_GetChannel;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float *spectrumarray, int numvalues, int channeloffset, FMOD_DSP_FFT_WINDOW windowtype) pfFMOD_ChannelGroup_GetSpectrum;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, float *wavearray, int numvalues, int channeloffset) pfFMOD_ChannelGroup_GetWaveData;

pfFMOD_ChannelGroup_GetName FMOD_ChannelGroup_GetName;
pfFMOD_ChannelGroup_GetNumChannels FMOD_ChannelGroup_GetNumChannels;
pfFMOD_ChannelGroup_GetChannel FMOD_ChannelGroup_GetChannel;
pfFMOD_ChannelGroup_GetSpectrum FMOD_ChannelGroup_GetSpectrum;
pfFMOD_ChannelGroup_GetWaveData FMOD_ChannelGroup_GetWaveData;

/*
     Userdata set/get.
*/

typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, void *userdata) pfFMOD_ChannelGroup_SetUserData;
typedef FMOD_RESULT function(FMOD_CHANNELGROUP *channelgroup, void **userdata) pfFMOD_ChannelGroup_GetUserData;

pfFMOD_ChannelGroup_SetUserData FMOD_ChannelGroup_SetUserData;
pfFMOD_ChannelGroup_GetUserData FMOD_ChannelGroup_GetUserData;

/*
    'DSP' API
*/

typedef FMOD_RESULT function(FMOD_DSP *dsp) pfFMOD_DSP_Release;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_SYSTEM **system) pfFMOD_DSP_GetSystemObject;

pfFMOD_DSP_Release FMOD_DSP_Release;
pfFMOD_DSP_GetSystemObject FMOD_DSP_GetSystemObject;

/*
     Connection / disconnection / input and output enumeration.
*/

typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_DSP *target) pfFMOD_DSP_AddInput;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_DSP *target) pfFMOD_DSP_DisconnectFrom;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_BOOL inputs, FMOD_BOOL outputs) pfFMOD_DSP_DisconnectAll;
typedef FMOD_RESULT function(FMOD_DSP *dsp) pfFMOD_DSP_Remove;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int *numinputs) pfFMOD_DSP_GetNumInputs;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int *numoutputs) pfFMOD_DSP_GetNumOutputs;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, FMOD_DSP **input) pfFMOD_DSP_GetInput;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, FMOD_DSP **output) pfFMOD_DSP_GetOutput;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, float volume) pfFMOD_DSP_SetInputMix;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, float *volume) pfFMOD_DSP_GetInputMix;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, FMOD_SPEAKER speaker, float *levels, int numlevels) pfFMOD_DSP_SetInputLevels;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, FMOD_SPEAKER speaker, float *levels, int numlevels) pfFMOD_DSP_GetInputLevels;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, float volume) pfFMOD_DSP_SetOutputMix;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, float *volume) pfFMOD_DSP_GetOutputMix;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, FMOD_SPEAKER speaker, float *levels, int numlevels) pfFMOD_DSP_SetOutputLevels;
////typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, FMOD_SPEAKER speaker, float *levels, int numlevels) pfFMOD_DSP_GetOutputLevels;

pfFMOD_DSP_AddInput FMOD_DSP_AddInput;
pfFMOD_DSP_DisconnectFrom FMOD_DSP_DisconnectFrom;
pfFMOD_DSP_DisconnectAll FMOD_DSP_DisconnectAll;
pfFMOD_DSP_Remove FMOD_DSP_Remove;
pfFMOD_DSP_GetNumInputs FMOD_DSP_GetNumInputs;
pfFMOD_DSP_GetNumOutputs FMOD_DSP_GetNumOutputs;
pfFMOD_DSP_GetInput FMOD_DSP_GetInput;
pfFMOD_DSP_GetOutput FMOD_DSP_GetOutput;
////pfFMOD_DSP_SetInputMix FMOD_DSP_SetInputMix;
////pfFMOD_DSP_GetInputMix FMOD_DSP_GetInputMix;
////pfFMOD_DSP_SetInputLevels FMOD_DSP_SetInputLevels;
////pfFMOD_DSP_GetInputLevels FMOD_DSP_GetInputLevels;
////pfFMOD_DSP_SetOutputMix FMOD_DSP_SetOutputMix;
////pfFMOD_DSP_GetOutputMix FMOD_DSP_GetOutputMix;
////pfFMOD_DSP_SetOutputLevels FMOD_DSP_SetOutputLevels;
////pfFMOD_DSP_GetOutputLevels FMOD_DSP_GetOutputLevels;

/*
     DSP unit control.
*/

typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_BOOL active) pfFMOD_DSP_SetActive;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_BOOL *active) pfFMOD_DSP_GetActive;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_BOOL bypass) pfFMOD_DSP_SetBypass;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_BOOL *bypass) pfFMOD_DSP_GetBypass;
typedef FMOD_RESULT function(FMOD_DSP *dsp) pfFMOD_DSP_Reset;

pfFMOD_DSP_SetActive FMOD_DSP_SetActive;
pfFMOD_DSP_GetActive FMOD_DSP_GetActive;
pfFMOD_DSP_SetBypass FMOD_DSP_SetBypass;
pfFMOD_DSP_GetBypass FMOD_DSP_GetBypass;
pfFMOD_DSP_Reset FMOD_DSP_Reset;

/*
     DSP parameter control.
*/

typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, float value) pfFMOD_DSP_SetParameter;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, float *value, char *valuestr, int valuestrlen) pfFMOD_DSP_GetParameter;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int *numparams) pfFMOD_DSP_GetNumParameters;
typedef FMOD_RESULT function(FMOD_DSP *dsp, int index, char *name, char *label, char *description, int descriptionlen, float *min, float *max) pfFMOD_DSP_GetParameterInfo;
typedef FMOD_RESULT function(FMOD_DSP *dsp, void *hwnd, FMOD_BOOL show) pfFMOD_DSP_ShowConfigDialog;

pfFMOD_DSP_SetParameter FMOD_DSP_SetParameter;
pfFMOD_DSP_GetParameter FMOD_DSP_GetParameter;
pfFMOD_DSP_GetNumParameters FMOD_DSP_GetNumParameters;
pfFMOD_DSP_GetParameterInfo FMOD_DSP_GetParameterInfo;
pfFMOD_DSP_ShowConfigDialog FMOD_DSP_ShowConfigDialog;

/*
     DSP attributes.
*/

typedef FMOD_RESULT function(FMOD_DSP *dsp, char *name, uint *_version, int *channels, int *configwidth, int *configheight) pfFMOD_DSP_GetInfo;
typedef FMOD_RESULT function(FMOD_DSP *dsp, FMOD_DSP_TYPE *type) pfFMOD_DSP_GetType;
typedef FMOD_RESULT function(FMOD_DSP *dsp, float frequency, float volume, float pan, int priority) pfFMOD_DSP_SetDefaults;
typedef FMOD_RESULT function(FMOD_DSP *dsp, float *frequency, float *volume, float *pan, int *priority) pfFMOD_DSP_GetDefaults;

pfFMOD_DSP_GetInfo FMOD_DSP_GetInfo;
pfFMOD_DSP_GetType FMOD_DSP_GetType;
pfFMOD_DSP_SetDefaults FMOD_DSP_SetDefaults;
pfFMOD_DSP_GetDefaults FMOD_DSP_GetDefaults;

/*
     Userdata set/get.
*/

typedef FMOD_RESULT function(FMOD_DSP *dsp, void *userdata) pfFMOD_DSP_SetUserData;
typedef FMOD_RESULT function(FMOD_DSP *dsp, void **userdata) pfFMOD_DSP_GetUserData;

pfFMOD_DSP_SetUserData FMOD_DSP_SetUserData;
pfFMOD_DSP_GetUserData FMOD_DSP_GetUserData;

/*
    'Geometry' API
*/

typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry) pfFMOD_Geometry_Release;

typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, float directocclusion, float reverbocclusion, FMOD_BOOL doublesided, int numvertices, FMOD_VECTOR *vertices, int *polygonindex) pfFMOD_Geometry_AddPolygon;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int *numpolygons) pfFMOD_Geometry_GetNumPolygons;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int *maxpolygons, int *maxvertices) pfFMOD_Geometry_GetMaxPolygons;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int index, int *numvertices) pfFMOD_Geometry_GetPolygonNumVertices;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int index, int vertexindex, FMOD_VECTOR *vertex) pfFMOD_Geometry_SetPolygonVertex;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int index, int vertexindex, FMOD_VECTOR *vertex) pfFMOD_Geometry_GetPolygonVertex;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int index, float directocclusion, float reverbocclusion, FMOD_BOOL doublesided) pfFMOD_Geometry_SetPolygonAttributes;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, int index, float *directocclusion, float *reverbocclusion, FMOD_BOOL *doublesided) pfFMOD_Geometry_GetPolygonAttributes;

typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_BOOL active) pfFMOD_Geometry_SetActive;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_BOOL *active) pfFMOD_Geometry_GetActive;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_VECTOR *forward, FMOD_VECTOR *up) pfFMOD_Geometry_SetRotation;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_VECTOR *forward, FMOD_VECTOR *up) pfFMOD_Geometry_GetRotation;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_VECTOR *position) pfFMOD_Geometry_SetPosition;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_VECTOR *position) pfFMOD_Geometry_GetPosition;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_VECTOR *scale) pfFMOD_Geometry_SetScale;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, FMOD_VECTOR *scale) pfFMOD_Geometry_GetScale;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, void *data, int *datasize) pfFMOD_Geometry_Save;

pfFMOD_Geometry_Release FMOD_Geometry_Release;

pfFMOD_Geometry_AddPolygon FMOD_Geometry_AddPolygon;
pfFMOD_Geometry_GetNumPolygons FMOD_Geometry_GetNumPolygons;
pfFMOD_Geometry_GetMaxPolygons FMOD_Geometry_GetMaxPolygons;
pfFMOD_Geometry_GetPolygonNumVertices FMOD_Geometry_GetPolygonNumVertices;
pfFMOD_Geometry_SetPolygonVertex FMOD_Geometry_SetPolygonVertex;
pfFMOD_Geometry_GetPolygonVertex FMOD_Geometry_GetPolygonVertex;
pfFMOD_Geometry_SetPolygonAttributes FMOD_Geometry_SetPolygonAttributes;
pfFMOD_Geometry_GetPolygonAttributes FMOD_Geometry_GetPolygonAttributes;

pfFMOD_Geometry_SetActive FMOD_Geometry_SetActive;
pfFMOD_Geometry_GetActive FMOD_Geometry_GetActive;
pfFMOD_Geometry_SetRotation FMOD_Geometry_SetRotation;
pfFMOD_Geometry_GetRotation FMOD_Geometry_GetRotation;
pfFMOD_Geometry_SetPosition FMOD_Geometry_SetPosition;
pfFMOD_Geometry_GetPosition FMOD_Geometry_GetPosition;
pfFMOD_Geometry_SetScale FMOD_Geometry_SetScale;
pfFMOD_Geometry_GetScale FMOD_Geometry_GetScale;
pfFMOD_Geometry_Save FMOD_Geometry_Save;

/*
     Userdata set/get.
*/

typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, void *userdata) pfFMOD_Geometry_SetUserData;
typedef FMOD_RESULT function(FMOD_GEOMETRY *geometry, void **userdata) pfFMOD_Geometry_GetUserData;

pfFMOD_Geometry_SetUserData FMOD_Geometry_SetUserData;
pfFMOD_Geometry_GetUserData FMOD_Geometry_GetUserData;

/*
    'Reverb' API
*/

typedef FMOD_RESULT function(FMOD_REVERB *reverb) pfFMOD_Reverb_Release;

////typedef FMOD_RESULT function(FMOD_REVERB *reverb, FMOD_VECTOR position) pfFMOD_Reverb_SetPosition;
////typedef FMOD_RESULT function(FMOD_REVERB *reverb, FMOD_VECTOR *position) pfFMOD_Reverb_GetPosition;
////typedef FMOD_RESULT function(FMOD_REVERB *reverb, float radius) pfFMOD_Reverb_SetMinRadius;
////typedef FMOD_RESULT function(FMOD_REVERB *reverb, float *radius) pfFMOD_Reverb_GetMinRadius;
////typedef FMOD_RESULT function(FMOD_REVERB *reverb, float radius) pfFMOD_Reverb_SetMaxRadius;
////typedef FMOD_RESULT function(FMOD_REVERB *reverb, float *radius) pfFMOD_Reverb_GetMaxRadius;
typedef FMOD_RESULT function(FMOD_REVERB *reverb, FMOD_REVERB_PROPERTIES *properties) pfFMOD_Reverb_SetProperties;
typedef FMOD_RESULT function(FMOD_REVERB *reverb, FMOD_REVERB_PROPERTIES *properties) pfFMOD_Reverb_GetProperties;

pfFMOD_Reverb_Release FMOD_Reverb_Release;

////pfFMOD_Reverb_SetPosition FMOD_Reverb_SetPosition;
////pfFMOD_Reverb_GetPosition FMOD_Reverb_GetPosition;
////pfFMOD_Reverb_SetMinRadius FMOD_Reverb_SetMinRadius;
////pfFMOD_Reverb_GetMinRadius FMOD_Reverb_GetMinRadius;
////pfFMOD_Reverb_SetMaxRadius FMOD_Reverb_SetMaxRadius;
////pfFMOD_Reverb_GetMaxRadius FMOD_Reverb_GetMaxRadius;
pfFMOD_Reverb_SetProperties FMOD_Reverb_SetProperties;
pfFMOD_Reverb_GetProperties FMOD_Reverb_GetProperties;



extern(D):

private void load(SharedLib lib) {
    bindFunc(FMOD_Memory_Initialize)("FMOD_Memory_Initialize", lib);
    bindFunc(FMOD_Memory_GetStats)("FMOD_Memory_GetStats", lib);
    bindFunc(FMOD_Debug_SetLevel)("FMOD_Debug_SetLevel", lib);
    bindFunc(FMOD_Debug_GetLevel)("FMOD_Debug_GetLevel", lib);
    bindFunc(FMOD_File_SetDiskBusy)("FMOD_File_SetDiskBusy", lib);
    bindFunc(FMOD_File_GetDiskBusy)("FMOD_File_GetDiskBusy", lib);


    bindFunc(FMOD_System_Create)("FMOD_System_Create", lib);
    bindFunc(FMOD_System_Release)("FMOD_System_Release", lib);


    bindFunc(FMOD_System_SetOutput)("FMOD_System_SetOutput", lib);
    bindFunc(FMOD_System_GetOutput)("FMOD_System_GetOutput", lib);
    bindFunc(FMOD_System_GetNumDrivers)("FMOD_System_GetNumDrivers", lib);
    bindFunc(FMOD_System_GetDriverInfo)("FMOD_System_GetDriverInfo", lib);
    bindFunc(FMOD_System_GetDriverCaps)("FMOD_System_GetDriverCaps", lib);
    bindFunc(FMOD_System_SetDriver)("FMOD_System_SetDriver", lib);
    bindFunc(FMOD_System_GetDriver)("FMOD_System_GetDriver", lib);
    bindFunc(FMOD_System_SetHardwareChannels)("FMOD_System_SetHardwareChannels", lib);
    bindFunc(FMOD_System_SetSoftwareChannels)("FMOD_System_SetSoftwareChannels", lib);
    bindFunc(FMOD_System_GetSoftwareChannels)("FMOD_System_GetSoftwareChannels", lib);
    bindFunc(FMOD_System_SetSoftwareFormat)("FMOD_System_SetSoftwareFormat", lib);
    bindFunc(FMOD_System_GetSoftwareFormat)("FMOD_System_GetSoftwareFormat", lib);
    bindFunc(FMOD_System_SetDSPBufferSize)("FMOD_System_SetDSPBufferSize", lib);
    bindFunc(FMOD_System_GetDSPBufferSize)("FMOD_System_GetDSPBufferSize", lib);
    bindFunc(FMOD_System_SetFileSystem)("FMOD_System_SetFileSystem", lib);
    bindFunc(FMOD_System_AttachFileSystem)("FMOD_System_AttachFileSystem", lib);
    bindFunc(FMOD_System_SetAdvancedSettings)("FMOD_System_SetAdvancedSettings", lib);
    bindFunc(FMOD_System_GetAdvancedSettings)("FMOD_System_GetAdvancedSettings", lib);
    bindFunc(FMOD_System_SetSpeakerMode)("FMOD_System_SetSpeakerMode", lib);
    bindFunc(FMOD_System_GetSpeakerMode)("FMOD_System_GetSpeakerMode", lib);


    bindFunc(FMOD_System_SetPluginPath)("FMOD_System_SetPluginPath", lib);
    bindFunc(FMOD_System_LoadPlugin)("FMOD_System_LoadPlugin", lib);
    bindFunc(FMOD_System_GetNumPlugins)("FMOD_System_GetNumPlugins", lib);
    bindFunc(FMOD_System_GetPluginInfo)("FMOD_System_GetPluginInfo", lib);
    bindFunc(FMOD_System_UnloadPlugin)("FMOD_System_UnloadPlugin", lib);
    bindFunc(FMOD_System_SetOutputByPlugin)("FMOD_System_SetOutputByPlugin", lib);
    bindFunc(FMOD_System_GetOutputByPlugin)("FMOD_System_GetOutputByPlugin", lib);
    bindFunc(FMOD_System_CreateCodec)("FMOD_System_CreateCodec", lib);


    bindFunc(FMOD_System_Init)("FMOD_System_Init", lib);
    bindFunc(FMOD_System_Close)("FMOD_System_Close", lib);


    bindFunc(FMOD_System_Update)("FMOD_System_Update", lib);

    bindFunc(FMOD_System_Set3DSettings)("FMOD_System_Set3DSettings", lib);
    bindFunc(FMOD_System_Get3DSettings)("FMOD_System_Get3DSettings", lib);
    bindFunc(FMOD_System_Set3DNumListeners)("FMOD_System_Set3DNumListeners", lib);
    bindFunc(FMOD_System_Get3DNumListeners)("FMOD_System_Get3DNumListeners", lib);
    bindFunc(FMOD_System_Set3DListenerAttributes)("FMOD_System_Set3DListenerAttributes", lib);
    bindFunc(FMOD_System_Get3DListenerAttributes)("FMOD_System_Get3DListenerAttributes", lib);

////    bindFunc(FMOD_System_SetSpeakerPosition)("FMOD_System_SetSpeakerPosition", lib);
////    bindFunc(FMOD_System_GetSpeakerPosition)("FMOD_System_GetSpeakerPosition", lib);
    bindFunc(FMOD_System_SetStreamBufferSize)("FMOD_System_SetStreamBufferSize", lib);
    bindFunc(FMOD_System_GetStreamBufferSize)("FMOD_System_GetStreamBufferSize", lib);


    bindFunc(FMOD_System_GetVersion)("FMOD_System_GetVersion", lib);
    bindFunc(FMOD_System_GetOutputHandle)("FMOD_System_GetOutputHandle", lib);
    bindFunc(FMOD_System_GetChannelsPlaying)("FMOD_System_GetChannelsPlaying", lib);
    bindFunc(FMOD_System_GetHardwareChannels)("FMOD_System_GetHardwareChannels", lib);
    bindFunc(FMOD_System_GetCPUUsage)("FMOD_System_GetCPUUsage", lib);
    bindFunc(FMOD_System_GetSoundRAM)("FMOD_System_GetSoundRAM", lib);
    bindFunc(FMOD_System_GetNumCDROMDrives)("FMOD_System_GetNumCDROMDrives", lib);
    bindFunc(FMOD_System_GetCDROMDriveName)("FMOD_System_GetCDROMDriveName", lib);
    bindFunc(FMOD_System_GetSpectrum)("FMOD_System_GetSpectrum", lib);
    bindFunc(FMOD_System_GetWaveData)("FMOD_System_GetWaveData", lib);


    bindFunc(FMOD_System_CreateSound)("FMOD_System_CreateSound", lib);
    bindFunc(FMOD_System_CreateStream)("FMOD_System_CreateStream", lib);
    bindFunc(FMOD_System_CreateDSP)("FMOD_System_CreateDSP", lib);
    bindFunc(FMOD_System_CreateDSPByType)("FMOD_System_CreateDSPByType", lib);
////bindFunc(FMOD_System_CreateDSPByIndex)("FMOD_System_CreateDSPByIndex", lib);
    bindFunc(FMOD_System_CreateChannelGroup)("FMOD_System_CreateChannelGroup", lib);
////    bindFunc(FMOD_System_Create3DReverb)("FMOD_System_Create3DReverb", lib);

    bindFunc(FMOD_System_PlaySound)("FMOD_System_PlaySound", lib);
    bindFunc(FMOD_System_PlayDSP)("FMOD_System_PlayDSP", lib);
    bindFunc(FMOD_System_GetChannel)("FMOD_System_GetChannel", lib);
    bindFunc(FMOD_System_GetMasterChannelGroup)("FMOD_System_GetMasterChannelGroup", lib);


    bindFunc(FMOD_System_SetReverbProperties)("FMOD_System_SetReverbProperties", lib);
    bindFunc(FMOD_System_GetReverbProperties)("FMOD_System_GetReverbProperties", lib);
////    bindFunc(FMOD_System_Set3DReverbAmbientProperties)("FMOD_System_Set3DReverbAmbientProperties", lib);
////    bindFunc(FMOD_System_Get3DReverbAmbientProperties)("FMOD_System_Get3DReverbAmbientProperties", lib);


    bindFunc(FMOD_System_GetDSPHead)("FMOD_System_GetDSPHead", lib);
    bindFunc(FMOD_System_AddDSP)("FMOD_System_AddDSP", lib);
    bindFunc(FMOD_System_LockDSP)("FMOD_System_LockDSP", lib);
    bindFunc(FMOD_System_UnlockDSP)("FMOD_System_UnlockDSP", lib);


////    bindFunc(FMOD_System_SetRecordDriver)("FMOD_System_SetRecordDriver", lib);
////    bindFunc(FMOD_System_GetRecordDriver)("FMOD_System_GetRecordDriver", lib);
    bindFunc(FMOD_System_GetRecordNumDrivers)("FMOD_System_GetRecordNumDrivers", lib);
////    bindFunc(FMOD_System_GetRecordDriverName)("FMOD_System_GetRecordDriverName", lib);
    bindFunc(FMOD_System_GetRecordPosition)("FMOD_System_GetRecordPosition", lib);

    bindFunc(FMOD_System_RecordStart)("FMOD_System_RecordStart", lib);
    bindFunc(FMOD_System_RecordStop)("FMOD_System_RecordStop", lib);
    bindFunc(FMOD_System_IsRecording)("FMOD_System_IsRecording", lib);


    bindFunc(FMOD_System_CreateGeometry)("FMOD_System_CreateGeometry", lib);
    bindFunc(FMOD_System_SetGeometrySettings)("FMOD_System_SetGeometrySettings", lib);
    bindFunc(FMOD_System_GetGeometrySettings)("FMOD_System_GetGeometrySettings", lib);
    bindFunc(FMOD_System_LoadGeometry)("FMOD_System_LoadGeometry", lib);


    bindFunc(FMOD_System_SetNetworkProxy)("FMOD_System_SetNetworkProxy", lib);
    bindFunc(FMOD_System_GetNetworkProxy)("FMOD_System_GetNetworkProxy", lib);
    bindFunc(FMOD_System_SetNetworkTimeout)("FMOD_System_SetNetworkTimeout", lib);
    bindFunc(FMOD_System_GetNetworkTimeout)("FMOD_System_GetNetworkTimeout", lib);


    bindFunc(FMOD_System_SetUserData)("FMOD_System_SetUserData", lib);
    bindFunc(FMOD_System_GetUserData)("FMOD_System_GetUserData", lib);


    bindFunc(FMOD_Sound_Release)("FMOD_Sound_Release", lib);
    bindFunc(FMOD_Sound_GetSystemObject)("FMOD_Sound_GetSystemObject", lib);


    bindFunc(FMOD_Sound_Lock)("FMOD_Sound_Lock", lib);
    bindFunc(FMOD_Sound_Unlock)("FMOD_Sound_Unlock", lib);
    bindFunc(FMOD_Sound_SetDefaults)("FMOD_Sound_SetDefaults", lib);
    bindFunc(FMOD_Sound_GetDefaults)("FMOD_Sound_GetDefaults", lib);
    bindFunc(FMOD_Sound_SetVariations)("FMOD_Sound_SetVariations", lib);
    bindFunc(FMOD_Sound_GetVariations)("FMOD_Sound_GetVariations", lib);
    bindFunc(FMOD_Sound_Set3DMinMaxDistance)("FMOD_Sound_Set3DMinMaxDistance", lib);
    bindFunc(FMOD_Sound_Get3DMinMaxDistance)("FMOD_Sound_Get3DMinMaxDistance", lib);
    bindFunc(FMOD_Sound_Set3DConeSettings)("FMOD_Sound_Set3DConeSettings", lib);
    bindFunc(FMOD_Sound_Get3DConeSettings)("FMOD_Sound_Get3DConeSettings", lib);
    bindFunc(FMOD_Sound_Set3DCustomRolloff)("FMOD_Sound_Set3DCustomRolloff", lib);
    bindFunc(FMOD_Sound_Get3DCustomRolloff)("FMOD_Sound_Get3DCustomRolloff", lib);
    bindFunc(FMOD_Sound_SetSubSound)("FMOD_Sound_SetSubSound", lib);
    bindFunc(FMOD_Sound_GetSubSound)("FMOD_Sound_GetSubSound", lib);
    bindFunc(FMOD_Sound_SetSubSoundSentence)("FMOD_Sound_SetSubSoundSentence", lib);
    bindFunc(FMOD_Sound_GetName)("FMOD_Sound_GetName", lib);
    bindFunc(FMOD_Sound_GetLength)("FMOD_Sound_GetLength", lib);
    bindFunc(FMOD_Sound_GetFormat)("FMOD_Sound_GetFormat", lib);
    bindFunc(FMOD_Sound_GetNumSubSounds)("FMOD_Sound_GetNumSubSounds", lib);
    bindFunc(FMOD_Sound_GetNumTags)("FMOD_Sound_GetNumTags", lib);
    bindFunc(FMOD_Sound_GetTag)("FMOD_Sound_GetTag", lib);
    bindFunc(FMOD_Sound_GetOpenState)("FMOD_Sound_GetOpenState", lib);
    bindFunc(FMOD_Sound_ReadData)("FMOD_Sound_ReadData", lib);
    bindFunc(FMOD_Sound_SeekData)("FMOD_Sound_SeekData", lib);


    bindFunc(FMOD_Sound_GetNumSyncPoints)("FMOD_Sound_GetNumSyncPoints", lib);
    bindFunc(FMOD_Sound_GetSyncPoint)("FMOD_Sound_GetSyncPoint", lib);
    bindFunc(FMOD_Sound_GetSyncPointInfo)("FMOD_Sound_GetSyncPointInfo", lib);
    bindFunc(FMOD_Sound_AddSyncPoint)("FMOD_Sound_AddSyncPoint", lib);
    bindFunc(FMOD_Sound_DeleteSyncPoint)("FMOD_Sound_DeleteSyncPoint", lib);


    bindFunc(FMOD_Sound_SetMode)("FMOD_Sound_SetMode", lib);
    bindFunc(FMOD_Sound_GetMode)("FMOD_Sound_GetMode", lib);
    bindFunc(FMOD_Sound_SetLoopCount)("FMOD_Sound_SetLoopCount", lib);
    bindFunc(FMOD_Sound_GetLoopCount)("FMOD_Sound_GetLoopCount", lib);
    bindFunc(FMOD_Sound_SetLoopPoints)("FMOD_Sound_SetLoopPoints", lib);
    bindFunc(FMOD_Sound_GetLoopPoints)("FMOD_Sound_GetLoopPoints", lib);


    bindFunc(FMOD_Sound_SetUserData)("FMOD_Sound_SetUserData", lib);
    bindFunc(FMOD_Sound_GetUserData)("FMOD_Sound_GetUserData", lib);


    bindFunc(FMOD_Channel_GetSystemObject)("FMOD_Channel_GetSystemObject", lib);

    bindFunc(FMOD_Channel_Stop)("FMOD_Channel_Stop", lib);
    bindFunc(FMOD_Channel_SetPaused)("FMOD_Channel_SetPaused", lib);
    bindFunc(FMOD_Channel_GetPaused)("FMOD_Channel_GetPaused", lib);
    bindFunc(FMOD_Channel_SetVolume)("FMOD_Channel_SetVolume", lib);
    bindFunc(FMOD_Channel_GetVolume)("FMOD_Channel_GetVolume", lib);
    bindFunc(FMOD_Channel_SetFrequency)("FMOD_Channel_SetFrequency", lib);
    bindFunc(FMOD_Channel_GetFrequency)("FMOD_Channel_GetFrequency", lib);
    bindFunc(FMOD_Channel_SetPan)("FMOD_Channel_SetPan", lib);
    bindFunc(FMOD_Channel_GetPan)("FMOD_Channel_GetPan", lib);
    bindFunc(FMOD_Channel_SetDelay)("FMOD_Channel_SetDelay", lib);
    bindFunc(FMOD_Channel_GetDelay)("FMOD_Channel_GetDelay", lib);
    bindFunc(FMOD_Channel_SetSpeakerMix)("FMOD_Channel_SetSpeakerMix", lib);
    bindFunc(FMOD_Channel_GetSpeakerMix)("FMOD_Channel_GetSpeakerMix", lib);
    bindFunc(FMOD_Channel_SetSpeakerLevels)("FMOD_Channel_SetSpeakerLevels", lib);
    bindFunc(FMOD_Channel_GetSpeakerLevels)("FMOD_Channel_GetSpeakerLevels", lib);
    bindFunc(FMOD_Channel_SetMute)("FMOD_Channel_SetMute", lib);
    bindFunc(FMOD_Channel_GetMute)("FMOD_Channel_GetMute", lib);
    bindFunc(FMOD_Channel_SetPriority)("FMOD_Channel_SetPriority", lib);
    bindFunc(FMOD_Channel_GetPriority)("FMOD_Channel_GetPriority", lib);
    bindFunc(FMOD_Channel_SetPosition)("FMOD_Channel_SetPosition", lib);
    bindFunc(FMOD_Channel_GetPosition)("FMOD_Channel_GetPosition", lib);
    bindFunc(FMOD_Channel_SetReverbProperties)("FMOD_Channel_SetReverbProperties", lib);
    bindFunc(FMOD_Channel_GetReverbProperties)("FMOD_Channel_GetReverbProperties", lib);

    bindFunc(FMOD_Channel_SetChannelGroup)("FMOD_Channel_SetChannelGroup", lib);
    bindFunc(FMOD_Channel_GetChannelGroup)("FMOD_Channel_GetChannelGroup", lib);
    bindFunc(FMOD_Channel_SetCallback)("FMOD_Channel_SetCallback", lib);


    bindFunc(FMOD_Channel_Set3DAttributes)("FMOD_Channel_Set3DAttributes", lib);
    bindFunc(FMOD_Channel_Get3DAttributes)("FMOD_Channel_Get3DAttributes", lib);
    bindFunc(FMOD_Channel_Set3DMinMaxDistance)("FMOD_Channel_Set3DMinMaxDistance", lib);
    bindFunc(FMOD_Channel_Get3DMinMaxDistance)("FMOD_Channel_Get3DMinMaxDistance", lib);
    bindFunc(FMOD_Channel_Set3DConeSettings)("FMOD_Channel_Set3DConeSettings", lib);
    bindFunc(FMOD_Channel_Get3DConeSettings)("FMOD_Channel_Get3DConeSettings", lib);
    bindFunc(FMOD_Channel_Set3DConeOrientation)("FMOD_Channel_Set3DConeOrientation", lib);
    bindFunc(FMOD_Channel_Get3DConeOrientation)("FMOD_Channel_Get3DConeOrientation", lib);
    bindFunc(FMOD_Channel_Set3DCustomRolloff)("FMOD_Channel_Set3DCustomRolloff", lib);
    bindFunc(FMOD_Channel_Get3DCustomRolloff)("FMOD_Channel_Get3DCustomRolloff", lib);
    bindFunc(FMOD_Channel_Set3DOcclusion)("FMOD_Channel_Set3DOcclusion", lib);
    bindFunc(FMOD_Channel_Get3DOcclusion)("FMOD_Channel_Get3DOcclusion", lib);
    bindFunc(FMOD_Channel_Set3DSpread)("FMOD_Channel_Set3DSpread", lib);
    bindFunc(FMOD_Channel_Get3DSpread)("FMOD_Channel_Get3DSpread", lib);
    bindFunc(FMOD_Channel_Set3DPanLevel)("FMOD_Channel_Set3DPanLevel", lib);
    bindFunc(FMOD_Channel_Get3DPanLevel)("FMOD_Channel_Get3DPanLevel", lib);
    bindFunc(FMOD_Channel_Set3DDopplerLevel)("FMOD_Channel_Set3DDopplerLevel", lib);
    bindFunc(FMOD_Channel_Get3DDopplerLevel)("FMOD_Channel_Get3DDopplerLevel", lib);


    bindFunc(FMOD_Channel_GetDSPHead)("FMOD_Channel_GetDSPHead", lib);
    bindFunc(FMOD_Channel_AddDSP)("FMOD_Channel_AddDSP", lib);


    bindFunc(FMOD_Channel_IsPlaying)("FMOD_Channel_IsPlaying", lib);
    bindFunc(FMOD_Channel_IsVirtual)("FMOD_Channel_IsVirtual", lib);
    bindFunc(FMOD_Channel_GetAudibility)("FMOD_Channel_GetAudibility", lib);
    bindFunc(FMOD_Channel_GetCurrentSound)("FMOD_Channel_GetCurrentSound", lib);
    bindFunc(FMOD_Channel_GetSpectrum)("FMOD_Channel_GetSpectrum", lib);
    bindFunc(FMOD_Channel_GetWaveData)("FMOD_Channel_GetWaveData", lib);
    bindFunc(FMOD_Channel_GetIndex)("FMOD_Channel_GetIndex", lib);


    bindFunc(FMOD_Channel_SetMode)("FMOD_Channel_SetMode", lib);
    bindFunc(FMOD_Channel_GetMode)("FMOD_Channel_GetMode", lib);
    bindFunc(FMOD_Channel_SetLoopCount)("FMOD_Channel_SetLoopCount", lib);
    bindFunc(FMOD_Channel_GetLoopCount)("FMOD_Channel_GetLoopCount", lib);
    bindFunc(FMOD_Channel_SetLoopPoints)("FMOD_Channel_SetLoopPoints", lib);
    bindFunc(FMOD_Channel_GetLoopPoints)("FMOD_Channel_GetLoopPoints", lib);


    bindFunc(FMOD_Channel_SetUserData)("FMOD_Channel_SetUserData", lib);
    bindFunc(FMOD_Channel_GetUserData)("FMOD_Channel_GetUserData", lib);


    bindFunc(FMOD_ChannelGroup_Release)("FMOD_ChannelGroup_Release", lib);
    bindFunc(FMOD_ChannelGroup_GetSystemObject)("FMOD_ChannelGroup_GetSystemObject", lib);


    bindFunc(FMOD_ChannelGroup_SetVolume)("FMOD_ChannelGroup_SetVolume", lib);
    bindFunc(FMOD_ChannelGroup_GetVolume)("FMOD_ChannelGroup_GetVolume", lib);
    bindFunc(FMOD_ChannelGroup_SetPitch)("FMOD_ChannelGroup_SetPitch", lib);
    bindFunc(FMOD_ChannelGroup_GetPitch)("FMOD_ChannelGroup_GetPitch", lib);


    bindFunc(FMOD_ChannelGroup_Stop)("FMOD_ChannelGroup_Stop", lib);
////    bindFunc(FMOD_ChannelGroup_OverridePaused)("FMOD_ChannelGroup_OverridePaused", lib);
    bindFunc(FMOD_ChannelGroup_OverrideVolume)("FMOD_ChannelGroup_OverrideVolume", lib);
    bindFunc(FMOD_ChannelGroup_OverrideFrequency)("FMOD_ChannelGroup_OverrideFrequency", lib);
    bindFunc(FMOD_ChannelGroup_OverridePan)("FMOD_ChannelGroup_OverridePan", lib);
////    bindFunc(FMOD_ChannelGroup_OverrideMute)("FMOD_ChannelGroup_OverrideMute", lib);
    bindFunc(FMOD_ChannelGroup_OverrideReverbProperties)("FMOD_ChannelGroup_OverrideReverbProperties", lib);
    bindFunc(FMOD_ChannelGroup_Override3DAttributes)("FMOD_ChannelGroup_Override3DAttributes", lib);
    bindFunc(FMOD_ChannelGroup_OverrideSpeakerMix)("FMOD_ChannelGroup_OverrideSpeakerMix", lib);


    bindFunc(FMOD_ChannelGroup_AddGroup)("FMOD_ChannelGroup_AddGroup", lib);
    bindFunc(FMOD_ChannelGroup_GetNumGroups)("FMOD_ChannelGroup_GetNumGroups", lib);
    bindFunc(FMOD_ChannelGroup_GetGroup)("FMOD_ChannelGroup_GetGroup", lib);
    bindFunc(FMOD_ChannelGroup_GetParentGroup)("FMOD_ChannelGroup_GetParentGroup", lib);


    bindFunc(FMOD_ChannelGroup_GetDSPHead)("FMOD_ChannelGroup_GetDSPHead", lib);
    bindFunc(FMOD_ChannelGroup_AddDSP)("FMOD_ChannelGroup_AddDSP", lib);


    bindFunc(FMOD_ChannelGroup_GetName)("FMOD_ChannelGroup_GetName", lib);
    bindFunc(FMOD_ChannelGroup_GetNumChannels)("FMOD_ChannelGroup_GetNumChannels", lib);
    bindFunc(FMOD_ChannelGroup_GetChannel)("FMOD_ChannelGroup_GetChannel", lib);
    bindFunc(FMOD_ChannelGroup_GetSpectrum)("FMOD_ChannelGroup_GetSpectrum", lib);
    bindFunc(FMOD_ChannelGroup_GetWaveData)("FMOD_ChannelGroup_GetWaveData", lib);


    bindFunc(FMOD_ChannelGroup_SetUserData)("FMOD_ChannelGroup_SetUserData", lib);
    bindFunc(FMOD_ChannelGroup_GetUserData)("FMOD_ChannelGroup_GetUserData", lib);


    bindFunc(FMOD_DSP_Release)("FMOD_DSP_Release", lib);
    bindFunc(FMOD_DSP_GetSystemObject)("FMOD_DSP_GetSystemObject", lib);


    bindFunc(FMOD_DSP_AddInput)("FMOD_DSP_AddInput", lib);
    bindFunc(FMOD_DSP_DisconnectFrom)("FMOD_DSP_DisconnectFrom", lib);
    bindFunc(FMOD_DSP_DisconnectAll)("FMOD_DSP_DisconnectAll", lib);
    bindFunc(FMOD_DSP_Remove)("FMOD_DSP_Remove", lib);
    bindFunc(FMOD_DSP_GetNumInputs)("FMOD_DSP_GetNumInputs", lib);
    bindFunc(FMOD_DSP_GetNumOutputs)("FMOD_DSP_GetNumOutputs", lib);
    bindFunc(FMOD_DSP_GetInput)("FMOD_DSP_GetInput", lib);
    bindFunc(FMOD_DSP_GetOutput)("FMOD_DSP_GetOutput", lib);
////    bindFunc(FMOD_DSP_SetInputMix)("FMOD_DSP_SetInputMix", lib);
////    bindFunc(FMOD_DSP_GetInputMix)("FMOD_DSP_GetInputMix", lib);
////    bindFunc(FMOD_DSP_SetInputLevels)("FMOD_DSP_SetInputLevels", lib);
////    bindFunc(FMOD_DSP_GetInputLevels)("FMOD_DSP_GetInputLevels", lib);
////    bindFunc(FMOD_DSP_SetOutputMix)("FMOD_DSP_SetOutputMix", lib);
////    bindFunc(FMOD_DSP_GetOutputMix)("FMOD_DSP_GetOutputMix", lib);
////    bindFunc(FMOD_DSP_SetOutputLevels)("FMOD_DSP_SetOutputLevels", lib);
////    bindFunc(FMOD_DSP_GetOutputLevels)("FMOD_DSP_GetOutputLevels", lib);


    bindFunc(FMOD_DSP_SetActive)("FMOD_DSP_SetActive", lib);
    bindFunc(FMOD_DSP_GetActive)("FMOD_DSP_GetActive", lib);
    bindFunc(FMOD_DSP_SetBypass)("FMOD_DSP_SetBypass", lib);
    bindFunc(FMOD_DSP_GetBypass)("FMOD_DSP_GetBypass", lib);
    bindFunc(FMOD_DSP_Reset)("FMOD_DSP_Reset", lib);


    bindFunc(FMOD_DSP_SetParameter)("FMOD_DSP_SetParameter", lib);
    bindFunc(FMOD_DSP_GetParameter)("FMOD_DSP_GetParameter", lib);
    bindFunc(FMOD_DSP_GetNumParameters)("FMOD_DSP_GetNumParameters", lib);
    bindFunc(FMOD_DSP_GetParameterInfo)("FMOD_DSP_GetParameterInfo", lib);
    bindFunc(FMOD_DSP_ShowConfigDialog)("FMOD_DSP_ShowConfigDialog", lib);


    bindFunc(FMOD_DSP_GetInfo)("FMOD_DSP_GetInfo", lib);
    bindFunc(FMOD_DSP_GetType)("FMOD_DSP_GetType", lib);
    bindFunc(FMOD_DSP_SetDefaults)("FMOD_DSP_SetDefaults", lib);
    bindFunc(FMOD_DSP_GetDefaults)("FMOD_DSP_GetDefaults", lib);


    bindFunc(FMOD_DSP_SetUserData)("FMOD_DSP_SetUserData", lib);
    bindFunc(FMOD_DSP_GetUserData)("FMOD_DSP_GetUserData", lib);


    bindFunc(FMOD_Geometry_Release)("FMOD_Geometry_Release", lib);

    bindFunc(FMOD_Geometry_AddPolygon)("FMOD_Geometry_AddPolygon", lib);
    bindFunc(FMOD_Geometry_GetNumPolygons)("FMOD_Geometry_GetNumPolygons", lib);
    bindFunc(FMOD_Geometry_GetMaxPolygons)("FMOD_Geometry_GetMaxPolygons", lib);
    bindFunc(FMOD_Geometry_GetPolygonNumVertices)("FMOD_Geometry_GetPolygonNumVertices", lib);
    bindFunc(FMOD_Geometry_SetPolygonVertex)("FMOD_Geometry_SetPolygonVertex", lib);
    bindFunc(FMOD_Geometry_GetPolygonVertex)("FMOD_Geometry_GetPolygonVertex", lib);
    bindFunc(FMOD_Geometry_SetPolygonAttributes)("FMOD_Geometry_SetPolygonAttributes", lib);
    bindFunc(FMOD_Geometry_GetPolygonAttributes)("FMOD_Geometry_GetPolygonAttributes", lib);

    bindFunc(FMOD_Geometry_SetActive)("FMOD_Geometry_SetActive", lib);
    bindFunc(FMOD_Geometry_GetActive)("FMOD_Geometry_GetActive", lib);
    bindFunc(FMOD_Geometry_SetRotation)("FMOD_Geometry_SetRotation", lib);
    bindFunc(FMOD_Geometry_GetRotation)("FMOD_Geometry_GetRotation", lib);
    bindFunc(FMOD_Geometry_SetPosition)("FMOD_Geometry_SetPosition", lib);
    bindFunc(FMOD_Geometry_GetPosition)("FMOD_Geometry_GetPosition", lib);
    bindFunc(FMOD_Geometry_SetScale)("FMOD_Geometry_SetScale", lib);
    bindFunc(FMOD_Geometry_GetScale)("FMOD_Geometry_GetScale", lib);
    bindFunc(FMOD_Geometry_Save)("FMOD_Geometry_Save", lib);


    bindFunc(FMOD_Geometry_SetUserData)("FMOD_Geometry_SetUserData", lib);
    bindFunc(FMOD_Geometry_GetUserData)("FMOD_Geometry_GetUserData", lib);


    bindFunc(FMOD_Reverb_Release)("FMOD_Reverb_Release", lib);

////    bindFunc(FMOD_Reverb_SetPosition)("FMOD_Reverb_SetPosition", lib);
////    bindFunc(FMOD_Reverb_GetPosition)("FMOD_Reverb_GetPosition", lib);
////    bindFunc(FMOD_Reverb_SetMinRadius)("FMOD_Reverb_SetMinRadius", lib);
////    bindFunc(FMOD_Reverb_GetMinRadius)("FMOD_Reverb_GetMinRadius", lib);
////    bindFunc(FMOD_Reverb_SetMaxRadius)("FMOD_Reverb_SetMaxRadius", lib);
////    bindFunc(FMOD_Reverb_GetMaxRadius)("FMOD_Reverb_GetMaxRadius", lib);
    bindFunc(FMOD_Reverb_SetProperties)("FMOD_Reverb_SetProperties", lib);
    bindFunc(FMOD_Reverb_GetProperties)("FMOD_Reverb_GetProperties", lib);
}

GenericLoader DerelictFMOD;
static this() {
    DerelictFMOD.setup(
        "fmodex.dll, fmodexp.dll",
        "libfmodex.so, libfmodexp.so",
        "",
        &load
    );
}
