
# os.execute()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          os, execute, shell, commands
> __See also__          [os.exit()][api.library.os.exit]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Passes a string to the operating system for execution and returns a system-dependent status code. This function is equivalent to the C function `system()`. 

This function returns a [number][api.type.Number] representing the status code with the system-dependent results of the command.


## Gotchas

This function does not work on devices.


## Syntax

	os.execute( cmd )

##### cmd ~^(required)^~
_[String][api.type.String]._ String specifying a command to be executed by an operating system shell. The function of this command depends on what is allowed by the running OS. If `cmd` is not specified, the return value is <nobr>non-zero</nobr> if a shell is available, or zero otherwise.

## Example

`````lua
os.execute( "ls" )
`````
