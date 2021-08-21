
# mouse

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mouse
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Mouse events occur when the mouse cursor moves or when the mouse buttons have been pressed or released. This event provides information about the mouse cursor's current screen coordinates and its button states.

Note that a mouse will generate [touch][api.event.touch] events while holding the primary mouse button down.

Also note that a mouse will generate [tap][api.event.tap] events when clicking the primary mouse button. The tap's [event.numTaps][api.event.tap.numTaps] property will be set to 1 when single clicking and 2 when double clicking. A [tap][api.event.tap] event will not be raised when clicking any other mouse button.

## Platform Support

### Android

Only Android 3.1 or higher devices support a mouse via bluetooth or USB.

Android 3.1 and 3.2 only support the mouse's primary button. The [event.isSecondaryButtonDown][api.event.mouse.isSecondaryButtonDown] and [event.isMiddleButtonDown][api.event.mouse.isMiddleButtonDown] properties will always be false on these Android operating system versions.

Android 4.0 and higher devices support the mouse's secondary and middle buttons.

### iOS

Does not support mouse events.

### macOS

The Corona Simulator for macOS and macOS desktop apps support mouse events.

### Win32 Desktop

The Corona Simulator for Windows and Win32 desktop apps support mouse events. However, in the Corona Simulator, mouse events are only provided when simulating an Android device.


## Gotchas

Mouse events will not be received while the mouse cursor is outside of the application window, such as when you drag the cursor on top of Android's bottom navigation bar.


## Properties

#### [event.isPrimaryButtonDown][api.event.mouse.isPrimaryButtonDown]

#### [event.isSecondaryButtonDown][api.event.mouse.isSecondaryButtonDown]

#### [event.isMiddleButtonDown][api.event.mouse.isMiddleButtonDown]

#### [event.isCtrlDown][api.event.mouse.isCtrlDown]

#### [event.isShiftDown][api.event.mouse.isShiftDown]

#### [event.isAltDown][api.event.mouse.isAltDown]

#### [event.isCommandDown][api.event.mouse.isCommandDown]

#### [event.name][api.event.mouse.name]

#### [event.time][api.event.mouse.time]

#### [event.x][api.event.mouse.x]

#### [event.y][api.event.mouse.y]

#### [event.scrollX][api.event.mouse.scrollX]

#### [event.scrollY][api.event.mouse.scrollY]

#### [event.type][api.event.mouse.type]

## Example
 
``````lua
-- Called when a mouse event has been received.
local function onMouseEvent( event )
    if event.type == "down" then
        if event.isPrimaryButtonDown then
            print( "Left mouse button clicked." )
        elseif event.isSecondaryButtonDown then
            print( "Right mouse button clicked." )        
        end
    end
end
                             
-- Add the mouse event listener.
Runtime:addEventListener( "mouse", onMouseEvent )
``````

