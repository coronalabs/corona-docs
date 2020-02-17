
# Introduction to CORONA_NATIVE_PRODUCT&nbsp;&mdash; iOS

This tutorial will help you get started with [CORONA_NATIVE_PRODUCT][native] builds for iOS.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Before you begin, we recommend that you update to the latest version of Xcode.

</div>
</div>


## Setup

To set up CORONA_NATIVE_PRODUCT, follow these steps:

1. Install Corona as outlined in [Installing Corona &mdash; macOS][guide.start.installMac].

<!---

2. Also, ensure that Corona is installed in your macOS `Applications` directory.

-->

2. Once you have Corona installed, locate its core application folder. Open the __Native__ folder within and run the __Setup&nbsp;Corona&nbsp;Native__ application.

3. CORONA_NATIVE_PRODUCT projects should generally use the provided `App` template as a foundation, so __copy__ the `App` folder <nobr>(`/Native/Project Template/App`)</nobr> to another convenient location such as a working project folder. Do __not__ modify the original template because you'll likely need a clean copy for future projects.

4. Once copied, rename the folder to whatever you want. In this tutorial, we'll build a sample __plugin__ which activates/deactivates the device's "flashlight" and then we'll integrate it into a test app. Thus, `Flashlight` is an appropriate folder name.


## Plugin Project

Let's get started! First, we'll address the plugin side of the project:

1. Open your `Flashlight` folder&nbsp;&mdash; a&nbsp;copy of the `App` template as described above&nbsp;&mdash; and then open the `ios` folder.

2. Inside this `ios` folder you'll see several files, two of which should be noted at this point:

	* `App.xcodeproj`
	* `Plugin.xcodeproj`

<div class="code-indent">

Basically, these are __Xcode&nbsp;Project__ files which contain various project files and settings.

</div>

3. Double click the `Plugin.xcodeproj` file to load the project in Xcode. Once loaded, inspect the <nobr>left-side</nobr> __Navigator__ column. From here, expand the <nobr>__Plugin__ &rarr; __Source__</nobr> folder tree:

<div class="code-indent" style="max-width: 750px; margin-bottom: -10px;">

![][images.docs.native-ios-1]

</div>

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If the Navigator is not visible, reveal it via <nobr>__View__ &rarr; __Navigators__ &rarr;</nobr> __Show&nbsp;Navigator__ <nobr>(⌘-0)</nobr>.

</div>
</div>
</div>

4. Inside, you'll see the `PluginLibrary.h` and `PluginLibrary.mm` files &mdash; these are the files which we'll modify to build the plugin.

<div class="code-indent" style="max-width: 750px; margin-bottom: -10px;">

![][images.docs.native-ios-2]

</div>

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

For those with a background in C programming, the `.mm` extension may seem a bit odd. In Xcode, a `.m` file is really a `.c` file, but it stands for __Methods__. This `.mm` file allows Xcode to mix <nobr>Obj-C</nobr> with C++ and it's where you'll put your methods and objects. As for the `.h` file, this is the traditional C "header" file where you'll place the definitions for the objects.

</div>
</div>


## Methods File

Now let's proceed with modifying the __methods__ file (`PluginLibrary.mm`):

1. Within Xcode, select `PluginLibrary.mm` from the <nobr>left-side</nobr> Navigator column to reveal its contents (or&nbsp;alternatively open the file in your preferred text&nbsp;editor).

2. For this tutorial, the plugin will need access to the `AVFoundation` framework. As such, we must import the appropriate __header__ file just after the `UIKit` import by adding the indicated highlighted line:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="8" highlight="[13]" }
#import "PluginLibrary.h"

#include <CoronaRuntime.h>
#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
``````

</div>

3. Following this, observe that the `PluginLibrary` class is declared. This is the interface for binding your plugin to Lua:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="17" }
class PluginLibrary
{
	public:
		typedef PluginLibrary Self;

	public:
		static const char kName[];
		static const char kEvent[];

	protected:
		PluginLibrary();

	public:
		bool Initialize( CoronaLuaRef listener );

	public:
		CoronaLuaRef GetListener() const { return fListener; }

	public:
		static int Open( lua_State *L );

	protected:
		static int Finalizer( lua_State *L );

	public:
		static Self *ToLibrary( lua_State *L );

	public:
		static int init( lua_State *L );
		static int show( lua_State *L );

