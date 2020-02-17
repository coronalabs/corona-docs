
# event.nativeKeyCode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [key][api.event.key]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key, nativeKeyCode
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides the key's unique integer ID assigned to it by the operating system.

This key code is not cross-platform, meaning that its numeric value for the same key will vary on different operating systems. For example, the "A" key will have key code `29` on Android and key code `65` on Windows.

On Android, the key code's value will match a `KEYCODE` constant defined in Android's `KeyEvent` Java class.

On Windows, the key code's value will match a "virtual key code" constant in Microsoft's `WinUser.h` C/C++ file, such as `VK_RETURN`. In .NET, it would match a constant in the `System.Windows.Forms.Keys` enum, which provides the same key code constants defined in C/C++.

## Example
 
``````lua
-- Called when a key event has been received
local function onKeyEvent( event )
	local message = "Key '" .. event.keyName .. "' has key code: " .. tostring( event.nativeKeyCode )
	print( message )
	return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````