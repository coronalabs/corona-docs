
# event.expiration

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [licensing][api.event.licensing]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          licensing, expiration
> __See also__          [licensing.verify()][api.library.licensing.verify]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [number][api.type.Number] that corresponds to the date/time when the cached license response expires. For a strict policy, this is the time when the event happens.

For a paid application, the server sets the initial license validity period so that the license response remains valid for as long as the application is refundable. 

When an application is no longer refundable, the server sets a longer validity period — typically a number of days.

For a free application, the server sets the validity period to a very high value. This ensures that, provided the policy has cached the validity timestamp locally, it will not need to recheck the license status of the application in the future.
