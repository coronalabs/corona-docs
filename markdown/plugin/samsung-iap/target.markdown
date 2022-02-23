
# store.target

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, target
> __See also__			[system.getInfo()][api.library.system.getInfo]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Indicates the store that the app was built for. It will yield one of the following strings:

* `"apple"` — Always returned on iOS.
* `"google"` — Targets Google Play (only returned on Android).
* `"samsung"` — Targets Samsung Galaxy Store  (only returned on Android).
* `"amazon"` — Targets the Amazon Appstore (only returned on Android).
* `"windows"` — Targets the Windows app store.
* `"none"` — Indicates that the app is not targeting a specific app store. This is always returned by the Corona Simulator.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This property yields the same result as passing `"targetAppStore"` to the [system.getInfo()][api.library.system.getInfo] function.

</div>


## Syntax

	store.target
