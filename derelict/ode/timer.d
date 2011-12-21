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
 * * Neither the names 'Derelict', 'DerelictODE', nor the names of its contributors
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
module derelict.ode.timer;

private
{
    version(Tango)
    {
        import tango.stdc.stdio;
    }
    else
    {
        import std.c.stdio;
    }
}

/*
 * ODE contribution by William DeVore, 2007
 * distanthumans.info
 */

/* stop watch objects */
struct dStopwatch {
    double time;                /* total clock count */
    ulong cc[2];        /* clock count since last `start' */
}

//==============================================================================
// FUNCTIONS
//==============================================================================
extern(C):

/* set a vector/matrix of size n to all zeros, or to a specific value. */
typedef void function(dStopwatch*) pfdStopwatchReset;
typedef void function(dStopwatch*) pfdStopwatchStart;
typedef void function(dStopwatch*) pfdStopwatchStop;
typedef void function(dStopwatch*) pfdStopwatchTime;
pfdStopwatchReset      dStopwatchReset;
pfdStopwatchStart      dStopwatchStart;
pfdStopwatchStop       dStopwatchStop;
pfdStopwatchTime       dStopwatchTime; /* returns total time in secs */

/* code timers */
typedef void function(char* description) pfdTimerStart;
typedef void function(char* description) pfdTimerNow;
typedef void function() pfdTimerEnd;
pfdTimerStart    dTimerStart; /* pass a static string here */
pfdTimerNow      dTimerNow; /* pass a static string here */
pfdTimerEnd      dTimerEnd; /* pass a static string here */

/* print out a timer report. if `average' is nonzero, print out the average
 * time for each slot (this is only meaningful if the same start-now-end
 * calls are being made repeatedly.
 */
typedef void function(FILE* fout, int average) pfdTimerReport;
pfdTimerReport      dTimerReport;

/* resolution */
/* returns the timer ticks per second implied by the timing hardware or API.
 * the actual timer resolution may not be this great.
 */
typedef double function() pfdTimerTicksPerSecond;
pfdTimerTicksPerSecond      dTimerTicksPerSecond;

/* returns an estimate of the actual timer resolution, in seconds. this may
 * be greater than 1/ticks_per_second.
 */
typedef double function() pfdTimerResolution;
pfdTimerResolution      dTimerResolution;



