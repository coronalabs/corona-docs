# CoronaCards — Windows&nbsp;Phone&nbsp;8

## Porting an Existing Corona Project

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Before porting an existing Corona project, please ensure that it uses features [supported][coronacards.wp8.support] by CoronaCards for Windows&nbsp;Phone&nbsp;8.

</div>

### Copying Project Files

1. In Visual Studio, view the __Solution Explorer__ panel.
2. Expand the project's __Assets__ &rarr; __Corona__ tree.
3. Open __Windows Explorer__, browse to the Corona project's root folder, and select all of the files.
4. Drag-and-drop the files into the __Assets__ &rarr; __Corona__ tree within Visual Studio.
5. Highlight all of the Corona files within the __Corona__ tree.
6. In the __Properties__ panel for __Build&nbsp;Action__, select __Content__ in the <nobr>drop-down</nobr> menu.

<div style="width:90%;">

![][images.simulator.cc-wp8-config3]

</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* If you drag-and-drop your Corona files into the project in Visual Studio, it will also copy those files into your C# project directory.
* You do __not__ need to include any <nobr>non-Microsoft</nobr> assets for Windows Phone development. For&nbsp;instance, you can omit the `build.settings` file, iOS/Android app&nbsp;icons, launch images, and other items which do not pertain to the Windows Phone platform.
* Setting the __Build Action__ of your files to __Content__ configures Visual Studio to add those files to the compiled Windows Phone `.xap` bundle. This is necessary for file extensions that Visual Studio does not recognize, such as `.ttf`, `.json`, and other file types.

</div>

### Adding App Icons

Corona icon image files such as `Icon.png`, `Icon-hdpi.png`, etc. are __not__ supported on Windows Phone and will be ignored. Thus, you should omit these files from your Visual Studio project's `Assets\Corona` directory.

To include an app icon for Windows Phone, create a 100&times;100 pixel PNG image file named `ApplicationIcon.png`. When you create a new Windows Phone project in Visual Studio, a default `ApplicationIcon.png` will be automatically generated in the project's `Assets` directory. You should edit or replace this with your custom image. Unlike iOS or Android, Windows Phone does not support multiple application icon files of different resolutions &mdash; the operating system will simply scale the main icon.

