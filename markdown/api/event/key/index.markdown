
# key

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Key events occur when a keyboard key or gamepad/joystick button has been pressed down or released.

In your key event listener, you can return `true` to indicate that your app will be handling the received key and overriding the operating system's default behavior. For example, on Android, returning `true` for the back key will prevent the operating system from backing out of your app.

Returning `false` in the key event listener indicates that your app is not overriding the key and allows the operating system to execute its default behavior.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

In the Corona Simulator, you can simulate a back key event while simulating an Android device via the <nobr>__Hardware__ &rarr; __Back__</nobr> menu item. This will dispatch two key events with [event.keyName][api.event.key.keyName] equal to `"back"`: one&nbsp;with [event.phase][api.event.key.phase] equal to `"down"` and the other `"up"`. Note that if you do __not__ return `true` on the `"up"` phase to override the key, the Corona&nbsp;Simulator will exit the app, just like how it works on a real device.

</div>
</div>


## Platform Support

### Android

Android raises key events for all keyboard keys, navigation buttons, volume buttons, and gamepad/joystick buttons. Android does __not__ raise key events for the Home navigation button, Task Manager button, or Power button.

### iOS

Supports key events from an MFi game controller \([guide][guide.hardware.mfiControllers]\) and keyboards key if build with Solar 3685+

### macOS

The Corona Simulator for macOS and macOS desktop apps support all keyboard keys and gamepad/joystick buttons.

### Win32 Desktop

The Corona Simulator for Windows and Win32 desktop apps support all keyboard keys. The Corona Simulator for Windows only provides key events when simulating an Android device.


## Gotchas

Key events will not be received if a native object such as a [TextField][api.type.TextField], [TextBox][api.type.TextBox], or [WebView][api.type.WebView] handles them. This can only happen if these native objects have the focus and if they choose to override that key. For example, a [TextField][api.type.TextField] and [TextBox][api.type.TextBox] typically handles all keyboard keys, preventing the application from receiving those key events, but will not handle a back key event.


## Properties

#### [event.descriptor][api.event.key.descriptor]

#### [event.device][api.event.key.device]

#### [event.isAltDown][api.event.key.isAltDown]

#### [event.isCommandDown][api.event.key.isCommandDown]

#### [event.isCtrlDown][api.event.key.isCtrlDown]

#### [event.isShiftDown][api.event.key.isShiftDown]

#### [event.keyName][api.event.key.keyName]

#### [event.name][api.event.key.name]

#### [event.nativeKeyCode][api.event.key.nativeKeyCode]

#### [event.phase][api.event.key.phase]
