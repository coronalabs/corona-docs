# Using Plugins in CORONA_NATIVE_PRODUCT&nbsp;&mdash; iOS

To use plugins with CORONA_NATIVE_PRODUCT builds through Xcode, you must include them in `build.settings` just like you would for Corona&nbsp;Simulator builds, for example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.openssl"] =
		{
			publisherId = "com.coronalabs"
		},
	}, 
}
``````

From here, you must run a process which contacts the [Corona Marketplace](https://marketplace.coronalabs.com/) and confirms that you have an active license for the plugin(s). If confirmed, Corona will install the library files and link them to your project.

## Procedure

To perform the process described above, simply follow these steps:

1. Open your project in Xcode.

2. In the Xcode tool bar, click on the __active&nbsp;scheme__ button and select __Download&nbsp;Plugins__:

<div class="code-indent">
<div style="max-width: 375px;">

![][images.docs.native-plugin-ios-1]

</div>
</div>

3. Click on the __Run__ button to download the plugin(s):

<div class="code-indent">
<div style="max-width: 425px;">

![][images.docs.native-plugin-ios-2]

</div>
</div>

4. In the Xcode tool bar, click on the __active&nbsp;scheme__ button again and select your main app. Now you can build your app with any plugin in the [Corona Marketplace](https://marketplace.coronalabs.com/).

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Note that you'll need to download the plugin(s) each time you add or change plugin settings/inclusions within `build.settings`.

</div>
</div>
