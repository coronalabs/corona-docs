# App Localization — iOS

This guide explains how to localize an iOS app for multiple languages/marketplaces.

<div class="guides-toc">

* [Bundle Localizations](#bundlelocalizations)
* [Localized Project Folders](#lproj)
* [Language Testing](#testing)

</div>


<a id="bundlelocalizations"></a>

## Bundle Localizations

The first step in localizing an app is determining which languages you wish to support. Once this is determined:

1. Locate the appropriate <nobr>2-character</nobr> <nobr>__ISO 639-1__</nobr> [language&nbsp;code](http://www.loc.gov/standards/iso639-2/php/code_list.php) for each.

2. In the project `build.settings` file, add these language codes to a `CFBundleLocalizations` table within the <nobr>`settings` &rarr; `iphone` &rarr; `plist`</nobr> table. The order is not important, but make sure that each entry is the <nobr>2-character</nobr> string value appropriate to the language, for example:

<div class="image-indent">

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			CFBundleLocalizations =
			{
				"en",  --English
				"es",  --Spanish
				"it",  --Italian
				"de",  --German
				"fr",  --French
				"ja",  --Japanese
				"ko",  --Korean
			},
		},
	},
}
``````

</div>

3. Add the `CFBundleDisplayName` and `CFBundleName` keys as the app defaults (see [Project&nbsp;Build&nbsp;Settings][guide.distribution.buildSettings] for details). Note that these should reside inside the `plist` table but outside the `CFBundleLocalizations` table.

<div class="image-indent">

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			CFBundleLocalizations =
			{
				"en",  --English
				"es",  --Spanish
				"it",  --Italian
				"de",  --German
				"fr",  --French
				"ja",  --Japanese
				"ko",  --Korean
			},
			CFBundleDisplayName = "Princess",
			CFBundleName = "Princess",
		},
	},
}
``````

</div>



<a id="lproj"></a>

## Localized Project Folders

The second step involves creating a __localized project folder__ for each language in the root project directory alongside `main.lua`.

1. For each language that you specified in the `CFBundleLocalizations` table within `build.settings`, create a new `xx.lproj` folder in the app's root directory, where `xx` represents the <nobr>2-character</nobr> language code.

<div class="image-indent">

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Each folder must be appended with `.lproj`. For instance, the proper folder name for English is `en.lproj`, not merely `en`.

* Each folder must follow <nobr>case-sensitive</nobr> naming. For instance, the proper folder name for English is `en.lproj`, not `EN.lproj`.

</div>

![][images.simulator.localizedfolders1]

</div>

2. Within each of these localized project folders, create a new text file titled `InfoPlist.strings`:

<div class="image-indent">

![][images.simulator.localizedfolders2]

</div>

3. As the contents for each `InfoPlist.strings` file, specify both a `CFBundleDisplayName` and `CFBundleName` line with the proper title for that language, for example:

<div class="image-indent" style="width: 500px;">

__English__ &nbsp;(`en.lproj/InfoPlist.strings`)

``````
CFBundleDisplayName = "Princess";
CFBundleName = "Princess";
``````

__Spanish__ &nbsp;(`es.lproj/InfoPlist.strings`)

``````
CFBundleDisplayName = "La princesa";
CFBundleName = "La princesa";
``````

__Korean__ &nbsp;(`ko.lproj/InfoPlist.strings`)

``````
CFBundleDisplayName = "공주 패션쇼";
CFBundleName = "공주 패션쇼";
``````

</div>




<a id="testing"></a>

## Language Testing

Once the above steps are complete, you can test the bundle names locally to ensure that the localized names appear.

1. Build the app as outlined in the __Build Process__ section of the [Provisioning&nbsp;and&nbsp;Building][guide.distribution.iOSBuild] guide.

2. Install the app as described under __Device Installation__ in the [Provisioning&nbsp;and&nbsp;Building][guide.distribution.iOSBuild] guide.

3. Change the device language setting via __Settings__ &rarr; __General__ &rarr; <nobr>__Language & Region__</nobr> and choose one of the languages within your localization setup. If&nbsp;you configured everything as outlined, the app name should appear as the name you defined for `CFBundleDisplayName` in the respective `InfoPlist.strings` file.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Disclaimer</div>

Changing the device settings must be done entirely at your own risk, especially in regards to language settings. If you change the device language, ensure that you understand the options and menus that will allow you to revert the device to your native language. Corona&nbsp;Labs cannot be held responsible for any settings changes that are conducted without reasonable caution.

</div>