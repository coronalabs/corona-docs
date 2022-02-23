# zeroconf.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ZeroConf, network, init
> __See also__			[zeroconf.*][plugin.zeroconf]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the optional listener function for <nobr>zero-configuration</nobr> events.


## Syntax

	zeroconf.init( [listener] )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which will receive [PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent] events.
