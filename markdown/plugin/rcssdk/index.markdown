# rcssdk.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rcssdk
> __Sample code__       
> __See also__          
> __Availability__      Starter, Pro, Enterprise
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The rcssdk plugin enables X.

## Sign Up

To use the SERVICE_NAME service, please [sign up](CORONA_REFERRAL_URL) for an account.

## Platforms

* Android: Yes
* iOS: Yes
* Mac: Yes
* Win: Yes
* Kindle: No
* NOOK: No

## Syntax

	local rcssdk = require "plugin.rcssdk"

## Functions

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
		["plugin.rcssdk"] =
		{
			-- required
			publisherId = "com.rovio",
		},
	},		
}
``````

### Enterprise

TBD

## Sample Code

## Support

More support is available from the Rovio team:

* [E-mail](mailto://jari.selin@rovio.com)
* [Forum](http://forum.coronalabs.com/plugin/rcssdk)
* [Plugin Publisher](http://www.rovio.com)
