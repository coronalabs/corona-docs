# native.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The native library wraps platform-specific UI elements like input fields, maps, web views, and more. These are controlled/rendered by the OS, not the Corona engine.

## Gotchas

* These objects may not work consistently between devices and even in the Corona Simulator. You should always test on the target device.

* Native objects are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects.

## Functions

#### [native.cancelAlert()][api.library.native.cancelAlert]

#### [native.cancelWebPopup()][api.library.native.cancelWebPopup]

#### [native.canShowPopup()][api.library.native.canShowPopup]

#### [native.getFontNames()][api.library.native.getFontNames]

#### [native.getProperty()][api.library.native.getProperty]

#### [native.getSync()][api.library.native.getSync]

#### [native.newFont()][api.library.native.newFont]

#### [native.newMapView()][api.library.native.newMapView]

#### [native.newTextBox()][api.library.native.newTextBox]

#### [native.newTextField()][api.library.native.newTextField]

#### [native.newVideo()][api.library.native.newVideo]

#### [native.newWebView()][api.library.native.newWebView]

#### [native.requestExit()][api.library.native.requestExit]

#### [native.setActivityIndicator()][api.library.native.setActivityIndicator]

#### [native.setKeyboardFocus()][api.library.native.setKeyboardFocus]

#### [native.setProperty()][api.library.native.setProperty]

#### [native.showAlert()][api.library.native.showAlert]

#### [native.showPopup()][api.library.native.showPopup]

#### [native.showWebPopup()][api.library.native.showWebPopup]

#### [native.setSync()][api.library.native.setSync]

## Constants

#### [native.systemFont][api.library.native.systemFont]

#### [native.systemFontBold][api.library.native.systemFontBold]
