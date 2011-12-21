module gl.bench;

import derelict.opengl.gl;
import derelict.opengl.glu;
import derelict.opengl.gl20;
import derelict.opengl.extension.ext.timer_query;
import gl.state;
import misc.logger;
import gl.state;

class GLTimer
{
    private
    {
        GLenum m_handle;
        int m_times = 0;
        double m_avgTime = 0;
        double m_minTime = double.infinity;
        double m_maxTime = 0;
    }

    public
    {
        this()
        {
            glGenQueries(1, &m_handle);
            GL.check;
        }

        ~this()
        {
            info(">GLTimer.~this");
            glDeleteQueries(1, &m_handle);
            info("<GLTimer.~this");
        }

        void begin()
        {
            glBeginQuery(GL_TIME_ELAPSED_EXT, m_handle);
        }

        void end()
        {
            glEndQuery(GL_TIME_ELAPSED_EXT);
            m_times++;
        }

        bool available()
        {
            GLint res;
            glGetQueryObjectiv(m_handle, GL_QUERY_RESULT_AVAILABLE, &res);
            return res != 0;
        }

        void updateResults()
        {
            if (m_times > 0)
            {
                long timeElapsed;
                glGetQueryObjectui64vEXT(m_handle, GL_QUERY_RESULT, &timeElapsed);

                m_avgTime = m_avgTime * 0.95 + timeElapsed * 0.05;

                if (timeElapsed < m_minTime) m_minTime = timeElapsed;
                if (timeElapsed > m_maxTime) m_maxTime = timeElapsed;
            }
        }

        double avgTime()
        {
            return m_avgTime;
        }

        double minTime()
        {
            return m_avgTime;
        }

        double maxTime()
        {
            return m_avgTime;
        }
    }

}
