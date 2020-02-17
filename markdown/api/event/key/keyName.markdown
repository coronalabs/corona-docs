
# event.keyName

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [key][api.event.key]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key, keyName
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The unique string name of the key. Used to identify which key was pressed down or released.


## Gotchas

* The value will be `"unknown"` if Corona could not identify the key. This can happen when the user presses a custom OEM key on a keyboard. In this case, you can only identify the key by its numeric [event.nativeKeyCode][api.event.key.nativeKeyCode] value.

* The key name does not represent the character or string that is produced when pressing a key. A key name is just a unique string ID assigned to the key that was pressed or released according to the key position on an <nobr>ANSI-standard</nobr> US&nbsp;keyboard. For example, if you press the "A" key on a US&nbsp;keyboard, `event.keyName` will always be `"a"`, regardless of whether the "Shift" key was held down (that&nbsp;is, you will never receive a capital `"A"`&nbsp;value). In contrast, if you press the "A" key on a French keyboard, you will get `"q"` because `event.keyName` returns the "key&nbsp;code" instead of the local representation of that key.


## Example
 
``````lua
-- Called when a key event has been received
local function onKeyEvent( event )

	-- Print which key was pressed down/up
	local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
	print( message )

	-- If the "back" key was pressed on Android, prevent it from backing out of the app
	if ( event.keyName == "back" ) then
		if ( system.getInfo("platform") == "android" ) then
			return true
		end
	end

	-- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
	-- This lets the operating system execute its default handling of the key
	return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````

## Key Names

### Letter Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"a"`					The "A" key.
`"b"`					The "B" key.
`"c"`					The "C" key.
`"d"`					The "D" key.
`"e"`					The "E" key.
`"f"`					The "F" key.
`"g"`					The "G" key.
`"h"`					The "H" key.
`"i"`					The "I" key.
`"j"`					The "J" key.
`"k"`					The "K" key.
`"l"`					The "L" key.
`"m"`					The "M" key.
`"n"`					The "N" key.
`"o"`					The "O" key.
`"p"`					The "P" key.
`"q"`					The "Q" key.
`"r"`					The "R" key.
`"s"`					The "S" key.
`"t"`					The "T" key.
`"u"`					The "U" key.
`"v"`					The "V" key.
`"w"`					The "W" key.
`"x"`					The "X" key.
`"y"`					The "Y" key.
`"z"`					The "Z" key.
----------------------	------------------------------------------------------------------------------------------

<div>

### Number Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"0"`					The "0" key belonging to the keyboard's top row of number keys.
`"1"`					The "1" key belonging to the keyboard's top row of number keys.
`"2"`					The "2" key belonging to the keyboard's top row of number keys.
`"3"`					The "3" key belonging to the keyboard's top row of number keys.
`"4"`					The "4" key belonging to the keyboard's top row of number keys.
`"5"`					The "5" key belonging to the keyboard's top row of number keys.
`"6"`					The "6" key belonging to the keyboard's top row of number keys.
`"7"`					The "7" key belonging to the keyboard's top row of number keys.
`"8"`					The "8" key belonging to the keyboard's top row of number keys.
`"9"`					The "9" key belonging to the keyboard's top row of number keys.
----------------------	------------------------------------------------------------------------------------------

</div>

### Number Pad Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"numPad0"`				The number pad's "0" key.
`"numPad1"`				The number pad's "1" key.
`"numPad2"`				The number pad's "2" key.
`"numPad3"`				The number pad's "3" key.
`"numPad4"`				The number pad's "4" key.
`"numPad5"`				The number pad's "5" key.
`"numPad6"`				The number pad's "6" key.
`"numPad7"`				The number pad's "7" key.
`"numPad8"`				The number pad's "8" key.
`"numPad9"`				The number pad's "9" key.
`"numPad+"`				The number pad's plus key.
`"numPad-"`				The number pad's minus key.
`"numPad*"`				The number pad's multiplication key.
`"numPad/"`				The number pad's division key.
`"numPad="`				The number pad's equals key.
`"numPadEnter"`			The number pad's enter or return key.
`"numPad."`				The number pad's decimal separator key.
`"numPad,"`				The number pad's thousands separator key.
`"numPad("`				The number pad's left parentheses key.
`"numPad)"`				The number pad's right parentheses key.
`"numLock"`				The number pad's "Num Lock" key.
----------------------	------------------------------------------------------------------------------------------

</div>

### Arrow Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"up"`					The up arrow key on the keyboard or D-pad.
`"down"`				The down arrow key on the keyboard or D-pad.
`"left"`				The left arrow key on the keyboard or D-pad.
`"right"`				The right arrow key on the keyboard or D-pad.
----------------------	------------------------------------------------------------------------------------------

