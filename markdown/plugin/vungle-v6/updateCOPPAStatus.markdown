# vungle.updateCOPPAStatus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle, COPPA
> __See also__          [vungle.init()][plugin.vungle-v6.init]
>                                        [vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The SDK COPPA API must be called before calling the init method.

Use this call to set the isUserCoppa parameter to `true` for a user who is under the age of 13 and falls under COPPA regulations; `false` for a user known to be over the age of 13.


## Syntax

	vungle.updateCOPPAStatus( isUserCoppa )

##### isUserCoppa ~^(required)^~
_[Boolean][api.type.Boolean]._ `true` for a user who is under the age of 13 and falls under COPPA regulations


## Example

``````lua
vungle.updateCOPPAStatus( true )
vungle.init( appID, adListener )
``````
