# onDemandResources.release()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, release, request
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>						[onDemandResources.resume()][plugin.onDemandResources.resume]
>						[onDemandResources.cancel()][plugin.onDemandResources.cancel]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Releases resources associated with a tag. Indicates that OS can free the disk space and that resource won't be used anymore. Note that in order to release the resource it has to be [requested][plugin.onDemandResources.request] first.

For more information refer on the [endAccessingResources](https://developer.apple.com/documentation/foundation/nsbundleresourcerequest/1614843-endaccessingresources?language=objc) function documentation.


## Syntax

	onDemandResources.release( tag )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to release downloading.
