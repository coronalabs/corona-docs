# iTunes.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          show, iTunes, picker
> __See also__          [iTunes][plugin.iTunes]
>								[iTunes.play()][plugin.iTunes.play]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the iTunes library picker and enables you to pick one or more items to play back at a future time.


## Syntax

	iTunes.show( onComplete )
	iTunes.show( options, onComplete )

##### onComplete ~^(required)^~
_[Listener][api.type.Listener]._ The callback function which is executed after dismissing the iTunes library picker.

##### options ~^(optional)^~
_[Table][api.type.Table]._ Table of parameters for the picker &mdash; see the next section for details.


## Options Reference

The `options` table may contain the following properties:

##### allowsPickingMultipleItems ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the iTunes picker will allow you to select multiple items to play. Default is `false`.

##### promptTitle ~^(optional)^~
_[String][api.type.String]._ The title that appears on the iTunes picker navigation bar. Default is __Select&nbsp;song&nbsp;to&nbsp;play__.


## Example

``````lua
local iTunes = require( "plugin.iTunes" )

-- Table to store media items
local mediaItems = {}

-- Function that is executed when song playback is complete
local function onPlaybackEnded()
	print( "Playback completed!" )
end

-- Function that is executed after media item(s) have been chosen
local function onMediaChosen( event )

	if ( event.data ) then
		for i=1,#event.data do
			mediaItems[i] = event.data[i]
		end
		
		--play the first item chosen
		iTunes.play( mediaItems[1].url, onPlaybackEnded )

	end	
end

local iTunesOptions =
{
	allowsPickingMultipleItems = true,
	promptTitle = "Select some songs"
}
iTunes.show( iTunesOptions, onMediaChosen )
``````