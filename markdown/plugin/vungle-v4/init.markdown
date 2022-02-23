# vungle-v4.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, vungle
> __See also__          [vungle-v4.show()][plugin.vungle-v4.show]
>						[vungle-v4.*][plugin.vungle-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle-v4.init()` initializes the Corona `ads` library by specifying the name of the ad network service provider and the application identifier.

Once the `ads` library is initialized, you can request an ad using [vungle-v4.show()][plugin.vungle-v4.show].


## Syntax

	vungle-v4.init( providerName, appId [, adListener] )

##### providerName ~^(required)^~
_[String][api.type.String]._ String value for the provider name. For Vungle, use `"vungle"`.

##### appId ~^(required)^~
_[String][api.type.String]._ String containing the app ID.

##### adListener ~^(optional)^~
_[Listener][api.type.Listener]._ The [function][api.type.Function] or [table][api.type.Table] that will handle ad lifecycle events from the Vungle plugin. Vungle notifies you of the following events:

### adStart

<div class="inner-table">

------------------	--------------------------------------
`name`				`"adsRequest"`
`provider`			`"vungle"`
`type`				`"adStart"`
`isError`			`false` if an ad started playing; `true` if an ad could not be played
`response`			reason why ad could not be played if `isError` is `true`
------------------	--------------------------------------

</div>

### adView

<div class="inner-table">

----------------------	--------------------------------------
`name`					`"adsRequest"`
`provider`				`"vungle"`
`type`					`"adView"`
`isError`				`false`
`totalAdSeconds`		the total length of the video in seconds
`secondsWatched`		the length of the longest view by the user, in seconds
`isCompletedView`		`true` if the user watched 80% of the video; `false` otherwise
----------------------	--------------------------------------

</div>

### adEnd

<div class="inner-table">

--------------------------	--------------------------------------
`name`						`"adsRequest"`
`provider`					`"vungle"`
`type`						`"adEnd"`
`isError`					`false`
`wasCallToActionClicked`	`true` if the user clicked on the call-to-action (usually "Download"); `false` otherwise
--------------------------	--------------------------------------

</div>

### cachedAdAvailable

<div class="inner-table">

--------------	--------------------------------------
`name`			`"adsRequest"`
`provider`		`"vungle"`
`type`			`"cachedAdAvailable"`
`isError`		`false`
--------------	--------------------------------------

</div>
