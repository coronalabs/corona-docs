
# native.showAlert()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          alert, native alert, alert popup
> __See also__          [native.cancelAlert()][api.library.native.cancelAlert]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a popup alert box with one or more buttons, using a native alert control. Program activity, including animation, will continue in the background, but all other user interactivity will be blocked until the user selects a button or cancels the dialog.

## Gotchas

* Native alerts are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects.

* Some platforms will not allow multiple alerts. If you have an alert pending and call another alert, the second alert may not show or trigger the alert listener.

## Syntax

	native.showAlert( title, message [, buttonLabels [, listener] ] )

##### title ~^(required)^~
_[String][api.type.String]._ The title string displayed in the alert.

##### message ~^(required)^~
_[String][api.type.String]._ Message string displayed in the alert text.

##### buttonLabels ~^(optional)^~
_[Table][api.type.Table]._ Table of strings, each of which will create a button with the corresponding label. Include at least one `buttonLabel` or the dialog will not have any buttons. The maximum number of buttons in an alert box is five. The most common format is one or two buttons, for example `"OK"` and `"Cancel"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ The listener function to be called when a user presses any button in the alert box. It can assign an action to each button according to its numerical index: the first button is index 1, the second is index 2, and so on. The listener can be either a function listener or a table listener and the event dispatched to the listener will have the following additional properties:

* `event.action` represents how the alert was dismissed: `"cancelled"` indicates that [native.cancelAlert()][api.library.native.cancelAlert] was called to close the alert, while `"clicked"` indicates that the user clicked on a button to close the alert.
* `event.index` is the index of the button pressed. It corresponds to the index in the `buttonLabels` parameter.


## Example

``````lua
-- Handler that gets notified when the alert closes
local function onComplete( event )
	if ( event.action == "clicked" ) then
		local i = event.index
		if ( i == 1 ) then
			-- Do nothing; dialog will simply dismiss
		elseif ( i == 2 ) then
			-- Open URL if "Learn More" (second button) was clicked
			system.openURL( "https://solar2d.com/" )
		end
	end
end
 
-- Show alert with two buttons
local alert = native.showAlert( "Solar2D", "Dream. Build. Ship.", { "OK", "Learn More" }, onComplete )
``````
