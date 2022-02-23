# hockeyApp.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          HockeyApp, testing, distribution
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

HockeyApp is a service which supports various aspects of the app development process, including the recruitment and management of testers, app distribution, and collection of crash reports.


## Registration

To use this plugin, please [register](https://rink.hockeyapp.net/users/sign_up) for an account.


## Syntax

	local hockeyApp = require( "plugin.hockey" )


## Functions

#### [hockeyApp.init()][plugin.hockey.init]

#### [hockeyApp.checkForUpdate()][plugin.hockey.checkForUpdate]

#### [hockeyApp.unRegisterForUpdate()][plugin.hockey.unRegisterForUpdate]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.hockey"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

In addition, you must enable <nobr>pop-up</nobr> error messages within `config.lua` to catch crash reports:

``````lua
application =
{
	showRuntimeErrors = true,
}
``````

<!--- Include ATS "override" template block --->
TEMPLATE_ATS
<!--- --->

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`

</div>


## Support

* [http://support.hockeyapp.net/](http://support.hockeyapp.net/)
* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)
