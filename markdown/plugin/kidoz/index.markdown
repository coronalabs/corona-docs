
# kidoz.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

<!---

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-kidoz]

</div>

-->

KIDOZ is a child-friendly content discovery platform, allowing you to boost app revenue and
engagement without compromising on user experience and fun. Unique features include:

* [COPPA](https://www.ftc.gov/enforcement/rules/rulemaking-regulatory-reform-proceedings/childrens-online-privacy-protection-rule) compliant in accordance with Federal Trade Commission laws regulating children's digital privacy and safety.
* Unlike most ad networks, apps using KIDOZ can be included in the family section of the Google&nbsp;Play&nbsp;Store according to Google's [Designed for Families](https://developer.android.com/distribute/googleplay/families/about.html) program requirements.
* Non-intrusive SDK specially made for kids which keeps your app nice and clean.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

FeedView type ads were deprecated in plugin version 1.4.2 (KIDOZ sdk version 0.8.3.2) and are no longer available.

FlexiView and VideoUnit type ads were deprecated in plugin version 1.4.5 (KIDOZ sdk version 0.8.5.1) and are no longer available.

</div>


## Registration

Before you can use this plugin, you must [register](http://accounts.kidoz.net/publishers/register) with KIDOZ.


## Syntax

	local kidoz = require( "plugin.kidoz" )


## Functions

#### [kidoz.init()][plugin.kidoz.init]

#### [kidoz.load()][plugin.kidoz.load]

#### [kidoz.show()][plugin.kidoz.show]

#### [kidoz.hide()][plugin.kidoz.hide]

#### [kidoz.isLoaded()][plugin.kidoz.isLoaded]


## Events

#### [adsRequest][plugin.kidoz.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.kidoz"] =
		{
			publisherId = "com.coronalabs"
		},
	},
	iphone =
    {
        plist = {
            SKAdNetworkItems = {
                {
                    SKAdNetworkIdentifier = "v79kvwwj4g.skadnetwork",
                },
            },
        },
    },
}

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`

</div>  
