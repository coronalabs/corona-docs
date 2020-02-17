
# event.errorType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.string]
> __Event__             [licensing][api.event.licensing]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          licensing, errorType
> __See also__          [licensing.verify()][api.library.licensing.verify]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If [event.isError][api.event.licensing.isError] is `true`, this contains the type of error: `"configuration"` or `"network"`. Returns `nil` if no error.