# ageRange.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          age, age range, age verification, parental controls, COPPA, iOS 26, Android, Amazon
> __Platforms__         Android, iOS, Amazon
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Age Range plugin provides access to **Apple’s Declared Age Range framework** (iOS 26.0+), **Google’s Age Signals API** (Android), and **Amazon’s GetUserAgeData API** (Amazon Appstore / Fire OS) for age verification and parental control management. This plugin helps apps comply with age-related regulations including state laws requiring parental consent for minors.

### Platform Differences

**iOS (iOS 26.0+)**
* Uses Apple's Declared Age Range framework
* Integrates with Screen Time and Family Sharing
* Supports custom age gates (13, 15, 18, etc.)
* Provides detailed parental control information
* Supports PermissionKit for communication and update approvals


**Android (Google Play)**
* Uses Google Play's Age Signals API
* Integrates with Family Link supervision
* Returns age ranges for supervised users
* Checks approval status through Play Console
* Limited real-time permission support


**Android (Amazon Appstore / Fire OS)**
* Uses Amazon’s GetUserAgeData API
* Integrates with Amazon Kids (child profiles)
* Returns age range data for supervised child profiles
* Supports age verification via Amazon’s content provider system
* Use the Amazon App Tester or publish your app in the Amazon Appstore for testing


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
        entitlements =
        {
            -- Required for Declared Age Range
            ["com.apple.developer.declared-age-range"] = true,
        },
    },
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You need to add Declared Age Range as an Entitlement to your project identifiers on App Store Connect and create a new Provisioning Profile.

</div>


### Android Requirements

**Google Play Store Builds**

Ensure Google Play Services is up to date. The Age Signals API requires:
* Google Play Store installed and enabled
* Google Play Services 22.0.0 or later


**Amazon Appstore / Fire OS Builds**

The Age Range plugin supports Amazon’s GetUserAgeData API on Fire OS devices and any Android device running the Amazon Appstore. Requirements include:
* Fire OS device or Android device with Amazon Appstore installed
* Amazon Kids child profile for supervised age range data (otherwise age range may be unavailable)
* For testing: install the Amazon App Tester or publish your app to the Amazon Appstore


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

- [View on GitHub](https://github.com/solar2d/com.solar2d-plugin.ageRange)