</div>

### Modifier Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"leftAlt"`				The left "Alt" modifier key.
`"rightAlt"`			The right "Alt" modifier key.
`"leftCtrl"`			The left "Control" modifier key.
`"rightCtrl"`			The right "Control" modifier key.
`"leftShift"`			The left "Shift" modifier key.
`"rightShift"`			The right "Shift" modifier key.
`"leftCommand"`			The left "Command" or "Windows" key.
`"rightCommand"`		The right "Command" or "Windows" key.
----------------------	------------------------------------------------------------------------------------------

</div>

### Function Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"function"`			The "function" or "fn" modifier key (not supported on Windows).
`"f1"`					The "F1" function key.
`"f2"`					The "F2" function key.
`"f3"`					The "F3" function key.
`"f4"`					The "F4" function key.
`"f5"`					The "F5" function key.
`"f6"`					The "F6" function key.
`"f7"`					The "F7" function key.
`"f8"`					The "F8" function key.
`"f9"`					The "F9" function key.
`"f10"`					The "F10" function key.
`"f11"`					The "F11" function key.
`"f12"`					The "F12" function key.
`"f13"`					The "F13" function key.
`"f14"`					The "F14" function key.
`"f15"`					The "F15" function key.
`"f16"`					The "F16" function key.
`"f17"`					The "F17" function key.
`"f18"`					The "F18" function key.
`"f19"`					The "F19" function key.
`"f20"`					The "F20" function key.
`"f21"`					The "F21" function key.
`"f22"`					The "F22" function key.
`"f23"`					The "F23" function key.
`"f24"`					The "F24" function key.
----------------------	------------------------------------------------------------------------------------------

</div>

### Navigation Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"back"`				The "navigate back" key (typically provided on all Android devices).
`"forward"`				The "navigate forward" key.
`"homePage"`			The "navigate to home page" key (this is not the "home" button on Android).
----------------------	------------------------------------------------------------------------------------------

</div>

### Media Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"mediaPlay"`			The button used to play media such as music or video.
`"mediaPlayPause"`		The button used to play/pause media such as music or video.
`"mediaPause"`			The button used to pause media such as music or video.
`"mediaStop"`			The button used to stop media such as music or video.
`"mediaNext"`			The button used to select the next music track or chapter in a video.
`"mediaPrevious"`		The button used to select the previous music track or chapter in a video.
`"mediaFastForward"`	The button used to fast forward music or video.
`"mediaRewind"`			The button used to go backwards in a song or video.
`"mediaRecord"`			The button used to start audio or video recording.
`"mediaEject"`			The button used to eject a CD or DVD.
`"mediaClose"`			The button used to close the CD or DVD tray on a PC.
----------------------	------------------------------------------------------------------------------------------

</div>

### Volume Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"volumeUp"`			The volume up button.
`"volumeDown"`			The volume down button.
`"volumeMute"`			The button used to mute and unmute audio playback.
`"microphoneMute"`		The button used to mute and unmute the microphone.
----------------------	------------------------------------------------------------------------------------------

</div>

### Gamepad/Joystick Buttons

<div class="inner-table">

keyName							Description
------------------------------	------------------------------------------------------------------------------------------
`"button1"`						Button "1" on a gamepad or joystick.
`"button2"`						Button "2" on a gamepad or joystick.
`"button3"`						Button "3" on a gamepad or joystick.
`"button4"`						Button "4" on a gamepad or joystick.
`"button5"`						Button "5" on a gamepad or joystick.
`"button6"`						Button "6" on a gamepad or joystick.
`"button7"`						Button "7" on a gamepad or joystick.
`"button8"`						Button "8" on a gamepad or joystick.
`"button9"`						Button "9" on a gamepad or joystick.
`"button10"`					Button "10" on a gamepad or joystick.
`"button11"`					Button "11" on a gamepad or joystick.
`"button12"`					Button "12" on a gamepad or joystick.
`"button13"`					Button "13" on a gamepad or joystick.
`"button14"`					Button "14" on a gamepad or joystick.
`"button15"`					Button "15" on a gamepad or joystick.
`"button16"`					Button "16" on a gamepad or joystick.
`"buttonA"`						Button "A" on a gamepad or joystick.
`"buttonB"`						Button "B" on a gamepad or joystick.
`"buttonC"`						Button "C" on a gamepad or joystick.
`"buttonX"`						Button "X" on a gamepad or joystick.
`"buttonY"`						Button "Y" on a gamepad or joystick.
`"buttonZ"`						Button "Z" on a gamepad or joystick.
`"buttonSelect"`				The "select" button on a gamepad or joystick.
`"buttonStart"`					The "start" button on a gamepad or joystick.
`"buttonMode"`					The "mode" button on a gamepad or joystick.
`"leftShoulderButton1"`			The first left shoulder button (aka "L1") on a gamepad.
`"leftShoulderButton2"`			The second left shoulder button (aka "L2") on a gamepad.
`"rightShoulderButton1"`		The first right shoulder button (aka "R1") on a gamepad.
`"rightShoulderButton2"`		The second right shoulder button (aka "R2") on a gamepad.
`"leftJoystickButton"`			The "left thumbstick" button on a gamepad (typically occurs when depressing the left thumbstick).
`"rightJoystickButton"`			The "right thumbstick" button on a gamepad (typically occurs when depressing the right thumbstick).
------------------------------	------------------------------------------------------------------------------------------

