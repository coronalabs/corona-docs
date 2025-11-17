# ageRange

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          age range, age verification, parental controls, Screen Time, ageRange
> __See also__          [plugin.ageRange.init()][plugin.ageRange.init]
>                       [plugin.ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange]
>                       [plugin.ageRange.*][plugin.ageRange]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The following event properties are passed to the listener function specified in [plugin.ageRange.init()][plugin.ageRange.init].


## Properties

#### event.name

_[String][api.type.String]._ The name of the event. Always `"ageRange"`.

#### event.isError

_[Boolean][api.type.Boolean]._ Indicates whether an error occurred. If `true`, check `event.errorMessage` for details.

#### event.errorMessage

_[String][api.type.String]._ Error message if `event.isError` is `true`.

#### event.isAvailable

_[Boolean][api.type.Boolean]._ Indicates whether the age range service is available on this device.

#### event.declined

_[Boolean][api.type.Boolean]._ Indicates whether the user declined to share their age range.

#### event.lowerBound

_[Number][api.type.Number]._ The lower bound of the user's age range (e.g., 13, 18, 21). Only present if age range was shared.

#### event.upperBound

_[Number][api.type.Number]._ The upper bound of the user's age range. Only present if age range was shared and there is an upper limit.

#### event.userStatus

_[String][api.type.String]._ The user's verification status. Possible values include:
- `"verified"` — User is a verified adult (18+) with no parental controls
- `"supervised"` — User has active parental controls
- `"declined"` — User declined to share age range
- `"notAvailable"` — Age range service not available
- `"error"` — An error occurred

#### event.hasParentalControls

_[Boolean][api.type.Boolean]._ Indicates whether the user has active parental controls (Screen Time restrictions). Only present if age range was shared.
