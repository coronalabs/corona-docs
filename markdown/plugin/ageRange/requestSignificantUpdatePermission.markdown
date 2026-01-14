# ageRange.requestSignificantUpdatePermission()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          parental consent, app updates, permissions, PermissionKit
> __See also__          [plugin.ageRange.init()][plugin.ageRange.init]
>                       [significantUpdateEvent][plugin.ageRange.event.significantUpdate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests parental permission for significant app updates that may affect supervised users. Use this when your app makes material changes that require parental notification or consent.

### Platform Behavior

**iOS (26.1+):**
- Sends permission request via Messages to parent/guardian
- Displays system UI with your description
- Returns `questionSent` immediately
- Responses arrive asynchronously through listener
- Requires PermissionKit entitlement

**Android:**
- Checks current approval status through Age Signals
- Updates must be submitted through Play Console
- Returns informational message about platform differences
- Checks `SUPERVISED_APPROVAL_PENDING` and `SUPERVISED_APPROVAL_DENIED` statuses

## Syntax

    plugin.ageRange.requestSignificantUpdatePermission( description )

##### description ~^(required)^~
_[String][api.type.String]._ Clear, concise description of the significant update. Use specific language explaining what changed.

**Good examples:**
- "This update adds video calling and location sharing features."
- "We've added in-app purchases and social messaging."
- "New features include photo uploads and user profiles."

**Bad examples:**
- "We've made improvements to the app."
- "Bug fixes and performance improvements."
- "New features added."

## Example
``````lua
local ageRange = require("plugin.ageRange")

local function ageRangeListener(event)
    if event.name == "significantUpdateEvent" then
        if event.platform == "android" then
            -- Android returns status check instead of sending request
            print("Platform:", event.platform)
            print("Message:", event.message)
            
            if event.approved then
                print("App changes previously approved")
                if event.mostRecentApprovalDate then
                    local dateStr = os.date("%c", event.mostRecentApprovalDate/1000)
                    print("Approved on:", dateStr)
                end
            elseif event.pending then
                print("Approval pending")
            elseif event.denied then
                print("Approval denied")
            end
            
        else
            -- iOS behavior
            if event.isError then
                print("Error:", event.errorMessage)
                
            elseif event.questionSent then
                print("Permission request sent to parent")
                print("Description:", event.description)
                -- Start listening for responses if not already
                
            elseif event.isBackgroundResponse then
                -- Response received asynchronously
                if event.approved then
                    print("Parent approved the update")
                    -- Enable new features
                    enableNewFeatures()
                else
                    print("Parent denied the update")
                    -- Keep new features disabled
                    disableNewFeatures()
                end
            end
        end
    end
end

ageRange.init(ageRangeListener)

-- Request permission for significant update
local updateDescription = "This update adds multiplayer chat and friend invitations."
ageRange.requestSignificantUpdatePermission(updateDescription)
``````

## Handling Update Flow
``````lua
local ageRange = require("plugin.ageRange")
local newFeaturesEnabled = false

local function ageRangeListener(event)
    if event.name == "significantUpdateEvent" then
        if event.questionSent then
            -- Show waiting UI
            showWaitingForApprovalUI()
            
        elseif event.approved then
            -- Enable new features
            newFeaturesEnabled = true
            showNewFeaturesUI()
            
        elseif event.approved == false then
            -- Keep features disabled
            newFeaturesEnabled = false
            showRestrictedUI()
        end
    end
end

ageRange.init(ageRangeListener)

-- Check if user needs approval before showing new features
local function checkUpdateApproval()
    -- First check if user is supervised
    ageRange.requestAgeRange()
    
    timer.performWithDelay(1000, function()
        -- Then request update permission
        ageRange.requestSignificantUpdatePermission(
            "This update adds social features including chat and profiles."
        )
    end)
end

checkUpdateApproval()
``````