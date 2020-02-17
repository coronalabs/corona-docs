# object:setvbuf()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setvbuf, files
> __See also__          [io.open()][api.library.io.open]
>						[io.flush()][api.library.io.flush]
>						[io.write()][api.library.io.write]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the buffering mode for an output file (or console).

This function can be used to control buffering of file writes and console output. When buffering is disabled on console output ([print()][api.library.global.print] and calls to [io.write()][api.library.io.write]), the information (debug&nbsp;data) is displayed instantly on the Xcode console and `Console.app` for iPhone/iPad.

## Gotchas

Disabling buffering can affect the performance of the app. The flushing of the buffer can be performed anytime by the [io.flush()][api.library.io.flush] function.

## Syntax

	File:setvbuf( mode [, size ] )

##### mode ~^(required)^~
_[String][api.type.String]._ There are three available modes:

* `"no"` &mdash; No buffering; the result of any output operation appears immediately.
* `"full"` &mdash; Full buffering; output operation is performed only when the buffer is full (or when you explicitly flush the file (see&nbsp;[io.flush()][api.library.io.flush])).
* `"line"` &mdash; Line buffering; output is buffered until a newline is output or there is any input from some special files such as a Terminal device.

##### size ~^(optional)^~
_[Number][api.type.Number]._ Specifies the size of the buffer, in bytes. The default is an appropriate size.


## Example

``````lua
io.output():setvbuf( "no" )  -- Disable output buffering for the console
``````