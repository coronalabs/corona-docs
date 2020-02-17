# Using JavaScript in HTML5 Builds

This guide explains how to interact between JavaScript and Lua code when running HTML5 build.

<div class="guide-notebox">
<div class="notebox-title">Note</div>
HTML5 builds are still in beta. Things in this guide may be subject for changes.
</div>

<div class="guides-toc">

* [JavaScript Module Loader](#loader)
* [Making a dummy wrapper for Simulator](#wrapper)
* [Bridging between Lua and JavaScript](#luaJs)
* [Passing functions to JavaScript](#funcToJs)
  * [Assigning Lua function to a property](#funcToJsProp)
  * [Passing Lua functions as parameters](#funcToJsParam)
* [Plugin example](#example)
* [Packaging HTML5 plugins](#packaging)
* [Support](#support)


</div>

HTML5 provides extremely rich access to a variety of APIs, both built-in and third party integrations. It would be impossible to create bindings for all of them in Lua. This is why Corona provides an extremely easy way to bridge between Lua and JavaScript code.

<a id="plugin"></a>

## JavaScript Module Loader
When trying to `require` a module from Lua, one can make use of the JavaScript Module Loader included into HTML5 builds. It looks for file in root of the project with `.js` extension.

For example:
```lua
local demo_plugin = require "demo_plugin"
```
would also look for `demo_plugin.js` to load as a module when running in a web browser. Note that Simulator can not execute JavaScript plugins.

In order for the module to get loaded, the file must define a global object with same name as the module name, `demo_plugin` in this case. Here's sample contents of `demo_plugin.js`:

```js
demo_plugin = {
    init: function() { 
	    console.log( "Init was called" );
	}
}
```
You can execute additional JS code in body of the file, but it is recommended to move all initialization into functions, like `init`.

Note, that if file contains syntactical errors it would produce runtime errors during runtime in the HTML5 build. If you see `ERROR: module "demo_plugin" not found` error popup, check the JavaScript Console from browser's developer tools. If it has warning like `Module file is loaded, but object 'demo_plugin' is not found!` it means that module contained syntax errors, so it failed to create global module object.

<a id="wrapper"></a>

### Making a dummy wrapper for Simulator
It can be bothersome to develop plugins that are getting errors all the time since JS code doesn't work in simulator. For that purpose we recommend making a Lua wrapper. It should check if JavaScript can be executed, and do so if possible.

For that you would create two files:
`demo_plugin.lua`:
```lua
if system.getInfo("platform") == 'html5' then
    return require "demo_plugin_js"
else
    local lib = {}
    setmetatable( lib, {__index = function( t, k )
        return function() 
            print( "WARNING: Placeholder is called for " .. k )
        end
    end} )
    return lib
end
```
This simple Lua wrapper would return a dummy function for all requests, unless it is running on `html5` platform. In that case, it would return real plugin contained in `demo_plugin_js.js` file:
```js
demo_plugin_js = {
    init: function() { 
	    console.log( "Init was called" );
	}
}
```
Note that module's object has to be renamed to `demo_plugin_js` as well.

<a id="luaJs"></a>

## Bridging between Lua and JavaScript

We tried to make bridging between Lua and JavaScript as seamless as possible. Our bridge works only in one direction: you can call methods or access properties of you JS module object from Lua.

To demonstrate that, lets add some properties to our `demo_plugin_js.js`:
```js
demo_plugin_js = {
    init: function() { 
	    console.log( "Init was called" );
	},
	someInt: 42,
	someString: "Hello World!",
	log: function( p ) {
		console.log( "Log called", p, this.someInt, this.someString );
	}
}
```
And here how we can access them from `main.lua`:
```lua
local demo = require "demo_plugin"
demo.init()
print( "Values:", demo.someInt, demo.someString )
demo.someInt = -1
demo.someString = "Hi!"
demo.log( 42 )
```
Now build this for HTML5. Make sure to open [/index-debug.html](http://127.0.0.1:20605/index-debug.html) to see output from Lua's `print` instructions. It is hidden in default index file.
You should see that everything works as expected. Methods are getting called, printed values are displayed and assigned properties work as well. Values passed as parameters, assigned to properties or returned by methods are copied and go through simple type transformation to be passed between JS & Lua environments. If types cannot be copied or transparently converted, they are omitted.

<a id="funcToJs"></a>

### Passing functions to JavaScript
We have already seen that it is very straightforward to call JavaScript functions from Lua. But it is often required to do the reverse - invoke a callback to Lua when some JavaScript async operations is finished. This is tricky, since JavaScript doesn't provide any mechanisms to interact with its garbage collector. Simpler, value types like strings, numbers or event tables can be copied between Lua and JavaScript, so memory leaks are not a problem because copies are handled separately on each side. Functions on other hand, must maintain connection to their environment in order to perform expected tasks.
Nevertheless, Corona provides two ways that allow Lua functions can be passed to Javascript:

<a id="funcToJsProp"></a>

#### 1. Assigning Lua function to a property
in `main.lua`:
```lua
local function callbackFunction( message )
    print( message )
end
local demo = require "demo_plugin"
demo.callback = callbackFunction
demo.execute()
```

In `demo_plugin_js.js`:
```js
demo_plugin_js = {
    execute: function() { 
	    this.callback( "Hello World" );
	}
}
```
This works as expected and prints "Hello World" to the [index-debug.html](http://127.0.0.1:20605/index-debug.html) console. 
If `demo.callback` is assigned from Lua, the JS Module Loader would take care of memory management. If you want to assign something to `this.callback` from JavaScript, make sure to _release_ it before hence. More on this in next section.

<a id="funcToJsParam"></a>

#### 2. Passing Lua functions as parameters
The previous method, while simple, is not very elegant or idiomatic from Lua point of view. In Lua we usually pass functions around as parameters. This causes problems in interface bridges to other languages, since we have to "hold on" to passed functions. When the Lua C API is used, we manually have to tell the garbage collector that particular function is being used and shouldn't be collected as garbage.

A similar approach is implemented in JS Module Loader. When functions are passed from Lua to JavaScript it is transformed to a _reference_ and you have a choice to "hold on" to it and create a callable JavaScript function. When it is not needed anymore, you should release it to prevent memory leaks. 

Here is all APIs to work with functions passed to JavaScript:

* `LuaIsFunction` returns `boolean`. `true` if the passed value represents a valid Lua function _reference_.
* `LuaCreateFunction` transforms a Lua function _reference_ to a callable JavaScript function and returns it.
* `LuaReleaseFunciton` releases a _reference_ to an underlying Lua function. Calling released functions would result in a no-op (do nothing).

Modus operandi is supposed to be as follows: receive a Lua function _reference_ as a parameter. Create a JavaScript function wrapper from this _reference_. Call the wrapper function, and release when it is no longer needed.

Let's demonstrate how it works with an example:
`main.lua`:
```lua
local function callbackFunction( message )
    print( message )
end
local demo = require "demo_plugin"
demo.execute( callbackFunction )
```

`demo_plugin_js.js`:
```js
demo_plugin_js = {
    execute: function( callbackReference ) {
	    if( LuaIsFunction( callbackReference ) ) {
		    var f = LuaCreateFunction( callbackReference );
		    f( "Hello World" );
		    LuaReleaseFunction( f );
		}
	}
}
```

This approach can be used with async calls as well. In this case make sure to use `LuaCreateFunction` right after receiving parameters. All function references are released right after exiting method they was passed to:

`demo_plugin_js.js`:
```js
demo_plugin_js = {
    execute: function( callbackReference ) {
        if( LuaIsFunction( callbackReference ) ) {
            var f = LuaCreateFunction( callbackReference );
            setTimeout( function() {
                f( "Hello World" );
                LuaReleaseFunction( f );
            }, 1000 )
        }
    }
}
```

<a id="example"></a>

## Plugin example

To see example of real-world plugin check out our VK Direct Games plugin available on [bitbucket](https://bitbucket.org/coronalabs/store-hosted-vk-direct/src/default/plugins/2018.3275/web/plugin_vk_direct_js.js). Lets review some notable parts.

#### `init()`
Function `init()` is most interesting. It has 2 parts. First - it remembers callback to dispatch events to:
```js
		LuaReleaseFunction( this.callback );
		if ( LuaIsFunction( callback ) ) {
			this.callback = LuaCreateFunction( callback );
		} else {
			this.callback = function(){};
		}
```
The first line releases an existing callback if there is one. Then it creates new callback from reference and assigns it to a `callback` property. If the new callback is not set, we just use empty function as a callback to prevent runtime errors and excessive checks.

Second part:
```js
		if ( this.init_internal ) {
			this.init_internal();
			this.init_internal = null;
		}
```
It calls the method `init_internal` then sets it to `null` so it won't be called again. This is simple way to make sure `init_internal` is called only once.

#### `init_internal()`
VK Direct Games is a third party integration. We have to use an external JavaScript library to use it. The library loaded and initialized in `init_internal()` method. Lets take a look:
```js
	init_internal: function()
	{
		var script = document.createElement('script');
		script.setAttribute('src', 'https://vk.com/js/api/mobile_sdk.js');
		script.setAttribute('type', 'text/javascript');
		script.setAttribute('charset', 'utf-8');

		script.onerror = function()
		{
			// ...
		};

		script.onload = function()
		{
			// ... initOK = ... initFail = ...
			VK.init(initOK, initFail, '5.60');
		};
		document.head.appendChild(script);
	}
```

In this code, we programmatically create a `<script/>` element and attach it to our HTML page. We also set `onerror` and `onload` handlers where we dispatch messages. Also, we call `VK.init` when the script is loaded to initialize VK APIs. Check out original code for more details.

<a id="packaging"></a>

## Packaging HTML5 plugins
Follow the existing [plugin submission guide](https://docs.coronalabs.com/native/plugin/submission.html). To add HTML5 JS plugins, put your JS & Lua files alongside with the `metadata.lua` to `web` folder next to other platforms plugins.

Sample `metadata.lua`:
```lua
local metadata = {
	plugin =
	{
		format = 'js',
	},
}
return metadata
```

Use [VK Direct Games plugin](https://bitbucket.org/coronalabs/store-hosted-vk-direct/src/default/plugins/2018.3275/web/plugin_vk_direct_js.js) as an example.

<a id="support"></a>

## Support

If you have any questions or ideas, feel free to join community discussions on our [HTML5 forum](https://forums.coronalabs.com/forum/637-html5/) or #html5 channel on [Slack](https://coronalabs.com/slack).