</div>

### Remote Control Buttons

<div class="inner-table">

keyName						Description
--------------------------	------------------------------------------------------------------------------------------
`"3D"`						The "3D" button on a remote control.
`"blue"`					The "blue" button on a remote control.
`"green"`					The "green" button on a remote control.
`"red"`						The "red" button on a remote control.
`"yellow"`					The "yellow" button on a remote control.
`"captions"`				The "captions" button on a remote control.
`"channelUp"`				The "channel up" button on a remote control.
`"channelDown"`				The "channel down" button on a remote control.
`"dvr"`						The "DVR" button on a remote control.
`"guide"`					The "guide" button on a remote control.
`"info"`					The "info" button on a remote control.
`"tv"`						The "TV" button on a remote control.
--------------------------	------------------------------------------------------------------------------------------

</div>

### Application Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"bookmark"`			The web page bookmark key.
`"calculator"`			The key used to display the Calculator application.
`"calendar"`			The key used to display the Calendar application.
`"call"`				The key used to make a phone call.
`"camera"`				The key used to display the Camera application.
`"contacts"`			The key used to display the Contacts (Address Book) application.
`"endCall"`				The key used to end a phone call on a mobile phone.
`"explorer"`			The key used to display the "Windows Explorer" or file "Finder" application.
`"focusCamera"`			The button used to focus the camera.
`"mail"`				The key used to display the e-mail application.
`"menu"`				The button used to display an application's menu (common on older Android devices).
`"music"`				The key used to display the music application.
`"notification"`		The key used to display Android's notifications in the status bar.
`"search"`				The "search" button on an Android device.
----------------------	------------------------------------------------------------------------------------------

</div>

### Other Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
<code>"`"</code>		The back tick key.
`"'"`					The apostrophe and double quote key.
`"@"`					The "at" key on an Android keyboard.
`"\"`					The backslash "\\" and "|" key.
`"/"`					The forward slash "/" and "?" key.
`"["`					The left bracket "[" and "{" key on the keyboard.
`"]"`					The right bracket "]" and "}" key on the keyboard.
`"+"`					The plus key.
`"-"`					The minus key.
`"*"`					The asterisk key on an Android keyboard.
`"."`					The "." and ">" key on the keyboard.
`"="`					The "=" and "+" key on the keyboard.
`"#"`					The "#" key on an Android keyboard.
`";"`					The ";" and ":" key on the keyboard.
`","`					The "," and "<" key on the keyboard.
`"break"`				The "break" key.
`"capsLock"`			The "Caps Lock" key.
`"clear"`				The number pad's "Clear" key.
`"deleteBack"`			The "Backspace" key on a Windows keyboard or "Delete" key on an Apple keyboard.
`"deleteForward"`		The "Delete" key on a Windows keyboard or "Delete Forward" key on an Apple keyboard.
`"end"`					The "end" key on a keyboard.
`"enter"`				The "Enter" or "Return" key on a keyboard.
`"escape"`				The "escape" or "esc" key.
`"headsetHook"`			The button on a headset earpiece (typically used to mute/unmute).
`"insert"`				The "insert" key.
`"home"`				The "home" key on a keyboard (this is not the "Home" button on an Android device).
`"pageUp"`				The "page up" key.
`"pageDown"`			The "page down" key.
`"printScreen"`			The "Print Screen" key.
`"scrollLock"`			The "Scroll Lock" key.
`"space"`				The space bar.
`"tab"`					The "tab" key.
`"zoomIn"`				The "zoom-in" key.
`"zoomOut"`				The "zoom-out" key.
----------------------	------------------------------------------------------------------------------------------

</div>

### Unknown Keys

<div class="inner-table">

keyName					Description
----------------------	------------------------------------------------------------------------------------------
`"unknown"`				The key name used if Corona is unable to recognize the received key code. In this case, you can only identify the key by its [event.nativeKeyCode][api.event.key.nativeKeyCode] value.
----------------------	------------------------------------------------------------------------------------------

</div>
