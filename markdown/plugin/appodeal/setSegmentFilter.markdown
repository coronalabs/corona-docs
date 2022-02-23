# appodeal.setSegmentFilter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, setSegmentFilter
> __See also__          [appodeal.init()][plugin.appodeal.init]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This method is not supported by the legacy plugin. Make sure to use new modular plugin or beta to get the latest and greatest features.

</div>

Manual Filters allows you to group users by specific characteristics. E.g. you know the sources that directed users to your app and you want to track the statistics for such users — group them into a segment. You can read more in [Appodeal Knowledge Base](http://faq.appodeal.com/segments).


## Syntax

	appodeal.setSegmentFilter( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ Table containing option values &mdash; see the next section for details.


## Options Reference

The `options` table includes parameters for specifying user details.

##### customRules ~^(required)^~
_[Number][api.type.Number]._ Custom rules for users grouping.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set segment filter
		appodeal.setSegmentFilter( { customRules = "YOUR CUSTOM RULES TABLE HERE" } )
    end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey = "YOUR_APP_KEY" } )
``````
