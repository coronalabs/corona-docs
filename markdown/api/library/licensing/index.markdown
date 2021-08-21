# licensing.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaLibrary][api.type.CoronaLibrary]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          license, licensing
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Solar2D licensing library lets you check to see if the app was bought from a store. Currently, only [Google&nbsp;Play](https://developer.android.com/google/play/licensing/setting-up) is supported.

For further information, see the Google [licensing](https://developer.android.com/google/play/licensing/licensing-reference.html) reference page.


## Project Settings

You must add the following permission to your `build.settings` file in order to use the Google licensing provider:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7]" }
settings =
{
	android =
	{
		usesPermissions =
		{
			"com.android.vending.CHECK_LICENSE"
		},
	},
}
``````

In addition, you must include the `license` table with your unique license key within the project's `config.lua` file. This key value must be obtained from Google.

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9,10]" }
application =
{
	license =
	{
		google =
		{
			key = "YOUR_LICENSE_KEY",
			policy = "serverManaged"
		},
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The `policy` key is optional. Its value can be either `"serverManaged"` (default) or `"strict"`. A value of `"serverManaged"` will query the Google server and cache the results; this is similar to Google's __ServerManagedPolicy__. A value of `"strict"` will not cache the results, so when there's a network failure, the licensing will fail; this is similar to Google's __StrictPolicy__.

</div>


## Functions

#### [licensing.init()][api.library.licensing.init]

#### [licensing.verify()][api.library.licensing.verify]


## Example

``````lua
local licensing = require( "licensing" )

local function licensingListener( event )

	if not ( event.isVerified ) then
		-- Failed to verify app from the Google Play store; print a message
		print( "Pirates!!!" )
	end
end

local licensingInit = licensing.init( "google" )

if ( licensingInit == true ) then
	licensing.verify( licensingListener )
end
``````
