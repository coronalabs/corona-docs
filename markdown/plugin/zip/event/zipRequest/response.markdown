# event.response

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [zipRequest][plugin.zip.event.zipRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          zip, response
> __See also__			[zipRequest][plugin.zip.event.zipRequest]
>						[zip.*][plugin.zip]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [table][api.type.Table] containing results from the requested zip file action:

* For [zip.compress()][plugin.zip.compress], this will contain a list of the files involved in the compress request.

* For [zip.uncompress()][plugin.zip.uncompress], this will contain a list of the files involved in the uncompress request.

* For [zip.list()][plugin.zip.list], this will contain a list of all files in the zip archive and additional information related to each.
