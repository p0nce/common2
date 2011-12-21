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
module derelict.portaudio.patypes;

enum PaError
{
	paNoError = 0,
	paNotInitialized = -10000,
	paUnanticipatedHostError,
	paInvalidChannelCount,
}


enum PaErrorCode
{
    paNoError,
    paNotInitialized = -10000,
    paUnanticipatedHostError,
    paInvalidChannelCount,
    paInvalidSampleRate,
    paInvalidDevice,
    paInvalidFlag,
    paSampleFormatNotSupported,
    paBadIODeviceCombination,
    paInsufficientMemory,
    paBufferTooBig,
    paBufferTooSmall,
    paNullCallback,
    paBadStreamPtr,
    paTimedOut,
    paInternalError,
    paDeviceUnavailable,
    paIncompatibleHostApiSpecificStreamInfo,
    paStreamIsStopped,
    paStreamIsNotStopped,
    paInputOverflowed,
    paOutputUnderflowed,
    paHostApiNotFound,
    paInvalidHostApi,
    paCanNotReadFromACallbackStream,
    paCanNotWriteToACallbackStream,
    paCanNotReadFromAnOutputOnlyStream,
    paCanNotWriteToAnInputOnlyStream,
    paIncompatibleStreamHostApi,
    paBadBufferPtr,
}

alias int PaDeviceIndex;


alias int PaHostApiIndex;

enum PaHostApiTypeId
{
    paInDevelopment,
    paDirectSound,
    paMME,
    paASIO,
    paSoundManager,
    paCoreAudio,
    paOSS = 7,
    paALSA,
    paAL,
    paBeOS,
    paWDMKS,
    paJACK,
    paWASAPI,
    paAudioScienceHPI,
}

align(1)
struct PaHostApiInfo
{
    int structVersion;
    PaHostApiTypeId type;
    char *name;
    int deviceCount;
    PaDeviceIndex defaultInputDevice;
    PaDeviceIndex defaultOutputDevice;
}

align(1)
struct PaHostErrorInfo
{
    PaHostApiTypeId hostApiType;
    int errorCode;
    char *errorText;
}


alias double PaTime;

alias uint PaSampleFormat;

const PaSampleFormat paFloat32 = 0x00000001;
const PaSampleFormat paInt32 = 0x00000002;
const PaSampleFormat paInt24 = 0x00000004;
const PaSampleFormat paInt16 = 0x00000008;
const PaSampleFormat paInt8 = 0x000000010;
const PaSampleFormat paUInt8 = 0x00000020;
const PaSampleFormat paCustomFormat = 0x00010000;

const PaSampleFormat paNonInterleaved = 0x80000000;

align(1)
struct PaDeviceInfo
{
    int structVersion;
    char *name;
    PaHostApiIndex hostApi;
    int maxInputChannels;
    int maxOutputChannels;
    PaTime defaultLowInputLatency;
    PaTime defaultLowOutputLatency;
    PaTime defaultHighInputLatency;
    PaTime defaultHighOutputLatency;
    double defaultSampleRate;
}

align(1)
struct PaStreamParameters
{
    PaDeviceIndex device;
    int channelCount;
    PaSampleFormat sampleFormat;
    PaTime suggestedLatency;
    void* hostApiSpecificStreamInfo;
}


alias void PaStream;
alias uint PaStreamFlags;

const PaStreamFlags paClipOff = 0x00000001;
const PaStreamFlags paDitherOff = 0x00000002;

align(1)
struct PaStreamCallbackTimeInfo
{
    PaTime inputBufferAdcTime;
    PaTime currentTime;
    PaTime outputBufferDacTime;
}

alias uint PaStreamCallbackFlags;

enum PaStreamCallbackResult
{
    paContinue,
    paComplete,
    paAbort,
}

struct PaStreamInfo
{
    int structVersion;
    PaTime inputLatency;
    PaTime outputLatency;
    double sampleRate;
}

public typedef extern(C) void function (void *userData) PaStreamFinishedCallback;

alias extern(C) int function(void *input, void *output, uint frameCount, PaStreamCallbackTimeInfo *timeInfo, PaStreamCallbackFlags statusFlags, void *userData) PaStreamCallback;
