
# pollfish.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, load
> __See also__          [pollfish.show()][plugin.pollfish.show]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`pollfish.load()` loads a Pollfish survey.

Once called, you can show the survey using [pollfish.show()][plugin.pollfish.show], assuming it's ready for display. You can confirm survey availability using [pollfish.isLoaded()][plugin.pollfish.isLoaded].


## Syntax

	pollfish.load( params )

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing Pollfish survey options &mdash; see the next section for details.


## Parameter Reference

The `params` table includes the following parameters for the Pollfish initialization.

##### yAlign ~^(optional)^~
_[String][api.type.String]._ Position of the survey button. Valid values include `"top"`, `"center"`, and `"bottom"`. Default is `"bottom"`.

##### xAlign ~^(optional)^~
_[String][api.type.String]._ Alignment of the survey button. Valid values include `"left"` and `"right"`. Default is `"right"`.

##### padding ~^(optional)^~
_[Number][api.type.Number]._ Padding (in&nbsp;pixels) to adjust the vertical position of the survey button. Negative values shift the button up and positive values shift it down. <nobr>Default is `0`.</nobr>

##### customMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Setting this to `true` activates "custom&nbsp;mode" as detailed below. Default is `false`.

* Setting this to `false` (default) is the standard way of using Pollfish in your apps. This option enables controlling behavior (intrusiveness) of the Pollfish panel in an app from the [Pollfish portal](https://www.pollfish.com/publisher). In this mode, the survey panel/button will automatically be shown according to the settings in the Pollfish dashboard.

* Setting this to `true` ignores the Pollfish panel behavior settings in the [Pollfish portal](https://www.pollfish.com/publisher). It always omits the Pollfish button and you must explicitly call [pollfish.show()][plugin.pollfish.show] to display the loaded survey.


## Example

``````lua
local pollfish = require( "plugin.pollfish" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		pollfish.load()
	end
end

-- Initialize the Pollfish plugin
pollfish.init( adListener, { apiKey="YOUR_API_KEY" } )
``````
