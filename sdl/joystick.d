module sdl.joystick;

import derelict.sdl.sdl;
import std.string;
import misc.logger;

class SDLJoystick
{
    private
    {
        SDL_Joystick* m_handle;
        int m_index;

        const PRESSED = true,
              RELEASED = false;

        bool[] m_button_pressed;
        float[] m_axis;
        char[] m_name;

        void open(int num)
        {
            m_index = num;
            m_handle = SDL_JoystickOpen(num);
        }

        void close()
        {
            if (opened()) SDL_JoystickClose(m_handle);
        }

        bool opened()
        {
            return (SDL_JoystickOpened(m_index) != 0);
        }
    }

    public
    {
        this(int index)
        {
            open(index);

            m_button_pressed.length = SDL_JoystickNumButtons(m_handle);
            m_button_pressed[] = RELEASED;

            m_axis.length = SDL_JoystickNumAxes(m_handle);
            m_axis[] = 0.f;

            m_name = std.string.toString(SDL_JoystickName(m_index));

        }

        ~this()
        {
            close();
        }

        bool button(int i)
        {
            return (m_button_pressed[i] == PRESSED);
        }

        void setButton(int i, bool newValue)
        {
            m_button_pressed[i] = newValue;
        }

        void setAxis(int i, float newValue)
        {
            m_axis[i] = newValue;
        }

        float axis(int i)
        {
            return m_axis[i];
        }

        int getNumAxis()
        {
            return m_axis.length;
        }

        int getNumButtons()
        {
            return m_button_pressed.length;
        }

        char[] getName()
        {
            return m_name;
        }
    }
}
