# ageRange.requestAgeRange()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          age range, age verification, parental controls, COPPA
> __See also__          [plugin.ageRange.init()][plugin.ageRange.init]
>                       [ageRange][plugin.ageRange.event.ageRange]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests the user's age range from the system. Results are returned through the listener function set in [plugin.ageRange.init()][plugin.ageRange.init].

### Platform Behavior

**iOS (26.0+):**
- Displays system UI for age range sharing
- Supports custom age gates through Screen Time
- Returns detailed parental control status
- Respects Family Sharing settings

**Android:**
- Uses Google Play's Age Signals API
- Returns verification status (verified 18+, supervised, unknown)
- Provides age ranges for supervised users
- Requires Play Store to be installed and enabled

## Syntax

    plugin.ageRange.requestAgeRange()

## Example
``````lua
local ageRange = require("plugin.ageRange")

local function ageRangeListener(event)
    if event.name == "ageRangeEvent" then
        if event.isError then
            print("Error:", event.errorMessage)
            if event.errorCode then
                print("Error code:", event.errorCode)
            end
            
        elseif not event.isAvailable then
            print("Age range service not available")
            
        elseif event.declined then
            print("User declined to share age range")
            
        else
            -- Successfully received age range
            if event.lowerBound then
                print("Minimum age:", event.lowerBound)
            end
            
            if event.upperBound then
                print("Maximum age:", event.upperBound)
            else
                print("No upper age limit (likely 18+)")
            end
            
            -- Check user status
            if event.userStatus == "verified" then
                print("User is a verified adult (18+)")
                -- Grant full access to content
                
            elseif event.userStatus == "supervised" then
                print("User has parental controls active")
                print("Has parental controls:", event.hasParentalControls)
                -- Implement age-appropriate restrictions
                
            elseif event.userStatus == "approvalPending" then
                print("Waiting for parental approval (Android)")
                
            elseif event.userStatus == "approvalDenied" then
                print("Parental approval denied (Android)")
                
            elseif event.userStatus == "unknown" then
                print("Age status unknown (Android)")
                -- Prompt user to verify in Play Store
            end
            
            -- Android-specific fields
            if event.installId then
                print("Install ID:", event.installId)
            end
            
            if event.mostRecentApprovalDate then
                local dateStr = os.date("%c", event.mostRecentApprovalDate/1000)
                print("Last approval:", dateStr)
            end
        end
    end
end

-- Initialize and request
ageRange.init(ageRangeListener)
ageRange.requestAgeRange()
``````

## Age-Gated Content Example
``````lua
local ageRange = require("plugin.ageRange")

local function checkAgeAndLoadContent(event)
    if event.name == "ageRangeEvent" then
        if event.isError or not event.isAvailable or event.declined then
            -- Default to most restrictive content
            loadContentForAge(0)
            return
        end
        
        local minAge = event.lowerBound or 0
        
        -- Load appropriate content based on age
        if minAge >= 18 then
            loadAdultContent()
        elseif minAge >= 13 then
            loadTeenContent()
        else
            loadKidsContent()
        end
    end
end

ageRange.init(checkAgeAndLoadContent)
ageRange.requestAgeRange()
``````