
# display.statusBarHeight

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          status bar, status bar height
> __See also__          [display.setStatusBar()][api.library.display.setStatusBar]
>						[display.topStatusBarContentHeight][api.library.display.topStatusBarContentHeight]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only property representing the height of the status bar in content pixels.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This API has been deprecated and it's recommended that you use [display.topStatusBarContentHeight][api.library.display.topStatusBarContentHeight] instead.

</div>


## Gotchas

Android 3.x devices do not support status bar and return a height of `0`.