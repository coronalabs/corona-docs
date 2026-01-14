# ageRange.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          age, age range, age verification, parental controls, COPPA, iOS 26, Android
> __Platforms__         Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Age Range plugin provides access to Apple's Declared Age Range framework (iOS 26.0+) and Google's Age Signals API (Android) for age verification and parental control management. This plugin helps apps comply with age-related regulations including state laws requiring parental consent for minors.

### Platform Differences

**iOS (iOS 26.0+)**
- Uses Apple's Declared Age Range framework
- Integrates with Screen Time and Family Sharing
- Supports custom age gates (13, 15, 18, etc.)
- Provides detailed parental control information
- Supports PermissionKit for communication and update approvals

**Android**
- Uses Google Play's Age Signals API
- Integrates with Family Link supervision
- Returns age ranges for supervised users
- Checks approval status through Play Console
- Limited real-time permission support

## Syntax

    local ageRange = require("plugin.ageRange")

## Functions

#### [ageRange.init()][plugin.ageRange.init]
#### [ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange]
#### [ageRange.requestSignificantUpdatePermission()][plugin.ageRange.requestSignificantUpdatePermission]
#### [ageRange.requestCommunicationPermission()][plugin.ageRange.requestCommunicationPermission]
#### [ageRange.startListeningForCommunicationResponses()][plugin.ageRange.startListeningForCommunicationResponses]

## Events

#### [ageRange][plugin.ageRange.event.ageRange]
#### [significantUpdateEvent][plugin.ageRange.event.significantUpdate]
#### [communicationEvent][plugin.ageRange.event.communication]

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.
``````lua
settings =
{
    plugins =
    {
        ["plugin.ageRange"] =
        {
            publisherId = "com.solar2d"
        },
    },
}
``````

### iOS Requirements

Add the following to your `build.settings` for iOS:
``````lua
settings =
{
    iphone =
    {
        plist =
        {
            -- Required for Declared Age Range
            ["com.apple.developer.declared-age-range"] = true,
        },
    },
}
``````

### Android Requirements

Ensure Google Play Services is up to date. The Age Signals API requires:
- Google Play Store installed and enabled
- Google Play Services 22.0.0 or later

## Sample Code
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
            print("Age range received:")
            print("  Lower bound:", event.lowerBound)
            print("  Upper bound:", event.upperBound)
            print("  User status:", event.userStatus)
            
            if event.userStatus == "verified" then
                -- User is 18+, grant full access
            elseif event.userStatus == "supervised" then
                -- User has parental controls, restrict content
            end
        end
        
    elseif event.name == "significantUpdateEvent" then
        if event.questionSent then
            print("Update permission request sent")
        elseif event.approved then
            print("Update approved by parent")
        end
        
    elseif event.name == "communicationEvent" then
        if event.questionSent then
            print("Communication request sent")
        elseif event.approved then
            print("Communication approved by parent")
        end
    end
end

-- Initialize the plugin
ageRange.init(ageRangeListener)

-- Request age range
ageRange.requestAgeRange()
``````

## Support

- GitHub: [https://github.com/solar2d/plugin.ageRange](https://github.com/solar2d/plugin.ageRange)
- Documentation: [https://docs.coronalabs.com/plugin/ageRange](https://docs.coronalabs.com/plugin/ageRange)