# iTunes.play()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          play, iTunes
> __See also__          [iTunes][plugin.iTunes]
>								[iTunes.pause()][plugin.iTunes.pause]
>								[iTunes.resume()][plugin.iTunes.resume]
>								[iTunes.stop()][plugin.iTunes.stop]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Plays an item selected from the iTunes library.


## Syntax

	iTunes.play( songUrl )
	iTunes.play( songUrl, onComplete )

##### songUrl ~^(required)^~
_[String][api.type.String]._ The song URL to play, as retrieved from the callback function of [iTunes.show()][plugin.iTunes.show].

##### onComplete ~^(optional)^~
_[Listener][api.type.Listener]._ The callback function which is executed after dismissing the iTunes library picker.


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