# iTunes.setVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setVolume, iTunes
> __See also__          [iTunes][plugin.iTunes]
>								[iTunes.getVolume()][plugin.iTunes.getVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the playback volume of an item that was selected from the iTunes library.


## Syntax

	iTunes.setVolume( volume )
	
##### volume ~^(required)^~
_[Number][api.type.Number]._ The volume ratio at which to play the iTunes item. Valid ranges is between `0.0` and `1.0`.


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

	end	
end

local iTunesOptions =
{
	allowsPickingMultipleItems = true,
	promptTitle = "Select some songs"
}
iTunes.show( iTunesOptions, onMediaChosen )
``````