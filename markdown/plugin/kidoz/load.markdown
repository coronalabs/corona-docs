# kidoz.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ, load
> __See also__          [kidoz.show()][plugin.kidoz.show]
>						[kidoz.*][plugin.kidoz]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a KIDOZ ad. Once loaded, You can call [kidoz.show()][plugin.kidoz.show] to show it.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Before calling this function, you must call [kidoz.init()][plugin.kidoz.init] and wait for the `"init"` event [phase][plugin.kidoz.event.adsRequest.phase].

</div>
</div>


## Syntax

	kidoz.load( adType, options )

##### adType ~^(required)^~
_[String][api.type.String]._ The ad type to load &mdash; see the following sections for details.

##### options ~^(required)^~
_[Table][api.type.Table]._ Options for the ad type &mdash; see the following sections for details.


## Panel View

This is a special customized view which can slide in/out of the screen (both&nbsp;in horizontal and vertical&nbsp;layout) with minimal interference to the user experience. For this ad type, `adType` should be `"panelView"` and the `options` table accepts these <nobr>key-value</nobr> pairs:

##### adPosition ~^(required)^~
_[String][api.type.String]._ The position of the panel. Valid values include `"top"` and `"bottom"`. Default is `"bottom"`.

##### handlePosition ~^(optional)^~
_[String][api.type.String]._ The position of the handle. Valid values are `"left"`, `"right"`, `"center"`, or `"none"`. Default is `"center"`. If `handlePosition` is set to `"none"`, the user will not have a <nobr>UI-based</nobr> handle to slide the view in and out.


## Interstitial

This is a <nobr>full-screen</nobr> single ad unit. For this ad type, `adType` should be `"interstitial"` and the `options` table should be omitted.


## Rewarded Video

This is a <nobr>full-screen</nobr> single ad unit. For this ad type, `adType` should be `"rewardedVideo"` and the `options` table should be omitted.


## Banner

This is a banner ad unit. For this ad type, `adType` should be `"banner"` and the `options` table accepts these <nobr>key-value</nobr> pairs:

##### adPosition ~^(required)^~
_[String][api.type.String]._ The position of the banner. Valid values include `"top"`, `"topLeft"`, `"topRight"`,  `"bottom"`,  `"bottomLeft"` and `"bottomRight"`. Default is `"bottom"`.


## Examples

##### Panel View

``````lua
kidoz.load( "panelView",
	{
		adPosition = "bottom",
		handlePosition = "left"
	}
)
``````

##### Interstitial

``````lua
kidoz.load( "interstitial" )
``````

##### Rewarded Video

``````lua
kidoz.load( "rewardedVideo" )
``````

##### Banner

``````lua
kidoz.load( "banner",
	{
		adPosition = "bottom"
	}
)
``````
