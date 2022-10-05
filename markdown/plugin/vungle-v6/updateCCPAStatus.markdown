# vungle.updateCCPAStatus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle, COPPA
> __See also__          [vungle.init()][plugin.vungle-v6.init]
>                                        [vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

In accordance with CCPA, the consent status is opted in by default unless updateCCPAStatus has been explicitly called to set it as opted out. getCCPAStatus may return null if not set but will be treated as opted-in.


## Syntax

	vungle.updateCCPAStatus( hasCCPAConsent )

##### hasCCPAConsent ~^(required)^~
_[Boolean][api.type.Boolean]._ `true` to opt-in, `false` to opt-out (no consent).


## Example

``````lua
vungle.updateCCPAStatus( true )
``````
