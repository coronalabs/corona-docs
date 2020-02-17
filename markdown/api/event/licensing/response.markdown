
# event.response

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.string]
> __Event__             [licensing][api.event.licensing]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          licensing, response
> __See also__          [licensing.verify()][api.library.licensing.verify]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This is a translated response from the licensing server. The value may be one of the following strings:

* `"Licensed"`
* `"Not licensed"`
* `"Invalid public key"`
* `"Missing permission"`
* `"Invalid package name"`
* `"Non matching UID"`
* `"Not market managed"`
* `"Error contacting server"`