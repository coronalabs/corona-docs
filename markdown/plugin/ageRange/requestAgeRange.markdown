# ageRange.requestAgeRange()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          age range, age verification, parental controls, Screen Time, iOS 18
> __See also__          [plugin.ageRange.init()][plugin.ageRange.init]
>                      
>                       [ageRange][plugin.ageRange.event.ageRange]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Requests the user's age range with custom age gates. The user will be prompted to share their age range through the iOS Screen Time system. Results are returned through the listener function set in [plugin.ageRange.init()][plugin.ageRange.init].

This feature requires iOS 26.0 or later.


## Syntax

    plugin.ageRange.requestAgeRange( )



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
        
        -- Check user status
        if event.userStatus == "verified" then
            print( "User is a verified adult (18+)" )
        elseif event.userStatus == "supervised" then
            print( "User has parental controls active" )
        end
    end
end

-- Initialize the plugin
ageRange.init( ageRangeListener )

-- Request age range with custom gates
ageRange.requestAgeRange( )
``````