	private:
		CoronaLuaRef fListener;
};
``````

Most of this requires no modification except for the final `public:` block where two methods are defined:

``````{ brush="lua" gutter="true" first-line="44" highlight="[44,45,46]" }
	public:
		static int init( lua_State *L );
		static int show( lua_State *L );

	private:
		CoronaLuaRef fListener;
};
``````

For our flashlight plugin, `show()` doesn't make much semantic sense. Instead, methods of `on()` and `off()` are more logical since the plugin will turn the flashlight on or off. Thus, let's __remove__ the `show()` method and __add__ both an `on()` and `off()` method instead:

``````{ brush="lua" gutter="true" first-line="44" highlight="[46,47]" }
	public:
		static int init( lua_State *L );
		static int on( lua_State *L );
		static int off( lua_State *L );

	private:
		CoronaLuaRef fListener;
};
``````

</div>

3. Now let's update some values to better represent the actual project on the Lua side and provide proper linking. Essentially, change `"plugin.library"` to `"plugin.flashlight"` and, a&nbsp;few lines after, `"pluginlibraryevent"` to `"Flashlight"`:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="55" highlight="[56,59]" }
// This corresponds to the name of the library, e.g. [Lua] require "plugin.library"
const char PluginLibrary::kName[] = "plugin.flashlight";

// This corresponds to the event name, e.g. [Lua] event.name
const char PluginLibrary::kEvent[] = "Flashlight";
``````

</div>

4. Next, the `PluginLibrary::Open()` method needs updating to remove the `show()` method and add the `on()` and `off()` methods we specified earlier:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="80" highlight="[91,92]" }
int
PluginLibrary::Open( lua_State *L )
{
	// Register __gc callback
	const char kMetatableName[] = __FILE__; // Globally unique string to prevent collision
	CoronaLuaInitializeGCMetatable( L, kMetatableName, Finalizer );

	// Functions in library
	const luaL_Reg kVTable[] =
	{
		{ "init", init },
		{ "on", on },
		{ "off", off },

		{ NULL, NULL }
	};

	// Set library as upvalue for each library function
	Self *library = new Self;
	CoronaLuaPushUserdata( L, library, kMetatableName );

	luaL_openlib( L, kName, kVTable, 1 ); // leave "library" on top of stack

	return 1;
}
``````

</div>

5. Now, scroll down until you see the `show()` method. Since we don't need this method for our flashlight plugin, __remove__ it and replace it with two __new__ methods for `on()` and `off()`:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="143" highlight="[143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209]" }
// [Lua] library.on( word )
int
PluginLibrary::on( lua_State *L )
{
	NSString *message = @"Device does not appear to have a camera light.";

	// check if flashlight available
	Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
	if (captureDeviceClass != nil) {
		AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		if ([device hasTorch] && [device hasFlash]){
				message = @"Device light should be on.";
			[device lockForConfiguration:nil];
			if (device.torchMode == AVCaptureTorchModeOff) {
				[device setTorchMode:AVCaptureTorchModeOn];
				[device setFlashMode:AVCaptureFlashModeOn];
			}
			[device unlockForConfiguration];
		}
	}

	Self *library = ToLibrary( L );

	// Create event and add message to it
	CoronaLuaNewEvent( L, kEvent );
	lua_pushstring( L, [message UTF8String] );
	lua_setfield( L, -2, "message" );

	// Dispatch event to library listener
	CoronaLuaDispatchEvent( L, library->GetListener(), 0 );

	return 0;
}

// [Lua] library.off( word )
int
PluginLibrary::off( lua_State *L )
{
	NSString *message = @"Device does not appear to have a camera light."; ;

	// check if flashlight available
	Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
	if (captureDeviceClass != nil) {
		AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		if ([device hasTorch] && [device hasFlash]){
				message = @"Device light should be off.";
			[device lockForConfiguration:nil];
			if (device.torchMode == AVCaptureTorchModeOn) {
				[device setTorchMode:AVCaptureTorchModeOff];
				[device setFlashMode:AVCaptureFlashModeOff];
			}
			[device unlockForConfiguration];
		}
	}

	Self *library = ToLibrary( L );

	// Create event and add message to it
	CoronaLuaNewEvent( L, kEvent );
	lua_pushstring( L, [message UTF8String] );
	lua_setfield( L, -2, "message" );

	// Dispatch event to library listener
	CoronaLuaDispatchEvent( L, library->GetListener(), 0 );

	return 0;
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Within each new method, following the <nobr>Obj-C</nobr> code which manages the device's lamp, there's some CORONA_NATIVE_PRODUCT code that constructs an event and dispatches it to Lua. Let's examine that code:

``````lua
	Self *library = ToLibrary( L );

	// Create event and add message to it
	CoronaLuaNewEvent( L, kEvent );
	lua_pushstring( L, [message UTF8String] );
	lua_setfield( L, -2, "message" );

	// Dispatch event to library listener
	CoronaLuaDispatchEvent( L, library->GetListener(), 0 );

	return 0;
}
``````

