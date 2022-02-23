# gpgs.requests.setListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, requests, setListener
> __See also__          [gpgs.requests][plugin.gpgs.requests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Registers a listener function to intercept incoming requests for the current user. If a listener is registered by this method, the incoming request will not generate a status bar notification as long as this client remains connected.

## Gotchas

Only one request listener may be active at a time. Calling this method while another request listener is registered will replace the original listener with the new one.

## Syntax

	gpgs.requests.setListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function which receives a [request][plugin.gpgs.requests.event.request] event.