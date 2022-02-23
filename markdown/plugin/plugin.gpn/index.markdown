# gpn.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gpn
> __Sample code__       
> __See also__          
> __Availability__      Starter, Pro, Enterprise
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The GameHouse Promotion Network lets you drive app installs with intelligence and control. You can participate in GPN by integrating the SDK into your iOS and Android apps.

## Terms and Conditions

Use of this SDK and participation in the GameHouse Promotion Network online services indicates your acceptance of our [Terms and Conditions](http://gpn.gamehouse.com/terms). If you do not agree to all of the terms you may not access the services.

## Sign Up

Signup for the GameHouse Promotion Network at [http://partners.gamehouse.com/gpn/](http://partners.gamehouse.com/gpn/).

## Platforms

The following platforms are supported:

* Android
* iOS

## Syntax

	local gpn = require "plugin.gpn"

## Functions

#### [gpn.init()][plugin.gpn.init]
#### [gpn.startRequestingInterstitials()][plugin.gpn.startRequestingInterstitials]
#### [gpn.presentInterstitial()][plugin.gpn.presentInterstitial]
#### [gpn.stopRequestingInterstitials()][plugin.gpn.stopRequestingInterstitials]
#### [gpn.setShouldKillOnLowMemory()][plugin.gpn.setShouldKillOnLowMemory]


## Project Settings

### SDK

When you build using the Corona Simulator, the server automatically takes care of integrating the plugin into your project. 

All you need to do is add an entry into a `plugins` table of your `build.settings`. The following is an example of a minimal `build.settings` file:

``````
settings =
{
	plugins =
	{
		-- key is the name passed to Lua's 'require()'
		["plugin.gpn"] =
		{
			-- required
			publisherId = "com.gamehouse",
		},
	},		
}
``````

### Enterprise

TBD

## Sample Code

You can access sample code [here](SAMPLE_CODE_URL).

## Support

More support is available from the PUBLISHER_NAME team:

* [E-mail](mailto://ghpromonetwork@gamehouse.com)
* [Forum](http://forum.coronalabs.com/plugin/gpn)
* [Plugin Publisher](http://partners.gamehouse.com)
