module misc.spinlock;

// a sort of fast mutex, intended to SMALL DELAYS only
// spin-wait loop
// NOT re-entrant !!!

import std.cpuid;

struct Spinlock
{
    enum { UNLOCKED, LOCKED };

    private
    {
        int m_counter;

        bool trylock()
        {
            bool res;
            int * p = &m_counter;
            asm
            {
                mov EAX, UNLOCKED;
                mov ECX, p;
                mov EDX, LOCKED;
                //lock; // not mandatory on mono-processor ! improve speed
                lock;
                cmpxchg [ECX], EDX;
                setz res;
            }
            return res;
        }
    }

    public
    {
        static Spinlock opCall()
        {
            Spinlock res;
            res.m_counter = UNLOCKED;
            return res;
        }

        void lock()
        {
            while(true)
            {
                if (trylock()) break;
                if (sse2())
                asm
                {
                    rep; nop; // PAUSE should improve spin-wait loops
                }
            }
        }

        void unlock()
        {
            m_counter = UNLOCKED; // no need to lock
        }
    }
}
