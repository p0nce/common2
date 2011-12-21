module misc.textfile;

import std.file;
import std.stream;
import std.stdio;
import misc.logger;

string[] readTextFile(string filename)
{
    string[] res;

    try
    {
        auto fd = new File(filename);
        scope(exit) fd.close();

        while(!fd.eof())
        {
            char[] line = fd.readLine();
            res ~= line;
        }
    } catch(StreamException e)
    {
        warn(e.msg);
    }

    return res;     // empty
}
