# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [zipRequest][plugin.zip.event.zipRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          zip, type
> __See also__			[zipRequest][plugin.zip.event.zipRequest]
>						[zip.*][plugin.zip]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] representing the type of action involved in the zip file action:

* For [zip.compress()][plugin.zip.compress], a value of `"compress"`.

* For [zip.uncompress()][plugin.zip.uncompress], a value of `"uncompress"`.

* For [zip.list()][plugin.zip.list], a value of `"list"`.
