# pcall()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pcall, protected mode, protected call, functions
> __See also__          [(globals)][api.library.global]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Calls a function specified as the first argument, with the given arguments (as the following arguments) in protected mode. This means that any error inside `f` is not propagated; instead, `pcall()` catches the error and returns a status code. Its first result is the status code (a [Boolean][api.type.Boolean]), which is `true` if the call succeeds without errors. In such case, `pcall()` also returns all results from the call, after this first result. In case of any error, `pcall()` returns `false` plus the error message.

## Syntax

	pcall( f [, ...] )

##### f ~^(required)^~
_[Function][api.type.Function]._ The function to be called in protected mode.

##### ... ~^(optional)^~
_Any._ Can be anywhere from zero to any amount of arguments to be passed to the function to be called.


## Example

In the following example, the function will fail and normally stop the simulator because we are trying to concatenate a `nil` value. The `pcall()` will catch and display the error without stopping the simulator.

`````lua
function myPrint( value )
    local foo = value .. nil
end
 
print( pcall( myPrint, "hello" ) )  -- print false and error message
`````
