module misc.inifile;

import std.stream, std.conv, std.string;
import misc.textfile;
import misc.logger;



class IniEntry
{
    private
    {
        char[] m_name, m_value;
    }

    public
    {
        this(char[] name, char[] value)
        {
            m_name = name;
            m_value = value;
        }

        char[] name()
        {
            return m_name;
        }

        char[] value()
        {
            return m_value;
        }

        char[] value(char[] v)
        {
            return m_value = v;
        }

        void output(OutputStream stream)
        {
            stream.writeLine(name ~ "=" ~ value);
        }
    }
}

class IniSection
{
    private
    {
        char[] m_name;
        IniEntry[] m_entries;
    }

    public
    {
        this(char[] name)
        {
            m_name = name;
        }

        char[] name()
        {
            return m_name;
        }

        IniEntry findEntry(char[] name)
        {
            for (int i = 0; i < m_entries.length; ++i)
            {
                if (m_entries[i].name == name) return m_entries[i];
            }

            return null;
        }

        IniEntry findOrCreateEntry(char[] name)
        {
            IniEntry res = findEntry(name);
            if (res is null)
            {
                m_entries ~= new IniEntry(name, "");
                return m_entries[m_entries.length - 1];
            }
            else
            {
                return res;
            }
        }

        void output(OutputStream stream)
        {
            stream.writeLine("[" ~ m_name ~ "]");

            for (int i = 0; i < m_entries.length; ++i)
            {
                m_entries[i].output(stream);
            }

            stream.writeLine("");
        }
    }
}

class IniFile
{
    private
    {
        IniSection[] m_sections;

        static const char[] FALSE = "false";
        static const char[] TRUE = "true";
    }

    public
    {
        // create empty (for saving)
        this()
        {
        }

        // create from a file (for loading settings)
        this(char[] path)
        {
            string[] lines = readTextFile(path);

            // parse lines (ignore errors)

            char[] sectionName = null;

            for (int i = 0; i < lines.length; ++i)
            {
                char[] line = strip(lines[i]);
                if ((line != "") && (line[0] != ';'))
                {
                    if ((line[0] == '[') && (line[$-1] == ']'))
                    {
                        sectionName = line[1..$-1];
                        IniSection currentSection = findOrCreateSection(strip(sectionName));
                    }
                    else
                    {
                        int pos = std.string.find(line, "=");
                        if ((pos != -1) && (sectionName !is null))
                        {
                            char[] name = line[0..pos];
                            char[] value = line[pos + 1..$];
                            writeString(sectionName, name, value);
                        }
                    }
                }
            }
        }

        void save (char[] path)
        {
            try
            {
                auto file = new File(path, FileMode.OutNew);
                scope(exit) file.close();

                for (int i = 0; i < m_sections.length; ++i)
                {
                    m_sections[i].output(file);
                }
            }
            catch(StreamException e)
            {
                warn(e.msg);
            }
        }

        IniSection findSection(char[] name)
        {
            for (int i = 0; i < m_sections.length; ++i)
            {
                if (m_sections[i].name == name) return m_sections[i];
            }

            return null;
        }

        IniSection findOrCreateSection(char[] name)
        {
            IniSection res = findSection(name);
            if (res is null)
            {
                m_sections ~= new IniSection(name);
                return m_sections[m_sections.length - 1];
            }
            else
            {
                return res;
            }
        }

        char[] findValue(char[] section, char[] name)
        {
            auto s = findSection(section);
            if (s !is null)
            {
                auto entry = s.findEntry(name);
                if (entry !is null) return entry.value;
            }
            return null;
        }

        char[] readString(char[] section, char[] name, char[] defaultValue)
        {
            char[] res = findValue(section, name);
            if (res is null)
            {
                return defaultValue;
            }
            else
            {
                return res;
            }
        }

        int readInt(char[] section, char[] name, int defaultValue)
        {
            char[] s = findValue(section, name);
            if (s is null)
            {
                return defaultValue;
            }
            else
            {
                try
                {
                    return std.conv.toInt(s);
                }
                catch(ConvError e)
                {
                    return defaultValue;
                }
            }
        }

        bool readBool(char[] section, char[] name, bool defaultValue)
        {
            char[] s = findValue(section, name);

            if (s is null)
            {
                return defaultValue;
            }
            else
            {
                if (s == TRUE)
                {
                    return true;
                }
                else if (s == FALSE)
                {
                    return false;
                }
                else
                {
                    return defaultValue;
                }
            }
        }

        void writeString(char[] section, char[] name, char[] value)
        {
            auto s = findOrCreateSection(section);
            auto e = s.findOrCreateEntry(name);
            e.value = value;
        }

        void writeInt(char[] section, char[] name, int value)
        {
            writeString(section, name, std.string.toString(value));
        }

        void writeBool(char[] section, char[] name, bool value)
        {
            char[] s = value ? TRUE : FALSE;
            writeString(section, name, s);
        }

    }
}
