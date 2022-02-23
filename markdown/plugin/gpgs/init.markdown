# gpgs.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, init
> __See also__          [gpgs.login()][plugin.gpgs.login]
>						[gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Initializes the plugin and calls the specified listener function to notify when the process is complete, or to provide error information.

This call is required and must be executed before making other calls such as [gpgs.login()][plugin.gpgs.login].


## Syntax

	gpgs.init( [listener] )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives an [init][plugin.gpgs.event.init] event.
