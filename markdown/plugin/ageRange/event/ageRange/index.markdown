# event.ageRange

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](__REVISION_URL__)
> __Keywords__          age range, age verification, parental controls, ageRangeEvent
> __See also__          [plugin.ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange]
>                       [plugin.ageRange.*][plugin.ageRange]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Age range event dispatched in response to [plugin.ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange].

## Properties

#### [event.name][plugin.ageRange.event.ageRange.name]
#### [event.isError][plugin.ageRange.event.ageRange.isError]
#### [event.isAvailable][plugin.ageRange.event.ageRange.isAvailable]
#### [event.declined][plugin.ageRange.event.ageRange.declined]
#### [event.lowerBound][plugin.ageRange.event.ageRange.lowerBound]
#### [event.upperBound][plugin.ageRange.event.ageRange.upperBound]
#### [event.userStatus][plugin.ageRange.event.ageRange.userStatus]
#### [event.hasParentalControls][plugin.ageRange.event.ageRange.hasParentalControls]
#### [event.errorMessage][plugin.ageRange.event.ageRange.errorMessage]
#### [event.errorCode][plugin.ageRange.event.ageRange.errorCode]
#### [event.installId][plugin.ageRange.event.ageRange.installId]
#### [event.mostRecentApprovalDate][plugin.ageRange.event.ageRange.mostRecentApprovalDate]

---

## Property Details

### event.name

_[String][api.type.String]._ The string `"ageRangeEvent"`.

---

### event.isError

_[Boolean][api.type.Boolean]._ `true` if an error occurred, `false` otherwise.

---

### event.isAvailable

_[Boolean][api.type.Boolean]._ `true` if age range service is available on this device, `false` otherwise.

**Platform Notes:**
- **iOS:** Available on iOS 26.0+ devices
- **Android:** Available if Google Play Services is installed and up-to-date

---

### event.declined

_[Boolean][api.type.Boolean]._ `true` if user declined to share age range, `false` otherwise.

**iOS Only:** User explicitly chose not to share their age range through the system dialog.

---

### event.lowerBound

_[Number][api.type.Number]._ Minimum age in the user's age range. May be `nil`.

**Examples:**
- `13` - User is at least 13 years old
- `18` - User is at least 18 years old (verified adult)
- `nil` - No age range provided or user is under minimum age gate

---

### event.upperBound

_[Number][api.type.Number]._ Maximum age in the user's age range. May be `nil`.

**Examples:**
- `17` - User is between lowerBound and 17 years old
- `nil` - No upper limit (typically for verified adults 18+)

---

### event.userStatus

_[String][api.type.String]._ User verification status. Possible values:

**iOS & Android:**
- `"verified"` - Verified adult (18+), no parental controls
- `"supervised"` - User with active parental controls (iOS) or Family Link supervision (Android)
- `"declined"` - User declined to share age range (iOS)
- `"notAvailable"` - Age range service not available
- `"error"` - Error occurred

**Android Only:**
- `"approvalPending"` - Waiting for parental approval
- `"approvalDenied"` - Parental approval was denied
- `"unknown"` - Age status unknown, user needs to verify in Play Store
- `"empty"` - No age data available

---

### event.hasParentalControls

_[Boolean][api.type.Boolean]._ `true` if user has active parental controls or supervision.

**Platform Details:**
- **iOS:** Screen Time restrictions are active
- **Android:** Family Link supervision is enabled

---

### event.errorMessage

_[String][api.type.String]._ Human-readable error message if `isError` is `true`.

**Common Error Messages:**

**iOS:**
- `"Age range service not available"` - Device doesn't support the API
- `"User declined to share age range"` - User chose not to share

**Android:**
- `"Age Signals API not available. Please update Play Store."`
- `"Play Store not found. Please install or enable Play Store."`
- `"Network error. Please check connection."`
- `"User age status unknown. Please verify in Play Store."`

---

### event.errorCode

_[Number][api.type.Number]._ Numeric error code. **Android only.**

Error codes:
- `-1` - API not available (Play Services outdated)
- `-2` - Play Store not found or disabled
- `-3` - Network error

---

### event.installId

_[String][api.type.String]._ Unique install identifier for supervised users. **Android only.**

Used to track individual app installations under Family Link supervision. Useful for:
- Tracking approval requests across app reinstalls
- Associating permissions with specific device installations

---

### event.mostRecentApprovalDate

_[Number][api.type.Number]._ Timestamp (milliseconds since Unix epoch) of most recent parental approval. **Android only.**

Convert to readable date:
``````lua
if event.mostRecentApprovalDate then
    local dateStr = os.date("%c", event.mostRecentApprovalDate/1000)
    print("Last approved:", dateStr)
end
``````

---

## Example
``````lua
local function ageRangeListener(event)
    if event.name == "ageRangeEvent" then
        print("Event name:", event.name)
        print("Is error:", event.isError)
        print("Is available:", event.isAvailable)
        print("Declined:", event.declined)
        
        if event.lowerBound then
            print("Lower bound:", event.lowerBound)
        end
        
        if event.upperBound then
            print("Upper bound:", event.upperBound)
        end
        
        print("User status:", event.userStatus)
        print("Has parental controls:", event.hasParentalControls)
        
        -- Android-specific
        if event.installId then
            print("Install ID:", event.installId)
        end
        
        if event.mostRecentApprovalDate then
            local date = os.date("%c", event.mostRecentApprovalDate/1000)
            print("Last approval:", date)
        end
        
        if event.errorCode then
            print("Error code:", event.errorCode)
        end
    end
end
``````