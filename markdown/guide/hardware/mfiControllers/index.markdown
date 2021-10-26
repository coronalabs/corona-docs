# MFi Controllers

This guide is an extension of the [Game Controllers][guide.hardware.gameControllers] guide. Apple <nobr>[MFi](https://en.wikipedia.org/wiki/MFi_Program)-certified</nobr> controllers can be paired to iOS, tvOS, or macOS devices.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* macOS supports both MFi controllers and "classic" HID controllers. To distinguish between them, check the [object.driver][api.type.InputDevice.driver] property when handling input events (its value will be either `"HID"` or `"MFi"`).

* iOS and tvOS support __only__ MFi controllers.

* If you're creating an app with MFi game controller support, we recommend that you follow Apple's guidelines, starting with this [checklist](https://developer.apple.com/library/prerelease/ios/documentation/ServicesDiscovery/Conceptual/GameControllerPG/Appendix/Appendix.html).

</div>


## Control Schemes/Profiles

MFi devices can conform to one of three profiles as reported by [device.MFiProfile][api.type.InputDevice.MFiProfile]. These profiles define the key layout of devices:

* `"gamepad"`
* `"extendedGamepadgamepad"`
* `"microGamepad"`
* `"directionalGamepad"`

### gamepad

<!---

![](https://developer.apple.com/library/prerelease/ios/documentation/ServicesDiscovery/Conceptual/GameControllerPG/Art/featureshidgamecontrollerstandardformfittingsample_2x.png)

-->

If [device.MFiProfile][api.type.InputDevice.MFiProfile] is `"gamepad"`, check the following [keyName][api.event.key.keyName] values to identify specific controls:

<div style="width: 80%;">
<div class="inner-table full-width percent33">

Control/Input							keyName
--------------------------------------	--------------------------	--
D-pad "up"								`up`						
D-pad "down"							`down`					
D-pad "left"							`left`					
D-pad "right"							`right`					
Button "A"								`buttonA`
Button "B"								`buttonB`
Button "X"								`buttonX`
Button "Y"								`buttonY`
Left shoulder button (1)				`leftShoulderButton1`
Right shoulder button (1)				`rightShoulderButton1`
Pause button							`menu`
--------------------------------------	--------------------------	--

</div>
</div>

### extendedGamepad

If [device.MFiProfile][api.type.InputDevice.MFiProfile] is `"extendedGamepad"`, the controller will have additional [keyName][api.event.key.keyName] or [axis][api.type.InputAxis.type] values. Note that triggers can be handled both as keys and axes.

<div style="width: 80%;">
<div class="inner-table full-width percent33">
Control/Input							keyName						axis
--------------------------------------	--------------------------	--------------------------
Left thumbstick horizontal axis										`leftX`
Left thumbstick vertical axis										`leftY`
Right thumbstick horizontal axis									`rightX`
Right thumbstick vertical axis										`rightY`
Left shoulder button (2)				`leftShoulderButton2`
Right shoulder button (2)				`rightShoulderButton2`
Left trigger							`leftShoulderButton2`		`leftTrigger`
Right trigger							`rightShoulderButton2`		`rightTrigger`													
--------------------------------------	--------------------------	--------------------------

</div>
</div>

### microGamepad or directionalGamepad

These are special MFi profiles for Apple TV Remotes. Original Siri Apple TV Remote if value of [device.MFiProfile][api.type.InputDevice.MFiProfile] is `"microGamepad"`, or the 2nd Generation Siri Remote if value of [device.MFiProfile][api.type.InputDevice.MFiProfile] is `"directionalGamepad"`. The controller will have the following [keyName][api.event.key.keyName] and [axis][api.type.InputAxis.type] values:

<div style="width: 80%;">
<div class="inner-table full-width percent33">

Control/Input							keyName						axis
--------------------------------------	--------------------------	--------------------------
Horizontal slide on trackpad										`x`
Vertical slide on trackpad											`y`
Swipe/flick up on trackpad				`up`
Swipe/flick down on trackpad			`down`
Swipe/flick left on trackpad			`left`
Swipe/flick right on trackpad			`right`
Press trackpad							`buttonA`
Pause/play button						`buttonX`
Tap trackpad							`buttonZ`
Quick tap on menu button				`menu`
--------------------------------------	--------------------------	--------------------------

</div>
</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The Apple&nbsp;TV Remote will generate [accelerometer][api.event.accelerometer] events.

* The Apple&nbsp;TV Remote has a trackpad instead of a thumbstick. By default, every time the user touches the trackpad, it creates a virtual joystick "window" centered on the initial tap location and a [relativeTouch][api.event.relativeTouch] event. However, if you want to track the absolute position of a touch, you can set [device.reportsAbsoluteDpadValues][api.type.InputDevice.reportsAbsoluteDpadValues] to `true`.

* If your app can be used in both horizontal and vertical orientations, we recommended that you set [device.allowsRotation][api.type.InputDevice.allowsRotation] to `true`. This setting will automatically flip axes to keep them in the <nobr>spatially-appropriate</nobr> orientation when the control is rotated.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* All MFi controllers have a pause button which pass a [keyName][api.event.key.keyName] of `menu`. In this case, __two__ events with [phases][api.event.key.phase] of `"up"` and `"down"` are generated instantly.

* Typically, this button should be used to pause and resume a game.

* Holding down this button on the controller may trigger a system action such as opening the springboard on tvOS.

</div>
