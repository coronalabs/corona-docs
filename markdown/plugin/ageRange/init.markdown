# ageRange.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          age range, age verification, parental controls, Screen Time, iOS 18
> __See also__          [plugin.ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange]
>                      
>                       [ageRange][plugin.ageRange.event.ageRange]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes the Age Range plugin and sets up the listener function to receive age verification events.


## Syntax

    plugin.ageRange.init( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Function that will receive [ageRange][plugin.ageRange.event.ageRange] events.


## Example

``````lua
local ageRange = require( "plugin.ageRange" )

local function ageRangeListener( event )
    if event.isError then
        print( "Error:", event.errorMessage )
    elseif not event.isAvailable then
        print( "Age range not available" )
    elseif event.declined then
        print( "User declined to share age range" )
    else
        print( "Lower bound:", event.lowerBound )
        print( "Upper bound:", event.upperBound )
        print( "User status:", event.userStatus )
        print( "Has parental controls:", event.hasParentalControls )
    end
end

-- Initialize the plugin
ageRange.init( ageRangeListener )

-- Later, request age range
ageRange.requestAgeRange( )
``````
