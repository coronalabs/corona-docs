
# os.difftime()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[os.*][api.library.os]
> __Return value__		[Number][api.type.Number]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__          difftime, time, date, difference
> __See also__			[os.time()][api.library.os.time]
>                       [os.clock()][api.library.os.clock]
>                       [os.date()][api.library.os.date]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the number of seconds from time `t1` to time `t2`. In POSIX, Windows, and some other systems, this value is exactly <nobr>`t2 - t1`</nobr>.

## Syntax

	os.difftime( newerTime, olderTime )

##### newerTime ~^(required)^~
_[Number][api.type.Number]._ First time parameter.

##### olderTime ~^(required)^~
_[Number][api.type.Number]._ Second time parameter.


## Example

``````lua
local olderTime = os.time()
 
-- Print the elasped time
local function dspTime()
	print( "Time elasped = " .. os.difftime( os.time(), olderTime ) )
end

timer.performWithDelay( 2000, dspTime )  -- Wait 2 seconds before calling function
``````
