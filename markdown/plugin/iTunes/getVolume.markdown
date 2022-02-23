# iTunes.getVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getVolume, iTunes
> __See also__          [iTunes][plugin.iTunes]
>								[iTunes.setVolume()][plugin.iTunes.setVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves the playback volume of an item that was selected from the iTunes library.


## Syntax

	iTunes.getVolume()


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

		--set the playback volume
		iTunes.setVolume( 0.5 )

		--print the playback volume
		iTunes.getVolume()

	end	
end

local iTunesOptions =
{
	allowsPickingMultipleItems = true,
	promptTitle = "Select some songs"
}
iTunes.show( iTunesOptions, onMediaChosen )
``````