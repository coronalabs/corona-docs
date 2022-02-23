# iCloud.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage
> __Platforms__			iOS, tvOS, macOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The iCloud plugin enables access to Apple's iCloud APIs and provides instruments to synchronize data across a user's devices.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

While iCloud is part of the iOS operating system, users may not log in with their iCloud account, or a user may choose to disable iCloud entirely. Thus, it's important that users can interact with your app even if iCloud is not enabled.

</div>


## iCloud Storage/Sharing

iCloud provides three distinct ways of storing and sharing data:

### Key-Value Storage

__Key-Value Storage__ (KVS) is the easiest aspect of iCloud to use and Apple recommends that all apps benefit from its implementation. Essentially, it provides the ability to associate data (values) with keys (strings). These <nobr>key-value</nobr> pairs are synchronized across all of the user's <nobr>iCloud-enabled</nobr> devices, allowing you to retrieve specific data using the associated key.

Note that storage space for KVS is strictly limited. You can declare a maximum of 1024 keys and the total size of all values should be less than 1&nbsp;MB. Keys should be less than 64 symbols (bytes). You may opt to store all data in a single key with a large set of data or divide the data into multiple keys &mdash; simply note that if a <nobr>key-value</nobr> pair is modified, it will be synchronized as a whole entity, so separating data across several keys may improve synchronization speed and minimize cellular data usage.

### Documents in iCloud

__Documents in iCloud__ is designed to synchronize files across a user's <nobr>iCloud-enabled</nobr> devices and the iCloud plugin provides APIs to read and write these files.

Note that the storage space for Documents in iCloud is limited to the user's iCloud&nbsp;Drive space. Also be aware that the user can manually delete specific stored files via the iOS settings screen, so your app should not assume that a certain file exists in iCloud storage.

### CloudKit

__CloudKit__ is the most recent addition to the iCloud framework. This is a distributed database where you can store records either privately and publicly. Private records can only be accessed by the user who created them, while public records are shared between users. Essentially, CloudKit is a very powerful tool for storing data as well as sharing data between users.

Note that CloudKit storage space "[scales with your users](https://developer.apple.com/icloud/)" but, in general practice, your app should not exceed the free storage limit unless there's a dedicated need for extensive database usage.


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.iCloud"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

	
## Enabling iCloud

Using iCloud requires certain settings within your app's provisioning configuration. You can __not__ use a wildcard App&nbsp;ID with iCloud, so you must configure and use an explicit one \([guide][guide.distribution.iOSBuild]\). To configure iCloud with your app, follow these basic steps:

