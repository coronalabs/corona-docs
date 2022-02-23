# startapp.showSplash()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, hide
> __See also__          [startapp.show()][plugin.startapp.show]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a StartApp splash ad immediately after the application is launched.
A Splash Ad first displays a pre-defined full page splash screen that you can customize (as described below) followed by a full page ad.


## Gotchas

To use splash ad, call `startapp.showSplash()` only once, immediately after `startapp.init()`.


## Syntax

	startapp.showSplash( [ params ] )

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional configuration for the splash screen — see the next section for details.


## Parameter Reference

The `params` table includes configuration for the splash screen.

##### theme ~^(optional)^~
_[String][api.type.String]._ Use one of six options to specify a design theme for the full page splash screen: `"deep_blue"` (default), `"sky"`, `"ashen_sky"`, `"blaze"`, `"gloomy"`, `"ocean"`.

##### appName ~^(optional)^~
_[String][api.type.String]._ Sets the application name to be used in the splash screen.

##### orientation ~^(optional)^~
_[String][api.type.String]._ Sets the orientation to be used in the splash screen. Valid values are  `"portrait"` (default), `"landscape"`, `"auto"` (use the device's orientation upon entering the application).


## Example

``````lua
local startapp = require( "plugin.startapp" )

local function adListener( event )
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
        -- Load an StartApp ad
        startapp.load( "interstitial" )
    end
end

-- Initialize the StartApp plugin
startapp.init( adListener, { appId = "Your App ID" } )

-- Show the StartApp splash
startapp.showSplash( { appName = "Your App Name" } )
``````
