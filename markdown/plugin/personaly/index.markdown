
# personaly.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Persona.ly
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-personaly]

</div>

[Persona.ly](http://persona.ly) provides a way to reward your users with <nobr>in-game</nobr> currency in exchange for performing simple activities like watching videos, downloading apps, and filling out surveys.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* You'll need your own user management which generates a unique user&nbsp;ID for all of your players.  

* You'll need your own server since credit is validated via S2S <nobr>(Server-to-Server)</nobr> postbacks.

</div>


## Registration

Before you can use this plugin, you must [register](http://persona.ly) with Persona.ly.


## Syntax

	local plugin = require( "plugin.personaly" )


## Functions

#### [personaly.init()][plugin.personaly.init]

#### [personaly.show()][plugin.personaly.show]

#### [personaly.setUserDetails()][plugin.personaly.setUserDetails]


## Events

#### [adsRequest][plugin.personaly.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.personaly"] =
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

</div>  


## Support

* [http://persona.ly](http://persona.ly)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
