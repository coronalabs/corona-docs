
# native.requestExit()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          requestExit, exit
> __See also__          [os.exit()][api.library.os.exit]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

On Android, this closes the application window gracefully without terminating the process. On macOS and Windows, this closes the application.

It is highly recommended that you call this function instead of [os.exit()][api.library.os.exit]. The [os.exit()][api.library.os.exit] function call terminates the application process immediately, which can be interpretted by an app reviewer as a crash. It would also clear all scheduled notifications and notification in the status bar on Android, which require the application process to be alive in the background to manage them.


## Syntax

    native.requestExit()


## Gotchas

* This function is not supported on iOS because iOS does not allow applications to terminate themselves.

* This is a non-blocking function call. This means that all code below this function call will be executed before the application window is closed.
