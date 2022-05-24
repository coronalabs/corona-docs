# facebook.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, request
> __See also__			[facebook.*][plugin.facebook-v4a]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to log Facebook App Events.


## Syntax

	facebook.logEvent(eventName [,eventParams] [,valueSum])

##### eventName ~^(required)^~
_[String][api.type.String]._ Event name to log for App Events. Can be a custom or following standard events: `"achievedLevel"`, `"adClick"`, `"adImpression"`, `"addedPaymentInfo"` , `"addedToCart"`, `"addedToWishlist"`, `"completedRegistration"`, `"completedTutorial"` , `"contact"`, `"customizeProduct"`, `"donate"`, `"findLocation"` , `"initiatedCheckout"`, `"rated"`, `"searched"`, `"spentCredits"` , `"startTrial"`, `"submitApplication"`, `"subscribe"`, or `"viewedContent"`. For more information, see [this document](https://developers.facebook.com/docs/app-events/reference#standard-event-parameters-3)

##### eventParams ~^(optional)^~
_[Table][api.type.Table]._ Table of key/value pairs passed as params for FB App Events. Can be a key/value or use the standard keys: `"adType"`, `"content"`, `"contentID"`, `"contentType"` , `"currency"`, `"description"`, `"level"`, `"maxRatingValue"`, `"numItems"`, `"orderID"`, `"paymentInfoAvailable"` , `"registrationMethod"`, `"searchString"`, or `"success"`. For more information, see [this document](https://developers.facebook.com/docs/app-events/reference#standard-event-parameters-3).

##### valueSum ~^(optional)^~
_[Number][api.type.Number]._ Number value passed as params for FB App Events. For more information, see [this document](https://developers.facebook.com/docs/app-events/reference#standard-event-parameters-3).


## Examples

##### Log Achieved Level

``````lua
facebook.logEvent( "achievedLevel", { level="Level 1" } )
``````

##### Log Spend Credits

``````lua
facebook.logEvent( "spentCredits", { contentID="skin1", contentType="skin", content="solar skin" }, 12 ) -- Total value of credits spent=12
``````
