# zeroconf.publish()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[Userdata][api.type.Userdata]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ZeroConf, network, publish
> __See also__			[zeroconf.unpublish()][plugin.zeroconf.unpublish]
>						[zeroconf.unpublishAll()][plugin.zeroconf.unpublishAll]
>						[zeroconf.*][plugin.zeroconf]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Starts advertising a service over the network. This will also trigger a [PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent] event with a [phase][plugin.zeroconf.event.PluginZeroConfEvent.phase] of `"published"`.

If publishing is started successfully, a publish&nbsp;ID will be returned. This can be passed to [zeroconf.unpublish()][plugin.zeroconf.unpublish] to <nobr>un-publish</nobr> the service.


## Gotchas

This function returns `nil` in case of failure.


## Syntax

	zeroconf.publish( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing parameters for the new object &mdash; see the next section for details.


## Parameter Reference

##### port ~^(required)^~
_[Number][api.type.Number]._ Network port number to be advertised.

##### type ~^(optional)^~
_[String][api.type.String]._ The type of service to publish. This __must__ start with an underscore (`_`) and end with a protocol separated by a dot. Valid protocol names are `_tcp` and `_udp`. The default type is `_corona._tcp`.

##### name ~^(optional)^~
_[String][api.type.String]._ This should identify a specific device. Passing an empty string (default) will trigger an attempt to generate a unique name.

##### data ~^(optional)^~
_[Table][api.type.Table]._ Arbitrary key-value data can be attached to the published service. Both data keys and values must be a [string][api.type.String]. Total size of all attached data is limited to 255 bytes.

##### domain ~^(optional)^~
_[String][api.type.String]._ Domain to browse for services. Default is `"local"`. An empty string indicates all available domains. Omit this key unless you fully understand its purpose.
