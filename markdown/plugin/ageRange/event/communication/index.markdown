# event.communication

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          communication, parental approval, contact permissions, communicationEvent
> __See also__          [plugin.ageRange.requestCommunicationPermission()][plugin.ageRange.requestCommunicationPermission]
>                       [plugin.ageRange.*][plugin.ageRange]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Communication permission event dispatched in response to [plugin.ageRange.requestCommunicationPermission()][plugin.ageRange.requestCommunicationPermission] and background responses.

## Properties

### event.name

_[String][api.type.String]._ The string `"communicationEvent"`.

---

### event.isError

_[Boolean][api.type.Boolean]._ `true` if an error occurred, `false` otherwise.

---

### event.handle

_[String][api.type.String]._ The contact handle (phone, email, or custom ID) from the request.

---

### event.handleKind

_[String][api.type.String]._ Type of handle: `"phone"`, `"email"`, or `"custom"`. **Android only** in responses.

---

### event.questionSent

_[Boolean][api.type.Boolean]._ `true` if the permission request was successfully sent to the parent/guardian. **iOS only.**

---

### event.isBackgroundResponse

_[Boolean][api.type.Boolean]._ `true` if this is an asynchronous response from a parent/guardian. **iOS only.**

---

### event.approved

_[Boolean][api.type.Boolean]._ `true` if the parent/guardian approved communication, `false` if denied.

**iOS:** Present when `isBackgroundResponse` is `true`

---

### event.isSupervised

_[Boolean][api.type.Boolean]._ `true` if user is under supervision (Family Link). **Android only.**

---

### event.requiresParentalApproval

_[Boolean][api.type.Boolean]._ `true` if communication requires parental approval. **Android only.**

---

### event.userStatus

_[String][api.type.String]._ Supervision status. **Android only.**

Values:
- `"supervised"` - User is supervised
- `"approvalPending"` - Approval pending
- `"approvalDenied"` - Approval denied

---

### event.platform

_[String][api.type.String]._ Platform identifier: `"android"` or `"ios"`.

---

### event.store

_[String][api.type.String]._ App store identifier. Currently only `"google"` for Android.

---

### event.message

_[String][api.type.String]._ Platform-specific informational message.

**Android:** Explains that Android doesn't have direct communication approval equivalent.

---

### event.errorMessage

_[String][api.type.String]._ Error description if `isError` is `true`.

---

## Example
``````lua
local function ageRangeListener(event)
    if event.name == "communicationEvent" then
        print("Handle:", event.handle)
        
        if event.platform == "android" then
            print("Platform:", event.platform)
            print("Message:", event.message)
            
            if event.isSupervised then
                print("User is supervised")
                print("Requires approval:", event.requiresParentalApproval)
                print("Status:", event.userStatus)
            else
                print("User not supervised")
            end
            
        else
            -- iOS
            if event.questionSent then
                print("Request sent to parent")
                
            elseif event.isBackgroundResponse then
                if event.approved then
                    print("Communication approved")
                else
                    print("Communication denied")
                end
            end
        end
        
        if event.isError then
            print("Error:", event.errorMessage)
        end
    end
end
``````