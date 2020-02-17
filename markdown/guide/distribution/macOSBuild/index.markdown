# Creating macOS Desktop Apps

This guide outlines the features of CORONA_CORE_PRODUCT that are specific to macOS desktop apps. A <nobr>Corona-built</nobr> macOS desktop app consists of a `.app` bundle which contains the Corona runtime engine and your Corona project's compiled code and assets.

<div class="guides-toc">

* [System Requirements](#systemreqs)
* [Building Great macOS Apps](#greatapps)
* [Window Settings](#windowsettings)
* [Excluding Files](#excludingfiles)
* [Including Resources](#includingresources)
* [Custom URL Schemes](#customurlschemes)
* [Custom Document Types](#customdocumenttypes)
* [Entitlements](#entitlements)
* [Copyright](#copyright)
* [App Icon](#appicon)
* [Building / Running](#building)
* [Debugging](#debugapp)
* [App Signing](#signing)
* [Distribution](#distribution)

</div>


<a id="systemreqs"></a>

## System Requirements

* macOS 10.11 or later
* Mac which supports OpenGL 2.1 or higher

<div class="guide-notebox">
<div class="notebox-title">Note</div>

All features supported by the Corona Simulator for macOS are supported for macOS desktop builds.

</div>




<a id="greatapps"></a>

## Building Great macOS Apps

Many developers will start with an iOS app, intending to duplicate it on the Mac platform. First and foremost, avoid the tempting assumption that all you need to do is choose <nobr>__File__ &rarr; __Build__ &rarr; __macOS...__</nobr> from the Corona Simulator menu to create a macOS app from an iOS app. The desktop and device platforms are quite different, and while Corona hides many of the practical implementation details, it can't magically turn an app designed for a touch screen device into a great <nobr>mouse-based</nobr> desktop experience.

Keep in mind that your macOS app will undergo the Apple review process before being accepted into the <nobr>Mac App Store</nobr>. This will cover the same type of issues as iOS app reviews, but there is an additional bar which must be cleared since macOS apps may be rejected on this point:

	Your app appears to be a mostly unmodified port of an iOS app.

Among other things, you should consider how your app reacts to window size changes and how it works in full screen mode. The size of the content area is much more variable on the desktop than it is on devices and you will almost certainly need to make changes to your app so that it works well in the desktop environment. Remember that you can adjust both the window size and the content area and that they don't necessarily need to be the same. Also remember that landscape orientation is what users will expect, so it will be more difficult to make a good impression with a <nobr>portrait-oriented</nobr> app in the desktop environment.

Obviously, anything you can download from the <nobr>Mac App Store</nobr> has passed the review process, so be sure to download other apps in the same genre as yours, see how they work on the desktop, and consider how you can modify yours to work similarly. 




<a id="windowsettings"></a>

## Window Settings

For both macOS desktop apps and Win32 desktop apps, Corona's `build.settings` file supports a `window` table for customizing the app's desktop window, including the default width/height, the title of the window, and more.

``````lua
settings =
{
	window =
	{
		-- Settings for the desktop window; applies to both macOS and Win32 desktop apps
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

Set this to `true` to allow the end user to resize the window (the window is not resizable by default). Note that if `true`, you may need to handle Corona's [resize][api.event.resize] event to <nobr>re-layout</nobr> your content.		

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

##### showWindowTitle

Causes the window's title bar to be shown (by&nbsp;default) or hidden making the app's content fill the entire window.  Dragging at the top of the window will move it as with a regular window and clicks in this area do not go to the app. This setting is supported on macOS only.

``````lua
settings =
{
	window =
	{
		showWindowTitle = false,
	},
}
``````

##### titleText

Sets the window's title bar text to the specified [string][api.type.String] (no title bar text by default). Supports <nobr>2-letter</nobr> <nobr>ISO 639‐1</nobr> [language codes](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) and optional <nobr>2-letter</nobr> <nobr>ISO 3166‐1</nobr> [country codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) (neither is case sensitive). The `default` title text can also be set programmatically via the [native.setProperty()][api.library.native.setProperty] API.

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

You can exclude file(s) that aren't needed for an macOS desktop app via the `build.settings` file's `excludeFiles` pattern matching feature. Please see the __Excluding&nbsp;Files__ section of the [Project Build Settings][guide.distribution.buildSettings#excluding-files] guide for more details on pattern matching.




<a id="includingresources"></a>

## Including Resources

Sometimes it's necessary to include certain files in your application to support specific macOS features. One example of this is __localization__ which is achieved at the OS level (for example the Finder's label for an app) using `.lproj` directories in the application's `Resource` directory \([background](https://developer.apple.com/internationalization/)\) page. Note that this mechanism to include arbitrary resources in your app is only intended to enable the knowledge to complete certain tasks and is not intended to automate anything.

To include arbitrary files in your app's `Resource` directory add a `bundleResourcesDirectory` entry to your project's `build.settings` for macOS builds. For example:

``````lua
settings =
{
	macos =
	{
		bundleResourcesDirectory = "osx-resources",
	},
}
``````

Then, in the project, the contents of the `osx-resources` directory might look like this:

``````
fr.lproj/

osx-resources/fr.lproj:
InfoPlist.strings
``````

This results in the `fr.lproj` directory ending up in `MyApp.app/Content/Resources/fr.proj`.

You will probably want to add the directory you use as `bundleResourcesDirectory` to your [excluded files](#excludingfiles).




<a id="customurlschemes"></a>

## Custom URL Schemes

To enable a custom URL scheme in your macOS app, you'll need to set it up in the app's `Info.plist` by including a section like this in `build.settings`:

``````lua
settings =
{
	macos =
	{
		plist =
		{
			CFBundleURLTypes =
			{
				{
					CFBundleURLName = "My URL Scheme",
					CFBundleURLSchemes = {
						"myscheme",
					},
				},
			},
		},
	},
}
``````

This will allow the app to receive a message from <nobr>(or be started by)</nobr> a __Terminal__ command such as:

``````
open myscheme://these/are/the/parameters
``````

To handle the message in your Corona app, implement a handler like this:

``````lua
local function onSystemEvent( event )
	if ( event.type == "applicationOpen" and event.url ) then
		local launchURL = event.url
		print( "Event: applicationOpen - launchURL: ", launchURL )
	end
end

Runtime:addEventListener( "system", onSystemEvent )
``````




<a id="customdocumenttypes"></a>

## Custom Document Types

Similarly to how custom URL schemes work you can set up document types that you app recognizes and which can be opened by dragging them to the app's icon in the __Finder__ or the __Dock__.

To enable custom document types in your macOS app, you'll need to set it up in the app's `Info.plist` by including a section like this in `build.settings`:

``````lua
settings =
{
	macos =
	{
		plist =
		{
			CFBundleDocumentTypes =
			{
				{
					CFBundleTypeExtensions =
					{
						"png",
					},
					CFBundleTypeIconFile = "app.icns",
					CFBundleTypeName = "public.png",
					LSHandlerRank = "Alternate",
					LSItemContentTypes =
					{
						"public.png",
					},
				},
			},
		},
	},
}
``````

In your Corona app, implement a handler like this:

``````lua
local function onSystemEvent( event )
	if ( event.type == "applicationOpen" and event.url ) then
		local filename = event.url
		print( "Event: applicationOpen - filename: ", filename )
	end
end

Runtime:addEventListener( "system", onSystemEvent )
``````

This code will called when files with the configured types are dropped on your app's icon in the __Finder__ or the __Dock__. More information is available in Apple's developer [Core Foundation Keys](https://developer.apple.com/library/mac/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html) documentation.




<a id="entitlements"></a>

## Entitlements

If you need custom [entitlements](https://developer.apple.com/library/mac/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/AboutEntitlements.html) in your macOS app, specify them in `build.settings`. For example, you might need to specify the `com.apple.security.personal-information.location` entitlement if you use Corona's [location][api.event.location] features.

``````lua
settings =
{
	macos =
	{
		entitlements = {
			["com.apple.security.personal-information.location"] = true,
		},
	},
}
``````




<a id="copyright"></a>

## Copyright

To customize the copyright message in the __About__ box of your app, you can add the following to `build.settings`:

``````lua
settings =
{
	macos =
	{
		plist =
		{
			NSHumanReadableCopyright = "Copyright © 2017 XYZ Company"
		},
	},
}
``````




<a id="appicon"></a>

## App Icon

You should add a `Icon-osx.icns` file to your Corona project's root directory to provide an icon for your application on macOS This should be an `.icns` file which contains multiple versions of your icon at different resolutions \([details](https://en.wikipedia.org/wiki/Apple_Icon_Image_format)\). This <nobr>`Icon-osx.icns`</nobr> file will be used to set the icon for the following:

1. The icon that your `.app` bundle uses, as viewed in the Finder.
2. The icon used by your app in the Dock.

You can find apps in the Mac App Store to help with the creation of `.icns` files.




<a id="building"></a>

## Building / Running

To build and run your macOS desktop app, follow these steps:

1. Open the Corona Simulator.

2. Open and run a Corona project.

3. Select the <nobr>__File__ &rarr; __Build__ &rarr; __macOS...__</nobr> menu item to reveal the macOS build dialog.

4. The __Application Name__, __Version__, and __Save&nbsp;to&nbsp;Folder__ fields are all required. Here are notes regarding these build dialog fields:

	* __Application Name__ — The application name you've entered can be fetched at runtime via Corona's `system.getInfo( "appName" )` call \([reference][api.library.system.getInfo]\).

	* __Version__ — The version string you've entered can be fetched at runtime via Corona's `system.getInfo( "appVersionString" )` call \([reference][api.library.system.getInfo]\).

	* __Provisioning Profile__ — The provisioning profile for the app; see [App Signing](#signing) below.

	* __Save to Folder__ — The directory in which to save the built project.

	* __After Build__ — select which action should be performed after the app is successfully built.

5. Click the __Build__ button to build your application to the given __Save&nbsp;to&nbsp;Folder__ location. If you chose <nobr>__Send to Mac App Store...__</nobr>, a panel will open which allows you to select the tab for the preferred option and follow the prompts to complete your build.




<a id="debugapp"></a>

## Debugging

The Corona Simulator does not currently support direct simulation of an app running in macOS desktop mode, although the Simulator running a "Custom&nbsp;Device" skin is almost the same.

Note that when running a built macOS Corona app or the Corona Shell, all `print()` output and Lua errors/warnings will be streamed to `stdout`. There are various ways to manage this output. One way is to run the executable embedded in the app bundle in a Terminal window which will make the debug output visible. For example:

	./Bridge\ for\ OS\ X/Contents/MacOS/Bridge\ for\ OS\ X

In this example, the backslashes (`\`) protect the spaces in the filename (you could alternatively use quotes).

You can also use the __Console__ app in the <nobr>__Applications__ &rarr; __Utilities__</nobr> folder to view application output.

If you run the app by choosing the __After&nbsp;Build__ &rarr; __Open&nbsp;application__ option in the Corona Simulator build dialog, the app's output will appear in the Corona Simulator Console window.




<a id="signing"></a>

## App Signing

You'll need a "Mac Apps" provisioning profile￼ from the [Apple Developer](https://developer.apple.com/) portal in order to sign your macOS app. This works very similarly to the [iOS][guide.distribution.iOSBuild] app signing process, but you may optionally choose to create an unsigned app by selecting __None__ in the __Provisioning&nbsp;Profile__ dropdown when performing a build. Unsigned apps can be run on your own machine and, with some tweaking of the <nobr>"Security & Privacy"</nobr> settings within "System&nbsp;Preferences," on other Macs. However, unsigned apps can __not__ be submitted to the Mac App Store, so you will eventually need to sort out your Mac provisioning profiles.

Provisioning profiles should be installed in <nobr>`~/Library/MobileDevice/Provisioning Profiles`</nobr>. It may be necessary to do this manually.

For testing, it's recommended you sign the app with your Mac App signing identity by choosing it in the Corona Simulator <nobr>__Build for macOS__</nobr> dialog and then tell your testers to choose the __Mac App Store and identified developers__ option on the <nobr>"Security &amp; Privacy"</nobr> panel of "System&nbsp;Preferences".




<a id="distribution"></a>

## Distribution

You can distribute your app via the Mac App Store, a `.dmg`, or any other way you may distribute an `.app` bundle.

If not using the Mac App Store, we recommend that you sign the app with your Mac App signing identity by choosing it in the Corona Simulator build dialog menu and then tell your testers to choose the __Mac App Store and identified developers__ option on the <nobr>"Security &amp; Privacy"</nobr> panel of "System&nbsp;Preferences".

If using a `.zip` archive to distribute your app, be aware that there are symbolic links in the built `.app` bundle, so you must specify the `-y` option if running `zip` on the command line to create your archive (using the __Compress__ option in the Finder does the correct thing automatically). Failure to do this will result in macOS saying the app is damaged when run on another computer. Also note that some file sharing services can corrupt macOS applications, so we recommend that you put them in `.zip` archives before uploading them.
