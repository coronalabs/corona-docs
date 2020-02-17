# Creating Lua Plugins

This guide outlines how to create a Lua plugin and package it for submission to the [Corona Marketplace](https://marketplace.coronalabs.com/).

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you are new to the concept of plugins and how to create them, please see our [Plugins][native.plugin] guide.

</div>
</div>

<div class="guides-toc">

* [Overview](#overview)
* [Creating a Plugin](#create)
* [Modifying the Plugin](#modify)
* [Plugin Code](#plugin-code)
* [Plugin Submission](#submission)

</div>


<a id="overview"></a>

## Overview

In simple terms, a __Lua&nbsp;plugin__ is nothing more than a module or series of modules that provide the end user with a set of methods (functions) and properties (variables) that can be called to execute the code you're providing. However, instead of sharing the code publicly via GitHub, your own website, or similar, you can deploy your Lua modules in a binary form and effectively protect your Intellectual&nbsp;Property&nbsp;(IP).




<a id="create"></a>

## Creating a Plugin

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

As the foundation for this guide, please use our [project template](https://github.com/coronalabs/plugins-template-library-lua) which contains the basic required files. You can either download it as a `.zip` file and unzip it, or you can use the GitHub application and clone it to your system.

</div>
</div>

To create a new Lua plugin, we have provided helper scripts which perform the necessary file renaming and string replacements for both macOS and Windows:

<div class="docs-tip-outer" style="background-color: #a5aec9; width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-apple" style="font-size: 36px; margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

In the Terminal application (`~/Applications/Utilities/Terminal)`, run the `create_project.sh` script, first changing directory (`cd`) to the project template folder, then specifying the path to the __new__ project folder along with the plugin name in place of `PLUGIN_NAME`:

``````
cd /path/to/template/
./create_project.sh /path/to/new/project/ PLUGIN_NAME
``````

</div>
</div>

<div class="docs-tip-outer" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-windows" style="font-size: 31px; margin-left: 0px; margin-top: 2px;"></div>
</div>
<div class="docs-tip-inner-right">

From the Command Prompt, run the `create_project.bat` script, first changing directory (`cd`) to the project template folder, then specifying the path to the __new__ project folder along with the plugin name in place of `PLUGIN_NAME`:

``````
cd \path\to\template\
create_project.bat \path\to\new\project\ PLUGIN_NAME
``````

</div>
</div>

Assuming you successfully executed the script as outlined above, your new plugin folder should contain the following file and folder hierarchy:

<div class="tree">

* `bin/` &mdash; Core binaries required by the build process.
* `build.bat` &mdash; Script which compiles and packages the plugin for distribution using Windows.
* `build.sh` &mdash; Script which compiles and packages the plugin for distribution using a Mac.
* `lua/`&nbsp;
	- `build.settings`&nbsp;
	- `config.lua`&nbsp;
	- `main.lua`&nbsp;
	- `plugin/`&nbsp;
		- `PLUGIN_NAME/`&nbsp;
			- `defaults.lua` &mdash; Example helper file for `PLUGIN_NAME.lua`.
		- `PLUGIN_NAME.lua` &mdash; This is a sample library implementation which saves/loads a table using&nbsp;JSON.
* `metadata.json` &mdash; See [Modifying the Plugin](#modify) as follows.

</div>




<a id="modify"></a>

## Modifying the Plugin

There are some essential parts of the project folder that you must modify:

### metadata.json

First, edit the `metadata.json` file which contains information about your plugin. The base (unmodified) file looks like this:

``````
{
	"contact": "PUBLISHER_CONTACT@PUBLISHER_URL",
	"url": "http://PUBLISHER_URL",
	"pluginName": "plugin.myLuaPlugin",
	"publisherId": "REVERSE_PUBLISHER_URL"
}
``````

To customize your plugin, you'll need to edit the following aspects:

<div class="inner-table">

Key						Value
----------------------	----------------------------------------------------------------------
`"contact"`				In place of `PUBLISHER_CONTACT@PUBLISHER_URL`, specify your contact email address.
`"url"`					In place of `http://PUBLISHER_URL`, specify your website URL.
`"pluginName"`			In place of `plugin.myLuaPlugin`, indicate a suitable name for your plugin. This will be the name which Corona developers use to include the plugin within their project's `build.settings` and `require()` it within their project code.
`"publisherId"`			In place of `REVERSE_PUBLISHER_URL`, specify a publisher URL in <nobr>reverse-domain</nobr> format, for example `com.mydomain`.
----------------------	----------------------------------------------------------------------

</div>

### Test Files

Next, open up the `lua` folder. The three files `build.settings`, `config.lua`, and `main.lua` are your test harness files. In these files, you should provide the necessary code which behaves like a sample app and facilitates testing of the plugin code&nbsp;&mdash; in other words, these files will allow end users to "run" the plugin code outlined in the following section.




<a id="plugin-code"></a>

## Plugin Code

Inside the `lua` folder is another folder called `plugin`. This is where you should include the actual plugin code. As outlined in [Creating a Plugin](#create) above, there will be a Lua __file__ with the name of your plugin, for example `myLuaPlugin.lua`,

Essentially, your Lua plugin should be created using the [CoronaLibrary][api.type.CoronaLibrary] class. Here's how a plugin called `plugin.myLuaPlugin` might look:

``````lua
-- Create library
local Library = require( "CoronaLibrary" )
local lib = Library:new{ name = "plugin.myLuaPlugin", publisherId = "com.mydomain" }

-- Create a function for the library
lib.doSomething = function()
	print( "I did something!" )
end

-- Return "lib"
return lib
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

It's very important that you update the `Library:new{}` command using the same information that you used for the plugin `metadata.json` file, in this case both the `name` key and `publisherId` key:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
-- Create library
local Library = require( "CoronaLibrary" )
local lib = Library:new{ name = "plugin.myLuaPlugin", publisherId = "com.mydomain" }
``````

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The `lua/plugin` folder also contains an additional __folder__ named according to your plugin, for instance `myLuaPlugin`. This folder contains a file named `defaults.lua`, but this file isn't necessarily required&nbsp;&mdash; it's merely an example used by the project template. Essentially, this folder can contain various Lua files of your choosing, for instance "support" modules that are <nobr>`require()`-d</nobr> by the `myLuaPlugin.lua` file.

</div>
</div>




<a id="submission"></a>

## Plugin Submission

If you'd like to [submit a plugin](https://marketplace.coronalabs.com/product-submit) for availability in the [Corona Marketplace](https://marketplace.coronalabs.com/), there are a few more steps you must complete:

### Device Testing

Using the `main.lua` file in the `lua` folder, you should build a basic sample app which exhibits the plugin and its features in action. Within that `main.lua` file, load the plugin just like you would any other Lua module:

``````lua
local myLuaPlugin = require( "plugin.myLuaPlugin" )
``````

Because the plugin code is in the `plugin` folder, your plugin will be accessible in the same manner as native Corona plugins.

Finally, you should ensure that your code executes on both iOS and Android devices, since Lua plugins are intended to be <nobr>cross-platform</nobr> compatible. Verify that your plugin successfully compiles for devices and be aware of potential performance issues on <nobr>low-end</nobr> devices.

### Documentation / Sample

You should prepare clear and complete documentation for your plugin so that users understand exactly how to use it. You can host this documentation on your own website, on GitHub, etc. In addition, you should offer users a basic sample project to easily test your plugin. This project can be shared/distributed via whatever method is best for you.

### Plugin Packaging

Before submitting your plugin, you should __package__ it, following a specific structure. Corona&nbsp;Labs offers scripts which perform this process for you:

<div class="docs-tip-outer" style="background-color: #a5aec9; width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-apple" style="font-size: 36px; margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

In the Terminal application, run the `build.sh` script, first changing directory (`cd`) to the plugin's folder:

``````
cd /path/to/new/project/
./build.sh
``````

</div>
</div>

<div class="docs-tip-outer" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-windows" style="font-size: 31px; margin-left: 0px; margin-top: 2px;"></div>
</div>
<div class="docs-tip-inner-right">

From the Command Prompt, run the `build.bat` script, first changing directory (`cd`) to the plugin's folder:

``````
cd \path\to\new\project\
build.bat
``````

</div>
</div>

This process converts your code into bytecode and prepares it for submission to the [Corona Marketplace](https://marketplace.coronalabs.com/). When complete, you will see a <nobr>`plugin-PLUGIN_NAME.zip`</nobr> file in your project directory.

### Submission

Once your plugin is packaged and complete, with hosted documentation and at least one sample, you can [submit](https://marketplace.coronalabs.com/product-submit) it Corona&nbsp;Labs. We will then contact you and personally help you through the process of uploading the plugin to our distribution servers and offering it to Corona developers via the [Corona Marketplace](https://marketplace.coronalabs.com/).
