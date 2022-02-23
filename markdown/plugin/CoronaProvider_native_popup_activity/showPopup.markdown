# native.showPopup() — Activity Popup

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, activity
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Displays the activity popup window which corresponds to `UIActivityViewController` on iOS. The set of activities depends on the items you specify.


## Syntax

	native.showPopup( name, options )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Activity Popup plugin, use `"activity"`.

##### options ~^(required)^~
_[Table][api.type.Table]._ A table that specifies parameters for the popup — see the next section for details.


## Options Reference

##### items ~^(required)^~
_[Array][api.type.Array]._ Array of individual items. See [Item Array](#itemarray) below.

##### excludedActivities ~^(optional)^~
_[Array][api.type.Array]._ By default, all built-in and compatible activities are shown. You can exclude an activity by specifying an array of strings where each corresponds to an activity. See [Supported Activities](#activities) below for valid string values.

##### origin ~^(optional)^~
_[Table][api.type.Table]._ Only applicable on iPad. Defines the bounds of the object (typically&nbsp;a&nbsp;button) from which the iPad's popup emerges from. A convenience pattern is to pass the `contentBounds` property of the object.

##### permittedArrowDirections ~^(optional)^~
_[Table][api.type.Table]._ Only applicable on iPad. An array of values which defines the directions in which the iPad's popup arrow may point. Valid values are `"up"`, `"down"`, `"left"`, `"right"`, or `"any"`. The default is `"any"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener which supports basic [popup events][api.event.popup]. In addition, it supports the following additional properties:

* `event.action` ([string][api.type.String]) &mdash; Value of `"sent"` or `"cancelled"`.
* `event.activity` ([string][api.type.String]) &mdash; Value corresponding to the [Supported Activities](#activities).


<a id="itemarray"></a>

## Item Array

The item array is an [array][api.type.Array] of individual items, where each item is a [table][api.type.Table] that contains data on which activity is to be performed. Each individual item table must contain both `type` and `value` properties.

Different activities support different item types. Please refer to Apple's [documentation](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActivity_Class/index.html#//apple_ref/doc/constant_group/Built_in_Activity_Types)
for a reference of supported activity types.

<div class="inner-table">

Type			Value
--------------	----------------------------------------------------------------------------------------------
`"string"`		[String][api.type.String] value which will be converted to a `NSString`.
`"url"`			[String][api.type.String] value which will be converted to a `NSURL`.
`"image"`		[Table][api.type.Table] in the form of <nobr>`{ baseDir=, filename= }`</nobr> which specifies the image file to post. This will be converted to a `UIImage`.

</div>


<a id="activities"></a>

## Supported Activities

The Activity plugin supports the following activity string values, each corresponding to a [built-in activity](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActivity_Class/index.html#//apple_ref/doc/constant_group/Built_in_Activity_Types) on iOS.

<div class="inner-table">

String									Corresponding iOS Activity
--------------------------------------	-------------------------------------------
`"UIActivityTypePostToFacebook"`		`UIActivityTypePostToFacebook` &nbsp;
`"UIActivityTypePostToTwitter"`			`UIActivityTypePostToTwitter` &nbsp;
`"UIActivityTypePostToWeibo"`			`UIActivityTypePostToWeibo` &nbsp;
`"UIActivityTypeMessage"`				`UIActivityTypeMessage` &nbsp;
`"UIActivityTypeMail"`					`UIActivityTypeMail` &nbsp;
`"UIActivityTypePrint"`					`UIActivityTypePrint` &nbsp;
`"UIActivityTypeCopyToPasteboard"`		`UIActivityTypeCopyToPasteboard` &nbsp;
`"UIActivityTypeAssignToContact"`		`UIActivityTypeAssignToContact` &nbsp;
`"UIActivityTypeSaveToCameraRoll"`		`UIActivityTypeSaveToCameraRoll` &nbsp;
`"UIActivityTypeAddToReadingList"`		`UIActivityTypeAddToReadingList` &nbsp;
`"UIActivityTypePostToFlickr"`			`UIActivityTypePostToFlickr` &nbsp;
`"UIActivityTypePostToVimeo"`			`UIActivityTypePostToVimeo` &nbsp;
`"UIActivityTypePostToTencentWeibo"`	`UIActivityTypePostToTencentWeibo` &nbsp;
`"UIActivityTypeAirDrop"`				`UIActivityTypeAirDrop` &nbsp;

</div>


## Examples

##### String Items

`````lua
local popupListener = {}
function popupListener:popup( event )
	print(
		"(name, type, activity, action):", 
		event.name, event.type, tostring(event.activity), tostring(event.action)
	)
end

local textItems = {
	{ type = "string", value = "Hello World!" },
	{ type = "string", value = "Good night, and good luck." },
}

local options = { items=textItems, listener=popupListener }

native.showPopup( "activity", options )
`````

##### URL Items

`````lua
local popupListener = {}
function popupListener:popup( event )
	print(
		"(name, type, activity, action):", 
		event.name, event.type, tostring(event.activity), tostring(event.action)
	)
end

local urlItems = {
	{ type = "url", value = "http://www.coronalabs.com" },
	{ type = "url", value = "http://docs.coronalabs.com" },
}

local options = { items=urlItems, listener=popupListener }

native.showPopup( "activity", options )
`````

##### Image Items

`````lua
local popupListener = {}
function popupListener:popup( event )
	print(
		"(name, type, activity, action):", 
		event.name, event.type, tostring(event.activity), tostring(event.action)
	)
end

local imageItems = {
	{
		type = "image",
		value = { filename = "world1.jpg", baseDir = system.ResourceDirectory }
	},
	{
		type = "image",
		value = { filename = "world2.jpg", baseDir = system.ResourceDirectory }
	},
}

local options = { items=imageItems, listener=popupListener }

native.showPopup( "activity", options )
`````

##### Combined Items

`````lua
local popupListener = {}
function popupListener:popup( event )
	print(
		"(name, type, activity, action):", 
		event.name, event.type, tostring(event.activity), tostring(event.action)
	)
end

local itemsToShare = {
	{
		type = "image",
		value = { filename = "world1.jpg", baseDir = system.ResourceDirectory }
	},
	{ type = "url", value = "http://www.coronalabs.com" },
	{ type = "string", value = "Hello World!" },
}

local options = { items=itemsToShare, listener=popupListener }

native.showPopup( "activity", options )
`````