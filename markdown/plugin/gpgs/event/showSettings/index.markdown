# showSettings

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, showSettings
> __See also__          [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates that the user has completed interaction with the settings window.

## Gotchas

For this event, [event.isError][plugin.gpgs.event.showSettings.isError] will be `true` because the view was `"cancelled"`. This is not an error per se, but for consistency it's treated as one.

## Properties

#### [event.name][plugin.gpgs.event.showSettings.name]

#### [event.isError][plugin.gpgs.event.showSettings.isError]

#### [event.errorMessage][plugin.gpgs.event.showSettings.errorMessage]

#### [event.errorCode][plugin.gpgs.event.showSettings.errorCode]