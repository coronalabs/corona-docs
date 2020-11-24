# Self-Hosted Plugins

## Overview

CORONA_NATIVE_PRODUCT users can enable plugins hosted on third-party servers. This allows you to use third party plugins as well as creating plugins for internal use and leveraging Solar2D's rapid build process with native code that you've written.


## Packaging and Hosting

Plugins must be packaged for each platform __separately__ as a `.tgz` file and hosted on a web server.

### Package as Archives

Follow the [Plugins][native.plugin] guide to build your plugin. Remember that for each support platform, a separate archive has to be packaged.

#### iOS

Building the plugin-in to be hosted on a web server, a few simple extra steps are required:

1. Create a directory for packaging, for instance `package-plugin`. Create a folder named `iphone` within `package-plugin`.

2. Place your iOS library (`.a`) file of your plugin into that directory.

3. Any additional resources that the plugin requires are placed into a new directory named `resources`. For instance, `*.nib` files for views. If your plugin depends on other frameworks, place all the compiled frameworks underneath a directory called `Frameworks`.

4. Place the `metadata.lua` file also in the directory `package-plugin`

5. Use a simple packaging script to call the zip/tar program. On Mac you could use the following lines, for instance, placed into a shell script `deploy.sh`:

``````lua
#!/bin/bash
tar -czf iphone.tgz libplugin_YOUR-PLUGIN.a metadata.lua resources
scp ../iphone.tgz "youruser@www.your-web-server-where-plugin-will-be-hostd.de:/var/www/YOUR_DOMAIN/plugins"
``````

Finally, for those who will use your Self-Hosted-Plugin, they have to add the location (`www.YOUR_DOMAIN.de/plugins/android.tgz`) into their `build.settings` so that the build proccess for Corona-Apps can find the plugin (see also below).


#### Android

Building the plugin-in to be published on a web server, a few simple extra steps are required:

1. Create a directory for packaging, for instance `package-plugin`. Create a folder named `android` within `package-plugin`.

2. Create a new gradle file, called `corona.gradle` and copy all your dependencies and repository definitions from your plugin's `build.gradle` also into that file.

3. Place the `metadata.lua` file also in the directory `package-plugin`

4. Use a simple packaging script to copy the build result into this directory and to call the zip/tar program. On Mac you could use the following lines, for instance, placed into a shell script `deploy.sh`:

``````lua
#!/bin/bash
cp ../../build/outputs/aar/plugin-release.aar .
COPYFILE_DISABLE=true tar -czf ../"$(basename "$(pwd)").tgz" --exclude='.[^/]*'  ./*
scp ../android.tgz "youruser@www.your-web-server-where-plugin-will-be-hostd.de:/var/www/YOUR_DOMAIN/plugins"
``````

Finally, for those who will use your Self-Hosted-Plugin, they have to add the location (`www.YOUR_DOMAIN.de/plugins/android.tgz`) into their `build.settings` so that the build proccess for Corona-Apps can find the plugin (see also below).

#### Lua
The plugin needs to be stored in a flat (no&nbsp;directories) `.tgz` format. For example, from inside your plugin build folder, run:

	tar -czf myplugin.tgz myplugin.lua metadata.lua

### Web Server Requirements

Upload the resulting `.tgz` file to a web server that is accessible from the Internet. If necessary, `https://` and basic authentication are supported for security and access control.


## Solar2D Simulator and Builds

### Running Plugins in the Simulator

Solar2D Simulator only accesses hosted plugins for device builds. When it comes to running these plugins in the Simulator, you must install these plugins locally by placing the plugin file in the following directory:

	~/Library/Application Support/Corona/Simulator/Plugins/

This file should match the name used as the key in the `plugins` table, for example `"plugin.hostedplugin"` in the `build.settings` example below.


### Device Builds/Settings

In order to use hosted plugins with your Solar2D project, the following changes to `build.settings` must be made:

1. For each __device__ platform, you must tell Solar2D the URL from which to fetch the plugin `.tgz` file.

    In the `supportedPlatforms` table for the plugin, each platform property key's value should contain the URL pointing to the `.tgz` plugin file.

2. For each __Simulator__ platform, you must tell Solar2D __not__ to attempt download of a `.tgz` file.

    In the `supportedPlatforms` table for the plugin, the `macos` and `win32` key values should be `false`.

    If you wish to use the plugin in the Solar2D Simulator, you must install the plugin locally as noted above.

Here is an example of including a hosted plugin within `build.settings`:

``````lua
settings =
{
	plugins =
	{
		["plugin.hostedplugin"] =
		{
			publisherId = "com.company",
			supportedPlatforms = { 
				iphone = { url="https://test:abc123@example.com/plugin/iphone.tgz" },
				android = { url="https://test:abc123@example.com/plugin/android.tgz" },
				macos = false,
				win32 = false
			},
		},
	},
}
``````


<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* The maximum __compressed__ size for the `.tgz` file is 25&nbsp;MB. The maximum __uncompressed__ size for the `.tgz` file is 50&nbsp;MB.

* Solar2D Simulator will throw an error on launch/relaunch saying that the plugin couldn't be downloaded. This message is safe to ignore.

</div>
