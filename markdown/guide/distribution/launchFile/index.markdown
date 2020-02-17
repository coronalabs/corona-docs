# Building Launch Screens &mdash; iOS

This guide outlines how to customize a <nobr>storyboard-based</nobr> document for displaying a __launch&nbsp;screen__ when an iOS app starts.

<div class="guides-toc">

* [Xcode Configuration](#xcode)
* [Build Settings](#buildsettings)

</div>


<a id="xcode"></a>

## Xcode Configuration

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

As the foundation for this guide, please use our [project template](https://github.com/coronalabs/launchimage/archive/master.zip) which contains the basic required files.

1. Download the [project template](https://github.com/coronalabs/launchimage/archive/master.zip) <nobr>(`launchimage-master.zip`)</nobr> from our GitHub repository and unzip it.

2. Double click on the `LaunchImage.xcodeproj` file to launch Xcode.

</div>
</div>

Xcode is a powerful and comprehensive development tool which may seem overwhelming. Fortunately, our project template considerably streamlines the configuration process. Assuming you've downloaded and opened the [template](https://github.com/coronalabs/launchimage/archive/master.zip) as outlined above, simply follow these steps:

1. In Xcode, within the left-side Navigator column, expand the <nobr>__LaunchImage__ &rarr; __LaunchImage__</nobr> folder tree:

<div class="code-indent" style="max-width: 750px; margin-bottom: -10px;">

![][images.docs.launchimage-ios-1]

</div>

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If the Navigator is not visible, reveal it via <nobr>__View__ &rarr; __Navigators__ &rarr;</nobr> __Show&nbsp;Navigator__ <nobr>(⌘-0)</nobr>.

</div>
</div>
</div>

2. In the Navigator folder tree, select the `Assets.xcassets` entry:

<div class="code-indent" style="max-width: 750px;">

![][images.docs.launchimage-ios-2]

</div>

3. In your desired image editing application, create three images. You'll need a "base" version plus one version doubled in size and another tripled in size. These don't need to adhere to specific pixel sizes since they will be scaled to fit the `UIImageView` while maintaining the original aspect ratio.

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

We include three sample images within the project template package which you can use for testing.

</div>
</div>
</div>

4. Save/copy the three images to your Corona project's root folder <nobr>(alongside `main.lua`)</nobr> with an <nobr>iOS-style</nobr> suffix scheme of `Launch.png`, `Launch@2x.png`, and `Launch@3x.png` respectively.

5. Back in Xcode, in the central pane, select the `Launch` entry:

<div class="code-indent" style="max-width: 750px;">

![][images.docs.launchimage-ios-3]

</div>

6. Directly to its right, you'll notice three "slots" labeled as __1x__, __2x__, and&nbsp;__3x__. From the Finder, drag the images you created earlier into their respective slots: `Launch.png` into the __1x__&nbsp;slot, `Launch@2x.png` into the __2x__&nbsp;slot, and `Launch@3x.png` into the __3x__&nbsp;slot:

<div class="code-indent" style="max-width: 750px;">

![][images.docs.launchimage-ios-4]

![][images.docs.launchimage-ios-5]

</div>

7. Now, in the left-side Navigator column, select the `LaunchScreen.storyboard` file:

<div class="code-indent" style="max-width: 750px;">

![][images.docs.launchimage-ios-6]

</div>

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

In the center pane, if you select <nobr>__View Controller Scene__</nobr>, you should see an approximate preview of what the launch screen will look like. Further adjustments and design of this storyboard are beyond the scope of this guide&nbsp;&mdash; we simply outline how to generate a basic launch screen with an image in the center.

</div>
</div>
</div>

8. Save your project now, then select <nobr>__File__ &rarr; __Export...__</nobr> from the main Xcode application menu.

<div class="code-indent">
<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Before exporting, ensure that `LaunchScreen.storyboard` is still selected in the <nobr>left-side</nobr> Navigator column&nbsp;&mdash; this is essential to generate the proper file type.

</div>
</div>

9. In the export dialog panel, navigate to your Corona project's root folder. Then, near the bottom, locate the __File&nbsp;Format__ selection box and change the selection to <nobr>__Interface Builder Storyboard Package__</nobr>.

<div class="code-indent" style="max-width: 530px; margin-bottom: -10px;">

![][images.docs.launchimage-ios-7]

</div>

<div class="code-indent">
<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

It's critical that you select <nobr>__Interface Builder Storyboard Package__</nobr> for this step&nbsp;&mdash; do __not__ use the default option.

</div>
</div>
</div>

10. When you're ready, click __Save__ to create a `LaunchScreen.storyboardc` folder for your project.

<div class="docs-tip-outer" style="background-color: #ffa752; margin-top: 24px;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

To ensure that you did everything properly, please follow this checklist:

1. In the Finder, navigate to your Corona project's root folder.

2. Inside, check for a `LaunchScreen.storyboardc` file. If it doesn't exist, you may have forgotten to choose the proper location <nobr>(the project's root folder)</nobr> when exporting the file. If&nbsp;necessary, repeat steps <nobr>8-10</nobr> above.

3. Get further information on the `LaunchScreen.storyboardc` file <nobr>(⌘-I)</nobr>. Its kind should be an <nobr>__Interface Builder Compiled Storyboard Document__</nobr>. If it's not, you may have forgotten to choose the correct __file&nbsp;format__ when exporting the file. If&nbsp;necessary, repeat steps <nobr>8-10</nobr> above.

4. Check that the folder contains the three images which will be used for the launch screen: `Launch.png`, `Launch@2x.png`, and `Launch@3x.png`. If these files don't exist, you may have forgotten to save/copy them to the root folder.

</div>
</div>




<a id="buildsettings"></a>

## Build Settings

One final aspect is required to link up your new compiled storyboard package with the Corona project:

1. Open the Corona project's `build.settings` file.

2. Within the `iphone` &rarr; `plist` table, add a `UILaunchStoryboardName` key with a value of `"LaunchScreen"`:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[8]" }
settings =
{
	iphone =
	{
		plist =
		{
			CFBundleIconFiles = {},  -- Required!
			UILaunchStoryboardName = "LaunchScreen",  -- Required!
		},
	},
}
``````

</div>

3. Save your `build.settings` file. 

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you have a `UILaunchImages` key and associated <nobr>sub-tables</nobr> in your `plist` table <nobr>(see below)</nobr>, you __must__ remove it, along with all of the image files associated with that setup. The `UILaunchStoryboardName` key supersedes it and the `LaunchScreen.storyboardc` file will control all of your launch screens.

</div>




<a id="alternative"></a>

## Static Method

An alternative method to creating a `LaunchScreen.storyboardc` file is to include a set of static images within your project folder, then link them up within the project's `build.settings` file. These images must adhere to the names/sizes indicated below and they must be placed in the project's root directory alongside `main.lua`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you have followed the steps above to create a <nobr>storyboard-based</nobr> launch screen, you can ignore this section entirely. The following information is only provided for those developers who want to use a wide array of static image files for launch screens.

</div>

<div class="inner-table">

File									Size (w&times;h)	Orientation		Target Devices
--------------------------------------	------------------	--------------	--------------------
`Default@2x.png`						640 &times; 960		portrait		iPhone 4s
`Default-568h@2x.png`					640 &times; 1136	portrait		iPhone 5 / 5s
`Default-Landscape-568h@2x.png`			1136 &times; 640	landscape		iPhone 5 / 5s
`Default-667h@2x.png`					750 &times; 1334	portrait		iPhone 6 / 6s / 7
`Default-Landscape-667h@2x.png`			1334 &times; 750	landscape		iPhone 6 / 6s / 7
`Default-736h@3x.png`					1242 &times; 2208	portrait		iPhone 6 Plus / 6s Plus / 7 Plus
`Default-Landscape-736h@3x.png`			2208 &times; 1242	landscape		iPhone 6 Plus / 6s Plus / 7 Plus
`Default-Portrait.png`					768 &times; 1024	portrait		iPad 2 / 3, iPad Mini 1
`Default-Landscape.png`					1024 &times; 768	landscape		iPad 2 / 3, iPad Mini 1
`Default-Portrait@2x.png`				1536 &times; 2048	portrait		<nobr>iPad 4, iPad Air, iPad Mini 2 / 3 / 4, iPad Pro 9.7"</nobr>
`Default-Landscape@2x.png`				2048 &times; 1536	landscape		<nobr>iPad 4, iPad Air, iPad Mini 2 / 3 / 4, iPad Pro 9.7"</nobr>
`Default-Portrait-1366@2x.png`			2048 &times; 2732	portrait		iPad Pro 12"
`Default-Landscape-1366@2x.png`			2732 &times; 2048	landscape		iPad Pro 12"
--------------------------------------	------------------	--------------	--------------------

</div>

Once you've added these files to your project folder, you must specify their existence and other definitions in the `UILaunchImages` table of `build.settings`:

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			-- Required launch image files/definitions table
			UILaunchImages = {
				{  -- iPhone 4 Portrait
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default",
					["UILaunchImageOrientation"] = "Portrait",
					["UILaunchImageSize"] = "{320, 480}"
				},
				{  -- iPhone 4 LandscapeLeft
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default",
					["UILaunchImageOrientation"] = "LandscapeLeft",
					["UILaunchImageSize"] = "{320, 480}"
				},
				{  -- iPhone 4 LandscapeRight
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default",
					["UILaunchImageOrientation"] = "LandscapeRight",
					["UILaunchImageSize"] = "{320, 480}"
				},
				{  -- iPhone 5 Portrait
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default-568h",
					["UILaunchImageOrientation"] = "Portrait",
					["UILaunchImageSize"] = "{320, 568}"
				},
				{  -- iPhone 5 LandscapeLeft
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default-568h",
					["UILaunchImageOrientation"] = "LandscapeLeft",
					["UILaunchImageSize"] = "{320, 568}"
				},
				{  -- iPhone 5 LandscapeRight
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default-568h",
					["UILaunchImageOrientation"] = "LandscapeRight",
					["UILaunchImageSize"] = "{320, 568}"
				},
				{  -- iPad Portrait
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default-Portrait",
					["UILaunchImageOrientation"] = "Portrait",
					["UILaunchImageSize"] = "{768, 1024}"
				},
				{  -- iPad LandscapeLeft
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default-Landscape",
					["UILaunchImageOrientation"] = "LandscapeLeft",
					["UILaunchImageSize"] = "{768, 1024}"
				},
				{  -- iPad LandscapeRight
					["UILaunchImageMinimumOSVersion"] = "7.0",
					["UILaunchImageName"] = "Default-Landscape",
					["UILaunchImageOrientation"] = "LandscapeRight",
					["UILaunchImageSize"] = "{768, 1024}"
				},
				{  -- iPhone 6 Portrait
					["UILaunchImageMinimumOSVersion"] = "8.0",
					["UILaunchImageName"] = "Default-667h",
					["UILaunchImageOrientation"] = "Portrait",
					["UILaunchImageSize"] = "{375, 667}"
				},
				{  -- iPhone 6 LandscapeLeft
					["UILaunchImageMinimumOSVersion"] = "8.0",
					["UILaunchImageName"] = "Default-667h",
					["UILaunchImageOrientation"] = "LandscapeLeft",
					["UILaunchImageSize"] = "{375, 667}"
				},
				{  -- iPhone 6 LandscapeRight
					["UILaunchImageMinimumOSVersion"] = "8.0",
					["UILaunchImageName"] = "Default-667h",
					["UILaunchImageOrientation"] = "LandscapeRight",
					["UILaunchImageSize"] = "{375, 667}"
				},
				{  -- iPhone 6 Plus Portrait
					["UILaunchImageMinimumOSVersion"] = "8.0",
					["UILaunchImageName"] = "Default-736h",
					["UILaunchImageOrientation"] = "Portrait",
					["UILaunchImageSize"] = "{414, 736}"
				},
				{  -- iPhone 6 Plus LandscapeLeft
					["UILaunchImageMinimumOSVersion"] = "8.0",
					["UILaunchImageName"] = "Default-Landscape-736h",
					["UILaunchImageOrientation"] = "LandscapeLeft",
					["UILaunchImageSize"] = "{414, 736}"
				},
				{  -- iPhone 6 Plus LandscapeRight
					["UILaunchImageMinimumOSVersion"] = "8.0",
					["UILaunchImageName"] = "Default-Landscape-736h",
					["UILaunchImageOrientation"] = "LandscapeRight",
					["UILaunchImageSize"] = "{414, 736}"
				},
				{  -- iPad Pro Portrait
					["UILaunchImageMinimumOSVersion"] = "9.0",
					["UILaunchImageName"] = "Default-Portrait-1366",
					["UILaunchImageOrientation"] = "Portrait",
					["UILaunchImageSize"] = "{1024, 1366}"
				},
				{  -- iPad Pro Landscape Right
					["UILaunchImageMinimumOSVersion"] = "9.0",
					["UILaunchImageName"] = "Default-Landscape-1366",
					["UILaunchImageOrientation"] = "LandscapeRight",
					["UILaunchImageSize"] = "{1024, 1366}"
				},
				{  -- iPad Pro Landscape Left
					["UILaunchImageMinimumOSVersion"] = "9.0",
					["UILaunchImageName"] = "Default-Landscape-1366",
					["UILaunchImageOrientation"] = "LandscapeLeft",
					["UILaunchImageSize"] = "{1024, 1366}"
				},
			},
		},
	},
}
``````
