module misc.logger;

import std.stream, std.stdio, std.string;
import misc.singleton;

public import std.string;

class Logger
{
    public
    {
        enum MessageType
        {
            DEBUG = 0, // crap message for debugging to be removed in debug mode, forbidden in release mode
            INFO = 1, // detailed functionning of the program, do not show in release mdoe
            WARNING = 2,
            ERROR = 3,
        }
    }

    void logMessage(char[] message)
    {
        logMessage(MessageType.DEBUG, message);
    }

    abstract void logMessage(int level, char[] message);
}

class FileLogger : Logger
{
    mixin Singleton;
    int indent = 0;

    private
    {
        Stream m_logFile;

        this()
        {
            try
            {
                m_logFile = new File("log.htm", FileMode.OutNew);
                m_logFile.writefln("<html>");
                m_logFile.writefln("<head>");
                m_logFile.writefln("<style>");
                m_logFile.writefln("body { margin: 0px; padding: 0px; font-family: courier new, courier; font-size: 9pt; color: white; background-color: #000000; }");
                m_logFile.writefln("div { margin: 5px 5px 5px 5px; }");
                m_logFile.writefln(".CRAP { color: #9b7766; text-align: left;}");
                m_logFile.writefln(".INFO { color: #80cf49; text-align: left;}");
                m_logFile.writefln(".WTF { color: #ff8020; text-align: left; text-decoration: bold;}");
                m_logFile.writefln(".EPICFAIL { color: #ff2020; text-align: left; text-decoration: bold;}");
                m_logFile.writefln("b { color: #ffff20; text-align: left; }");
                m_logFile.writefln("</style>");
                m_logFile.writefln("</head>");
                m_logFile.writefln("<body>");

            } catch(StreamException e)
            {
                writefln(e.msg);
                m_logFile = null;
            }
        }

        ~this()
        {
            if (m_logFile !is null)
            {
                m_logFile.writefln("</body>");
                m_logFile.writefln("</html>");
                m_logFile.close();
            }
        }

        char[] getTopic(int level)
        {
            switch (level)
            {
                case 0 : return "CRAP";
                case 1 : return "INFO";
                case 2 : return "WTF";
                case 3:
                default: return "EPICFAIL";
            }
        }
    }


    public
    {
        override void logMessage(int level, char[] message)
        {
            if (message.length == 0) return;

            if (message[0] == '<')
            {
                if (indent > 0) indent -= 1;
            }

            int usedIndent = indent;

            if (message[0] == '>')
            {
                if (indent < 32) indent += 1;
            }

            char[] topic = getTopic(level);
            char[] indentString1 = repeat(" ", usedIndent * 4);

            debug
            {
                writefln("[%s] %s %s", topic, indentString1, message);
            }
            else
            {
                //assert(level != MessageType.DEBUG, "no CRAP messages in release mode please");
                //if (level == MessageType.INFO) return;
            }

            if (m_logFile !is null)
            {
                char[] HTMLmessage = message;
                if (message[0] == '>') HTMLmessage = "&rarr; " ~ HTMLmessage[1..$];
                else if (message[0] == '<') HTMLmessage = "&larr; " ~ HTMLmessage[1..$];
                else if (message[0] == '*') HTMLmessage = "&diams; " ~ HTMLmessage[1..$];

                try
                {
                    m_logFile.writefln("<div class=\"%s\" style=\"margin-left: %dpt;\" ><b>[%s]</b> %s</div>", topic, usedIndent * 30, topic, HTMLmessage);
                    m_logFile.flush();
                }
                catch(WriteException e)
                {
                    writefln(e.msg);
                }
            }
        }
    }
}

public static void info(char[] s)
{
    Logger logger = FileLogger.instance;
    logger.logMessage(Logger.MessageType.INFO, s);
}

public static void crap(char[] s)
{
    Logger logger = FileLogger.instance;
    logger.logMessage(Logger.MessageType.DEBUG, s);
}

public static void warn(char[] s)
{
    Logger logger = FileLogger.instance;
    logger.logMessage(Logger.MessageType.WARNING, s);
}

public static void error(char[] s)
{
    Logger logger = FileLogger.instance;
    logger.logMessage(Logger.MessageType.ERROR, s);
}

public static void die()
{
    assert(false);
}

public static void die(char[] s)
{
    error(s);
    die();
}
