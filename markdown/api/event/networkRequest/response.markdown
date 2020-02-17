# event.response

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, response
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string containing the response from the server, or in the case of response output directed to a file, a table indicating the `filename` and `baseDirectory` for the output file.

When not downloading response content to a file, the response contents will be provided as a string.  A determination of whether a given response is text or binary is made based on the response content, looking at the content type and any specified content encoding, either in response headers, or in the content itself (as in the case of HTML and XML).  This determination is necessary because text content can be encoded in a variety of different character sets or encodings, so it is necessary to decode that content appropriately and then re-encode it as UTF-8 text so that the Lua code processing the response doesn't have to deal with encoding issues.  As a result of this process, the [event.responseType][api.event.networkRequest.responseType] will be set to either `"text"`, in which case the string provided here will be a UTF-8 encoded text string, or `"binary"`, in which case the string provided here will be the literal bytes received with no transcoding performed (and such a string may contain non-printable or nil elements). 

If the response body is directed to a file and the response was successfully written to the file, then this property will contain a table indicating the `filename` and `baseDirectory` for the output file.  In this case, no transcoding of downloaded content will be performed, the exact bytes received will be written to the file.  If the request completes, but produces an error response, then any error response body will be provided in this properry as a string instead.  This behavior prevents the destination file from being written/overwritten with an error response instead of the desired payload.








