# ageRange.startListeningForCommunicationResponses()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [plugin.ageRange.*][plugin.ageRange]
> __Return value__      none
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          communication, responses, background listening, PermissionKit
> __See also__          [plugin.ageRange.requestCommunicationPermission()][plugin.ageRange.requestCommunicationPermission]
>                       [communicationEvent][plugin.ageRange.event.communication]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Starts listening for asynchronous responses to communication permission requests. On iOS, this enables receiving responses even when the app is in the background or after restart.

### Platform Behavior

**iOS (26.1+):**
- Monitors async sequence for permission responses
- Receives responses via Messages integration
- Works even when app is backgrounded
- Continues until app termination or explicit stop

**Android:**
- No-op function (for API compatibility)
- Android doesn't support real-time response listening
- Apps should call `requestAgeRange()` periodically to check for status updates

## Syntax

    plugin.ageRange.startListeningForCommunicationResponses()

## Example
``````lua
local ageRange = require("plugin.ageRange")

local function ageRangeListener(event)
    if event.name == "communicationEvent" then
        if event.platform == "android" then
            print("Android:", event.message)
            -- Periodically check requestAgeRange() instead
            
        elseif event.isBackgroundResponse then
            -- iOS: Received response asynchronously
            print("Background response received")
            
            if event.approved then
                print("Communication approved by parent")
                -- Update app state to allow communication
                updateCommunicationPermissions()
            else
                print("Communication denied by parent")
                -- Update app state to block communication
                blockCommunicationFeatures()
            end
        end
    end
end

ageRange.init(ageRangeListener)

-- Start listening for responses (iOS only)
ageRange.startListeningForCommunicationResponses()

-- Later, request communication permission
ageRange.requestCommunicationPermission("friend@example.com", "email")
``````

## Complete Communication Flow
``````lua
local ageRange = require("plugin.ageRange")

-- Track communication state
local communicationState = {
    listening = false,
    approvedContacts = {},
    pendingRequests = {}
}

local function ageRangeListener(event)
    if event.name == "communicationEvent" then
        if event.platform == "android" then
            -- Handle Android-specific response
            if event.isSupervised and event.requiresParentalApproval then
                print("Android: Requires custom approval flow")
                showCustomApprovalDialog()
            end
            
        else
            -- Handle iOS response
            if event.questionSent then
                -- Track pending request
                communicationState.pendingRequests[event.handle] = true
                showPendingUI(event.handle)
                
            elseif event.isBackgroundResponse then
                -- Handle async response
                local handle = findHandleFromResponse(event)
                communicationState.pendingRequests[handle] = nil
                
                if event.approved then
                    communicationState.approvedContacts[handle] = true
                    enableCommunication(handle)
                else
                    disableCommunication(handle)
                end
            end
        end
    end
end

-- Initialize and start listening
ageRange.init(ageRangeListener)
ageRange.startListeningForCommunicationResponses()
communicationState.listening = true

-- Request communication with a contact
local function requestCommunication(email)
    if not communicationState.approvedContacts[email] then
        ageRange.requestCommunicationPermission(email, "email")
    end
end

-- Example: Request to message a friend
requestCommunication("friend@example.com")
``````