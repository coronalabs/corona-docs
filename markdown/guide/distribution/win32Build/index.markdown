# Creating Win32 Desktop Apps

This guide outlines how to configure and build a Win32 desktop app via the Corona Simulator. A <nobr>Corona-built</nobr> Win32 desktop app consists of a `.exe` file, a collection of `.dll` files, and your Corona project's asset files. It is compiled for <nobr>32-­bit</nobr> which can run on both <nobr>32­-bit</nobr> and <nobr>64­-bit</nobr> Windows desktop operating systems.

<div class="guides-toc">

* [System Requirements](#systemreqs)
* [Win32 Platform Settings](#win32settings)
* [Window Settings](#windowsettings)
* [Excluding Files](#excludingfiles)
* [App Icon](#appicon)
* [Building / Running](#building)
* [Debugging](#debugapp)
* [App Signing](#signing)

</div>


<a id="systemreqs"></a>

## System Requirements

* Windows 7, Windows 8, or Windows 10 (<nobr>32-­bit</nobr> or <nobr>64-­bit</nobr>)
* Video driver supporting OpenGL 2.1 or higher

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* All features supported by the Corona Simulator for Windows are supported for Win32 desktop builds. However, the Corona&nbsp;Simulator for Windows does not support most native UI features that the macOS version does.

* Just like mobile device builds, Win32 desktop builds support an `orientation` table within the project's `build.settings` file. If defined, the width and height defined in the `config.lua` file \([guide][guide.basics.configSettings]\) will be relative to __portrait__ orientation, just like iOS and Android. This means that for a <nobr>landscape-oriented</nobr> app, `width` is the height of the window and `height` is the width of the window, making your project settings portable to both desktop and mobile devices.

</div>




<a id="win32settings"></a>

## Win32 Platform Settings

Corona's `build.settings` file supports the following Win32 <nobr>platform-specific</nobr> settings via the `win32` table:

``````lua
settings =
{
	win32 =
	{
		-- Settings for Win32 apps go here
	}
}
``````

##### preferenceStorage

Indicates where the app's custom preferences should be stored when accessed via the [system.getPreference()][api.library.system.getPreference], [system.setPreferences()][api.library.system.setPreferences], and [system.deletePreferences()][api.library.system.deletePreferences] functions using the `"app"` category.

``````lua
settings =
{
	win32 =
	{
		preferenceStorage = "registry",
	}
}
``````

This key can be set to one of the following:

* `"sqlite"` &mdash; This is the default setting and the most portable option. Preferences are stored to a `CoronaPreferences.sqlite` database file under the Windows user's hidden <nobr>`.\AppData\Local\<CompanyName>\<AppName>\.system`</nobr> directory.
* `"registry"` &mdash; Stores the app's preferences to the Windows registry under <nobr>`HKEY_CURRENT_USER\Software\<CompanyName>\<AppName>`</nobr>. This feature has portability issues, for example preference names are not <nobr>case-sensitive</nobr> when stored to the registry. Also, forward slashes (`/`) and backslashes (`\`) in a preference name will be regarded as registry key path separators and will be treated as the same characters.

##### singleInstance

Set this to `true` (the default setting) to allow only one instance of a Win32 desktop application to exist at a time. This means that attempting to launch a second instance will bring the first instance's window to the front of the desktop instead. If the second instance was given any command line arguments, those arguments are delivered to the first instance via an `"applicationOpen"` typed [system][api.event.system] event. Set this setting to `false` to support multiple application instances at the same time.

``````lua
settings =
{
	win32 =
	{
		singleInstance = false,
	}
}
``````


<a id="windowsettings"></a>

## Window Settings

For both Win32 desktop apps and macOS desktop apps, Corona's `build.settings` file supports a `window` table for customizing the app's desktop window, including the default width/height, the title of the window, and more.

``````lua
settings =
{
	window =
	{
		-- Settings for the desktop window; applies to both Win32 and macOS desktop apps
	},
}
``````

Within the `window` table, the following settings are supported:

##### defaultMode

Sets how the window should be launched on startup. Supported values include `"normal"`, `"minimized"`, `"maximized"`, or `"fullscreen"`. Default is `"normal"`. This can also be set programmatically via the [native.setProperty()][api.library.native.setProperty] API.

``````lua
settings =
{
	window =
	{
		defaultMode = "fullscreen",
	},	
}
``````

##### defaultViewWidth

Sets the default launch width of the view/client area of the window. This is the region within the borders of the window to which Corona renders. Ideally, this should match or exceed your `config.lua` content area width.

``````lua
settings =
{
	window =
	{
		defaultViewWidth = 640,
	},	
}
``````

##### defaultViewHeight

Sets the default launch height of the view/client area of the window. This is the region within the borders of the window to which Corona renders. Ideally, this should match or exceed your `config.lua` content area height.

``````lua
settings =
{
	window =
	{
		defaultViewHeight = 960,
	},
}
``````

##### resizable

Set this to `true` to allow the end user to resize the window (the&nbsp;window is not resizable by&nbsp;default). Note that if `true`, you may need to handle Corona's [resize][api.event.resize] event to <nobr>re-layout</nobr> your content.		

``````lua
settings =
{
	window =
	{
		resizable = true,
	},
}
``````

##### minViewWidth

This setting only applies if `resizable` is set to `true`. Prevents the user from resizing the window to a width smaller than this value. Note that this represents the width of the region within the borders of the window. If `resizable` is set to `true` and this setting is not specified, the window can be resized down to whatever width the OS allows.

``````lua
settings =
{
	window =
	{
		minViewWidth = 320,
	},
}
``````

##### minViewHeight

This setting only applies if `resizable` is set to `true`. Prevents the user from resizing the window to a height smaller than this value. Note that this represents the height of the region within the borders of the window. If `resizable` is set to `true` and this setting is not specified, the window can be resized down to whatever height the OS allows.

``````lua
settings =
{
	window =
	{
		minViewHeight = 480,
	},
}
``````

##### enableCloseButton

Enables or disables the window's "close" button <nobr>(enabled by default)</nobr>. If disabled, you must close the window in Lua via [native.requestExit()][api.library.native.requestExit]. Note that Corona does not currently trigger an event when the "close" button is clicked.

``````lua
settings =
{
	window =
	{
		enableCloseButton = true,
	},
}
``````

##### enableMinimizeButton

Enables or disables the window's "minimize" button <nobr>(enabled by default)</nobr>.

``````lua
settings =
{
	window =
	{
		enableMinimizeButton = true,
	},
}
``````

##### enableMaximizeButton

Enables or disables the window's "maximize" button <nobr>(disabled by default)</nobr>. Note that the window will be resized when maximized/restored, so if this setting is `true`, you may need to handle Corona's [resize][api.event.resize] event to <nobr>re-layout</nobr> your content.

``````lua
settings =
{
	window =
	{
		enableMaximizeButton = true,
	},
}
``````

##### suspendWhenMinimized

Tells the runtime to suspend when the window is minimized <nobr>(disabled by default)</nobr>.

``````lua
settings =
{
	window =
	{
		suspendWhenMinimized = true,
	},
}
``````

##### titleText

Sets the window's title bar text to the specified [string][api.type.String] (no&nbsp;title&nbsp;bar text by&nbsp;default). Supports <nobr>2-letter</nobr> <nobr>ISO 639‐1</nobr> language codes and optional <nobr>2-letter</nobr> <nobr>ISO 3166‐1</nobr> country codes <nobr>(neither case sensitive)</nobr>. The title text can also be set programmatically via the [native.setProperty()][api.library.native.setProperty] API.

``````lua
settings =
{
	window =
	{
		titleText = {
			-- The "default" text will be used if the system is using a language and/or
			-- country code not defined below. This serves as a fallback mechanism.
			default = "Window Title Test",
			-- This text is used on English language systems in the United States.
			-- Note that the country code must be separated by a dash (-).
			["en‐us"] = "Window Title Test (English‐USA)",
			-- This text is used on English language systems in the United Kingdom.
			-- Note that the country code must be separated by a dash (-).
			["en‐gb"] = "Window Title Test (English‐UK)",
			-- This text is used for all other English language systems.
			["en"] = "Window Title Test (English)",
			-- This text is used for all French language systems.
			["fr"] = "Window Title Test (French)",
			-- This text is used for all Spanish language systems.
			["es"] = "Window Title Test (Spanish)",
		},
	},
}
``````




<a id="excludingfiles"></a>

## Excluding Files

You can exclude file(s) that aren't needed for a Win32 desktop app via the `build.settings` file's `excludeFiles` pattern matching feature. Please see the __Excluding&nbsp;Files__ section of the [Project Build Settings][guide.distribution.buildSettings#excluding-files] guide for more details on pattern matching.




<a id="appicon"></a>

## App Icon

You must add a `Icon­-win32.ico` file to your Corona project's root directory when doing a Win32 build via the Corona Simulator. This file should contain multiple images at different resolutions, bundled into a single `.ico` file \([details](https://en.wikipedia.org/wiki/ICO_(file_format))\). This <nobr>`Icon­-win32.ico`</nobr> file will be used to set the icon for the following:

1. The icon that your `.exe` file uses, as viewed in Windows Explorer.
2. The icon used by your app's desktop window (<nobr>top-left</nobr> corner).
3. The icon used by your app on the Windows taskbar.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You can use Windows Explorer to see how your `.exe` app icon looks at different resolutions &mdash; simply choose different "View" modes in its menu/toolbar such as "Details" or "Tiled."

</div>




<a id="building"></a>

## Building / Running

To build and run your Win32 desktop app, follow these steps:

1. Open the Corona Simulator.
2. Open and run a Corona project.
3. Select the __File__ &rarr; __Build__ &rarr; __Windows...__ menu item.

<!---

<div class="image-indent">

![][images.simulator.win32-build1]

</div>

-->

<!---

4. This selection will display the following dialog:

<div class="image-indent">

![][images.simulator.win32-build2]

</div>

-->

4. The __Application Name__, __EXE File Name__, __Version__, and __Save&nbsp;to&nbsp;Folder__ fields are all required. All other fields are optional, but we highly recommend that you specify them. Here are notes regarding these build dialog fields:

	* __Application Name__ — The application name you've entered can be fetched at runtime via Corona's `system.getInfo( "appName" )` call \([reference][api.library.system.getInfo]\).

	* __EXE File Name__ — When right-clicking the built `.exe` file, most of this field information can be seen via the "Properties" window.

	* __Version__ — The version string you've entered can be fetched at runtime via Corona's `system.getInfo( "appVersionString" )` call \([reference][api.library.system.getInfo]\).
	
	* __Description__ — This string is used by the Windows Task Manager to display the name of your app process. If the description is not set, the Task Manager will use the application name instead.

	* __Application Name__ + __Company&nbsp;Name__ — In combination, these are used to generate a unique directory to store your app's files under the Windows user's hidden `\AppData` directory.

<div class="code-indent">
<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

When using the above combination, the following directories will be generated:

* `.\AppData\Roaming\<CompanyName>\<AppName>\Documents`
* `.\AppData\Local\<CompanyName>\<AppName>\CachedFiles`
* `.\AppData\Local\<CompanyName>\<AppName>\TemporaryFiles`
* `.\AppData\Local\<CompanyName>\<AppName>\.system`&nbsp; (used&nbsp;by Corona for its own internal&nbsp;purposes)

Windows will automatically synchronize files under the `\Roaming` folder on to other machines that the user logs into on the same Windows domain via Active&nbsp;Directory. However, files under the `\Local` folder will not be synchronized.

</div>
</div>
</div>

5. Click the __Build__ button to build your application to the given __Save&nbsp;to&nbsp;Folder__ location.

<!---

<div class="image-indent">

![][images.simulator.win32-build3]

</div>

-->

6. From the resulting dialog window, click the <nobr>__View in Explorer...__</nobr> button to go to the directory where your built Win32 app was copied to. The application will be under a subfolder named `<AppName>.Win32`. Open this folder to access the app's `.exe` file.

7. Double click on the `.exe` file to run your app.

<!---

<div class="image-indent">

![][images.simulator.win32-build4]

</div>

-->




<a id="debugapp"></a>

## Debugging

The Corona Simulator does not currently support direct simulation of an app running in Windows desktop mode. However, the Windows version of CORONA_CORE_PRODUCT contains a new application named `Corona.Shell.exe` which can run a Corona project similarly to how a built Win32 desktop app runs. By default, you can find the Corona Shell application here:

	C:\Program Files\Corona Labs\Corona SDK\Corona.Shell.exe

When you run the Corona Shell, it will prompt you to select a Corona project's `main.lua` file. Once the file has been selected, it will run the app. This allows you to make quick changes to your project without having to perform a build each time. However, note that the Corona Shell does __not__ support restarts or logging since it's actually running your project just like a real Win32 desktop app (no&nbsp;simulation).

Also note that when running a built Win32 desktop app or the Corona Shell, all `print()` output and Lua errors/warnings will be streamed to `stdout`. There are various ways to manage this output. One way is to redirect `stdout` to a text file at the command line (MS­DOS&nbsp;box) as shown below. This will launch your app and, after you close it, a text file will be generated containing all of the print/logging information.

	[YourExeFileName] > log.txt

Alternatively, you can run the __Corona&nbsp;Output&nbsp;Viewer__ installed under the Windows start menu's "CORONA_CORE_PRODUCT" folder to run a <nobr>Corona-built</nobr> Win32 desktop app and monitor its output.

<!---

![][images.simulator.win32-output-viewer]

-->




<a id="signing"></a>

## App Signing

The Corona Simulator will __n​ot__ ​digitally sign your built `.exe` file. This is because Windows does not require `.exe` files to be digitally signed in order to run them (it's&nbsp;optional). However, some antivirus software might block your app from being started or "red­&nbsp;flag" the app if it's not digitally signed. Thus, it is best to digitally sign your `.exe` when you're ready to distribute the app publicly.

Microsoft documents how to digitally sign an application [here](https://msdn.microsoft.com/en-us/en%C2%ADus/library/windows/desktop/aa387764.aspx).

To summarize, in order to sign your app, you need to purchase a digital certificate from a reputable source such as VeriSign or DigiCert. Microsoft's signing tools require this to be a `.pfx` file. You'll then need to acquire Microsoft's `signtool` command line utility by downloading and installing one of the following:

* Microsoft Windows SDK
* Visual Studio (any version)

Here is an example of how to digitally sign your app:

￼`signtool sign /f <PathToPfxFile> /p <CertificatePassword> /t <TimeServerUrl> <PathToExeFile>`
