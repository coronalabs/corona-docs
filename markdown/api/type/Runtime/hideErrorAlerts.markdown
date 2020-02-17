# Runtime:hideErrorAlerts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Runtime][api.type.Runtime]
> __Library__           none
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          runtime, hideErrorAlerts
> __See also__          [unhandledError][api.event.unhandledError]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Disables the runtime error alert that appears if the application hits an error condition. This is shorthand for defining your own [unhandledError][api.event.unhandledError] listener and returning `true`.

Note that syntax errors and out of memory errors will still cause an error alert and that disabling the alert does not mean that the error itself is ignored. Errors will still interrupt the execution of Lua code in listeners and functions. 

## Syntax

	Runtime:hideErrorAlerts()
