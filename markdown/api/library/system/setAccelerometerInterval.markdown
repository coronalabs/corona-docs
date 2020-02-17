# system.setAccelerometerInterval()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          accelerometer
> __See also__          [accelerometer][api.event.accelerometer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the frequency of [accelerometer][api.event.accelerometer] events.

On both Android and iOS, the default value is not documented but it is typically low, for example 10&nbsp;Hz.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Accelerometer events are a significant drain on the battery, so only increase the frequency when you need faster responses.

</div>
</div>


## Gotchas

* On iOS, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

<div class="code-indent">

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSMotionUsageDescription = "This app would like to access the accelerometer.",
		},
	},
}
``````

</div>

* On iOS devices, the frequency limits are between 10&nbsp;Hz and 100&nbsp;Hz.


## Syntax

	system.setAccelerometerInterval( frequency )

##### frequency ~^(required)^~
_[Number][api.type.Number]._ The measurement interval in Hz.


## Example

``````lua
-- Set the measurement interval to 50 Hz
-- This makes the system take 50 measurements per second
system.setAccelerometerInterval( 50 )
``````
