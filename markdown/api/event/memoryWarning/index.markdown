
# memoryWarning

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          memoryWarning
> __See also__          [system.getInfo()][api.library.system.getInfo]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is currently only available on iOS and Android. It is exposed as a Corona event type named `"memoryWarning"`, sent to the global [Runtime][api.type.Runtime] object. This event has no fields.

When this event fires, the OS reserves the right to forcibly shut down the application in about five seconds, although it may not actually do so. Apple advises developers to listen for this warning and to handle it by freeing as much memory as possible when received.

Note that you can monitor texture memory usage by calling `system.getInfo( "textureMemoryUsed" )`. Texture memory for graphics/images tends to be the most limited resource in mobile development because  it typically runs out before normal memory.


## Syntax

	Runtime:addEventListener( "memoryWarning", listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ An event listener to be notified when a low memory situation occurs.


## Properties

#### [event.name][api.event.memoryWarning.name]


## Example

``````lua
local function handleLowMemory( event )
	print( "Memory warning received!" )
end
 
Runtime:addEventListener( "memoryWarning", handleLowMemory )
``````
