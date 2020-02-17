# setfenv()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Function][api.type.Function]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setfenv, environment, globals
> __See also__          [getfenv()][api.library.global.getfenv]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the environment &mdash; or the table where Lua keeps all its global variables &mdash; to be used by the given function.

This function returns the same function that is passed as the first argument.

## Syntax

	setfenv( f, table )

##### f ~^(required)^~
_[Function][api.type.Function] or [Number][api.type.Number]._ If `f` is a function, `setfenv()` sets the environment for that function. If a number is specified, the environment for the function at that stack level is set. Number `1` means the current function, number `2` means the function calling the current function, and so on. As a special case, when set to `0`, `setfenv()` changes the environment of the running thread, in which case nothing is returned.

##### table ~^(required)^~
_[Table][api.type.Table]._ The table containing the new environment.