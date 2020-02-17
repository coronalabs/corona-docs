
# os.time()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          os, time, date
> __See also__          [os.date()][api.library.os.date]
>                       [os.clock()][api.library.os.clock]
>                       [system.getTimer()][api.library.system.getTimer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the current time in seconds from 1970 when called without arguments, or a time representing the date and time specified by the given table.

## Syntax

	os.time( table )

##### table ~^(optional)^~
_[Table][api.type.Table]._ table specifying a time to convert to seconds. If `table` is present, it must have fields `year`, `month`, and `day`, and may have additional fields `hour`, `min`, `sec`, and `isdst` (for a description of these fields, see the [os.date][api.library.os.date] function).


## Example

`````lua
local t = os.date( '*t' )  -- get table of current date and time
print( os.time( t ) )      -- print date & time as number of seconds
-- OUTPUT: 1287516614
 
t.min = t.min + 1          -- add one to the minute field
print( os.time( t ) )      -- print number of seconds (increases by 60 seconds)
-- OUTPUT: 1287516674

-- Get the number of seconds since Jan 1, 1970 for a specific date and time
local t = {}
t.year = 2018
t.month = 12
t.day = 25
t.hour = 0
t.min = 0
t.sec = 0
print( os.time( t ) )
-- OUTPUT: 1545714000

`````
