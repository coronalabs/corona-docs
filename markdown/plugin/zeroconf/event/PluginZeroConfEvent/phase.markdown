
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__				[PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ZeroConf, network, PluginZeroConfEvent, phase
> __See also__			[PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent]
>						[zeroconf.*][plugin.zeroconf]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

[String][api.type.String] value indicating the phase of the [PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent] event. Possible values include:

* `"published"` &mdash; Service has started publishing.
* `"found"` &mdash; Service has been found.
* `"lost"` &mdash; Service has been lost.
* `"browseError"` &mdash; An error occurred when browsing for services.