Basically, this code creates a C object called `library` which is the pathway to the Lua app. Next, it calls `CoronaLuaNewEvent()` and passes it the `kEvent` object. It then adds the string `message` and tells Lua that it's the second entry in the table. Finally, it dispatches the event to the library (further&nbsp;on in this tutorial we'll discuss the Lua code for handling this&nbsp;event).

</div>

</div>

6. The last block of code in the `PluginLibrary.mm` file is this:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="213" }
CORONA_EXPORT int luaopen_plugin_library( lua_State *L )
{
	return PluginLibrary::Open( L );
}
``````

Because of the "suffix" of `_library`, the name of the plugin on the Corona side will be `library`. That name is vague if you decide to build several plugins, so let's rename the plugin `flashlight` by changing the code to `luaopen_plugin_flashlight`:

``````{ brush="lua" gutter="true" first-line="213" highlight="[213]" }
CORONA_EXPORT int luaopen_plugin_flashlight( lua_State *L )
{
	return PluginLibrary::Open( L );
}
``````

</div>

7. At this point, save your `PluginLibrary.mm` file and proceed to the next section.


## Header File

Now let's proceed with modifying the __header__ file (`PluginLibrary.h`):

1. Within Xcode, select `PluginLibrary.h` from the <nobr>left-side</nobr> Navigator column to reveal its contents (or&nbsp;alternatively open the file in your preferred text&nbsp;editor).

2. Change the `CORONA_EXPORT` line to the following:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="14" highlight="[16]" }
// This corresponds to the name of the library, e.g. [Lua] require "plugin.library"
// where the '.' is replaced with '_'
CORONA_EXPORT int luaopen_plugin_flashlight( lua_State *L );

#endif // _PluginLibrary_H__
``````

</div>

3. At this point, save your `PluginLibrary.h` file and proceed to the next section.


## Building the Project

Xcode projects need to be __built__ to verify the code and test for any errors. Confirm that you saved all changes to both `PluginLibrary.mm` and `PluginLibrary.h`, then select <nobr>__Product__ &rarr; __Build__ (⌘-B)</nobr> from within Xcode. If the process completes without errors, you can close the project file at this point.


## App Project

Now, from within your core `Flashlight` folder, open the `App.xcodeproj` project and proceed with the following steps:

1. First, rename the project to something more sensible by clicking and hovering over the project name (`App`) in the <nobr>left-side</nobr> Navigator column. Change the name from `App` to `Flashlight`. Upon entry, Xcode will analyze the project and show a dialog box indicating all of the names it will change. Click __Rename__ to confirm.

<div class="code-indent" style="max-width: 750px;">

![][images.docs.native-ios-3]

</div>