Windows Phone can also display a __tile__ for your application on the start screen. When you create a new Windows Phone project in Visual Studio, default tile images are automatically created under the project's `Assets\Tiles` directory. For more details on tile support, see Microsoft's [documentation](http://msdn.microsoft.com/en-us/library/windows/apps/hh202948\(v=vs.105\).aspx).


### Setting the App Orientation

For iOS and Android projects, you typically indicate supported orientations via the `build.settings` file. This file is __not__ supported on Windows Phone and will be ignored. Thus, you should omit this file from your Visual Studio project's `Assets\Corona` directory.

To set the orientation of a Windows Phone app, please follow these steps:

1. In Visual Studio, view the __Solution Explorer__ panel.
2. Double click the `MainPage.xaml` file.
3. In the XML editor, click on the `<phone:PhoneApplicationPage>` tag's `SupportedOrientation` attribute.
4. View the __Properties__ panel and click on the __SupportedOrientations__ <nobr>pull-down</nobr> box.
5. Select either __Portrait__, __Landscape__, or __PortraitOrLandscape__.


### Identifying the Platform

In Lua, you can check if an app is running on Windows Phone with the following code:

``````lua
if ( system.getInfo("platformName") == "WinPhone" ) then
	-- This app is running on Windows Phone
end
``````


### Back Key Support

Windows Phone has a "back" key just like Android devices. Pressing this key will exit the app, so you are expected to override this key and implement backward navigation within your own Corona scenes before allowing the app to exit.

``````lua
local function onKeyEvent( event )
	-- If the 'back' key was pressed on Android or Windows Phone, prevent it from backing out of your app
	local platformName = system.getInfo( "platformName" )
	if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
		if ( event.keyName == "back" ) then
			-- Navigate back one scene or display an 'Are you sure you want to exit' alert
			return true
		end
	end

	-- Return false to indicate that this app is *not* overriding the received key.
	-- This lets the operating system execute its default handling of this key.
	return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````


### Call/Notification Interruption

The Windows Phone operating system will not automatically suspend your app when an incoming phone call is received. Instead, when a phone call occurs, Windows Phone will overlay a notification over the app, but the app will continue running. Thus, Microsoft allows developers to decide if an app should or shouldn't suspend during a phone call. However, games are expected to suspend during a phone call and Microsoft will reject your game from the Windows Phone Store if it doesn't suspend.

You can detect phone call interruption when a .NET [Obscured](http://msdn.microsoft.com/en-US/library/windows/apps/microsoft.phone.controls.phoneapplicationframe.obscured\(v=vs.105\).aspx) event is raised by the operating system. However, note that this event will also be raised when a __notification__ is received. Currently, there's no way to differentiate between these two events, but you can handle them similarly since Windows Phone notifications obstruct a large portion of the screen and games should be suspended in both cases.

To suspend an app during this event, do the following:

1. In Visual Studio, view the __Solution Explorer__ panel.
2. Double click on the `MainPage.xaml.cs` file below the `MainPage.xaml` file in the tree.
3. Edit the code as follows:

<div class="code-indent">

``````
// [C#]

public partial class MainPage : PhoneApplicationPage
{
	public MainPage()
	{
		// Initialize this page's components that were set up via the UI designer.
		InitializeComponent();

		// Set up Corona to automatically start up when the control's Loaded event has been raised.
		// Note: By default, Corona will run the "main.lua" file in the "Assets\Corona" directory.
		//       You can change the defaults via the CoronaPanel's AutoLaunchSettings property.
		fCoronaPanel.AutoLaunchEnabled = true;

		// Set up the CoronaPanel control to render fullscreen via the DrawingSurfaceBackgroundGrid control.
		// This significantly improves the frame rate and is the only means of achieving 60 FPS.
		fCoronaPanel.BackgroundRenderingEnabled = true;
		fDrawingSurfaceBackgroundGrid.SetBackgroundContentProvider(fCoronaPanel.BackgroundContentProvider);
		fDrawingSurfaceBackgroundGrid.SetBackgroundManipulationHandler(fCoronaPanel.BackgroundManipulationHandler);

		// Add application event handlers.
		App.RootFrame.Obscured += OnAppObscured;
		App.RootFrame.Unobscured += OnAppUnobscured;
	}

	private void OnAppObscured(object sender, ObscuredEventArgs e)
	{
		if (e.IsLocked == false)
		{
			fCoronaPanel.Runtime.Suspend();
		}
	}

	private void OnAppUnobscured(object sender, EventArgs e)
	{
		fCoronaPanel.Runtime.Resume();
	}
}
``````

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You can simulate phone call or notification interruption via the Windows Phone emulator. This makes it easy to test and verify that the above solution is functioning properly.

</div>


### Optimizing Text Performance

Text generation via [display.newText()][api.library.display.newText] or [display.newEmbossedText()][api.library.display.newEmbossedText], and text rendering within [widgets][api.library.widget], is&nbsp;a slow and expensive operation on Windows Phone. This performance issue is caused by the operating system's native text rendering APIs and it cannot be further optimized by Corona Labs.

One workaround for this performance issue is to use "bitmap" fonts. This involves setting up an [imageSheet][api.type.ImageSheet] which contains all of the required letters/characters and then render your text via [display.newImage()][api.library.display.newImage] or [display.newImageRect()][api.library.display.newImageRect] objects. This will vastly improve your app's text rendering performance, since all characters will be <nobr>pre-loaded</nobr>.

The following third-party bitmap font libraries may be considered:

* [bmGlyph](http://www.bmglyph.com/corona-bitmap-font-with-graphics-2-0)
* [Font-Manager](https://github.com/autismuk/Font-Manager)
* [TextCandy](http://www.x-pressive.com/TextCandy_Corona/features.html)

Note that a bitmap font library is best used for text that's under your app's control. This means that it shouldn't be used for text strings taken from a source like Facebook, Twitter, or another outside source, as this text may contain special characters which are not included in your [imageSheet][api.type.ImageSheet]. In these cases, using [display.newText()][api.library.display.newText] should be acceptable, since the text will not likely be updated/changed frequently.

Finally, regarding widgets, the performance penalty will only occur if the widget contains text, for example text inserted into [tableView][api.library.widget.newTableView] rows. When inserting text in this case, you should either <nobr>pre-load</nobr> text generated by [display.newText()][api.library.display.newText] or use bitmap fonts.


### Using Embedded Fonts

If your Corona project includes a `.ttf` or `.otf` font file which you want to utilize via [display.newText()][api.library.display.newText] or similar, you must use the following font naming convention &mdash; this is a standard Windows Phone XAML font naming standard which Corona uses to load embedded fonts.

``````lua
local fontName = "<MyFontNamePlusExtension>#<My Font Family Name>"
``````

For example, if you copy a __Times&nbsp;New&nbsp;Roman__ font file named `Times.ttf` into your project's `Assets\Corona` folder, it may be displayed as follows:

``````lua
local myText = display.newText( "My Text", 0, 0, "Times.ttf#Times New Roman", 8 )
``````

In Windows, you can determine a `.ttf` or `.otf` file's font family name by double clicking on it. This will display a window which reveals the font family name in the title bar or next to the __Font&nbsp;name:__ field.

Note that Windows Phone may refuse to load some font files and default to the system font instead. If the operating system refuses to load a particular font that you've provided, you'll need to use a different font file or generate a bitmap font using a bitmap font library.


### Audio Support

For audio playback on Windows Phone, CoronaCards supports the following audio file formats:

* `.ogg` (Ogg Vorbis)
* `.wav` (16-bit uncompressed)

CoronaCards for Windows Phone 8 does __not__ support the audio [recording][api.type.Recording] feature.


### In-App Purchases

CoronaCards for Windows Phone 8 does not support the [store][api.library.store] API and thus does not feature direct <nobr>in-app</nobr> purchase (IAP) support. However, you can implement IAP yourself via [Lua/.NET&nbsp;Communication][coronacards.wp8.communication] &mdash; please inspect the example code [here](https://github.com/olomorolo/CoronaCardsWP8_IAPguide).

### Implementing Missing Features

If your app requires other features which are not [supported][coronacards.wp8.support] by CoronaCards for Windows&nbsp;Phone&nbsp;8, you may be able to implement these features yourself in .NET. Please proceed to the [Lua/.NET&nbsp;Communication][coronacards.wp8.communication] guide for more details.


##

<div class="walkthrough-nav">

__&lang;__ [Guide Index][coronacards.wp8]

</div>
