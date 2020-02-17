# CoronaCards — Windows&nbsp;Phone&nbsp;8

## Lua/.NET Communication

Interop communication between the Lua environment and the .NET <nobr>(C# or Visual Basic)</nobr> or C++/CX component environments is performed via Corona Runtime events. When a `CoronaPanel` XAML control loads a Corona project, it raises a "Loaded" event which provides a new instance of the `CoronaRuntimeEnvironment` class. This instance represents the loaded Lua environment of your project and, using this object, you can listen for and dispatch Corona Runtime events in Lua.

## C\# to Lua

The following example illustrates C# requesting Lua to sum two numbers and return the result back to C#. This is accomplished by having C# dispatch an event to Lua named `"requestingSum"` with two number properties. This is received by a Lua listener which then returns the sum back to C#.

``````
// [C#]

/// <summary>Constructor. Initializes member variables and the user interface.</summary>
public MainPage()
{
	// Initialize this page's components that were set up via the UI designer.
	InitializeComponents();

	// Set up Corona to automatically start up when the control's Loaded event has been raised.
	fCoronaPanel.AutoLaunchEnabled = true;

	// Add a Corona event handler which detects when the Corona project has been started.
	fCoronaPanel.Runtime.Started += OnCoronaRuntimeStarted;
}

/// <summary>Called when the Corona runtime has started and finished loaded the "main.lua" file.</summary>
/// <param name="sender">The CoronaRuntime object that raised this event.</param>
/// <param name="e">Event arguments providing the CoronaRuntimeEnvironment that has been started.</param>
private void OnCoronaRuntimeStarted(object sender, CoronaLabs.Corona.WinRT.CoronaRuntimeEventArgs e)
{
	// Create a custom Corona event named "requestingSum" with the following properties.
	// This will be converted into a Lua "event" table once dispatched by Corona.
	var eventProperties = CoronaLabs.Corona.WinRT.CoronaLuaEventProperties.CreateWithName("requestingSum");
	eventProperties.Set("x", 5);
	eventProperties.Set("y", 10);
	eventProperties.Set("message", "Hello. Can you add these 2 numbers please?");

	// Dispatch the event to Lua.
	var eventArgs = new CoronaLabs.Corona.WinRT.CoronaLuaEventArgs(eventProperties);
	var result = e.CoronaRuntimeEnvironment.DispatchEvent(eventArgs);

	// Check if a number was returned from the Lua listener.
	var boxedNumber = result.ReturnedValue as CoronaLabs.Corona.WinRT.CoronaBoxedNumber;
	if (boxedNumber != null)
	{
		// A number was returned from Lua. Fetch it.
		double sum = boxedNumber.Value;
	}
}
``````

``````lua
-- [Lua]

-- Called when a Corona event named "requestingSum" has been dispatched
local function onRequestingSum( event )
	-- Print event property "message" to Visual Studio's Output Panel
	print( event.message )

	-- Sum event properties "x" and "y" and return the result back to C#
	return event.x + event.y
end

-- Set up the above function to be called when an event named "requestingSum" has been dispatched
Runtime:addEventListener( "requestingSum", onRequestingSum )
``````

## Lua to C\#

The following example illustrates Lua requesting C# to display a native message box by dispatching a `"requestingMessageBox"` event. The C# side of the app sets up the Corona event listener when the Corona Runtime has been loaded &mdash; this is the best time to add Corona Runtime event listeners because the "Loaded" event is raised in C# before `main.lua` is executed.

``````
// [C#]

/// <summary>Constructor. Initializes member variables and the user interface.</summary>
public MainPage()
{
	// Initialize this page's components that were set up via the UI designer.
	InitializeComponents();

	// Set up Corona to automatically start up when the control's Loaded event has been raised.
	fCoronaPanel.AutoLaunchEnabled = true;

	// Add a Corona event handler which detects when the Corona project has been loaded, but not started yet.
	fCoronaPanel.Runtime.Loaded += OnCoronaRuntimeLoaded;
}

/// <summary>
///  Called when a new CoronaRuntimeEnvironment has been created/loaded,
///  but before the "main.lua" has been executed.
/// </summary>
/// <param name="sender">The CoronaRuntime object that raised this event.</param>
/// <param name="e">Event arguments providing the CoronaRuntimeEnvironment that has been created/loaded.</param>
private void OnCoronaRuntimeLoaded(object sender, CoronaLabs.Corona.WinRT.CoronaRuntimeEventArgs e)
{
	// Set up C# method OnRequestingMessageBox() to be invoked when Corona runtime event
	// "requestingMessageBox" has been dispatched.
	e.CoronaRuntimeEnvironment.AddEventListener("requestingMessageBox", OnRequestingMessageBox);
}

/// <summary>Called when Corona runtime event "requestingMessageBox" has been dispatched.</summary>
/// <param name="sender">The CoronaRuntimeEnvironment that dispatched the event.</param>
/// <param name="e">Provides the Lua event table's fields/properties.</param>
private CoronaLabs.Corona.WinRT.ICoronaBoxedData OnRequestingMessageBox(
	CoronaLabs.Corona.WinRT.CoronaRuntimeEnvironment sender,
	CoronaLabs.Corona.WinRT.CoronaLuaEventArgs e)
{
	// Fetch the "event.message" property.
	var boxedMessage = e.Properties.Get("message") as CoronaLabs.Corona.WinRT.CoronaBoxedString;
	if (boxedMessage == null)
	{
		// A "message" property was not provided or it was not of type string.
		// Return an error message to Lua describing what went wrong.
		return CoronaLabs.Corona.WinRT.CoronaBoxedString.From("'event.message' is a required field.");
	}

	// Display a native message box with the given string.
	System.Windows.MessageBox.Show(boxedMessage.ToString());

	// Return a success message to Lua.
	return CoronaLabs.Corona.WinRT.CoronaBoxedString.From("Message box was displayed successfully!");
}
``````

``````lua
-- [Lua]

-- Dispatch an event named "requestingMessageBox" to be received by C#
local requestingMessageBoxEvent =
{
	name = "requestingMessageBox",
	message = "Hello World!"
}
local result = Runtime:dispatchEvent( requestingMessageBoxEvent )

-- Print the message returned by C#
print( tostring(result) )
``````


## Class Framework

Documentation for the Corona .NET/C++/CX class framework can be found [here](../../native/wp8/html/index.html).


##

<div class="walkthrough-nav">

__&lang;__ [Guide Index][coronacards.wp8]

</div>
