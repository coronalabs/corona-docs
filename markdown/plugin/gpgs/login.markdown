# gpgs.login()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, login
> __See also__          [gpgs.init()][plugin.gpgs.init]
>						[gpgs.logout()][plugin.gpgs.logout]
>						[gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Attempts to log in the current player. You must call [gpgs.init()][plugin.gpgs.init] before making this function call.


## Syntax

	gpgs.login( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the login &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the login.

##### userInitiated ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, a <nobr>sign-in</nobr> dialog will appear if the user is not logged in. Use this when the user specifically wants to log in via a UI button/element instead of being logged in automatically.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [login][plugin.gpgs.event.login] event.
