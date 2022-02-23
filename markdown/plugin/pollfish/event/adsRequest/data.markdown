# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.pollfish.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, adsRequest, data
> __See also__			[adsRequest][plugin.pollfish.event.adsRequest]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A <nobr>JSON-encoded</nobr> [string][api.type.String] with additional data about the event, returned for the `"loaded"` and `"completed"` [phase][plugin.pollfish.event.adsRequest.phase] events.

The JSON data has the following elements:

* `playfulSurvey` &mdash; `true` if the survey is __playful__, `false` if it's __basic__. Playful surveys are small image question surveys <nobr>(3-4 questions)</nobr> that have a fluctuating price; on average they pay between $0.06 and $0.08 and they can be disabled through the [Pollfish portal](https://www.pollfish.com/publisher). Basic surveys usually contain <nobr>7-12</nobr> questions and pay a minimum of $0.30 per completed survey (this&nbsp;price can go up to&nbsp;$2.00).

* `surveyPrice` &mdash; _[Number][api.type.Number] representing the price of the survey in cents (USD).
