
# os.clock()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          os, clock, time, date
> __See also__          [system.getTimer()][api.library.system.getTimer]
>						[os.time()][api.library.os.time]
>						[os.date()][api.library.os.date]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an approximation of the amount in seconds of CPU time used by the program.

This is a standard Lua function that returns the CPU in seconds. A run time of 5 seconds returns as 0.05. It counts from 0.00 to 0.99 before rolling over to 1.00.

## Syntax

	os.clock()

## Example

#### Display CPU Time

`````lua
print( os.clock() )  -- Outputs CPU time to terminal
`````
