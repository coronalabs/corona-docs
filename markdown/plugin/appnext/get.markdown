# appnext.get*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Functions][api.type.Function]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, get
> __See also__          [appnext.set*][plugin.appnext.set]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

When you create an Appnext ad via [appnext.createAd()][plugin.appnext.createAd], you can include a wide array of parameters to customize the look and behavior of the ad.

Following creation of the ad, all parameters can also be __read__ by calling the following functions.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Certain parameters apply only to specific ad types, per the indicated sections.
* Parameters can also be set via corresponding [appnext.set*][plugin.appnext.set] functions.

</div>

### General

* [appnext.getCategories()][plugin.appnext.getCategories]
* [appnext.getPostback()][plugin.appnext.getPostback]
* [appnext.getButtonText()][plugin.appnext.getButtonText]
* [appnext.getButtonColor()][plugin.appnext.getButtonColor]
* [appnext.getPreferredOrientation()][plugin.appnext.getPreferredOrientation]
* [appnext.getBackButtonCanClose()][plugin.appnext.getBackButtonCanClose]
* [appnext.getMute()][plugin.appnext.getMute]

### Interstitial

* [appnext.getCreativeType()][plugin.appnext.getCreativeType]
* [appnext.getSkipText()][plugin.appnext.getSkipText]
* [appnext.getAutoPlay()][plugin.appnext.getAutoPlay]

### Full-Screen / Rewarded

* [appnext.getProgressType()][plugin.appnext.getProgressType]
* [appnext.getProgressColor()][plugin.appnext.getProgressColor]
* [appnext.getVideoLength()][plugin.appnext.getVideoLength]
* [appnext.getCloseDelay()][plugin.appnext.getCloseDelay]
* [appnext.getShowClose()][plugin.appnext.getShowClose]

### Rewarded

* [appnext.getRewardsTransactionId()][plugin.appnext.getRewardsTransactionId]
* [appnext.getRewardsUserId()][plugin.appnext.getRewardsUserId]
* [appnext.getRewardsRewardTypeCurrency()][plugin.appnext.getRewardsRewardTypeCurrency]
* [appnext.getRewardsAmountRewarded()][plugin.appnext.getRewardsAmountRewarded]
* [appnext.getRewardsCustomParameter()][plugin.appnext.getRewardsCustomParameter]
