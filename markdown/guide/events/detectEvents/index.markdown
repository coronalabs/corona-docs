# Basic Interactivity and Event Detection

__Events__ are the foundation of interactive applications in Corona. They're used to trigger responses in your app like a tap on the screen, detection of a specific system event, completion of a timer, collision of two physical bodies, etc. Events are detected using the [object:addEventListener()][api.type.EventDispatcher.addEventListener] method which directs Corona to track (listen&nbsp;for) the associated event within a listener function. See the [Registering&nbsp;Events](#registerevents) section for details.

<div class="guides-toc">

- [Basic Interactivity and Event Detection](#basic-interactivity-and-event-detection)
	- [Runtime Events](#runtime-events)
	- [Local Events](#local-events)
	- [Function and Table Listeners](#function-and-table-listeners)
	- [Event Listeners](#event-listeners)
	- [Registering Events](#registering-events)
	- [Removing Event Listeners](#removing-event-listeners)

</div>


<a id="runtime"></a>

## Runtime Events

__Runtime events__ are dispatched to the global Runtime listener. These events are not directed at any particular object; rather, they are broadcast to all interested listeners. Common Runtime events include the following:

* `enterFrame` events \([documentation][api.event.enterFrame]\) occur at the <nobr>frames-per-second</nobr> interval of the application.

* `lateUpdate` events \([documentation][api.event.lateUpdate]\) occur at the <nobr>frames-per-second</nobr> interval of the application, right after the `enterFrame` event and right before the rendering process.

* `system` events \([documentation][api.event.system]\) are dispatched when certain external events occur, such as when the device suspends or exits the application.

* `resize` events \([documentation][api.event.resize]\)	occur when the width or height of the app's view has been changed.

* `orientation` events \([documentation][api.event.orientation]\) occur when the device orientation changes from portrait to landscape or <nobr>vice-versa</nobr>.

* `windowState` events \([documentation][api.event.windowState]\) occur when the application window is sent to background or activated again (Win32 and macOS only).

The following code shows how an app can respond to `system` events:

``````lua
local function onSystemEvent( event )
	
	local eventType = event.type

	if ( eventType == "applicationStart" ) then
		-- Occurs when the application is launched and all code in "main.lua" is executed
	elseif ( eventType == "applicationExit" ) then
		-- Occurs when the user or OS task manager quits the application
	elseif ( eventType == "applicationSuspend" ) then
		-- Perform all necessary actions for when the device suspends the application, i.e. during a phone call
	elseif ( eventType == "applicationResume" ) then
		-- Perform all necessary actions for when the app resumes from a suspended state
	elseif ( eventType == "applicationOpen" ) then
		-- Occurs when the application is asked to open a URL resource (Android and iOS only)
	end
end

Runtime:addEventListener( "system", onSystemEvent )
``````




<a id="local"></a>

## Local Events

__Local events__ are typically sent to a single listener and are not broadcast to the global Runtime. Common local events include the following:

* `tap` and `touch` events occur when the user touches the device screen. See the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide for more information.

* `collision` events occur when two [physics][api.library.physics] objects collide. See the [Collision Detection][guide.physics.collisionDetection] guide for more information.

* `timer` events occur when a running [timer][api.event.timer] completes its duration.

* `audio` events can be dispatched when a [audio][api.event.audio] file finishes playing. See the [Audio Usage/Functions][guide.media.audioSystem] guide for details.

Local events vary in usage and are discussed further in their <nobr>topic-appropriate</nobr> [guides][guide] and/or the [API Reference][api].




<a id="functionvstable"></a>

## Function and Table Listeners

Listeners can be either functions or table/display objects.

When a __function&nbsp;listener__ is invoked, it is passed a table representing the event:

``````lua
local myListener = function( event )
	print( "Listener called with event of type: " .. event.name )
end

Runtime:addEventListener( "touch", myListener )
Runtime:addEventListener( "enterFrame", myListener )
``````

Sometimes a function listener is not convenient because certain variables are not in scope when the listener is invoked. In these situations, __table&nbsp;listeners__ should be used. Table listeners must have an instance method with a name corresponding to the event name:

``````lua
-- Assumes "myClass" and "myClass:new()" already exist

function myClass:enterFrame( event )
	print( "enterFrame called at time: " .. event.time )
end

function myClass:touch( event )
	print( "touch occurred at: " .. event.x .. "," .. event.y )
end
 
local myObject = myClass:new() 

Runtime:addEventListener( "touch", myObject )
Runtime:addEventListener( "enterFrame", myObject )
``````




<a id="listeners"></a>

## Event Listeners

As illustrated in each example above, events are dispatched to __event&nbsp;listeners__ which are written as basic functions. An `event` argument is always dispatched to the function.

``````lua
local function myTouchListener( event )

	print( "Touch X location" .. event.x )
	print( "Touch Y location" .. event.y )
end
 
local myButton = display.newRect( 100, 100, 200, 50 )
myButton:addEventListener( "touch", myTouchListener )
``````

Notice how the `event` argument passed to the `myTouchListener` function contains both `x` and `y` properties that represent the point on the screen where the touch occurred. Properties associated with the `event` argument are unique to each event type — please refer to the [Events][api.event] API documentation for details.




<a id="registerevents"></a>

## Registering Events

Events can be registered using the [object:addEventListener()][api.type.EventDispatcher.addEventListener] method. Just pass the string name of the event type and the name of the event listener function that should handle it.

``````lua
-- Standard touch listener on an object
myButton:addEventListener( "touch", myTouchListener )

-- Runtime "system" event listener
Runtime:addEventListener( "system", onSystemEvent )
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

As shown above, two types of event listeners can be created with the `object:addEventListener()` method: listeners attached to display objects and listeners attached to the global Runtime.

When you create a display object and add a __local__ touch event listener to it, you essentially __point__ to a block of code via reference to the function. This code resides in its own memory and it persists after the display object is removed. When that occurs, there's no way to sense future events on the object, so the local event listener is effectively removed for you. You don't need to explicitly remove it.

__Runtime__ event listeners, on the other hand, __must__ be removed when you're finished using them. Otherwise, they'll continue to run because the Runtime event is global. Not only will this cause a memory leak, but if any functions executing in the Runtime attempt to reference object(s) that no longer exist, the program will crash. See [Removing Event Listeners](#remove) below for more information.

</div>




<a id="remove"></a>

## Removing Event Listeners

Most listeners, with the exception of Runtime listeners like `"enterFrame"`, will be removed automatically when the associated object is removed, for example when you call [object:removeSelf()][api.type.DisplayObject.removeSelf] or [display.remove()][api.library.display.remove]. However, you may need to explicitly remove an event listener without removing the object.

Removing an event listener is done using the <nobr>built-in</nobr> [object:removeEventListener()][api.type.EventDispatcher.removeEventListener] method.

This function is called in the same exact manner as `object:addEventListener()`. For example, if you want to stop listening for touch events on the `myButton` object, remove the listener as follows:

``````lua
myButton:removeEventListener( "touch", myTouchListener )
``````

Both the type and function name are required to remove the associated listener, because it's possible to assign multiple listeners of the same type to a single object. For instance, you could have two (or&nbsp;more) different listener functions assigned to the `"touch"` event of the `myButton` display object. Therefore, when calling `object:removeEventListener()`, you need to specify the type of event you want to stop listening for, as well as the listener function that was previously assigned to that event.
