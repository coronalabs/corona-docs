# CORONA_NATIVE_PRODUCT &mdash; iOS

The following resources go further in depth on using CORONA_NATIVE_PRODUCT for iOS.

<div class="guides-toc">

* [CORONA_NATIVE_PRODUCT Setup](#setup)
* [Project Templates](#templates)
* [CORONA_NATIVE_PRODUCT Development](#development)
* [Building for Devices](#building)

</div>


<a id="setup"></a>

## CORONA_NATIVE_PRODUCT Setup

The following steps will help you set up your native development environment such that it's optimized for integration with CORONA_NATIVE_PRODUCT.

1. Within the `/Applications/Corona/Native/` folder, double click __Setup&nbsp;Corona&nbsp;Native__. This will create the symbolic link required for the project templates.

2. To develop native iOS applications, you'll need to install [Xcode](https://developer.apple.com/xcode/), available from the Mac&nbsp;App&nbsp;Store or for direct download. If you already have Xcode installed, ensure you've updated to the latest version.

3. You must have an [Apple Developer](https://developer.apple.com/) account to install/test apps on iOS devices and publish to the App&nbsp;Store. Once you've established your account, you'll need to integrate it with Xcode. This process is outlined [here](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/AddingYourAccounttoXcode/AddingYourAccounttoXcode.html).

4. If your iOS development environment is working correctly, you should be able to build a native iOS sample project such as [MyLife](https://developer.apple.com/library/content/samplecode/MyLife/Introduction/Intro.html#//apple_ref/doc/uid/TP40017272). Additionally, you should be able to [deploy and run](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/LaunchingYourApponDevices/LaunchingYourApponDevices.html) the sample on a device.




<a id="templates"></a>

## Project Templates

New projects can easily be created by using template files as a starting point. Inside the <nobr>`/Applications/Corona/Native/Project Template/App/`</nobr> folder, the following files/directories are of primary concern:

<div class="tree">

* `Corona` &mdash; This folder represents a classic Corona project, containing files like `main.lua`, app&nbsp;icons, etc. By default, `ios/App.xcodeproj` is set up to assume that these files reside inside this exact folder (`Corona`).
* `ios` &mdash; Contains all of the <nobr>iOS-specific</nobr> code, projects, etc.
	- `App.xcodeproj` &mdash; This is the main project for building and running your app within Xcode. We recommend that you use this project template as the starting point for your Xcode project since it contains custom build phases that take care of packaging your Lua sources and resource files <nobr>(images, audio, etc.)</nobr>. It also allows you to structure your native extensions as [plugins][native.plugin] that can be <nobr>re-used</nobr> in future projects.
	- `AppCoronaDelegate.h`&nbsp;/&nbsp;`AppCoronaDelegate.mm` &mdash; The main application entry points go here. The class conforms to the [CoronaDelegate][native.ios.CoronaDelegate] protocol, so you will get notified immediately before and after `main.lua` is loaded and executed. You can also add `UIApplicationDelegate` methods. We recommend that you add new Lua libraries via plugins.
	- `Plugin/` &mdash; For [plugins][native.plugin], this is where the implementation of `plugin.library` goes.
		- `PluginLibrary.h`&nbsp;/&nbsp;`PluginLibrary.mm` &mdash; These implement `plugin.library`.
	- `Plugin.xcodeproj` &mdash; For [plugins][native.plugin], this is the main project that contains the Lua library that you are exposing to your application. This is a dependency of `App.xcodeproj`, so it will get built automatically. You only need to open this project if you want to build a plugin separately.
	- `CoronaNative.xcconfig` &mdash; Configuration file containing common setup elements for CORONA_NATIVE_PRODUCT (paths&nbsp;to Corona and Lua header files, libraries, and linker&nbsp;options).
	- `CoronaApp.xcconfig` &mdash; Configuration file generated when building "Download&nbsp;Plugins" target. This configuration may include information necessary to use plugins specified in `build.settings`. It also includes `CoronaNative.xcconfig`.

</div>

<div class="guide-notebox">
<div class="notebox-title">Project Flow</div>

The following steps briefly outline the flow of the <nobr>`/Applications/Corona/Native/Project Template/App/`</nobr> project for iOS:

1. `ios/main.mm` &mdash; At launch time, `MyCoronaDelegate` is registered as the class implementing the [CoronaDelegate][native.ios.CoronaDelegate] interface. Corona will instantiate an instance of this class and assume the designated initializer is `init`.

2. `ios/AppCoronaDelegate.mm` &mdash; Right before `Corona/main.lua` is invoked, the [willLoadMain][native.ios.CoronaDelegate.willLoadMain] method is invoked. At this point, OpenGL is set up and all Corona frameworks are available.

3. `Corona/main.lua` &mdash; In the Lua code, `plugin.library` is loaded via `require()`. The Corona engine will then look for a corresponding C function called `luaopen_plugin_library` and invoke it. The name of this function is dynamic and is constructed using the original library name passed to `require()`. It takes that name and adds a prefix `luaopen_` to it, then replaces `.` with `_`.

4. `ios/Plugin/PluginLibrary.mm` &mdash; When `luaopen_plugin_library` is invoked, it calls `PluginLibrary::Open` which does all of the heavy lifting, for example creating the Lua library table, registering the Lua methods like `show()`, and then leaving the table at the top of the Lua stack.

</div>




<a id="development"></a>

## CORONA_NATIVE_PRODUCT Development

### Bridging Lua/C

To bridge Lua and C code, you'll use functionality made available by the [Lua C API](http://www.lua.org/manual/5.1/manual.html#3). This allows you to add libraries and functions in Lua that call directly into&nbsp;C.

Every function in the Lua C API takes the `lua_State` pointer `L` as its first argument. You can get access to the proper `lua_State` variable via an instance of the [CoronaRuntime][native.ios.CoronaRuntime].

In order to use the Lua C API successfully, you must understand the Lua stack. This stack is different from a function call stack; it is designed to ease the marshalling of data across the <nobr>Lua-C</nobr> bridge. See [here](http://www.lua.org/manual/5.1/manual.html#3) for more information.

### Native APIs

The following are specific to CORONA_NATIVE_PRODUCT for iOS:

<div class="inner-table">

Native API										Description
----------------------------------------------	------------------------------------------
[CoronaDelegate][native.ios.CoronaDelegate]		Your code __must__ implement this protocol if you wish to add your own functions at the Lua layer. You can also intercept `UIApplicationDelegate` events via your implementation of this protocol.
[CoronaRuntime][native.ios.CoronaRuntime]		Key objects including the Lua state used by the Corona engine are accessible via this protocol. The Corona engine gives you access to this via the [CoronaDelegate][native.ios.CoronaDelegate].
[CoronaLuaIOS.h][native.ios.CoronaLuaIOS]		Contains additional functions to help you bridge between Lua and native <nobr>Obj-C</nobr> code. This is meant to complement the set of <nobr>cross-platform</nobr> functions in [CoronaLua.h][native.C.CoronaLua].
[Corona C Functions][native.C]					This is a collection of C functions offered by the Corona engine which help you interact with Lua for <nobr>Corona-specific</nobr> patterns such as dispatching events.
----------------------------------------------	------------------------------------------

</div>

### Using Plugins

For instructions on how to obtain and include Corona plugins within a CORONA_NATIVE_PRODUCT project, please consult the [Using Plugins in CORONA_NATIVE_PRODUCT &mdash; iOS][native.ios.usingPlugins] guide.

<a id="orientation"></a>

### Setting Orientation

To restrict Corona to specific orientations when using CORONA_NATIVE_PRODUCT on iOS, you can use the `orientation` table in your project's `build.settings`. See [Project Build Settings][guide.distribution.buildSettings] for more details.

Alternatively, you can edit the `Info.plist` file (`App-Info.plist` in the template app) and add a `CoronaViewSupportedInterfaceOrientations` array with options similar to `UISupportedInterfaceOrientations`. For example, to enable all orientations:

``````xml
<key>CoronaViewSupportedInterfaceOrientations</key>
<array>
	<string>UIInterfaceOrientationLandscapeLeft</string>
	<string>UIInterfaceOrientationLandscapeRight</string>
	<string>UIInterfaceOrientationPortrait</string>
	<string>UIInterfaceOrientationPortraitUpsideDown</string>
</array>
``````

### Sending Events to Runtime

All events in Corona are Lua tables. To make sending events to the global [Runtime][api.type.Runtime] object, we've added a convenience utility function in [CoronaLua.h][native.C.CoronaLua] called [CoronaLuaRuntimeDispatchEvent()][native.C.CoronaLua.CoronaLuaRuntimeDispatchEvent].

In the following Lua code, we create a custom event of type `"delegate"`. In order for Corona to recognize the event as a Lua table, the `name` property of the Lua table must be set to the type of event:

``````lua
local event = { name="delegate" }
Runtime:dispatchEvent( event )
``````

We then translate this call into native code and send the event in the [didLoadMain][native.ios.CoronaDelegate.didLoadMain] method of [CoronaDelegate][native.ios.CoronaDelegate]:

``````c
@implementation MyCoronaDelegate

- (void)didLoadMain:(id<CoronaRuntime>)runtime
{
	lua_State *L = runtime.L;

	// DISPATCH CUSTOM EVENT
	// Create 'delegate' event
	const char kNameKey[] = "name";
	const char kValueKey[] = "delegate";
	lua_newtable( L );
	lua_pushstring( L, kValueKey );		// All events are Lua tables
	lua_setfield( L, -2, kNameKey );	// that have a 'name' property

	Corona::Lua::RuntimeDispatchEvent( L, -1 );
}

@end
``````

### Registering Custom Libraries

If you want to add your own library in Lua that wraps native C code, you should follow the standard Lua conventions as described in the [Native C][native.plugin#native-c] section of the [Plugins][native.plugin] guide.

### Custom Lua Error Handling

You can register a custom Lua error handler by calling [CoronaLuaSetErrorHandler()][native.C.CoronaLua.CoronaLuaSetErrorHandler]. Your handler will override Corona's internal default error handler and it will be called any time a Lua error occurs at runtime. 

``````c
static int MyTraceback( lua_State *L )
{
	lua_getfield(L, LUA_GLOBALSINDEX, "debug");
	if (!lua_istable(L, -1)) {
		lua_pop(L, 1);
		return 1;
	}
	lua_getfield(L, -1, "traceback");
	if (!lua_isfunction(L, -1)) {
		lua_pop(L, 2);
		return 1;
	}
	lua_pushvalue(L, 1);  // pass error message
	lua_pushinteger(L, 1);  // skip this function and traceback
	lua_call(L, 2, 1);  // call debug.traceback

	// Log result of calling debug.traceback()
	NSLog( @"[LUA ERROR]: %s", lua_tostring( L, -1 ) );

	return 1;
}

@implementation MyCoronaDelegate
- (void)willLoadMain:(id<CoronaRuntime>)runtime
{
	Corona::Lua::SetErrorHandler( MyTraceback );
}
@end
``````

### OpenGL Context Mismatch

Many third-party graphics libraries that use OpenGL will use their own OpenGL context. However, Corona performs its rendering on the main thread and does not expect the OpenGL context to change. Consequently, if you use certain graphics libraries, you may be inadvertently changing the OpenGL context which may cause issues with Corona rendering/updating properly.

To ensure your code is dealing with OpenGL properly, you should ensure that the OpenGL context changes are "balanced" as follows:

``````c
// 1. Save Corona context
EAGLContext *context = nil;
context = [EAGLContext currentContext];

// 2. Call third-party library

// 3. Restore Corona context
[EAGLContext setCurrentContext:context];
``````

For example, if the interface for the <nobr>third-party</nobr> library is shown via a modal view controller, you would perform steps 1 and 2 in the `presentViewController:animated:completion:` call and then perform step 3 in the `dismissViewControllerAnimated:completion:` call.




<a id="building"></a>

## Building for Devices

To build a CORONA_NATIVE_PRODUCT project from Xcode, please follow Apple's guidelines [here](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/LaunchingYourApponDevices/LaunchingYourApponDevices.html).
