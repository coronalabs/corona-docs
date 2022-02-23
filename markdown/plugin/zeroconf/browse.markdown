# zeroconf.browse()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[Userdata][api.type.Userdata]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ZeroConf, network, browse
> __See also__			[zeroconf.stopBrowse()][plugin.zeroconf.stopBrowse]
>						[zeroconf.stopBrowseAll()][plugin.zeroconf.stopBrowseAll]
>						[zeroconf.*][plugin.zeroconf]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Starts looking for services of a specific type over the network. Whenever a service is found (or&nbsp;lost), a [PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent] event will be invoked with a [phase][plugin.zeroconf.event.PluginZeroConfEvent.phase] of `"found"` or `"lost"`.

If browsing is started successfully, a browser&nbsp;ID will be returned. This can be passed to [zeroconf.stopBrowse()][plugin.zeroconf.stopBrowse] to stop looking for services.


## Gotchas

This function returns `nil` in case of failure.


## Syntax

	zeroconf.browse( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing parameters &mdash; see the next section for details.


## Parameter Reference

##### type ~^(optional)^~
_[String][api.type.String]._ The type of service to look for. This __must__ start with an underscore (`_`) and end with a protocol separated by a dot. Valid protocol names are `_tcp` and `_udp`. The default type is `_corona._tcp`.

##### domain ~^(optional)^~
_[String][api.type.String]._ Domain to browse for services. Default is `"local"`. An empty string indicates all available domains. Omit this key unless you fully understand its purpose.
