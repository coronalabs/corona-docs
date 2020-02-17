# system.canOpenURL()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system, canOpenURL, URL
> __See also__          [system.openURL()][api.library.system.openURL]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] value confirming whether a URL can be opened via [system.openURL()][api.library.system.openURL].

* Returns `true` if the URL can be opened.
* Returns `false` if the URL is malformed or if there is no app to handle the URL's scheme. Also returns `false` on iOS&nbsp;9.0+ or tvOS if the URL is not listed in `LSApplicationQueriesSchemes` (see&nbsp;below).

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you are deploying the app for iOS&nbsp;9.0+ or&nbsp;tvOS, you must specify all of the associated URL schemes via the `LSApplicationQueriesSchemes` key within the `plist` table of `build.settings`. For instance, the following addition will allow the app to check if Facebook and Instagram URLs can be opened:

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			LSApplicationQueriesSchemes = { "fb", "instagram" },
		},
	},
}
``````

</div>


## Gotchas

* This does __not__ check the URL for validity &mdash; it simply checks if there is an application associated with a URL scheme.

* If you are deploying the app for iOS&nbsp;9.0+ or&nbsp;tvOS, you must specify all of the associated URL schemes via the `LSApplicationQueriesSchemes` key (see&nbsp;above). If the URL scheme is not specified within `LSApplicationQueriesSchemes`, iOS will output an error message to the system console. For more information about iOS and tvOS aspects, see [here](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplication_Class/#//apple_ref/occ/instm/UIApplication/canOpenURL:).


## Syntax

	system.canOpenURL( url )

##### url ~^(required)^~
_[String][api.type.String]._ The URL.


## Example

##### Check for Facebook App

``````lua
local url = "fb://feed"

if ( system.canOpenURL( url ) ) then
	system.openURL( url )
else
	print( "WARNING: Facebook app is not installed!" )
end
``````
