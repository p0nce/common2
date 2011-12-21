module gl.error;

import std.string;

class OpenGLError : object.Exception
{
    this(char[] s)
    {
        super(s);
    }
}

// FBO
class FBOError : OpenGLError
{
    this(char[] s)
    {
        super(s);
    }
}

// shaders

class ShaderError : OpenGLError
{
    this(char[] s)
    {
        super(s);
    }
}

final class CompileError : ShaderError
{
    this(char[] filename, char[] log)
    {
        super(format("CompileError : Cannot compile %s\nLOG :\n%s", filename, log));
    }
}

final class LinkError : ShaderError
{
    this(char[] filename)
    {
        super(format("LinkError : Cannot link shader (%s)", filename));
    }
}

final class NotFoundUniformError : ShaderError
{
    this(char[] name)
    {
        super(format("Not found uniform \"%s\"", name));
    }
}
