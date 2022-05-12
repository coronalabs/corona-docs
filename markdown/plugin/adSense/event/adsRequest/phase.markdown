# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.adSense.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          AdSense, Google Ads, Google AdSense, ads, adsRequest, phase
> __See also__			[adsRequest][plugin.adSense.event.adsRequest]
>						[adSense.*][plugin.adSense]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.adSense.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the AdSense plugin was initialized successfully. You must wait for this event phase before trying to show ads. Also may return [event.isError][plugin.adSense.event.adsRequest.isError] if init failed.

* `"displayed"` &mdash; Indicates that an ad has been displayed successfully via [adSense.show()][plugin.adSense.show].

* `"hidden"` &mdash; Indicates that an Ad has been hidden successfully via [adSense.hide()][plugin.adSense.hide].
