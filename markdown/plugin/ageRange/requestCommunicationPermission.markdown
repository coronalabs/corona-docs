# ageRange.requestCommunicationPermission()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          communication, parental consent, contact permissions, PermissionKit
> __See also__          [plugin.ageRange.init()][plugin.ageRange.init]
>                       [communicationEvent][plugin.ageRange.event.communication]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests parental permission for a supervised user to communicate with a specific person (phone number, email, or custom handle).

### Platform Behavior

**iOS (26.1+):**
- Sends permission request via Messages to parent/guardian
- Returns `questionSent` immediately
- Responses arrive asynchronously through listener
- Supports phone, email, and custom handle types
- Requires PermissionKit entitlement

**Android:**
- Checks if user is supervised
- Returns informational message about platform differences
- Apps must implement their own communication approval logic
- No direct equivalent to iOS PermissionKit

## Syntax

    plugin.ageRange.requestCommunicationPermission( handle, handleKind )

##### handle ~^(required)^~
_[String][api.type.String]._ The contact identifier (phone number, email address, or custom ID).

##### handleKind ~^(required)^~
_[String][api.type.String]._ Type of handle. Supported values:
- `"phone"` - Phone number
- `"email"` - Email address  
- `"custom"` - Custom identifier (username, user ID, etc.)

## Example
``````lua
local ageRange = require("plugin.ageRange")

local function ageRangeListener(event)
    if event.name == "communicationEvent" then
        if event.platform == "android" then
            -- Android returns supervision status
            print("Platform:", event.platform)
            print("Message:", event.message)
            
            if event.isSupervised then
                print("User is supervised")
                print("Requires parental approval:", event.requiresParentalApproval)
                -- Implement custom approval flow
                showCustomApprovalFlow()
            else
                print("User not supervised - communication allowed")
                enableCommunication()
            end
            
        else
            -- iOS behavior
            if event.isError then
                print("Error:", event.errorMessage)
                
            elseif event.questionSent then
                print("Communication request sent to parent")
                print("Handle:", event.handle)
                -- Show waiting UI
                showWaitingForApprovalUI()
                
            elseif event.isBackgroundResponse then
                -- Response received asynchronously
                if event.approved then
                    print("Parent approved communication")
                    -- Enable communication with contact
                    allowCommunicationWith(event.handle)
                else
                    print("Parent denied communication")
                    -- Block communication with contact
                    blockCommunicationWith(event.handle)
                end
            end
        end
    end
end

ageRange.init(ageRangeListener)

-- Start listening for responses (iOS)
ageRange.startListeningForCommunicationResponses()

-- Request permission to communicate via email
ageRange.requestCommunicationPermission("friend@example.com", "email")

-- Request permission to communicate via phone
ageRange.requestCommunicationPermission("+1234567890", "phone")

-- Request permission for custom identifier (e.g., username)
ageRange.requestCommunicationPermission("user123", "custom")
``````

## Managing Contact Approval
``````lua
local ageRange = require("plugin.ageRange")
local approvedContacts = {}
local pendingContacts = {}

local function ageRangeListener(event)
    if event.name == "communicationEvent" then
        if event.questionSent then
            -- Track pending request
            pendingContacts[event.handle] = true
            updateContactUI(event.handle, "pending")
            
        elseif event.isBackgroundResponse then
            -- Remove from pending
            pendingContacts[event.handle] = nil
            
            if event.approved then
                -- Add to approved list
                approvedContacts[event.handle] = true
                updateContactUI(event.handle, "approved")
                enableMessagingWith(event.handle)
            else
                updateContactUI(event.handle, "denied")
            end
        end
    end
end

ageRange.init(ageRangeListener)
ageRange.startListeningForCommunicationResponses()

-- Check if contact is approved before allowing communication
local function canCommunicateWith(handle)
    return approvedContacts[handle] == true
end

-- Request approval for new contact
local function requestContactApproval(handle, handleType)
    if not canCommunicateWith(handle) and not pendingContacts[handle] then
        ageRange.requestCommunicationPermission(handle, handleType)
    end
end
``````