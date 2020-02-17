
# event.stackTrace

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [unhandledError][api.event.unhandledError]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          unhandledError, stackTrace
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The stack trace at which the last runtime error occurred formatted into a string.

## Example
 
``````lua
function errorHandler( event )
    print( event.errorMessage, event.stackTrace )
end 

Runtime:addEventListener( "unhandledError", errorHandler )
``````
