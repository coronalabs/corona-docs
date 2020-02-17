# Game Controllers

In Corona, creating apps with gamepad/joystick support is both easy and interactive. This guide outlines how the game controller APIs and events work together.

<div class="guides-toc">

* [Requirements](#requirements)
* [Querying Devices](#querying)
* [Connecting/Disconnecting Controllers](#connections)
* [Handling Controller Input](#input)
* [Summary](#summary)
* [References](#references)

</div>


<a id="requirements"></a>

## Requirements

* Game controllers are supported in the Corona Simulator for macOS or Windows, in Win32 desktop apps, and on Android devices.

* Supported game controller(s). The Corona Simulator for macOS supports most game controllers, but some controllers require additional setup. Tested controllers include:

	* Xbox 360 Controller (wired or wireless with PC receiver). This controller requires a [360Controller driver](https://github.com/d235j/360Controller/releases).
	* Xbox One Controller. This controller requires the [Xone-OSX driver](https://github.com/FranticRain/Xone-OSX/releases/latest).
	* DualShock 4/3/2/1 (PlayStation controllers). These controllers work out of the box, however their key bindings will vary.
	* Various Logitech/generic PC game controllers which all tested without issues. However, key bindings vary widely from device to device.

* This guide accompanies the "Pew&nbsp;Pew!" sample app which utilizes all game controller APIs. You may download it from our [GitHub repository](https://github.com/coronalabs/PewPew).




<a id="querying"></a>

## Querying Devices

The initial API to begin with is [system.getInputDevices()][api.library.system.getInputDevices] which returns a list of all detected input devices. Note, however, the following differences between platforms:

* On Android, this call returns all connected input devices, including touch screens, gamepads, keyboards, etc.
* On macOS, this call will return only joysticks/gamepads.
* On Windows, this call returns all DirectInput and XInput devices.

Essentially, when an application starts, you can check if key bindings for a device are stored:

``````lua
local inputDevices = system.getInputDevices()

for i = 1,#inputDevices do
	local device = inputDevices[i]
	print( device.descriptor )
end
``````

Effectively, each entry in the list returned by [system.getInputDevices()][api.library.system.getInputDevices] is an instance of [InputDevice][api.type.InputDevice]. You can query this for information about the device, for example:

* The [object.descriptor][api.type.InputDevice.descriptor] property indicates the controller identifier during a session/run. If the same device is disconnected and later reconnected, it will have same `descriptor` value, however this doesn't mean that `descriptor` will remain unchanged between sessions/runs. In&nbsp;a subsequent session/run, controllers are liable to have different `descriptor` values.

* The [object.displayName][api.type.InputDevice.displayName] of the device is reported by the operating system. You can display this so the user can identify which controller is being used.

* You may also query the [InputDevice][api.type.InputDevice] object for its axes via the [object:getAxes()][api.type.InputDevice.getAxes] method or cause it to vibrate with the [object:vibrate()][api.type.InputDevice.vibrate] function. Please see the [documentation][api.type.InputDevice] for a complete list of properties and methods.




<a id="connections"></a>

## Connecting/Disconnecting Controllers

The [inputDeviceStatus][api.event.inputDeviceStatus] event is fired whenever a controller is connected or disconnected. The following example shows how to handle this event:

``````lua
local function onInputDeviceStatusChanged( event )
	
	if ( event.connectionStateChanged ) then
		if ( event.device.isConnected ) then
			-- Device has been connected
		else
			-- Connection has been lost
		end
    end
end

Runtime:addEventListener( "inputDeviceStatus", onInputDeviceStatusChanged )
``````

Within the listener function, the `event` table contains the following properties pertaining to the device which received a status change:

* [event.connectionStateChanged][api.event.inputDeviceStatus.connectionStateChanged] &mdash; [Boolean][api.type.Boolean] value indicating if the device's connection with the system has changed.
* [event.device][api.event.inputDeviceStatus.device] &mdash; Returns an [InputDevice][api.type.InputDevice] object with various properties.
* [event.name][api.event.inputDeviceStatus.name] &mdash; [String][api.type.String] value of `"inputDeviceStatus"`.
* [event.reconfigured][api.event.inputDeviceStatus.reconfigured] &mdash; [Boolean][api.type.Boolean] value indicating if the device has been reconfigured.




<a id="input"></a>

## Handling Controller Input

Game controllers produce two types of events as a result of input: [axis][api.event.axis] and [key][api.event.key].

A [key][api.event.key] event's `event.device` property will be `nil` on both macOS and Windows. It can also be `nil` on Android if it came from a virtual input device such as the virtual keyboard.

The following example shows how to detect a specific controller. When either an `axis` or `key` event is triggered, the `setDevice()` function is called which sets the `event.device` and [InputDevice][api.type.InputDevice] `displayName`.

``````lua
local controller = { device="", displayName="" }

local function setDevice( device, displayName )

	-- Set current controller
	controller["device"] = device
	controller["displayName"] = displayName

	-- Remove event listeners
	Runtime:removeEventListener( "axis", onAxisEvent )
	Runtime:removeEventListener( "key", onKeyEvent )
end

local function onKeyEvent( event )
	setDevice( event.device, event.device.displayName )
end

local function onAxisEvent( event )
	if ( math.abs(event.normalizedValue) > 0.5 ) then
		setDevice( event.device, event.device.displayName )
	end
end

Runtime:addEventListener( "axis", onAxisEvent )
Runtime:addEventListener( "key", onKeyEvent )
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* In the above example, `event.normalizedValue` for the `onAxisEvent()` listener function is compared to `0.5`. This means that the axis is turned by a "readable" amount, or more than halfway through.

* Some game controllers produce both `axis` and `key` events when analog triggers are pressed, so you may wish to conditionally handle this possibility.

</div>

### Handling Keys

Keys are handled with [key][api.event.key] events. Whenever the user presses a button on a gamepad/joystick or a key on the keyboard, this event is triggered. To identify which button/key was pressed, refer to the [event.keyName][api.event.key.keyName] documentation. Furthermore, when a `key` event occurs, `event.phase` will equal `"down"` when the button/key is pressed down, or `"up"` when the button/key is released.

### Handling Axes

The [axis][api.event.axis] event fires any time the controller's axis values change. This can result in a large amount of events, so game developers should consider accumulating the axis state. Each event has several useful properties:

* [event.device][api.event.axis.device] &mdash; Refers to the [InputDevice][api.type.InputDevice] which this axis belongs to.
* [event.axis][api.event.axis.axis] &mdash; Refers to the [InputAxis][api.type.InputAxis] object of the axis which produced the event.
* [event.normalizedValue][api.event.axis.normalizedValue] &mdash; Contains the value of the axis in the range of -1.0 to 1.0.
* [event.rawValue][api.event.axis.rawValue] &mdash; Contains the value reported by the hardware; this should be interpreted according to values in the `axis` field.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* The usual workflow when dealing with `axis` events is to accumulate values. In this approach, [event.normalizedValue][api.event.axis.normalizedValue] is typically most useful.

* Like devices, an axis can provide useful information about itself. [InputAxis][api.type.InputAxis] tables are returned by [object:getAxes()][api.type.InputDevice.getAxes] and [axis][api.event.axis.axis] in `axis` events. Probably the most useful property is [type][api.type.InputAxis.type] which attempts to describe the utility of the axis.

</div>




<a id="summary"></a>

## Summary

* Game controllers are supported in the Corona Simulator for macOS or Windows, in Win32 desktop apps, and on Android devices.

* Game controller support can be implemented using the following events:

	* The [axis][api.event.axis] event fires every time a game controller axis changes position, and [event.normalizedValue][api.event.axis.normalizedValue] should typically be used to access its position.
	* The [key][api.event.key] event reports both the [event.keyName][api.event.key.keyName] and `event.phase` of `"down"` or `"up"` for each button/key press.
	* The [inputDeviceStatus][api.event.inputDeviceStatus] event fires every time a device is connected, disconnected, or reconfigured.

* All three events above reference the [InputDevice][api.type.InputDevice] which produced the event, accessible via `event.device`.
	* If the device is the system keyboard, `event.device` may be `nil`.
	* Use [object.descriptor][api.type.InputDevice.descriptor] to identify devices within a session and [object.displayName][api.type.InputDevice.displayName] to get a readable device name reported by the operating system.

* To list known game controllers, use the [system.getInputDevices()][api.library.system.getInputDevices] function.

* It's wise to accumulate axis changes and take action later, for instance in the runtime `"enterFrame"` listener, similar to the [sample app](https://github.com/coronalabs/PewPew) method.




<a id="references"></a>

## References

### Documentation

* [InputDevice][api.type.InputDevice] type
* [InputAxis][api.type.InputAxis] type
* [inputDeviceStatus][api.event.inputDeviceStatus] event
* [key][api.event.key] event
* [axis][api.event.axis] event
* [system.getInputDevices()][api.library.system.getInputDevices]
	
### Third-Party Drivers

* [360Controller driver](https://github.com/d235j/360Controller/releases)
* [Xone-OSX driver](https://github.com/FranticRain/Xone-OSX/releases/latest)

### Sample Code

* [Pew Pew!](https://github.com/coronalabs/PewPew) sample app
* [InputDevices](https://github.com/coronalabs/samples-coronasdk/tree/master/Hardware/InputDevices) sample app
