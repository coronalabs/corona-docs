# onDemandResources.setEventListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, setEventListener
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets a "global" listener function that will receive <nobr>on-demand</nobr> resources [events][plugin.onDemandResources.event.onDemandResourcesEvent]. This function will receive events from individual calls to [onDemandResources.request()][plugin.onDemandResources.request]. It will also receive the event [type][plugin.onDemandResources.event.onDemandResourcesEvent.type] of `"lowDiskSpace"`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you're not interested in `"lowDiskSpace"` events, you can ignore this method and simply use individual listener references within [request][plugin.onDemandResources.request] calls.

</div>


## Syntax

    onDemandResources.setEventListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive <nobr>on-demand</nobr> resources [events][plugin.onDemandResources.event.onDemandResourcesEvent].


## Example

``````lua
local odr = require( "plugin.onDemandResources" )

-- Function to receive events from all on-demand resources calls
local function odrGlobalListener( event )
	print( "Received on-demand resources event" )
	print( "Type: " .. event.type )
	print( "Tag: " .. event.tag )
end

odr.setEventListener( odrGlobalListener )
``````
