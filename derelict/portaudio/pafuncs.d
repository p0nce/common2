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
module derelict.portaudio.pafuncs;

import derelict.portaudio.patypes;
import derelict.util.loader;


package void loadPA(SharedLib lib)
{
    bindFunc(Pa_GetVersion)("Pa_GetVersion", lib);
    bindFunc(Pa_GetVersionText)("Pa_GetVersionText", lib);
    bindFunc(Pa_GetErrorText)("Pa_GetErrorText", lib);
    bindFunc(Pa_Initialize)("Pa_Initialize", lib);
    bindFunc(Pa_Terminate)("Pa_Terminate", lib);
    bindFunc(Pa_GetDefaultHostApi)("Pa_GetDefaultHostApi", lib);
    bindFunc(Pa_GetHostApiInfo)("Pa_GetHostApiInfo", lib);
    bindFunc(Pa_HostApiTypeIdToHostApiIndex)("Pa_HostApiTypeIdToHostApiIndex", lib);
    bindFunc(Pa_HostApiDeviceIndexToDeviceIndex)("Pa_HostApiDeviceIndexToDeviceIndex", lib);
    bindFunc(Pa_GetLastHostErrorInfo)("Pa_GetLastHostErrorInfo", lib);
    bindFunc(Pa_GetDeviceCount)("Pa_GetDeviceCount", lib);

    bindFunc(Pa_GetDefaultInputDevice)("Pa_GetDefaultInputDevice", lib);
    bindFunc(Pa_GetDefaultOutputDevice)("Pa_GetDefaultOutputDevice", lib);
    bindFunc(Pa_GetDeviceInfo)("Pa_GetDeviceInfo", lib);
    bindFunc(Pa_IsFormatSupported)("Pa_IsFormatSupported", lib);
    bindFunc(Pa_OpenStream)("Pa_OpenStream", lib);
    bindFunc(Pa_OpenDefaultStream)("Pa_OpenDefaultStream", lib);
    bindFunc(Pa_CloseStream)("Pa_CloseStream", lib);
    bindFunc(Pa_SetStreamFinishedCallback)("Pa_SetStreamFinishedCallback", lib);
    bindFunc(Pa_StartStream)("Pa_StartStream", lib);
    bindFunc(Pa_StopStream)("Pa_StopStream", lib);
    bindFunc(Pa_AbortStream)("Pa_AbortStream", lib);
    bindFunc(Pa_IsStreamStopped)("Pa_IsStreamStopped", lib);
    bindFunc(Pa_IsStreamActive)("Pa_IsStreamActive", lib);
    bindFunc(Pa_GetStreamInfo)("Pa_GetStreamInfo", lib);
    bindFunc(Pa_GetStreamTime)("Pa_GetStreamTime", lib);
    bindFunc(Pa_GetStreamCpuLoad)("Pa_GetStreamCpuLoad", lib);
    bindFunc(Pa_ReadStream)("Pa_ReadStream", lib);
    bindFunc(Pa_WriteStream)("Pa_WriteStream", lib);
    bindFunc(Pa_GetStreamReadAvailable)("Pa_GetStreamReadAvailable", lib);
    bindFunc(Pa_GetStreamWriteAvailable)("Pa_GetStreamWriteAvailable", lib);
    bindFunc(Pa_GetSampleSize)("Pa_GetSampleSize", lib);
    bindFunc(Pa_Sleep)("Pa_Sleep", lib);
    
}


GenericLoader DerelictPA;
static this() {
    DerelictPA.setup(
        "PortAudio.dll",
        "portaudio.so,libportaudio.so", // TODO : more path for linux
        "", // ???
        &loadPA
    );
}


extern(C)
{
	int function() Pa_GetVersion;
	char * function() Pa_GetVersionText;
	char * function(PaError errorCode) Pa_GetErrorText;
	PaError function() Pa_Initialize;
	PaError function() Pa_Terminate;
	PaHostApiIndex function() Pa_GetHostApiCount;
	PaHostApiIndex function() Pa_GetDefaultHostApi;
	PaHostApiInfo * function(PaHostApiIndex) Pa_GetHostApiInfo;
	PaHostApiIndex function(PaHostApiTypeId) Pa_HostApiTypeIdToHostApiIndex;
	PaDeviceIndex function(PaHostApiIndex, int) Pa_HostApiDeviceIndexToDeviceIndex;
	PaHostErrorInfo * function() Pa_GetLastHostErrorInfo;
	PaDeviceIndex function() Pa_GetDeviceCount;
	PaDeviceIndex function() Pa_GetDefaultInputDevice;
	PaDeviceIndex function() Pa_GetDefaultOutputDevice;
	PaDeviceInfo * function(PaDeviceIndex) Pa_GetDeviceInfo;
	PaError function(PaStreamParameters *, PaStreamParameters *, double) Pa_IsFormatSupported;
	PaError function(PaStream **, PaStreamParameters *, PaStreamParameters *, double, uint, PaStreamFlags, PaStreamCallback, void *) Pa_OpenStream;
	PaError function(PaStream **, int, int, PaSampleFormat, double, uint, PaStreamCallback, void *) Pa_OpenDefaultStream;
	PaError function(PaStream *) Pa_CloseStream;
	PaError function(PaStream *, void function(void *)) Pa_SetStreamFinishedCallback;
	PaError function(PaStream *) Pa_StartStream;
	PaError function(PaStream *) Pa_StopStream;
	PaError function(PaStream *) Pa_AbortStream;
	PaError function(PaStream *) Pa_IsStreamStopped;
	PaError function(PaStream *) Pa_IsStreamActive;
	PaStreamInfo * function(PaStream *) Pa_GetStreamInfo;
	PaTime function(PaStream *) Pa_GetStreamTime;
	double function(PaStream *) Pa_GetStreamCpuLoad;
	PaError function(PaStream *, void *, uint) Pa_ReadStream;
	PaError function(PaStream *, void *, uint) Pa_WriteStream;
	int function(PaStream *) Pa_GetStreamReadAvailable;
	int function(PaStream *) Pa_GetStreamWriteAvailable;
	PaError function(PaSampleFormat) Pa_GetSampleSize;
	void function(int) Pa_Sleep;
}