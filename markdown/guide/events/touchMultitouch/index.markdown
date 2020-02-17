# Tap / Touch / Multitouch

This guide explains the difference between __tap__, __touch__, and __multitouch__ and how to handle the events associated with each method.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you're new to Corona and haven't yet explored basic screen interactivity and events, please begin by reading the [Basic Interactivity and Event Detection][guide.events.detectEvents] guide.

</div>
</div>

<div class="guides-toc">

* [Tap Detection](#tapevents)
* [Touch Detection](#touchevents)
* [Multitouch](#multitouch)
* [Tap/Touch Propagation](#propagation)
* [Setting Focus](#focus)

</div>


<a id="tapevents"></a>

## Tap Detection

[Tap][api.event.tap] events are the most basic form of screen interactivity. Essentially, a tap is represented by the user touching the screen and lifting off at the same approximate point. The tap event is considered successful only if the user touches __and__ releases at that point.

In Corona, you can listen for tap events by registering a `"tap"` event listener on most common [display&nbsp;objects][guide.media.displayObjects]:

``````lua
local function tapListener( event )

	-- Code executed when the button is tapped
	print( "Object tapped: " .. tostring(event.target) )  -- "event.target" is the tapped object
	return true
end

local myButton = display.newRect( 100, 100, 200, 50 )
myButton:addEventListener( "tap", tapListener )  -- Add a "tap" listener to the object
``````

The `event` properties returned from a tap include:

* `event.target` — reference to the object that was tapped.

* `event.name` — string value of `"tap"`.

* `event.numTaps` — the number of taps on the screen. The default delay between what is considered the next tap in sequence is `0`, but this time can be adjusted with the [system.setTapDelay()][api.library.system.setTapDelay] function.

* `event.x` / `event.y` — the __x__ and __y__ position of the tap, in content coordinates.

Unlike [touch events](#touchevents), the tap event does not include a `phase` property&nbsp;— the tap is a singular action involving both a touch and release, so you don't need to handle the phase in any special manner.

<div class="guide-notebox">
<div class="notebox-title">Filtering Multiple Taps</div>

Using the `event.numTaps` property, you can easily determine whether an object was tapped multiple times and concurrently ignore single taps on the object. To achieve this, just ensure that `event.numTaps` is equal to `2` or higher and ignore <nobr>`return true`</nobr> in all other cases.

``````lua
local function tapListener( event )

	if ( event.numTaps == 2 ) then
		print( "Object double-tapped: " .. tostring(event.target) )
	elseif ( event.numTaps == 3 ) then
		print( "Object triple-tapped: " .. tostring(event.target) )
	else
		return true
	end
end

local myButton = display.newRect( 100, 100, 200, 50 )
myButton:addEventListener( "tap", tapListener )
``````

</div>




<a id="touchevents"></a>

## Touch Detection

[Touch][api.event.touch] events provide for a much greater level of screen interactivity. Using touch events, you can detect when the user first touches the screen and when the touch is lifted off the screen. You can also track the motion of the touch as it moves around the screen. To accomplish this, Corona offers the `event.phase` property in one of four states:

* `"began"` — indicates that a touch has started on the screen.
* `"moved"` — indicates that a touch has moved on the screen.
* `"ended"` — indicates that a touch has been lifted from the screen.
* `"cancelled"` — indicates that the __system__ cancelled tracking of the touch (not to be confused with `"ended"`).

You can listen for touch events by registering a `"touch"` event listener on most common [display objects][guide.media.displayObjects]:

``````lua
local function myTouchListener( event )

	if ( event.phase == "began" ) then
		-- Code executed when the button is touched
		print( "object touched = " .. tostring(event.target) )  -- "event.target" is the touched object
	elseif ( event.phase == "moved" ) then
		-- Code executed when the touch is moved over the object
		print( "touch location in content coordinates = " .. event.x .. "," .. event.y )
	elseif ( event.phase == "ended" ) then
		-- Code executed when the touch lifts off the object
		print( "touch ended on object " .. tostring(event.target) )
	end
	return true  -- Prevents tap/touch propagation to underlying objects
end

local myButton = display.newRect( 100, 100, 200, 50 )
myButton:addEventListener( "touch", myTouchListener )  -- Add a "touch" listener to the object
``````

The event properties returned from a touch include:

* `event.id` — a unique identifier that distinguishes between multiple touches across different touch events. See [Multitouch](#multitouch) below for more details.

* `event.target` — reference to the object that was touched.

* `event.name` — string value of `"touch"`.

* `event.phase` — the phase of the touch as described above.

* `event.pressure` — number indicating the pressure of a touch, typically used to detect "3D&nbsp;Touch" events on compatible iOS devices. See the [documentation][api.event.touch.pressure] for more information.

* `event.time` — the time in milliseconds since the start of the application, accessible from within the touch listener function.

* `event.x` / `event.y` — the __x__ and __y__ position of the touch, in content coordinates.

* `event.xStart` / `event.yStart` — the __x__ and __y__ position of the touch from the `"began"` phase of the touch sequence, in content coordinates.




<a id="multitouch"></a>

## Multitouch

Enabling __multitouch__ in an app lets you detect and handle multiple user touches on the screen at the same time.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Because multitouch is __disabled__ by default, you must first enable it via the [system.activate()][api.library.system.activate] function:

``````lua
system.activate( "multitouch" )
``````

</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Multitouch functionality is only supported on actual mobile devices <nobr>(phone, tablet, etc.)</nobr> __or__ on a system with a touchscreen running Windows&nbsp;7 or higher, in which case multitouch is supported by both the Corona&nbsp;Simulator for Windows and <nobr>Corona-built</nobr> [Win32 desktop apps][guide.distribution.win32Build].

</div>
</div>

With multitouch enabled, listen for touch events by registering a `"touch"` event listener on the object(s), exactly as described in [Touch Detection](#touchevents) above. Then, compare the `event.id` property to determine which specific touch event sequence is being returned. For&nbsp;example:

``````lua
-- Activate multitouch
system.activate( "multitouch" )

-- Create a display object on the screen
local newRect1 = display.newRect( display.contentCenterX, display.contentCenterY, 280, 440 )
newRect1:setFillColor( 1, 0, 0.3 )

-- Touch event listener
local function touchListener( event )

	print( "Phase: " .. event.phase )
	print( "Location: " .. tostring(event.x) .. "," .. tostring(event.y) )
	print( "Unique touch ID: " .. tostring(event.id) )
	print( "----------" )
	return true
end

-- Add a touch listener to the object
newRect1:addEventListener( "touch", touchListener )
``````




<a id="propagation"></a>

## Tap/Touch Propagation

When the user touches the screen, the event is dispatched to the display hierarchy. Only those display objects that intersect the touch location on the screen will receive the event.

[Tap][api.event.tap] and [touch][api.event.touch] events propagate through these objects in a particular order. By default, the first object to receive the event is the <nobr>front-most</nobr> display object in the display hierarchy that intersects the touch location. The next object to receive the event is the next object back in the hierarchy that intersects the touch location, and so on.

Tap and touch events propagate until they are "handled." This means that if you have multiple objects overlaying each other in the display hierarchy, and a tap or touch event listener has been applied to each, the event will propagate through __all__ of these objects. However, you can stop propagation to the next underlying object by telling Corona that the event has been handled. This is as simple as returning `true` from the event listener&nbsp;— this stops the propagation cycle and prevents any underlying objects from responding to the hit event.

``````lua
local function myTouchListener( event )

	if ( event.phase == "began" ) then
		-- Code executed when the button is touched
		print( "object touched = " .. tostring(event.target) )  -- "event.target" is the touched object
	end
	return true  -- Prevents tap/touch propagation to underlying objects
end

local myButton = display.newRect( 100, 100, 200, 50 )
myButton:addEventListener( "touch", myTouchListener )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If the tap or touch event is still not handled after traversal through the entire display hierarchy, it is broadcast as a global event to the Runtime listener.

</div>
</div>




<a id="focus"></a>

## Setting Touch Focus

You can direct all [touch][api.event.touch] events to a specific display object by setting __focus__ on the object. This instructs the system to deliver all future touch events to that object, effectively making it "own" the first touch it receives for the lifetime of that touch.

Consider a typical button &mdash; if&nbsp;the user touches the button and, without lifting/releasing touch, slides outside the button bounds, the button probably should not trigger an action upon touch release. Similary, if the touch slides off the button and intersects another <nobr>touch-sensitive</nobr> object, you probably don't want that object to react since the touch began on the button. Both of these cases are easily solved by setting focus on the display object.

To set focus on a display object, pass its object reference to [StageObject:setFocus()][api.type.StageObject.setFocus]. This may be `event.target` within a touch listener, or it can be any direct reference to the object itself.

In contrast, when you wish to __release__ focus on the object, simply pass `nil` to [StageObject:setFocus()][api.type.StageObject.setFocus]:

``````lua
display.getCurrentStage():setFocus( nil )
``````

This example shows how you might handle focus and release of multiple objects:

``````lua
-- Create two display objects on the screen
local newRect1 = display.newRect( display.contentCenterX, 160, 60, 60 )
newRect1:setFillColor( 1, 0, 0.3 )
local newRect2 = display.newRect( display.contentCenterX, 320, 60, 60 )
newRect2:setFillColor( 0.3, 0, 1 )

-- Touch event listener
local function touchListener( event )

	if ( event.phase == "began" ) then
		event.target.alpha = 0.5
		-- Set focus on object
		display.getCurrentStage():setFocus( event.target )

	elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
		event.target.alpha = 1
		-- Release focus on object
		display.getCurrentStage():setFocus( nil )
	end
	return true
end

-- Add a touch listener to each object
newRect1:addEventListener( "touch", touchListener )
newRect2:addEventListener( "touch", touchListener )
``````

### Multitouch Focus

Touch focus can also be achieved when __multitouch__ is enabled via [system.activate()][api.library.system.activate]. However, because there may be multiple touches on the same object, you must dedicate the first touch it receives by a unique internal identifier. This is done by passing the `event.id` property gathered from the touch listener as the second argument to [StageObject:setFocus()][api.type.StageObject.setFocus]:

``````lua
display.getCurrentStage():setFocus( event.target, event.id )
``````

Then, when you wish to __release__ focus on the object, simply pass `nil` as the second argument to [StageObject:setFocus()][api.type.StageObject.setFocus]:

``````lua
display.getCurrentStage():setFocus( event.target, nil )
``````

This example shows how you might handle focus and release of multiple objects while multitouch is enabled:

``````lua
-- Activate multitouch
system.activate( "multitouch" )

-- Create two display objects on the screen
local newRect1 = display.newRect( display.contentCenterX, 160, 60, 60 )
newRect1:setFillColor( 1, 0, 0.3 )
local newRect2 = display.newRect( display.contentCenterX, 320, 60, 60 )
newRect2:setFillColor( 0.3, 0, 1 )

-- Touch event listener
local function touchListener( event )

	print( "Unique touch ID: " .. tostring(event.id) )

	if ( event.phase == "began" ) then
		event.target.alpha = 0.5
		-- Set focus on object using unique touch ID
		display.getCurrentStage():setFocus( event.target, event.id )

	elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
		event.target.alpha = 1
		-- Release focus on object
		display.getCurrentStage():setFocus( event.target, nil )
	end
	return true
end

-- Add a touch listener to each object
newRect1:addEventListener( "touch", touchListener )
newRect2:addEventListener( "touch", touchListener )
``````
