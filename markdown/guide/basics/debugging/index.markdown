# Debugging Guide

As a developer, you will occasionally encounter problems in your code, including incorrect logic, improper usage of an API, or any number of other issues. This guide will teach you how to debug your code, detect some common problems, and find their solutions.

<div class="guides-toc">

* [Background](#background)
* [Using Corona Editor](#coronaeditor)
* [Console/Device Debugging](#consoledebugging)
* [Tips and Common Pitfalls](#common)
* [Community Support](#support)

</div>



<a id="background"></a>

## Background

<div style="border-left: 2px solid #EEE; padding-left: 15px; padding-bottom: 3px; margin: 0px 25px 15px 15px;">

_Oops! Something is badly wrong. My program crashed, or printed nonsense, or seems to be running forever. Now what?_

_Beginners have a tendency to blame the compiler, the library, or anything other than their own code. Experienced programmers would love to do the same, but they know that, realistically, most problems are their own fault._

_Fortunately, most bugs are simple and can be found with simple techniques. Examine the evidence in the erroneous output and try to infer how it could have been produced. Look at any debugging output before the crash; if possible get a stack trace from a debugger. Now you know something of what happened, and where. Pause to reflect. How could that happen? Reason back from the state of the crashed program to determine what could have caused this._

_Debugging involves backwards reasoning, like solving murder mysteries. Something impossible occurred, and the only solid information is that it really did occur. So we must think backwards from the result to discover the reasons. Once we have a full explanation, we'll know what to fix and, along the way, likely discover a few other things we hadn't expected._

</div>

This excerpt from [The Practice of Programming](https://en.wikipedia.org/wiki/The_Practice_of_Programming) emphasizes the importance of gathering sufficient data and facts before undertaking the task of debugging. Sometimes, this means eliminating possible causes in order to find the real problem. Other times, it's an indirect way to resolve the issue.




<a id="coronaeditor"></a>

## Using Corona Editor

[Corona Editor](https://github.com/coronalabs/CoronaSDK-SublimeText) is an <nobr>add-on</nobr> feature for [Sublime Text](https://www.sublimetext.com/). This allows you to see debugging messages in Sublime Text without needing a console window. It also allows you to validate your code using an interactive debugger.

Once you have Sublime Text and Corona Editor installed, it can help you debug your code. For example, you can stop the Solar2D Simulator at certain points and examine the state of your code, or you can step through the code and inspect variable values along the way. In addition, you can follow the __stack&nbsp;trace__ of the app for more comprehensive debugging purposes.

### Using Break Points

One key concept in using an interactive debugger is the ability to stop your program at certain points so you can observe the current state. This includes looking at the value of variables in scope, stepping through the code one line or one function at a time, and checking the stack trace. This is known as __using&nbsp;break&nbsp;points__ and it all revolves around stopping your program at the points you want to inspect.

You can enable or disable (toggle) break points in one of two ways:

* Click on the line of code and select __Corona&nbsp;Editor__ &rarr; __Corona&nbsp;Debugger__ &rarr; __Toggle&nbsp;Breakpoint__ from the main menu.

* Right-click the line of code and choose __Toggle&nbsp;Breakpoint__ from the popup context menu.

When you set a break point, a small Corona logo will appear on the line. Then, when you run your app from Sublime Text via __Corona&nbsp;Editor__ &rarr; __Corona&nbsp;Debugger__ &rarr; __Run__, it will stop when it reaches this line of code and return to Sublime Text. At this point, you have several options:

* __Run__ &mdash; Run the code until the next break point or until completion.

* __Step Over__ &mdash; This will step forward one line of code, and if it's a function, it will complete the function and stop on the next line of code.

* __Step Into__ &mdash; This will step forward one line of code, and if it's a function, it will enter the function and stop on the first line of that function.

* __Toggle Breakpoint__ &mdash; Turn off the breakpoint or set a new one.

* __Inspect Variable__ &mdash; See [Inspecting Variables](#inspecting) below.

* __Stop__ &mdash; Stop the program.

<!---

### Watching Variables

When Sublime Text with Corona Editor runs, it opens up several windows by default. One window is your code, another is the __Console__ log where errors and `print()` statements appear, another window is the __Lua&nbsp;Stack__ trace, and the last one is __Variables__ to watch.

Any variable that is in scope will show in the Watch variables window. Instead of using print() statements to watch your variables, Corona Debugger will show you the variables and their values.  You can watch the variables as you step through your code.

-->

<a id="inspecting"></a>

### Inspecting Variables

<!---

Watching variables only shows you variables in scope.  It does not show global variables, or other variables.  You can also look at a specific variable by inspecting a variable.

-->

From the main menu, select __Corona&nbsp;Debugger__ &rarr; __Inspect&nbsp;Variable__. A search bar will open at the bottom of Sublime Text and you can enter any valid variable. You will then see the details of that variable, and if it's a table, this can provide a better visual representation compared to what is typically available.

### Stack Tracing

Sometimes it's helpful to know where an error originated from. When you call a function and it misbehaves, a&nbsp;common reason is that the calling function passed invalid data. By using the __stack&nbsp;trace__, you can quickly identify which line of code called the function that you are currently executing. More specifically, you can set a break point in that function, continue running your app, and when the function exits and hits the next break point, you can examine the variables that were used to call the function.

For more information on the stack trace, see [Viewing Runtime Errors](#runtimeerrors) below.




<a id="consoledebugging"></a>

## Console/Device Debugging

<a id="runtimeerrors"></a>

### Viewing Runtime Errors

If you have __Show&nbsp;Runtime&nbsp;Errors__ enabled in the Solar2D Simulator preferences, runtime errors (those&nbsp;that crash your&nbsp;app) will abort the program and reveal a message dialog box with more information about the error, including:

* The filename in which the error occurred in, for example `main.lua`.
* The line number within that file where the error occurred, for instance <nobr>`Line 218`</nobr>.
* The reason for the error, such as <nobr>`Attempt to perform arithmetic on a nil value.`</nobr>.
* The __stack trace__ which can help you locate the origin of the error, for example:

<div class="code-indent">

``````
stack traceback:
	main.lua:218: in function 'start'
	main.lua:222: in main chunk
``````

</div>

This collective information usually pinpoints the exact spot in your code where the problem lies. In this example, you can open the `main.lua` file, locate line `218`, and look for a math operation where one of the values is `nil` &mdash; specifically, a place where you're attempting to perform math on an undefined variable. Furthermore, the stack trace reveals that the error resides within the function named `start`, and that function was called from line `222`.

Sometimes, the stack trace is less specific and must be followed carefully. For instance:

``````
?: in function <?:221>
	main.lua:218: in function 'start'
	main.lua:222: in main chunk
``````

From this, you know that the error resides on line `221`, but you must trace backwards for more details. In this case, the problem occurred on line `221`, and that line was called from a function named `start` at line `218` of `main.lua`. Thus, even if the first line of the stack trace doesn't pinpoint exactly where the problem occurred, it can usually expose the root of the error.

<div class="guide-notebox">
<div class="notebox-title">Debug Symbols</div>

When [building for iOS][guide.distribution.iOSBuild] you have the choice of a __Development__ build or a __Distribution__ build. When [building for Android][guide.distribution.androidBuild], you either build with a __Debug__ keystore or a __Release__ keystore. Typically, your choice impacts the information available in the stack trace as follows:

* If you build with a development profile or a debug keystore, Solar2D will retain debug symbols within the Lua code. This results in a minimal performance impact and a larger application bundle.

* If you build with a distribution profile or a release keystore, Solar2D will strip debug symbols out of the Lua code.

If you wish to retain these symbols regardless of the build type, simply override the default behavior as illustrated [here][guide.distribution.advancedSettings#build-control]. This will make it easier to trace the code, but if the error occurs inside of core Solar2D code, debug symbols will still not be available. In these cases, you'll need to trace backwards and determine why the information you're passing to a Solar2D library function is causing an error.

</div>

### Solar2D Simulator Console

Diagnostic output can also be viewed within the __Solar2D&nbsp;Simulator&nbsp;Console__. Here, useful debugging messages will be shown, along with the value of `print()` statements within your code. While this practice may be considered outdated to some developers, tracking the output of `print()` commands can often reveal the cause of an error or an issue with conditional logic.

### Xcode Simulator &mdash; macOS

The above methods can help diagnose most coding issues, but the __Xcode&nbsp;Simulator__ for macOS may be necessary to preview how the app will function on actual iOS devices. This helps simulate some device features that the Solar2D Simulator cannot, but it's still not as accurate as a real device.

To test an app in the Xcode Simulator:

1. Select __File__ &rarr; __Build__ &rarr; __Build&nbsp;for&nbsp;iOS...__ from within the Solar2D Simulator.

2. In the dialog window, under the __Build&nbsp;for:__ <nobr>pull-down</nobr> menu, select __Xcode&nbsp;Simulator__.

3. Proceed with the build process and the application will open in a simulated device window.

4. From this application, select __Debug__ &rarr; <nobr>__Open System Log...__</nobr> to view the system log.

### Device Debugging &mdash; iOS

Some errors only manifest themselves once you install the app on a device. Fortunately, each device has its own console log which you can access, and for Apple, you can see this console log within Xcode as follows:

1. Open Xcode if it's not already running.

2. Open the __Devices &amp; Simulators__ window (__Window__ &rarr; __Devices &amp; Simulators__).

3. Connect the device to your computer and wait until it appears in the left column of the window. When it does, select&nbsp;it.

4. Click on the __Open Console__ button to open the device's console log.


### Device Debugging &mdash; Android

Debugging on Android is a bit more "command line oriented," but once you figure out the commands, it's reasonably quick to install an app, view the log as the app runs, and look for error messages.

First, you must install some free tools from Google called __Android&nbsp;Debug&nbsp;Bridge__. Simply follow these steps:

1. Visit the [download](https://developer.android.com/studio#downloads) page. Instead of clicking the large download button, click on the __Download&nbsp;Options__ link. Then, in the <nobr>__Command line tools only__</nobr> section, select the correct option for your system. Alternatively, you can download the SDK Platform Tools for your operating system from the [platform tools](https://developer.android.com/studio/releases/platform-tools) page.

2. Install the tools. On Windows, run the installer; on macOS, unzip the file and move the folder to a sensible location.

3. Follow the instructions for [Adding SDK Packages](https://developer.android.com/studio#downloads). Install at least the __Android&nbsp;SDK&nbsp;Tools__ and <nobr>__Android SDK Platform-tools__.</nobr>

Once the tools are installed, you can use the command line tools. With your Android device connected, simply type the following command in the __Terminal__ (macOS) or __Command&nbsp;Prompt__ (Windows) and watch the messages appear. This command will filter out all messages except those generated by Solar2D.

``````
adb logcat Corona:v *:s
``````

Sometimes errors are generated by things besides Solar2D, for example messages from Google Play related to Google <nobr>In-App</nobr> Purchases. To see the entire log, use this command instead:

``````
adb logcat
``````

This will prevent filtering for <nobr>Solar2D-specific</nobr> activity, but it will generate a large number of messages and it will be difficult to locate those relevant to the problem. Thus, it may be helpful to include some `print()` statements within your code near the area which you suspect is problematic. For&nbsp;example:

``````lua
print( "MYAPP - Purchase: *********************************************" )
store.purchase( "com.coronalabs.NewExampleInAppPurchase.NonConsumableTier1" )
``````

If you prefer a more visual tool, __adb__ also offers a GUI version of <nobr>`adb logcat`</nobr> called __monitor__. You may need to set your device to "developer&nbsp;mode" to use these tools, and each device and version of Android exposes this in different ways, so we suggest that you search online for your specific OS and "developer&nbsp;mode" to locate the instructions.

### Debugging &mdash; Win32 Desktop

If you're working on a Win32 desktop app, some details on debugging can be located [here][guide.distribution.win32Build#debugapp].

### Debugging &mdash; macOS Desktop

If you're working on a macOS desktop app, some details on debugging can be located [here][guide.distribution.macOSBuild#debugapp].




<a id="common"></a>

## Tips and Common Pitfalls

There are some common issues which are usually simple to resolve once you're aware of them.

### Proper Indentation

The most important practice for code readability is proper indentation (adding&nbsp;tabs or spaces before lines to distinguish blocks of&nbsp;code). You should use a text editor or Integrated Development Environment (IDE) which handles indentions for you. Consider this code:

``````lua
local function doSomething( params )
if params.someValue == 10 then
if params.someOtherValue == "test" then
params.yetAnotherValue = params.someValue
end
end
``````

Without indenting the lines to show the various blocks of code, it's very difficult to read. In fact, there's an error which would be obvious if the code was indented correctly. Compare the difference:

``````lua
local function doSomething( params )
	if params.someValue == 10 then
		if params.someOtherValue == "test" then
			params.yetAnotherValue = params.someValue
		end
	end
``````

As you can see, there is a missing `end` keyword for the `doSomething` function, and this is clearly revealed when the code is properly indented.

Many code editors can help you by automatically indenting code and, when you close a block, it will back out one level and put the `end` in the correct place. Each operating system has a selection of code editors, and better editors feature Lua syntax highlighting. For a list of recommended editors, please see our installation guides for [macOS][guide.start.installMac] or [Windows][guide.start.installWin].

### Descriptive Naming

Another important aspect is naming variables and functions so that you and others know what they mean. Consider these two blocks of code:

``````lua
local function a( b )
	local c = b.target
	if c.x < 100 then
		c.alpha = 0
	end
	return true
end
``````

``````lua
local function touchEventHandler( event )
	local target = event.target
	if target.x < 100 then
		target.alpha = 0
	end
	return true
end
``````

These functions are identical in behavior, but by using clearer variable and function names, most developers can easily figure out what you're trying to accomplish.

### Device Considerations

Some developers are dismayed to find that their project works in the Solar2D Simulator but not on their actual device. Usually, one of the following factors is at fault:

* File names are not <nobr>__case-sensitive__</nobr>. When testing on macOS or Windows, file names are not <nobr>case-sensitive</nobr>, but when running on a device, the file names __must__ match in case. For example, the file name `titleimage.png` and `TitleImage.PNG` are the same in the Solar2D Simulator, but they are considered different on a device.

* There is an error in the `build.settings` file, and often this is because the various blocks and tables are not properly nested. Please see the [Project Build Settings][guide.distribution.buildSettings] guide for instructions on how to properly construct the `build.settings` file and each section within it.

* There's a problem with a [plugin][plugin]. Each plugin must be included exactly as specified, and several plugins require device __permissions__ in order to function properly. Please see the appropriate [plugin documentation][plugin] for details.

### Listener Removal

In some cases, an [event][api.event] listener function may still be running when you attempt to remove the listener, or a Solar2D library will be completing an internal process when you attempt to call a certain action. For example, you may attempt to remove a [GPS][api.event.location] listener while the GPS event is still being processed, or you may try to [deactivate][api.type.Body.isBodyActive] a physics body at the exact moment it collides with another object. Both of these are liable to cause an error/warning.

The solution to these type of issues is to perform the necessary action after a short [timer][api.library.timer.performWithDelay] delay:

``````lua
local function handleGPS( event )
	timer.performWithDelay( 10, function() Runtime:removeEventListener( "location", handleGPS ); end )
end
``````




<a id="support"></a>

## Community Support

### Locating Solutions

If you have exhausted all of the above debugging methods, proceed to the [Solar2D Forums](https://forums.solar2d.com/). There you can search for topics which describe the same issue you're struggling with. Often, another developer will have reported the same issue and, in many cases, the thread will contain the solution &mdash; as&nbsp;such, please do not post a new topic without first searching for the answer in existing threads.

Note that new contributors will have their first post moderated &mdash; these will be entered into the system, but they will not be visible to others until approved by a moderator.

### Requesting Assistance

If you cannot locate the solution in any previous forum threads, please post a new request and follow these guidelines:

* Do not post the same topic multiple times. Also, choose the most appropriate <nobr>sub-forum</nobr> for your topic, and abstain from posting the same topic in multiple <nobr>sub-forums.</nobr>

* Include enough information so that the community can help. You should provide the following:

	* &nbsp;A detailed description of the problem you're having.  
	* &nbsp;A concise amount of code around the problematic area, if necessary.  
    * &nbsp;Whether you are using macOS or Windows.  
    * &nbsp;Whether you are building for iOS, Android, macOS desktop, or Windows desktop.  
    * &nbsp;Which version/build of Solar2D you're using.  
    * &nbsp;The relevant error messages from your console log.  
    * &nbsp;Screenshots/images which can help the community visualize the problem.  

* When including code within a forum post, surround it with `[lua] [/lua]` tags for clarity and readability:

<div class="code-indent" style="width: 500px;">

``````
[lua]
...
[/lua]
``````

</div>

* To include screenshots or images, click the __More&nbsp;Reply&nbsp;Options__ button below the message input box. On the next screen, use the __Attach&nbsp;Files__ section to upload the image files. For YouTube or Vimeo videos, simply paste the video URL along with the message.
