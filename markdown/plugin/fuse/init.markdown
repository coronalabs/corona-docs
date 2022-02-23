# fuse.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, init
> __See also__          [fuse.checkLoaded()][plugin.fuse.checkLoaded]
>						[fuse.show()][plugin.fuse.show]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes the Fuse service. It should only be called once.

Upon initialization, a few ads for the default [ad zone][guide.monetization.fuse.zones] will be loaded and cached. Each time an ad is consumed (shown) via [fuse.show()][plugin.fuse.show], Fuse will attempt to cache ads for the requested zone plus one additional zone. If you want to <nobr>pre-load</nobr> ads for a specific zone instead of relying on the initial default cache, call [fuse.load()][plugin.fuse.load] with a specified zone.


## Syntax

	fuse.init( appID, listener )

##### appID ~^(required)^~
_[String][api.type.String]._ String containing the Fuse App ID associated with your app.

* To get a new App ID, create an app in the Fuse [dashboard](https://dashboard.fusepowered.com/).
* For an existing Fuse app, navigate to the app home page where you can find the App&nbsp;ID listed directly below the app name shown at the top of the page.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.fuse.event.adsRequest] events.