1. Log into the [Apple Developer](https://developer.apple.com/) portal, enter the __Member&nbsp;Center__, and navigate to the <nobr>__Certificates, Identifiers & Profiles__</nobr> dashboard.

2. Click on __Identifiers__ under the desired platform. There you should see all of your apps listed. Select the app for which you want to add iCloud support and, below the list of services, click __Edit__.

3. In the list of services, select the __iCloud__ checkbox.

4. Generate <nobr>(or regenerate)</nobr> all provisioning profiles that include the selected App&nbsp;ID. For details on this process, please refer to the <nobr>__Creating Provisioning Profiles__</nobr> section [here][guide.distribution.iOSBuild].

<a id="containers"></a>

### iCloud Containers

In addition to the steps above, if you want to use Documents in iCloud or CloudKit, you must associate an __iCloud&nbsp;Container__ with the app as follows:

1. In the [Apple Developer](https://developer.apple.com/) portal, from the same section reached in the steps above, select <nobr>__Include CloudKit support__</nobr> in the __iCloud__ row.

2. In the same row, click the __Edit__ button. Here you can create a new iCloud Container or associate an existing iCloud Container with the app. If you are creating an iCloud Container for the first time, note that you'll need to create/register it first, then repeat this step to associate the new container with the app and iCloud.

3. Generate <nobr>(or regenerate)</nobr> all provisioning profiles that include the selected App&nbsp;ID. For details on this process, please refer to the <nobr>__Creating Provisioning Profiles__</nobr> section [here][guide.distribution.iOSBuild].

### Sharing Data

For Documents in iCloud and CloudKit, you can share the data between multiple apps. This is facilitated by associating a dedicated [iCloud Container](#containers) with each app via the [Apple Developer](https://developer.apple.com/) portal as outlined in the steps above. From that point, CORONA_CORE_PRODUCT will automatically extract the container information during the build process for each platform in which `iCloud` is set to `true`:

``````lua
settings =
{
	iphone =
	{
		iCloud = true,
	},

	tvos =
	{
		-- Optional (only for use with Apple TV and tvOS)
		iCloud = true,
	},

	macos =
	{
		-- Optional (only for use with macOS desktop apps)
		iCloud = true,
	},
}
``````

If using only KVS, you can share data between different apps by specifying a `kvstore-identifier` in the `iphone` table of `build.settings`. This will override the default boolean `true` which simply enables KVS for the same app on the user's <nobr>iCloud-enabled</nobr> devices.

``````lua
settings =
{
	iphone = 
	{
		--iCloud = true,  -- Default
		iCloud = { ["kvstore-identifier"] = "com.example.shared_KVS" },
	}
}
``````


## Functions

<div class="small-header">

Key-Value Storage

</div>

#### [iCloud.setKVSListener()][plugin.iCloud.setKVSListener]

#### [iCloud.set()][plugin.iCloud.set]

#### [iCloud.get()][plugin.iCloud.get]

#### [iCloud.delete()][plugin.iCloud.delete]

#### [iCloud.identityToken()][plugin.iCloud.identityToken]

#### [iCloud.synchronize()][plugin.iCloud.synchronize]

#### [iCloud.table()][plugin.iCloud.table]

<div class="small-header">

Documents in iCloud

</div>

#### [iCloud.docInit()][plugin.iCloud.docInit]

#### [iCloud.docList()][plugin.iCloud.docList]

#### [iCloud.docWrite()][plugin.iCloud.docWrite]

#### [iCloud.docRead()][plugin.iCloud.docRead]

#### [iCloud.docDelete()][plugin.iCloud.docDelete]

#### [iCloud.docCheck()][plugin.iCloud.docCheck]

#### [iCloud.docDownload()][plugin.iCloud.docDownload]

#### [iCloud.docEvict()][plugin.iCloud.docEvict]

#### [iCloud.docConflicts()][plugin.iCloud.docConflicts]

#### [iCloud.docConflictData()][plugin.iCloud.docConflictData]

#### [iCloud.docResolve()][plugin.iCloud.docResolve]

<div class="small-header">

CloudKit

</div>

#### [iCloud.recordCreate()][plugin.iCloud.recordCreate]

#### [iCloud.recordDelete()][plugin.iCloud.recordDelete]

#### [iCloud.recordFetch()][plugin.iCloud.recordFetch]

#### [iCloud.recordFetchMultiple()][plugin.iCloud.recordFetchMultiple]

#### [iCloud.recordQuery()][plugin.iCloud.recordQuery]

#### [iCloud.recordCreateZone()][plugin.iCloud.recordCreateZone]

#### [iCloud.recordAccountStatus()][plugin.iCloud.recordAccountStatus]


## Events

<div class="small-header">

Key-Value Storage

</div>

#### [iCloudKVSEvent][plugin.iCloud.event.iCloudKVSEvent]

<div class="small-header">

Documents in iCloud

</div>

#### [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]

<div class="small-header">

CloudKit

</div>

#### [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]


## Types

<div class="small-header">

CloudKit

</div>

#### [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]


## Examples

##### Key-Value Storage

``````lua
-- This simple example counts user taps across devices and keeps a
-- synchronized counter in the cloud using Key-Value Storage (KVS)

local iCloud = require( "plugin.iCloud" )

-- Create text object for text readout
local text = display.newText( "iCloud", display.contentCenterX, display.contentCenterY, nil, 20 )

-- Set/reset the text readout
local function setText()
	text.text = tostring( iCloud.get( "taps" ) )
end

-- KVS listener function
local function listenKVS( event )
	setText()
end

-- Set the KVS listener
iCloud.setKVSListener( listenKVS )

-- Set the initial text readout
setText()

-- Tap listener function
local function globalTap( event )
	local tapCount = 1 + ( iCloud.get( "taps" ) or 0 )
	iCloud.set( "taps", tapCount )
	iCloud.synchronize()
	setText()
end

-- Detect taps in Runtime
Runtime:addEventListener( "tap", globalTap )
``````
