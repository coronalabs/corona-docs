# getfenv()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getfenv, setfenv, environment, global
> __See also__          [setfenv()][api.library.global.setfenv]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the current environment in use by a specified [Function][api.type.Function]. The first argument can be a [Function][api.type.Function] or a [Number][api.type.Number] that specifies the function at that stack level: level `1` is the function calling `getfenv()`. If the given function is not a Lua function, or if `f` is `0`, `getfenv()` returns the global environment. The default for `f` is `1`.

## Syntax

	getfenv( [f] )

##### f ~^(optional)^~
_[Function][api.type.Function] or [Number][api.type.Number]._ Specifies the function at that stack level.