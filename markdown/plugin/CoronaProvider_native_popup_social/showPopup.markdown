# native.showPopup() — Social Popup

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, social, Twitter, Facebook, Sina Weibo
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the operating system's default popup window for a specified service.


## Gotchas

Pre-filling messages on Facebook is a violation of their [Platform Policy](https://developers.facebook.com/docs/apps/review/prefill). On iOS 8.0+ and Android, `options.message` is not supported and Facebook will silently ignore this field if you try to use it.


## Syntax

	native.showPopup( name, options )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Social Popup plugin, use `"social"`.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table that specifies the optional properties for the popup — see the next section for details.


## Options Reference

##### service ~^(optional)^~
_[String][api.type.String]._ Required for iOS only, indicating the name of the social service popup to show. Supported values are `"twitter"`, `"facebook"`, or `"sinaWeibo"`. This key is ignored on Android.

##### image ~^(optional)^~
_[Table][api.type.Table]._ Table containing <nobr>sub-tables</nobr> in the form `{ baseDir=, filename= }` of the images you wish to post.

##### message ~^(optional)^~
_[String][api.type.String]._ String that pre-populates the message field of the popup. On iOS 8.0+ and Android, this is not supported with Facebook as it violates thier [platform policy](https://developers.facebook.com/docs/apps/review/prefill). Facebook will silently ignore this field if you try to use it on iOS 8.0+ and Android.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which supports [popup events][api.event.popup].

##### url ~^(optional)^~
_[String][api.type.String] or [Array][api.type.Array]._ Single string or an array of strings. Each string is a URL to post.


## Example

``````lua
local serviceName = "twitter"  -- Supported values are "twitter", "facebook", or "sinaWeibo"

local isAvailable = native.canShowPopup( "social", serviceName )

if ( isAvailable ) then

	local listener = {}
	
	function listener:popup( event )
		print( "name: " .. event.name )
		print( "type: " .. event.type )
		print( "action: " .. tostring( event.action ) )
		print( "limitReached: " .. tostring( event.limitReached ) )
	end

	native.showPopup( "social",
	{
		service = serviceName,
		message = "Hi there!",
		listener = listener,
		image = 
		{
			{ filename="world.jpg", baseDir=system.ResourceDirectory },
			{ filename="bkg_wood.png", baseDir=system.ResourceDirectory }
		},
		url = 
		{
			"http://www.coronalabs.com",
			"http://docs.coronalabs.com"
		}
	})

else

	native.showAlert(
		"Cannot send " .. serviceName .. " message.",
		"Please setup your " .. serviceName .. " account or check your network connection.",
		{ "OK" } )
end
``````