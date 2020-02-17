# CoronaCards: Native/Lua Communication — Android

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          CoronaCards, Android
> __See also__          [Project Integration — Android][coronacards.android.project]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Communication between Lua and the Java environment is done through CoronaView instances which allow __events__ to be sent from one environment to the other.

In Java, these events are represented by `Hashtable` instances. In Lua, they are basic Lua tables. Both follow the Corona convention for events with a required `"name"` key along with a string value that identifies the key. Further information can additionally be passed via a series of <nobr>key-value</nobr> pairs.

The central router for events between the two environments is the global [Runtime][api.type.Runtime] object which exists on the Lua side.


## Java to Lua

You can send events to Lua from Java by constructing a Corona-style event. In the example below, we create a custom event type (`"pauseEvent"`) by instantiating an instance of `HashMap`. We fill this with the proper field (the key/value pair `"name"`/`"pauseEvent"`) and a custom field `"otherKey"`/`"otherValue"`. We then call the CoronaView method `sendEvent`, passing in the `Hashtable`. The CoronaView will automatically translate this to a Lua table and dispatch it to any Lua listener that has been registered with the global [Runtime][api.type.Runtime] object.

##### Example

``````
// [Java]

CoronaView view = ...
Hashtable<Object, Object> event = new Hashtable<Object, Object>();
event.put("otherKey", "otherValue");
event.put("name", "pauseEvent");
view.sendEvent(event);
``````

``````lua
-- [Lua]

local function handlePause( event )

	if ( event.phase == "pause" ) then
		print( event.name ) --> pauseEvent
		print( event.otherKey ) --> otherValue
		--handle pause implementation here
	end
	return true
end

Runtime:addEventListener( "pauseEvent", handlePause )
``````


## Lua to Java

Lua code within a CoronaView instance can send events to the `CoronaView`. These events should be of the type `coronaView` and you must register a `CoronaEventListener` with `setCoronaEventListener` to listen for them. The Lua `event` table will be converted to a `Hashtable` by the time the listener is called.

##### Example

``````
// [Java]

coronaView.setCoronaEventListener(new CoronaEventListener() {
	@Override
	public Object onReceivedCoronaEvent(CoronaView view, Hashtable<Object, Object> event) {
		android.util.Log.i("Corona", event.get("message"));
		return "Nice to meet you CoronaCards!";
	}
});
``````

``````lua
-- [Lua]

local function pressMe( event )

	if ( event.phase == "ended" ) then
		local event = { name="coronaView", message="Hello from CoronaCards!" }
		-- Dispatch the event to the global Runtime object
		local result = Runtime:dispatchEvent( event )
		print( "Response: " .. result ) --> Response: Nice to meet you CoronaCards!
	end
	return true
end

local myObject:addEventListener( "touch", pressMe )
``````
