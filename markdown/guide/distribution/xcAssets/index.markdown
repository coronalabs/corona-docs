# Managing Xcode Assets

This guide outlines how to customize __app&nbsp;icons__ and related assets for <nobr>Apple-based</nobr> apps <nobr>(iOS and tvOS)</nobr> built with Corona.

<div class="guides-toc">

* [Xcode Assets Folder](#assetsfolder)
* [Build Settings](#buildsettings)

</div>


<a id="assetsfolder"></a>

## Xcode Assets Folder

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

For iOS apps targeting iOS&nbsp;11 or later, you __must__ include and reference the `Images.xcassets` folder as outlined in this section, otherwise your app will be rejected upon submission to the App&nbsp;Store.

For your convenience, a default `Images.xcassets` folder is automatically added to all new Corona project templates. The same folder is also bundled with the Corona application itself, in case you need to copy it over to existing projects. It&nbsp;can be found within the CORONA_CORE_PRODUCT application folder here:

<nobr>`/Applications/Corona/Resources/Resource Library/iOS/Images.xcassets`</nobr>

</div>
</div>

To include and reference the `Images.xcassets` folder within your Corona project, proceed as follows:

1. In the Finder, locate (or&nbsp;copy&nbsp;in) the `Images.xcassets` folder. Copy the entire folder to your project.

2. Open the folder and locate the `AppIcon.appiconset` folder. This contains the full set of iOS app icons as follows:

<div class="code-indent">
<div class="inner-table">

File						Size (w&times;h)
--------------------------	------------------
`Icon-40.png`				40 &times; 40
`Icon-58.png`				58 &times; 58
`Icon-76.png`				76 &times; 76
`Icon-80.png`				80 &times; 80
`Icon-87.png`				87 &times; 87
`Icon-120.png`				120 &times; 120
`Icon-152.png`				152 &times; 152
`Icon-167.png`				167 &times; 167
`Icon-180.png`				180 &times; 180
`Icon-1024.png`				1024 &times; 1024
--------------------------	------------------

</div>
</div>

3. Using these __exact__ names and sizes as a guideline, create your own custom icon files and __replace__ the default files in the `AppIcon.appiconset` folder. To avoid potential incompatibilities, your images should be <nobr>non-interlaced</nobr> and they shouldn't contain an embedded ICC profile.

<div class="code-indent">

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you're updating an older Corona project or template to use the `Images.xcassets` folder, you can simply __move__ the <nobr>similarly-named</nobr> icon files from the root project folder <nobr>(alongside `main.lua`)</nobr> to the `Images.xcassets/AppIcon.appiconset` folder. However, note that you must also __add__ the 1024&times;1024 <nobr>`Icon-1024.png`</nobr> file to be used for the App&nbsp;Store banner icon.

</div>
</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Instead of replacing files manually, you may alternatively edit the Asset&nbsp;Catalog directly via Xcode by dragging and dropping it onto the Xcode dock icon. This will open a detailed UI with ability to add supplemental icons, see warnings about improperly sized or formatted icons, etc.

</div>

</div>

4. If no tvOS release is planned, you can delete both the `AppIconTV.brandassets` and `LaunchImageTV.launchimage` folders within the `Images.xcassets` folder. This will not affect how icons are generated for iOS.




<a id="buildsettings"></a>

## Build Settings

Next, you must reference and link up the `Images.xcassets` folder with the Corona project:

1. Open the Corona project's `build.settings` file.

2. If you're updating an older Corona project or template to use the icons within <nobr>`Images.xcassets/AppIcon.appiconset`</nobr>, __remove__ the entire `CFBundleIconFiles` table <nobr>(`settings` &rarr; `iphone` &rarr; `plist` &rarr; `CFBundleIconFiles`)</nobr>.

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[8,9,10,11,12,13,14,15,16,17,18]" }
settings =
{
	iphone =
	{
		plist =
		{
			UILaunchStoryboardName = "LaunchScreen",
			CFBundleIconFiles = {
				"Icon-40.png",
				"Icon-58.png",
				"Icon-76.png",
				"Icon-80.png",
				"Icon-87.png",
				"Icon-120.png",
				"Icon-152.png",
				"Icon-167.png",
				"Icon-180.png",
			},
		},
	},
}
``````

</div>

3. In the <nobr>`settings` &rarr; `iphone`</nobr> table, add the <nobr>key-value</nobr> pair of <nobr>`xcassets = "Images.xcassets"`</nobr>. Note that this entry goes in the <nobr>top-level</nobr> `iphone` table, __not__ within its `plist` child table.

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings =
{
	iphone =
	{
		xcassets = "Images.xcassets",
		plist =
		{
			UILaunchStoryboardName = "LaunchScreen",
		},
	},
}
``````

</div>

4. Save your `build.settings` file. 

That's it! With all of these aspects in place, Corona will build the app using the specified Xcode&nbsp;Asset&nbsp;Catalog (`Images.xcassets`) to generate assets, icons, and `plist` entries.


<!---

<a id="legacy"></a>

## Legacy Method

For iOS, all icons should adhere to the names and sizes listed below. For detailed information on creating icons, please refer to the [iOS Human Interface Guidelines](https://developer.apple.com/ios/human-interface-guidelines/graphics/app-icon/).

<div class="inner-table">

File						Size (w&times;h)
--------------------------	------------------
`Icon-40.png`				40 &times; 40
`Icon-58.png`				58 &times; 58
`Icon-76.png`				76 &times; 76
`Icon-80.png`				80 &times; 80
`Icon-87.png`				87 &times; 87
`Icon-120.png`				120 &times; 120
`Icon-152.png`				152 &times; 152
`Icon-167.png`				167 &times; 167
`Icon-180.png`				180 &times; 180
--------------------------	------------------

</div>

Additionally, you must specify these file names in the `CFBundleIconFiles` table as follows:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7,8,9,10,11,12,13,14,15,16,17]" }
settings =
{
	iphone =
	{
		plist =
		{
			CFBundleIconFiles = {
				"Icon-40.png",
				"Icon-58.png",
				"Icon-76.png",
				"Icon-80.png",
				"Icon-87.png",
				"Icon-120.png",
				"Icon-152.png",
				"Icon-167.png",
				"Icon-180.png",
			},
		},
	},
}
``````

-->
