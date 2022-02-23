# apsalar.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Apsalar
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The [Apsalar Analytics](https://marketplace.coronalabs.com/plugin/apsalar) plugin allows you to track the usage and behavior of your application in the [Apsalar](https://apsalar.com/app/login) system, including mobile install attribution/tracking.


## Registration

To use Apsalar analytics, please [register](https://apsalar.com/app/login?action=register) for an account.


## Syntax

	local apsalar = require( "plugin.apsalar" )


## Functions

#### [apsalar.init()][plugin.apsalar.init]

#### [apsalar.logEvent()][plugin.apsalar.logEvent]

#### [apsalar.endSession()][plugin.apsalar.endSession]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.apsalar"] =
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

</div>
