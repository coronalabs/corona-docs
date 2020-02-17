
# unhandledError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          unhandledError, runtime
> --------------------- ------------------------------------------------------------------------------------------

## Overview

These events occur when an application experiences a runtime error. They are only dispatched to the global [Runtime][api.type.EventDispatcher] object, meaning that errors in callbacks and listeners are __not__ caught.

If `true` is returned from the listener for `"unhandledError"`, the error is suppressed and application execution will continue. Returning `false` (or&nbsp;nothing) from the listener will allow the runtime error to be reported to the user and the application to terminate.


## Properties

#### [event.errorMessage][api.event.unhandledError.errorMessage]

#### [event.stackTrace][api.event.unhandledError.stackTrace]


## Examples

##### Error Message

``````lua
local unhandledErrorListener = function( event )
	print( "We have a problem: " .. event.errorMessage )
end

Runtime:addEventListener( "unhandledError", unhandledErrorListener )
``````

##### Stack Trace

``````lua
function errorHandler( event )
	print( event.errorMessage, event.stackTrace )
end 

Runtime:addEventListener( "unhandledError", errorHandler )
``````
