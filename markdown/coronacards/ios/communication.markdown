# CoronaCards — iOS

## Native/Lua Communication

At this time, communication between Lua and the iOS environment is done through an <nobr>Obj-C</nobr> layer. To simplify this process, instances of `CoronaView` allow __events__ to be sent from one environment to the other.

Within Obj-C, these events are represented by `NSDictionary` instances. In Lua, they are basic Lua tables. Both follow the Corona convention for events with a required `"name"` key along with a string value that identifies the key. Further information can additionally be passed via a series of <nobr>key-value</nobr> pairs.

### Obj-C to Lua

From the Obj-C side, you can send events to a `CoronaView` instance by constructing a <nobr>Corona-style</nobr> event. For instance, if you have a `UIButton` that should trigger an event within a `CoronaView` instance, you can create a new instance of an `NSDictionary`, fill it with the information you wish to pass, and then send the event. On the Lua side, a `CoronaView` will convert this `NSDictionary` object to a Lua table and dispatch it to any Lua `Runtime` listener that's registered to listen for that event.

The following example illustrates this concept on both the <nobr>Obj-C</nobr> and Lua sides:

``````c
// [Obj-C]
CoronaView *view = ...
NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
	@"pauseEvent", @"name",
	@"pause", @"phase",
	@"otherValue", @"otherKey",
	nil];
[view sendEvent:event];
``````

``````lua
-- [Lua]
local function handlePause( event )

	if ( event.phase == "pause" ) then
		print( event.name ) --> pauseEvent
		print( event.otherKey ) --> otherValue
		-- Handle pause implementation here
	end
	return true
end

Runtime:addEventListener( "pauseEvent", handlePause )
``````

### Lua to Obj-C

Lua code within a `CoronaView` instance can send events to the `CoronaView`. These events should be of the type `coronaView` and you must register a `CoronaViewDelegate` <nobr>(attached to `CoronaView`)</nobr> to listen for them. In this case, the Lua `event` table will be converted to a `NSDictionary` when it is received by the delegate.

The following example illustrates this concept on both the <nobr>Obj-C</nobr> and Lua sides:

``````c
// [Obj-C]
// Change the value of the UILabel element 'myLabel'
- (id)coronaView:(CoronaView *)view receiveEvent:(NSDictionary *)event
{
	NSLog( @"Logging properties of the event: %@", event );
	self.myLabel.text = [event objectForKey:@"message"];

	return @"Nice to meet you CoronaCards!";
}
``````

``````lua
-- [Lua]
local function pressMe( event )

	if ( event.phase == "ended" ) then
		local event = { name="coronaView", message="Hello from CoronaCards!" }
		-- Dispatch the event to the global Runtime object
		local result = Runtime:dispatchEvent( event )
		print( "Response: " .. result )  --> Response: Nice to meet you CoronaCards!
	end
	return true
end

myObject:addEventListener( "touch", pressMe )
``````

### Lua Modules

A slightly lower-level way to bridge the <nobr>Obj-C</nobr> and Lua worlds is to create a Lua module. This requires using the [Lua&nbsp;C&nbsp;API](https://www.lua.org/manual/5.1/manual.html#3) which lets you invoke Lua code from C and create wrappers to C code which you can invoke from Lua.


##

<div class="walkthrough-nav">

__&lang;__ [Obj-C/UIKit Integration][coronacards.ios.uikit] _|_ [Feature Comparison][coronacards.ios.support] __&rang;__

</div>
