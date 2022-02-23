# gpgs.getAccountName()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, getAccountName
> __See also__          [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests the current player's account name.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you want to use this function, you must include the `GET_ACCOUNTS` permission in your `build.settings` file&nbsp;&mdash; please see [here][REFLINK 1] for instructions.

</div>

## Syntax

	gpgs.getAccountName( [listener] )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [getAccountName][plugin.gpgs.event.getAccountName] event.


<!--- REFERENCE LINK -->

[REFLINK 1]: ../../guide/distribution/buildSettings/index.html#android-build-settings
