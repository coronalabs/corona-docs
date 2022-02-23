# iCloud.identityToken()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, Key-Value Storage, KVS, identityToken
> __See also__          [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [string][api.type.String] which can be used to ensure that the iCloud user has not changed. This string will be a hash of the user's iCloud session ID which you may store/check locally to ensure that the same user is logged in to iCloud.

Returns `nil` if the identity token can not be retrieved.


## Syntax

	iCloud.identityToken()
