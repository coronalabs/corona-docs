# ageRange.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          age range, age verification, parental controls, initialization
> __See also__          [plugin.ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange]
>                       [ageRange][plugin.ageRange.event.ageRange]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Initializes the Age Range plugin and sets up the listener function to receive age verification, significant update, and communication events.

## Syntax

    plugin.ageRange.init( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Function that will receive age range events including:
- [ageRangeEvent][plugin.ageRange.event.ageRange] - Age verification responses
- [significantUpdateEvent][plugin.ageRange.event.significantUpdate] - App update approval responses
- [communicationEvent][plugin.ageRange.event.communication] - Communication permission responses

## Example
``````lua
local ageRange = require("plugin.ageRange")

local function ageRangeListener(event)
    if event.name == "ageRangeEvent" then
        if event.isError then
            print("Error:", event.errorMessage)
        elseif not event.isAvailable then
            print("Age range not available")
        elseif event.declined then
            print("User declined to share age range")
        else
            print("Lower bound:", event.lowerBound)
            print("Upper bound:", event.upperBound)
            print("User status:", event.userStatus)
            print("Has parental controls:", event.hasParentalControls)
        end
        
    elseif event.name == "significantUpdateEvent" then
        if event.questionSent then
            print("Update permission request sent")
        elseif event.approved then
            print("Parent approved the update")
        else
            print("Parent denied the update")
        end
        
    elseif event.name == "communicationEvent" then
        if event.questionSent then
            print("Communication request sent")
        elseif event.approved then
            print("Communication approved")
        else
            print("Communication denied")
        end
    end
end

-- Initialize the plugin
ageRange.init(ageRangeListener)
``````