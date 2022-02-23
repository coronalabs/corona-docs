# event.payload

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [adsRequest][plugin.fuse.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, adsRequest, payload
> __See also__			[adsRequest][plugin.fuse.event.adsRequest]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When a user completes an action, for example accepts an offer or completes a task like watching a video, an [adsRequest][plugin.fuse.event.adsRequest] event will be dispatched to the listener function specified in [fuse.init()][plugin.fuse.init] with [event.phase][plugin.fuse.event.adsRequest.phase] equal to `"completed"`. At this point, the `event.payload` property ([table][api.type.Table]) provides your app with the context of that action so it can behave accordingly.

## Payload Values

The `event.payload` property is a [table][api.type.Table] and the properties contained within depend on the [event.type][plugin.fuse.event.adsRequest.type].

### Rewarded Video

For a rewarded video, the [event.type][plugin.fuse.event.adsRequest.type] will be `"rewarded"` and `event.payload` will contain:

* `preRollMessage` — [String][api.type.String] message displayed when the reward is offered (before the video starts playing).
* `rewardMessage` — [String][api.type.String] message displayed when the reward is granted (when the video is completed).
* `rewardItem` — [String][api.type.String] name of the rewarded virtual currency/item.
* `rewardAmount` — The rewarded virtual currency amount \([number][api.type.Number]\).
* `rewardItemId` — The rewarded item ID \([number][api.type.Number]\) as specified in the Fuse Dashboard.

### Virtual Goods Offer

For a virtual goods offer, the [event.type][plugin.fuse.event.adsRequest.type] will be `"virtualGoodsOffer"` and `event.payload` will contain:

* `purchaseCurrency` — [String][api.type.String] name of the virtual currency used to make the purchase.
* `purchasePrice` — The amount of virtual currency required to make the purchase \([number][api.type.Number]\).
* `itemName` — [String][api.type.String] name of the offered virtual good.
* `itemAmount` — The amount of the offered virtual good \([number][api.type.Number]\).
* `startTime` — Start time of the offer \([number][api.type.Number]\).
* `endTime` — End time of the offer \([number][api.type.Number]\).
* `currencyID` — ID of the virtual currency used to make the purchase \([number][api.type.Number]\).
* `virtualGoodID` — ID of the offered virtual good \([number][api.type.Number]\).

### In-App Purchase Offer

For an in-app purchase offer, the [event.type][plugin.fuse.event.adsRequest.type] will be `"iapOffer"` and `event.payload` will contain:

* `productID` — [String][api.type.String] ID of the in-app purchase.
* `productPrice` — Price of the in-app purchase \([number][api.type.Number]\) (`0` or the value in local currency if available, for example `2.99`).
* `itemName` — [String][api.type.String] The name of the offered item or currency.
* `itemAmount` — The amount of the offered item or currency \([number][api.type.Number]\).
* `startTime` — Start time of the offer \([number][api.type.Number]\).
* `endTime` — End time of the offer \([number][api.type.Number]\).
