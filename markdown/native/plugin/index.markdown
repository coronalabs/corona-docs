# Plugins

Plugins allow you to extend the functionality of CORONA_CORE_PRODUCT. This guide outlines the fundamental details.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The old [Corona Marketplace](https://marketplace.coronalabs.com/) is closing and no longer accepts plugin submissions. If you've created a plugin and wish to submit it to the new [Solar2D Plugins Marketplace](https://www.solar2dplugins.com/), please see the [Asset Packaging Guidelines](https://www.solar2dplugins.com/asset-packaging-guidelines).

</div>
</div>

<div class="guides-toc">

* [Architecture](#architecture)
* [Using Plugins](#using)
* [Plugin Projects](#projects)
* [Coding Plugins](#coding)

</div>


<a id="architecture"></a>

## Architecture

CORONA_CORE_PRODUCT plugins leverage Lua's module system in which plugins are lazily loaded by a corresponding call to the Lua [require()][api.library.package.require] function.

Typically, these plugins are just shared native libraries which are supported on platforms like <nobr>macOS (`.dylib`)</nobr>, <nobr>Windows (`.dll`)</nobr>, and <nobr>Android (`.so`)</nobr>.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

* On iOS, shared libraries are not supported, so plugins must be static libraries (`.a`). 
* On Android, it's often convenient to create pure Java plugins (`.jar`).

In these two cases, CORONA_CORE_PRODUCT adds special loaders which ensure that these plugins can be easily loaded, assuming certain conventions are followed.

</div>




<a id="using"></a>

## Using Plugins

### CORONA_CORE_PRODUCT

Plugins for CORONA_CORE_PRODUCT are hosted in a number of places. Many are available at [Free Plugins Directory](PLUGINS_DIR), [Solar2D Marketplace](https://solar2dmarketplace.com/), and [Solar2D Plugins Marketplace](https://www.solar2dplugins.com/). You can incorporate a plugin by adding an entry to the `plugins` table of `build.settings`, for&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.myPlugin"] =
		{
			publisherId = "com.domainname"
		},
	},
}
``````

Each plugin host will provide specific build.settings for the individual plugin.

When added in this manner, CORONA_CORE_PRODUCT will integrate the plugin during the build phase.

From there, the plugin can be loaded using the standard Lua [require()][api.library.package.require] function, for instance:

``````lua
local myPlugin = require( "plugin.myPlugin" )
``````

### CORONA_NATIVE_PRODUCT

Native plugins can easily be added to your iOS or Android project.

On iOS, plugins will be in the form of static library (`.a`) files that need to be linked into your app executable. 

On Android, plugins can come in the form of `.so` (shared&nbsp;library) or `.jar` files.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

When you add a plugin via CORONA_NATIVE_PRODUCT, be aware of the following:

* __Resources__ &mdash; If the plugin comes with resources, you should ensure those resources are available.
* __Dependencies__ &mdash; If the plugin depends on linking to system frameworks or libraries, ensure the appropriate linker flags are set.

</div>




<a id="projects"></a>

## Plugin Projects

If you want to [create/submit][native.plugin.submission] a plugin for availability in the [Solar2D Plugins Marketplace](https://www.solar2dplugins.com/), you can use our `App` project templates to simplify development of your plugin, as well as test it. After&nbsp;all, a plugin itself is not an executable and it must be run inside an actual application. The project templates can be located within the CORONA_NATIVE_PRODUCT folder:

<nobr>`/Applications/Corona/Native/Project Template/App/`</nobr>

This folder has separate <nobr>platform-specific</nobr> subfolders for each target platform:

* `ios`
* `android`

There's also a `Corona` folder that sits alongside these folders which contains a classic Corona project (`main.lua`). You can modify these files to test the Lua&nbsp;APIs that are offered by your plugin.

### iOS

In the `ios` folder, there are two Xcode projects:

1. `App.xcodeproj` &mdash; This is the project that builds the `.app` executable which runs on the device. It automatically builds the plugin as an implicit dependency.

2. `Plugin.xcodeproj` &mdash; For plugin development, you should modify this project. It builds the plugin as a static library (`.a`) and you can use this project directly if you want to share your plugin outside of the `App` project.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Most often, you will want to create a __universal&nbsp;binary__ for your plugin. In other words, you'd like to ship one static library that supports both the device and the <nobr>Xcode iOS Simulator</nobr>.

You can accomplish this via the `lipo` tool. In the following example, we are creating a universal library for `staticlibrary.a`:

``````
lipo -create "/path/to/iphoneos/staticlibrary.a" "/path/to/iphoneos-simulator/staticlibrary.a" -output "/path/to/dst/staticlibrary.a"
``````

</div>

### Android

In the `android` folder, the contents include:

1. `app` &mdash; This module builds the `.apk` that installs on the device. The `app` module automatically builds the plugin as an explicit dependency per this entry in the `dependencies` block of the `build.gradle` script for the `app` module (`compile project(':plugin')`).

2. `plugin` &mdash; This module builds the plugin as a `.jar` file, only including the Java files under `plugin/src/main/java` in your project. You can use this project directly if you want to share your plugin outside of the `App` project.




<a id="coding"></a>

## Coding Plugins

Plugins build upon Lua's module system, so they can come in three different flavors:

1. Pure Lua code
2. Native code
3. Hybrid of Lua and native code

### Pure Lua

A Lua library plugin can be created using the [CoronaLibrary][api.type.CoronaLibrary] class. Please see the [Creating Lua Plugins][native.plugin.luaplugin] guide for details on how to create, package, and submit a Lua plugin to the available marketplaces.

### Native C

In addition to the plugin naming conventions discussed above, CORONA_CORE_PRODUCT expects plugins to follow some additional conventions that ensure Lua can locate these modules. In&nbsp;C, these conventions are just the standard Lua naming conventions for modules:

* The name of the module function must be prefixed by `luaopen_`. 
* The signature of this function should match [lua_CFunction](http://www.lua.org/manual/5.1/manual.html#lua_CFunction).
* If a module contains a dot (`.`), it is replaced by an underscore (`_`) in the name of the function, since C does not allow dots in symbol names.
* This function should be publicly visible.

For example, the Lua library `plugin.myLibrary` would have a Lua function called `luaopen_plugin_myLibrary`:

``````c
static int doSomething( lua_State *L )
{
	lua_getglobal( L, "print" );
	lua_pushstring( "I did something!" );
	CoronaLuaDoCall( L, 1, 0 );
	return 0;
}

// Export so it's visible to "require()"
CORONA_EXPORT
int luaopen_plugin_myLibrary( lua_State *L )
{
	static const luaL_Reg kFunctions[] =
	{
		{ "doSomething", doSomething },

		{ NULL, NULL }
	};

	// Create "myLibrary"
	// Lua version assumes version and revision default to 1
	int result = CoronaLibraryNew(
		L, "myLibrary", "com.mycompany", 1, 1, kFunctions, NULL );

	return result;
}
``````

### Native Java

If you write the module in Java, Corona has set up Lua to load Java code and to let that Java code define the Lua library via [JNLua](http://code.google.com/p/jnlua/). Here, Lua looks for the Java class `LuaLoader` and instantiates it.

CORONA_CORE_PRODUCT assumes the following conventions:

* The `LuaLoader` class has a default (empty) constructor.
* The `LuaLoader` class must implement the JNLua interface `com.naef.jnlua.JavaFunction`. 
* The namespace of `LuaLoader` should be the same as the name passed to `require()`.

For example, the Lua library `plugin.myLibrary` would be implemented by the <nobr>(fully-qualified)</nobr> class `plugin.myLibrary.LuaLoader` and that class would implement the `invoke()` method of the `com.naef.jnlua.JavaFunction` interface.

### Lua + Native

You can also create plugins in a hybrid fashion. For example, you can create the library via Lua code and then do further initialization in C. 

Below is an example for creating the `myLibrary` library from Lua and then adding additional functions on the native C side. Here, we assume `kBuffer` stores the Lua bytecodes corresponding to `myLibrary.lua`.

``````c
// The bytecodes for "myLibrary.lua" are contained in kBuffer
static const unsigned char kBuffer[] = { ... }

static int bufferLoader( lua_State *L )
{
	return luaL_loadbuffer( L, (const char*)kBuffer, sizeof( kBuffer ), "myLibrary" );
}

static int somethingElse( lua_State *L )
{
	printf( "I'm doing something else!" );
	return 0;
}

CORONA_EXPORT
int luaopen_myLibrary( lua_State *L )
{
	lua_CFunction factory = Corona::Lua::Open< bufferLoader >;
	int result = CoronaLibraryNewWithFactory( L, factory, NULL, NULL );

	if ( result )
	{
		const luaL_Reg kFunctions[] =
		{
			{ "somethingElse", somethingElse },

			{ NULL, NULL }
		};

		luaL_register( L, NULL, kFunctions );
	}

	return result;
}
``````
