# appnext.set*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Functions][api.type.Function]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, set
> __See also__          [appnext.get*][plugin.appnext.get]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

When you create an Appnext ad via [appnext.createAd()][plugin.appnext.createAd], you can include a wide array of parameters to customize the look and behavior of the ad.

Following creation of the ad, all parameters can also be __set__ by calling the following functions.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Certain parameters apply only to specific ad types, per the indicated sections.
* Parameters can also be read/retrieved via corresponding [appnext.get*][plugin.appnext.get] functions.

</div>

### General

* [appnext.setCategories()][plugin.appnext.setCategories]
* [appnext.setPostback()][plugin.appnext.setPostback]
* [appnext.setButtonText()][plugin.appnext.setButtonText]
* [appnext.setButtonColor()][plugin.appnext.setButtonColor]
* [appnext.setPreferredOrientation()][plugin.appnext.setPreferredOrientation]
* [appnext.setBackButtonCanClose()][plugin.appnext.setBackButtonCanClose]
* [appnext.setMute()][plugin.appnext.setMute]

### Interstitial

* [appnext.setCreativeType()][plugin.appnext.setCreativeType]
* [appnext.setSkipText()][plugin.appnext.setSkipText]
* [appnext.setAutoPlay()][plugin.appnext.setAutoPlay]

### Full-Screen / Rewarded

* [appnext.setProgressType()][plugin.appnext.setProgressType]
* [appnext.setProgressColor()][plugin.appnext.setProgressColor]
* [appnext.setVideoLength()][plugin.appnext.setVideoLength]
* [appnext.setCloseDelay()][plugin.appnext.setCloseDelay]
* [appnext.setShowClose()][plugin.appnext.setShowClose]

### Rewarded

* [appnext.setRewardsTransactionId()][plugin.appnext.setRewardsTransactionId]
* [appnext.setRewardsUserId()][plugin.appnext.setRewardsUserId]
* [appnext.setRewardsRewardTypeCurrency()][plugin.appnext.setRewardsRewardTypeCurrency]
* [appnext.setRewardsAmountRewarded()][plugin.appnext.setRewardsAmountRewarded]
* [appnext.setRewardsCustomParameter()][plugin.appnext.setRewardsCustomParameter]
