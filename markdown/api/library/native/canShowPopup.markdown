
# native.canShowPopup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, canShowPopup, show popup
> __See also__          [native.showPopup()][api.library.native.showPopup]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether or not the popup type can be shown. This usually defines whether the popup will actually be displayed. However, in the case of `"appStore"`, a result of `true` does not guarantee that the popup will be displayed because, in those cases, the particular popup will depend on additional parameters.


## Syntax

	native.canShowPopup( name )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. This can be one of the following:

* `"mail"`
* `"sms"`
* `"appStore"`
* `"requestAppPermission"`

Note that there are also additional popup types available via plugins (see [native.showPopup()][api.library.native.showPopup]).


## Example

``````lua
if ( native.canShowPopup( "sms" ) ) then
	local options = {
		to = { "1234567890", "9876543210" },
		body = "I scored over 9000!!! Can you do better?"
	}
	local result = native.showPopup( "sms", options )

else
	print( "SMS Not supported/setup on this device" )
	native.showAlert( "Alert!", "SMS not supported/setup on this device.", { "OK" } )
end
``````
