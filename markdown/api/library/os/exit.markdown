
# os.exit()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          exit, quit, exit app, quit app
> __See also__          [os.execute()][api.library.os.execute]
>								[native.requestExit()][api.library.native.requestExit]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>
This is a low level Lua call that should __not__ be used on any platform.  Use [native.requestExit()][api.library.native.requestExit] instead (other than on iOS which does not permit apps to terminate themselves).
</div>

Calls the C function `exit()`, with an optional code, to terminate the host program. The default value for code is the success code.

## Syntax

	os.exit( [ exit ] )

##### exit ~^(optional)^~
_[Number][api.type.Number]._ Optional parameter that returns the exit code to the OS.


## Gotchas

This is not the API you are looking for.  Use [native.requestExit()][api.library.native.requestExit] instead.

