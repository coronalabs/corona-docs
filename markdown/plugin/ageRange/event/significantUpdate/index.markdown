# event.significantUpdate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          significant update, parental approval, app updates, significantUpdateEvent
> __See also__          [plugin.ageRange.requestSignificantUpdatePermission()][plugin.ageRange.requestSignificantUpdatePermission]
>                       [plugin.ageRange.*][plugin.ageRange]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Significant update event dispatched in response to [plugin.ageRange.requestSignificantUpdatePermission()][plugin.ageRange.requestSignificantUpdatePermission].

## Properties

### event.name

_[String][api.type.String]._ The string `"significantUpdateEvent"`.

---

### event.isError

_[Boolean][api.type.Boolean]._ `true` if an error occurred, `false` otherwise.

---

### event.description

_[String][api.type.String]._ The update description provided when requesting permission.

---

### event.questionSent

_[Boolean][api.type.Boolean]._ `true` if the permission request was successfully sent to the parent/guardian. **iOS only.**

---

### event.isBackgroundResponse

_[Boolean][api.type.Boolean]._ `true` if this is an asynchronous response from a parent/guardian. **iOS only.**

---

### event.approved

_[Boolean][api.type.Boolean]._ `true` if the parent/guardian approved the update, `false` if denied.

**iOS:** Present when `isBackgroundResponse` is `true`
**Android:** Indicates current approval status

---

### event.pending

_[Boolean][api.type.Boolean]._ `true` if approval is pending. **Android only.**

Corresponds to `SUPERVISED_APPROVAL_PENDING` status.

---

### event.denied

_[Boolean][api.type.Boolean]._ `true` if approval was denied. **Android only.**

Corresponds to `SUPERVISED_APPROVAL_DENIED` status.

---

### event.platform

_[String][api.type.String]._ Platform identifier: `"android"` or `"ios"`.

---

### event.store

_[String][api.type.String]._ App store identifier. Currently only `"google"` for Android.

---

### event.message

_[String][api.type.String]._ Platform-specific informational message.

**Android:** Explains that updates must be submitted through Play Console rather than requested at runtime.

---

### event.mostRecentApprovalDate

_[Number][api.type.Number]._ Timestamp (milliseconds since Unix epoch) of most recent approval. **Android only.**

---

### event.errorMessage

_[String][api.type.String]._ Error description if `isError` is `true`.

---

## Example
``````lua
local function ageRangeListener(event)
    if event.name == "significantUpdateEvent" then
        print("Platform:", event.platform or "ios")
        
        if event.platform == "android" then
            print("Message:", event.message)
            
            if event.approved then
                print("Previously approved")
                if event.mostRecentApprovalDate then
                    local date = os.date("%c", event.mostRecentApprovalDate/1000)
                    print("Approved on:", date)
                end
            elseif event.pending then
                print("Approval pending")
            elseif event.denied then
                print("Approval denied")
            end
            
        else
            -- iOS
            if event.questionSent then
                print("Request sent to parent")
                print("Description:", event.description)
                
            elseif event.isBackgroundResponse then
                if event.approved then
                    print("Parent approved update")
                else
                    print("Parent denied update")
                end
            end
        end
        
        if event.isError then
            print("Error:", event.errorMessage)
        end
    end
end
``````