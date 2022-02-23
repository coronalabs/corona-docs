# memoryBitmap.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			memoryBitmap, bitmap
> __Platforms__			Android, iOS, macOS, Windows, tvOS
> __Sample__			[https://github.com/coronalabs/plugins-sample-memoryBitmap](https://github.com/coronalabs/plugins-sample-memoryBitmap)
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This plugin provides the ability to create and manipulate <nobr>in-memory</nobr> bitmaps.


## Syntax

	local memoryBitmap = require( "plugin.memoryBitmap" )


## Functions

#### [memoryBitmap.newTexture()][plugin.memoryBitmap.newTexture]


## Types

#### [MemoryBitmap][plugin.memoryBitmap.type.MemoryBitmap]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.memoryBitmap"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Examples

##### Setting/Getting Pixel

``````lua
local memoryBitmap = require( "plugin.memoryBitmap" )

-- Create bitmap texture
local tex = memoryBitmap.newTexture(
	{
		width = 100,
		height = 100,
		-- format = "rgba"  -- (default)
		-- format = "rgb"
		-- format = "mask"
	})

-- Create image using the bitmap texture
local bitmap = display.newImageRect( tex.filename, tex.baseDir, 100, 100 )
bitmap.x = display.contentCenterX
bitmap.y = display.contentCenterY

-- Set a pixel color in the bitmap
tex:setPixel( 10, 10, 1, 0, 0, 1 )  -- Set pixel at (10,10) to be red
-- tex:setPixel( 10, 10, {1,0,0,1} )  -- Same using table syntax for RGB+A color

-- Get a pixel color from the bitmap
print( tex:getPixel( 10, 10 ) )  --> 1 0 0 1

-- Submit texture to be updated
tex:invalidate()
``````

##### Setting Multiple Pixels

``````lua
local memoryBitmap = require( "plugin.memoryBitmap" )

-- Create bitmap texture
local tex = memoryBitmap.newTexture(
	{
		width = 100,
		height = 100,
		-- format = "rgba"  -- (default)
		-- format = "rgb"
		-- format = "mask"
	})

-- Create image using the bitmap texture
local bitmap = display.newImageRect( tex.filename, tex.baseDir, 100, 100 )
bitmap.x = display.contentCenterX
bitmap.y = display.contentCenterY

-- Loop through all pixels and set green channel to 1
for y = 1,tex.height do
	for x = 1,tex.width do
		tex:setPixel( x, y, nil, 1, nil, nil )
		tex:invalidate()
	end
end

-- If no more modifications are required, release the texture
tex:releaseSelf()
``````
