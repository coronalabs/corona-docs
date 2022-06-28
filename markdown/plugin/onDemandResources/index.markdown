# onDemandResources.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__			on-demand resources, onDemandResources
> __Platforms__			tvOS, iOS
> __See also__			[Apple TV and tvOS][guide.distribution.tvos] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The [onDemandResources](https://marketplace.coronalabs.com/plugin/on-demand-resources) plugin provides an interface for Apple's [on-demand resources](https://developer.apple.com/library/tvos/documentation/FileManagement/Conceptual/On_Demand_Resources_Guide/), applicable to tvOS.

Usage of <nobr>on-demand</nobr> resources can be essential for developing tvOS games and apps since there is a [limit](https://developer.apple.com/library/ios/documentation/FileManagement/Conceptual/On_Demand_Resources_Guide/PlatformSizesforOn-DemandResources.html) of 200&nbsp;MB for the app bundle.

Essentially, <nobr>on-demand</nobr> resources allow you to split your app into parts and download specific assets/resources when you require them. This technique can also be utilized to minimize the app's initial download size and reduce the footprint size in the device's storage.


## Tags

When using <nobr>on-demand</nobr> resources, you should separate parts of your app into downloadable packages and reference them with __tags__. Each tag can point to an individual resource (file) or a group of resources (folder). By default, these resources will be excluded from the app bundle and will be available only after the app is downloaded.

See the [instructions](#configureODR) below regarding configuration of <nobr>on-demand</nobr> resources/tags.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Resources must be available before you attempt to use them. This is accomplished via [onDemandResources.request()][plugin.onDemandResources.request] which can both check the availability of resources __or__ download them. If the desired resources are not available, you should request their download and wait for a successful callback response before attempting to use them.

* Once resources are successfully requested and downloaded, they can be safely accessed until the application is terminated.

* Even though you can typically use <nobr>on-demand</nobr> resources as if they exist in your app's bundle, they are not physically there. Use [system.pathForFile()][api.library.system.pathForFile] to retrieve the actual path, or alternatively the convenience function [onDemandResources.path()][plugin.onDemandResources.path]. This may be necessary when, for example, an <nobr>on-demand</nobr> resource is a text file <nobr>(not an image)</nobr> and [io.open()][api.library.io.open] is required to open the file and read its contents ([guide][guide.data.readWriteFiles]).

</div>


## Gotchas

* You should not assign unique tags to both a folder and a nested folder within it. For example, if you assign a tag to `assets/images`, you should not assign a separate tag to `assets/images/level1` because, inherently, the `level1` resources are already included as part of the broader tag.

* If the operating system requires storage space, it may automatically cycle through tags and evict downloaded content. By&nbsp;default, resources which have not been used recently will be prioritized for eviction, although you can manage eviction behavior with [onDemandResources.setPreservationPriority()][plugin.onDemandResources.setPreservationPriority].

* <nobr>On-demand</nobr> resources only function in distributed apps. To test functionality prior to release, use a service such as [TestFlight](https://developer.apple.com/testflight/).


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.onDemandResources"] =
		{
			publisherId = "com.coronalabs"
		},
	},		
}
``````

<a id="configureODR"></a>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To configure <nobr>on-demand</nobr> resources, include the `onDemandResources` table within the `tvos` and/or `ios` table of `build.settings`. This table should consist of a series of entries ([tables][api.type.Table]) which define the packages for <nobr>on-demand</nobr> resources. Each of these tables must include a required `tag` key ([string][api.type.String]) and a required `resource` key ([string][api.type.String]) which can reference either a specific file or a folder containing multiple resources.

In addition, you can include an optional `type` key equal to either of these values:

* `"install"` &mdash; These resources will be downloaded immediately when the app is downloaded from the App&nbsp;Store. This is useful for resources which may be required immediately when the app is first launched. In contrast to assets which are simply <nobr>pre-bundled</nobr> within your project folder for persistent availability, <nobr>on-demand</nobr> resources tagged with `"install"` may still be evicted from local storage at some point.

* `"prefetch"` &mdash; These resources will begin to download in the background immediately after the app is downloaded from the App&nbsp;Store.

``````lua
settings =
{
	tvos =
	{
		onDemandResources =
		{
			{ tag="introMusic", resource="intro.mp4", type="prefetch" },
			{ tag="imgTutorial", resource="img/tutorial", type="install" },
			{ tag="imgL1", resource="img/level1" },
		},
	},
	iphone = 
	{
		onDemandResources =
		{
			{ tag="introMusic", resource="intro.mp4", type="prefetch" },
			{ tag="imgTutorial", resource="img/tutorial", type="install" },
			{ tag="imgL1", resource="img/level1" },
		},
	},

}
``````

</div>


## Functions

#### [onDemandResources.request()][plugin.onDemandResources.request]

#### [onDemandResources.progress()][plugin.onDemandResources.progress]

#### [onDemandResources.pause()][plugin.onDemandResources.pause]

#### [onDemandResources.resume()][plugin.onDemandResources.resume]

#### [onDemandResources.cancel()][plugin.onDemandResources.cancel]

#### [onDemandResources.path()][plugin.onDemandResources.path]

#### [onDemandResources.getDownloadPriority()][plugin.onDemandResources.getDownloadPriority]

#### [onDemandResources.setDownloadPriority()][plugin.onDemandResources.setDownloadPriority]

#### [onDemandResources.getPreservationPriority()][plugin.onDemandResources.getPreservationPriority]

#### [onDemandResources.setPreservationPriority()][plugin.onDemandResources.setPreservationPriority]

#### [onDemandResources.setEventListener()][plugin.onDemandResources.setEventListener]


## Events

#### [onDemandResourcesEvent][plugin.onDemandResources.event.onDemandResourcesEvent]
