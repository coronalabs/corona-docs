# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.tenjin.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Tenjin, analyticsRequest, phase
> __See also__			[analyticsRequest][plugin.tenjin.event.analyticsRequest]
>						[tenjin.*][plugin.tenjin]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] indicating the phase of the [analyticsRequest][plugin.tenjin.event.analyticsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Tenjin plugin was initialized successfully.

* `"recorded"` &mdash; Indicates that an event was successfully recorded via [tenjin.logEvent()][plugin.tenjin.logEvent] or [tenjin.logPurchase()][plugin.tenjin.logPurchase].