2. In the middle pane, with __General__ selected along the upper tab bar, look for the __Identity__ section. For __Bundle&nbsp;Identifier__, change the value to a valid app bundle&nbsp;ID which you set up in the [Apple Developer](https://developer.apple.com/) portal. If you need assistance on Apple provisioning, please see our [guide][guide.distribution.iOSBuild].

<div class="code-indent" style="max-width: 750px;">

![][images.docs.native-ios-4]

</div>

<!---

In the **Deployment Info** section below, go through and edit the options such as **Deployment Target**, **Devices**, **Device Orientation**, etc.

-->

3. Next, scroll down to the <nobr>__Linked Frameworks and Libraries__</nobr> section and look for `AVFoundation.framework`. If you do not see it, click the [__+__] button below the list, select `AVFoundation.framework`, and click __Add__.


## Lua Project Code

The final step is to implement our plugin into a standard Corona (Lua) project. Within Xcode, from the <nobr>left-side</nobr> Navigator column, expand the <nobr>__Flashlight__ &rarr; __Corona__</nobr> tree:

<div style="max-width: 750px;">

![][images.docs.native-ios-5]

</div>

Here you'll see typical Corona project files like `main.lua`, `build.settings`, and `config.lua`. For CORONA_NATIVE_PRODUCT, the latter two files are typically not used, so we can ignore them for this tutorial.

Select `main.lua` to reveal its contents (or&nbsp;alternatively open the file in your preferred text&nbsp;editor) and then __replace__ the existing file code with the following:

``````{ brush="lua" gutter="true" first-line="1" }
local flashlight = require( "plugin.flashlight" )
local widget = require( "widget" )

-- This event is dispatched to the global Runtime object by "didLoadMain:" in MyCoronaDelegate.mm
local function delegateListener( event )
	native.showAlert(
		"Event dispatched from 'didLoadMain:'",
		"of type: " .. tostring( event.name ),
		{ "OK" } )
end
Runtime:addEventListener( "delegate", delegateListener )

local function listener( event )
	print( "Received event from Flashlight plugin (" .. event.name .. "): ", event.message )
end

local lightState = "off"

local function handleButtonEvent( event )

	if ( lightState == "off" ) then
		flashlight.on()
		lightState = "on"
		event.target:setLabel( "Turn Off" )
	else
		flashlight.off()
		lightState = "off"
		event.target:setLabel( "Turn On" )
	end
	return true
end

local onOffSwitch = widget.newButton(
{
	x = display.contentCenterX,
	y = display.contentCenterY,
	label = "Turn On",
	onRelease = handleButtonEvent
})

flashlight.init( listener )
``````

Let's inspect this code step by step:

* The first line loads our plugin into a Corona variable called `flashlight`, similar to how you'd include any typical Corona plugin. The second line includes the Corona [widget][api.library.widget] library which we'll use to create a standard button.

* Next is the function called `delegateListener()`. This function will be attached to the Runtime event `"delegate"` and it will receive events dispatched from the native side. Basically, this lets you know when the app has been loaded, but this sample won't use it in any meaningful way (in&nbsp;this case, it just shows an&nbsp;alert).

* The next function is the listener that the app uses to receive events from various plugin methods. Like the previous function, this won't be used in any meaningful way within this sample.

* The rest of the code does the main work from the Corona side. Among other things, we create a widget button that uses the listener function named `handleButtonEvent()`. Most importantly, notice that the `handleButtonEvent()` function calls `flashlight.on()` and `flashlight.off()`, the functions that we wrote in <nobr>Obj-C</nobr> within `PluginLibrary.mm`.

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="19" highlight="[22,26]" }
local function handleButtonEvent( event )

	if ( lightState == "off" ) then
		flashlight.on()
		lightState = "on"
		event.target:setLabel( "Turn Off" )
	else
		flashlight.off()
		lightState = "off"
		event.target:setLabel( "Turn On" )
	end
	return true
end
``````

</div>


## Test Run

And now for the fun &mdash; testing on an actual device!

1. Assuming you've enabled your iOS device as a development device, connect it to your computer with the sync cable.

2. In the Xcode tool bar, click on the __active&nbsp;scheme__ button and confirm that __App__ is the selected scheme:

<div class="code-indent" style="max-width: 375px;">

![][images.docs.native-ios-6]

</div>

3. In the same scheme button region, click to the __right__ of the thin arrow (__&rang;__). You should find a list of connected device(s) under the grey __Device__ subheader. Select the device that you wish to test on.

<div class="code-indent" style="max-width: 375px;">

![][images.docs.native-ios-7]

</div>

4. To the left of the scheme button, you'll see a __Run__ button. Click this and Xcode will install the app onto the device and start it. Because it's in development mode, it may take a couple seconds longer to start up.

5. If everything is working correctly, you'll see a "Turn&nbsp;On" button in the center of the screen. Tap it and the device's flashlight should turn on. Tap the button again to turn off the flashlight.

6. When you're finished testing, click the __Stop__ button in Xcode.


## Conclusion

Clearly this tutorial is just a basic example of what can be done with CORONA_NATIVE_PRODUCT, but hopefully it has shown you what __can__ be accomplished when you combine the nearly unlimited power of native programming with the ease and simplicity of Corona!
