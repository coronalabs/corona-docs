
# event.errorMessage

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [unhandledError][api.event.unhandledError]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          unhandledError, errorMessage
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value is the file, line number, and error message of the last runtime error when used with [Runtime:addEventListener()][api.type.EventDispatcher.addEventListener].

## Example
 
``````lua
local unhandledErrorListener = function( event )
	print( "We have a problem: " .. event.errorMessage )
end

Runtime:addEventListener( "unhandledError", unhandledErrorListener )
``````
