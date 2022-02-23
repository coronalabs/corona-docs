# zeroconf.stopBrowse()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ZeroConf, network, stopBrowse
> __See also__			[zeroconf.browse()][plugin.zeroconf.browse]
>						[zeroconf.stopBrowseAll()][plugin.zeroconf.stopBrowseAll]
>						[zeroconf.*][plugin.zeroconf]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Stops browsing for a service based on a browser&nbsp;ID.


## Syntax

	zeroconf.stopBrowse( browserID )

##### browserID ~^(required)^~
_[Userdata][api.type.Userdata]._ The ID associated with the browse request. This can be gathered from the return value of [zeroconf.browse()][plugin.zeroconf.browse].
