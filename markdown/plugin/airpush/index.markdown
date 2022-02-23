# PLUGIN_NAME.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Airpush PlayStore SDK
> __Sample code__       
> __See also__          
> __Availability__      Starter, Pro, Enterprise
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Airpush's Standard SDK allows developers to earn industry-leading advertising CPM revenue with the world's highest global fill rates.

## Sign Up

To use the Airpush service, please [sign up](http://manage.airpush.com/publishers/publishers/) for generating unique APPID & APIKEY to your Android Application.

## Platforms

The following platforms are supported:  library.init( listener )

* Android

## Syntax

	local PLUGIN_NAME = require "plugin.airpush.playstore"

## Functions

#### [PLUGIN_NAME.FUNCTION()][plugin.PLUGIN_NAME.init]

#### [PLUGIN_NAME.FUNCTION()][plugin.PLUGIN_NAME.show]

#### [PLUGIN_NAME.FUNCTION()][plugin.PLUGIN_NAME.hide]

#### [PLUGIN_NAME.FUNCTION()][plugin.PLUGIN_NAME.smartAd]

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
		["plugin.airpush.playstore"] =
		{
			-- required
			publisherId = "com.airpush",
		},
	},		
}
``````

### Enterprise

* [Airpush Standard SDK Doc for Entrprise Edition programmers ](http://manage.airpush.com/docs/index.php?title=Corona_Standard_SDK_1.0)

## Sample Code

You can access sample code [here](https://bitbucket.org/coronalabs/plugins-hosted-airpush/downloads#download-368645).

## Support
 
More support is available from the PUBLISHER_NAME team:

* [E-mail](mailto://androiddevs@airpush.com)
* [Forum](http://manage.airpush.com/docs/index.php?title=Corona_Standard_SDK_1.0)
* [Plugin Publisher](http://www.airpush.com)
