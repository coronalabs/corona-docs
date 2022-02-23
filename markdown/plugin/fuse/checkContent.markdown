# fuse.checkContent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, checkContent
> __See also__          [fuse.init()][plugin.fuse.init]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] value specifying whether an ad zone contains a specific content type, including:

* IAP (in-app purchase) offers
* Rewarded videos
* Virtual goods


## Syntax

	fuse.checkContent( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ A table which specifies properties for the content check — see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `zone` &mdash; Optional [string][api.type.String] value specifying the ad zone to query for content. If omitted, the default zone will be used.

* `type` &mdash; Optional [string][api.type.String] value specifying the type of content for which to query availability. These values correspond to the completed action types as listed in [event.type][plugin.fuse.event.adsRequest.type], including `"rewarded"`, `"iapOffer"`, or `"virtualGoodsOffer"`.