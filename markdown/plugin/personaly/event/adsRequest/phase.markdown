# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.personaly.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Persona.ly, adsRequest, phase
> __See also__			[adsRequest][plugin.personaly.event.adsRequest]
>						[personaly.*][plugin.personaly]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.personaly.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Persona.ly plugin was initialized successfully.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.type][plugin.personaly.event.adsRequest.type] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. For this phase, [event.type][plugin.personaly.event.adsRequest.type] can provide additional context.
