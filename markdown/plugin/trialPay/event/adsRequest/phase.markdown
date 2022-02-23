# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.trialPay.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, TrialPay, adsRequest, phase
> __See also__			[adsRequest][plugin.trialPay.event.adsRequest]
>						[trialPay.*][plugin.trialPay]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.trialPay.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the TrialPay plugin was initialized successfully.

* `"closed"` &mdash; Indicates that an ad was closed. For this phase, [event.type][plugin.trialPay.event.adsRequest.type] can provide additional context.

* `"failed"` &mdash; Indicates that an ad failed to show. For this phase, [event.isError][plugin.trialPay.event.adsRequest.isError] will be `true` and [event.response][plugin.trialPay.event.adsRequest.response] can provide additional context.

* `"reward"` &mdash; Indicates that a user completed a reward and has earned a reward. For this phase, [event.data][plugin.trialPay.event.adsRequest.data] will contain information for the earned reward.
