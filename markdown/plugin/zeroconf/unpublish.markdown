# zeroconf.unpublish()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ZeroConf, network, unpublish
> __See also__			[zeroconf.publish()][plugin.zeroconf.publish]
>						[zeroconf.unpublishAll()][plugin.zeroconf.unpublishAll]
>						[zeroconf.*][plugin.zeroconf]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Stops (<nobr>un-publishes</nobr>) a service based on a publish&nbsp;ID.


## Syntax

	zeroconf.unpublish( publishID )

##### publishID ~^(required)^~
_[Userdata][api.type.Userdata]._ The publish&nbsp;ID associated with the service. This can be gathered from the return value of [zeroconf.publish()][plugin.zeroconf.publish].
