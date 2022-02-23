# microtransactionAuthorization

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, IAP, in-app purchases, microtransaction, microtransactionAuthorization
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when a microtransaction <nobr>(in-app purchase)</nobr> has been approved or denied by the currently logged in user.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Steam only supports microtransactions via web APIs and it does __not__ track purchased products. Steam only dispatches events providing the order&nbsp;ID of approved purchases made by the user. The order&nbsp;ID is defined by the app developer when issuing a request via Steam's web APIs and it's up to the app developer to track purchased products via these order&nbsp;IDs. Please see Steam's microtransaction documentation for more details.

</div>


## Properties

#### [event.authorized][plugin.steamworks.event.microtransactionAuthorization.authorized]

#### [event.name][plugin.steamworks.event.microtransactionAuthorization.name]

#### [event.orderId][plugin.steamworks.event.microtransactionAuthorization.orderId]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when a microtransaction has been approved/denied by user
local function onMicrotransactionAuthorization( event )
	if ( event.authorized ) then
		-- User has made a purchase
		-- It's up to the app developer to finalize purchase with received order ID
		local orderId = event.orderId
	else
		-- User has canceled the purchase
	end
end

-- Set up a listener to be invoked when a microtransaction has been made
steamworks.addEventListener( "microtransactionAuthorization", onMicrotransactionAuthorization )
``````
