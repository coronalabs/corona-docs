# gpgs.getAccountName()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs..*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests curent player's account name. Requires `GET_ACCOUNTS` android permission, if you want to use it, be sure to include it in your `build.settings` file.

## Syntax

	gpgs.getAccountName(listener)

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [getAccountName][plugin.gpgs3.event.getAccountName] event.
