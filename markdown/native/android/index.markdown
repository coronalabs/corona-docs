
# CORONA_NATIVE_PRODUCT &mdash; Android

The following resources go further in depth on using CORONA_NATIVE_PRODUCT for Android.

<div class="guides-toc">

* [CORONA_NATIVE_PRODUCT Setup](#setup)
* [Project Templates](#templates)
* [CORONA_NATIVE_PRODUCT Development](#development)
* [Building for Devices](#building)
* [Building for Self-Hosted-Plugins](#self-hosted)

</div>


<a id="setup"></a>



## CORONA_NATIVE_PRODUCT Setup

Download and install [Android Studio](https://developer.android.com/studio), the official IDE for Android development.

### For macOS

Within the `/Applications/Corona/Native/` folder, double click __Setup&nbsp;Corona&nbsp;Native__. This will create the symbolic link required for the project templates.


<a id="templates"></a>

## Project Templates

New projects can easily be created by using template files as a starting point. Project template can be found:

* macOS: <nobr>`/Applications/Corona/Native/Project Template/`</nobr>
* Windows: <nobr>`Native\Project Template`</nobr> from Corona installation location. Shortcut to open this directory can be found in Start menu

To start a new project, copy the `App` folder to desired location and rename it. Start Android Studio, click "Open an existing Android Studio Project", and select `android` directory from copied `App` template.

<div class="guide-notebox">
Note, that opening <nobr>`App/android`</nobr> from original template location with Android Studio is error prone: install location is often in system protected folder. Copy it to folder with write access.
</div>

Inside your copy of the `App` folder, the following files/directories are of primary concern:

<div class="tree">

* `Corona` &mdash; This folder represents a classic Corona project, containing files like `main.lua`, app&nbsp;icons, etc. By default, <nobr>`build.gradle (Module: App)`</nobr> is set up to assume that these files reside inside this exact folder (`Corona`).
* `android` &mdash; Contains all of the <nobr>Android-specific</nobr> code, projects, etc.
	- `app` &nbsp;
		- `build.gradle` &mdash; This is the main build script and it's also where you set up some application settings like version and what SDK versions to use.
		- `libs/` &mdash; This is where <nobr>third-party</nobr> (Corona) `.jar` plugins that your __app__ relies upon should go.
		- `src` &nbsp;
			- `main` &nbsp;
				- `AndroidManifest.xml` &mdash; This is where you configure application settings such as name, permissions, etc.
				- `java/` &mdash; This is where the Java source files for your __app__ should go. Because the package is `com.mycompany.app`, this is where the files are located by default. You should modify this according to the package name you specify.
				- `jniLibs/` &mdash; This is where <nobr>third-party</nobr> (Corona) `.so` plugins that your __app__ relies upon should go.
	- `plugin` &mdash; This is the main folder when developing plugins for SOlar2D. All your code goes here. For [plugins][native.plugin], there are additional files and directories of interest:
		- `build.gradle` &mdash; This is the build script that creates the plugin. The output is usually a `.jar` file. The only files included in the `.jar` are those located in `plugin/src/main/`, whether they are code or resources. In case you have additional resources to be added to the plugin (e.g., UI) that reside usually in the `res` directory (see below), an `aar` file will be generated (How to handle `aar` files please see [Building for Self Hosted Plugins](#self-hosted)).
		- `libs` &mdash; This is where <nobr>third-party</nobr> (Corona) `.jar` plugins that your __plugin__ relies upon should go.
		- `src` &nbsp;
			- `main` &nbsp;
				- `AndroidManifest.xml` &mdash; This is where you set up the plugin's package name.
				- `java` &nbsp;
					- `plugin` &nbsp;
						- `library` &nbsp;
							- `LuaLoader.java` &mdash; This is the code for the Lua library `plugin.library` on the Android side.
				- `jniLibs/` &mdash; This is where <nobr>third-party</nobr> (Corona) `.so` plugins that your __plugin__ relies upon should go.
				- `res/` &mdash; This is where your Android resources will be located (i.e., color, style, texts, and so forth). If there will be such resources remember to appy the plugin `'com.android.library'` instead of `'com.android.appication'` in your build.gradle.

</div>

<div class="guide-notebox">
<div class="notebox-title">Project Flow</div>

The following steps briefly outline the flow of the <nobr>`/Applications/Corona/Native/Project Template/App/`</nobr> project for Android:

1. `android/app/src/main/java/com/mycompany/app/CoronaApplication.java` &mdash; At launch time, `CoronaApplication.java` is instantiated. It adds a private class to be notified of various <nobr>app-level</nobr> events like app suspend and resume. Right before `main.lua` is invoked, the `onCreate()` method is invoked. At this point, OpenGL is set up and all Corona frameworks are available.

2. `Corona/main.lua` &mdash; In the Lua code, `plugin.library` is loaded via `require()`. The Corona engine will then look for a corresponding Java class called `plugin.library.LuaLoader` and invoke it. The name of this class is dynamic and is constructed using the original library name passed to `require()` as the package name for a `LuaLoader` class. The `LuaLoader` class is expected to implement the JNLua interface `com.naef.jnlua.JavaFunction`.

3. `android/plugin/src/main/java/plugin/library/LuaLoader.java` &mdash; When the <nobr>fully-qualified</nobr> class path for `LuaLoader` is resolved, the class is instantiated with the default constructor. The `invoke()` method is then called by Lua via JNLua and does all the heavy lifting, for example creating the Lua library table, registering the Lua methods like `show()`, and then leaving the table at the top of the Lua stack.

<div class="code-indent">

Note that the `LuaLoader` class is instantiated __once__ for the lifetime of the process, much like a `.dll` or `.so` file is typically loaded once for the lifetime of the process. Also note that the `invoke()` method is called once for each Lua state that does a `require()`&nbsp;&mdash; this corresponds to being called once each time the `CoronaActivity` is instantiated.

</div>
</div>




<a id="development"></a>

## CORONA_NATIVE_PRODUCT Development

### Bridging Lua/Java

To bridge Lua and Java code, you'll use functionality made available by [JNLua](https://code.google.com/archive/p/jnlua/). This allows you to add libraries and functions in Lua that call directly into Java.

### Native APIs

The native APIs for Android are available as a [JavaDoc](html/overview-summary.html).

### Using ProGuard

Just remember to keep ProGuard from obfuscating your `plugin.your-plugin-name.LuaLoader` class by adding the line:

``````
-keep public class plugin.your-plugin-name.LuaLoader { public *;}
``````

to your `proguard-rules.pro` file within the plugin module.

### Using Common Android Libraries

If you're [developing a plugin][native.plugin] that depends on the [Android Support Libraries](https://developer.android.com/topic/libraries/support-library/index.html) or [Google Play Services](https://developers.google.com/android/guides/overview), please read our [Android Dependency Integration][native.android.dependencies] guide.

### Runtime Permission Support

For information on working with Android Runtime Permissions in __Android&nbsp;6.0__ or newer, please read our [Android Runtime Permission Support][native.android.permissionSupport] guide.




<a id="building"></a>

## Building for Devices

To build a CORONA_NATIVE_PRODUCT project from Android&nbsp;Studio, simply use the __Run__ button on the top bar of icons. This will build your project, sign it, and prompt you to select a deployment target. The built `.apk` is signed with either a keystore you've specified in the <nobr>`android` &rarr; `signingConfigs`</nobr> block of the `android/app/build.gradle` script, or the default `debug.keystore` if none is provided.

Android Studio has several other <nobr>build-related</nobr> options that you can read about [here](https://developer.android.com/studio/run).

<a id="self-hosted"></a>

## Building for Self Hosted Plugins

Building the plugin-in to be published on a web server (since the plugin is not yet intended to be shared with the community), a few simple extra steps are required:

1. Create a directory for packaging, for instance `package-plugin`. Create a folder named `android` within `package-plugin`.

2. Create a new gradle file, called `corona.gradle` and copy all your dependencies and repository definitions from your plugin's `build.gradle` also into that file.

3. Place the `metadata.lua` file also in the directory `package-plugin`

4. Use a simple packaging script to copy the build result into this directory and to call the zip/tar program. On Mac you could use the following lines, for instance, placed into a shell script `deploy.sh`:

``````
#!/bin/bash
cp ../../build/outputs/aar/plugin-release.aar .
COPYFILE_DISABLE=true tar -czf ../"$(basename "$(pwd)").tgz" --exclude='.[^/]*'  ./*
scp ../android.tgz "youruser@www.your-web-server-where-plugin-will-be-hostd.de:/var/www/YOUR_DOMAIN/plugins"
``````

Finally, for those who will use your Self-Hosted-Plugin, they have to add the location (`www.YOUR_DOMAIN.de/plugins/android.tgz`) into their `build.settings` so that the build proccess for Corona-Apps can find the plugin.