# event.responseType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, responseType
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The encoding type of the response, which will be one of the following values:

* `"text"` - The response content was determined to be text, and was encoded as a UTF-8 string.
* `"binary"` - The response content was determined to be binary, was provided without any encoding.

## Gotchas

When not downloading response content to a file, the determination of whether a given response is text or binary is made based on the response content, looking at the content type and any specified content encoding, either in response headers, or in the content itself (as in the case of HTML and XML).  This determination is necessary because text content can be encoded in a variety of different character sets or encodings, so it is necessary to decode that content appropriately and then re-encode it as UTF-8 text so that the Lua code processing the response doesn't have to deal with encoding issues.

When downloading response content to a file, this value will always be `"binary"` and no transcoding of downloaded content will be performed.  The exact bytes received will be written to the file.
