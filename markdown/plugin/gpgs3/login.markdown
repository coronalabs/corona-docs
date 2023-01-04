# gpgs.login()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Attempts to log in the current player.

## Syntax

	gpgs.login(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### userInitiated ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, will show sign in dialog if user is not logged in. Use it when user specifically wants to log in (presses log in button for instance) instead of being logged in automatically.

##### useDrive ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true` will request Google Drive Access. This is needed for [Snapshots][plugin.gpgs3.snapshots].

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [login][plugin.gpgs3.event.login] event.
