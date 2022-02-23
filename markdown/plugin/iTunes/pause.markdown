# iTunes.pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pause, iTunes
> __See also__          [iTunes][plugin.iTunes]
>								[iTunes.play()][plugin.iTunes.play]
>								[iTunes.resume()][plugin.iTunes.resume]
>								[iTunes.stop()][plugin.iTunes.stop]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses an item (currently playing) that was selected from the iTunes library.


## Syntax

	iTunes.pause()
	

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

		--pause the song
		iTunes.pause()

	end	
end

local iTunesOptions =
{
	allowsPickingMultipleItems = true,
	promptTitle = "Select some songs"
}
iTunes.show( iTunesOptions, onMediaChosen )
``````