# mediaBrix.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix
> __Platforms__			Android, iOS
> __Sample__			[https://github.com/coronalabs/plugins-sample-mediabrix](https://github.com/coronalabs/plugins-sample-mediabrix)
> --------------------- ------------------------------------------------------------------------------------------

 
## Overview

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-mediabrix]

</div>

The MediaBrix plugin allows developers to monetize users through [MediaBrix](https://www.mediabrix.com/) static interstitials, video interstitials, rewarded videos, and more.


<a id="registration"></a>

## Registration

To use this plugin, you must [register](https://platform.mediabrix.com/signup) with MediaBrix as follows:

1. Sign up for a developer account [here](https://platform.mediabrix.com/signup).

2. After submission, MediaBrix will review your application and a member of the MediaBrix Business Development team will reach out to you.

3. Once MediaBrix approves your account, you may set your password and login for the MediaBrix [publisher access portal](http://platform.mediabrix.com).

4. When logged in, select "Submit&nbsp;App" from the menu to submit a new app. After submission, a MediaBrix Developer Support manager will review the form and create the IDs and keys required to integrate your app with MediaBrix (usually within 24 hours).


## Syntax

	local mediaBrix = require( "plugin.mediaBrix" )


## Functions

#### [mediaBrix.init()][plugin.mediaBrix.init]

#### [mediaBrix.load()][plugin.mediaBrix.load]

#### [mediaBrix.isLoaded()][plugin.mediaBrix.isLoaded]

#### [mediaBrix.show()][plugin.mediaBrix.show]


## Events

#### [adsRequest][plugin.mediaBrix.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.mediaBrix"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<!--- Include ATS "override" template block --->
TEMPLATE_ATS
<!--- --->

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`

</div>


## Support

* [http://www.mediabrix.com/contact/](http://www.mediabrix.com/contact/)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
