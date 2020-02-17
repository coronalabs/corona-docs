#  Image Sheets

Corona fully supports __image sheets__, sometimes referred to as sprite sheets or texture atlases. This allows you to load multiple images/frames from a single larger image file. Image sheets can be used for both static images and animated sprites. <!--- add link to sprite guide (left) -->

<div class="guides-toc">

* [Overview](#overview)
* [Image Sheet Setup](#setup)
* [Displaying Images](#display)
* [Trimming Notes](#trimming)

</div>


<a id="overview"></a>

## Overview

In mobile app design, where devices have limited texture memory, it's often essential to conserve this memory by using image sheets. In most cases, it is more efficient to consolidate several smaller images onto one larger sheet and "pull" a particular image from the sheet when you want to display it on the screen. Corona offers this functionality via image sheets.

Image sheets are also a convenience feature. Using popular <nobr>third-party</nobr> tools like [TexturePacker](http://www.codeandweb.com/texturepacker), you can design your images individually and then instruct the application to consolidate several image files into one optimized image sheet.

For a more detailed explanation of the memory benefits of image sheets, please refer to the [Performance&nbsp;and&nbsp;Optimization][guide.basics.optimization] guide.




<a id="setup"></a>

## Image Sheet Setup

The syntax for a new image sheet requires, at minimum, the name of the file and a table of __options__ which tells Corona about the images contained on the overall sheet. Depending on your needs, these options can be in "simple" format or "complex" format. If you're using a texture packing utility like those mentioned above, this task will typically be handled for you.

Initializing the image sheet is done with the [graphics.newImageSheet()][api.library.graphics.newImageSheet] function:

``````lua
graphics.newImageSheet( filename, [baseDir, ] options )
``````

* `filename` — this is the name of the image file that includes all frames of the image sheet.

* `baseDir` — specifies the base directory \([system directory constant][api.library.system]\) where `filename` is located.

* `options` — a table with keys and/or sub-tables that represent specific options related to the image sheet.

### Simple Options

This configuration assumes that all frames in the image sheet share identical size properties (width&nbsp;and&nbsp;height).

``````lua
local options =
{
	width = 50,
	height = 50,
	numFrames = 3
}
local sheet = graphics.newImageSheet( "mySheet.png", options )
``````

### Complex Options

This configuration is required if the image sheet has frames of varying sizes. In this configuration, `options` consists of an array of tables within a parent `frames` table. Each table in the array represents a single frame in the image sheet. For each frame, you must specify the `x` and `y` start <nobr>(upper-left corner)</nobr> along with the `width` and `height` of the frame. Taken together, these four parameters encompass the rectangular bounds of the frame.

For example, consider the following image sheet (`mySheet.png`) with two frames of varying width:

<div class="float-right" style="float: none; margin: 10px 0px 22px 0px; color: #666; vertical-align: middle;">

-------------------------------------------	-------------------------------------------	-------------------------------------------
											<span style="line-height:30px;">232</span>	<span style="line-height:30px;">277</span>
<span style="margin-right:8px;">276</span>	![][images.simulator.image-sheets-bird0]	![][images.simulator.image-sheets-bird2]
-------------------------------------------	-------------------------------------------	-------------------------------------------

</div>

The image sheet setup would look like this:

``````lua
local options =
{
	frames =
	{
		{	-- frame 1
			x = 0,
			y = 0,
			width = 232,
			height = 276
		},
		{	-- frame 2
			x = 232,
			y = 0,
			width = 277,
			height = 276
		}
	}
}
local sheet = graphics.newImageSheet( "mySheet.png", options )
``````

### Dynamically-Selected Image Sheets

Just like individual images displayed with [display.newImageRect()][api.library.display.newImageRect], image sheets may be selected dynamically depending on the screen resolution. To accomplish this, you must specify the following key-value pairs in the `options` table:

* `sheetContentWidth`
* `sheetContentHeight`

These values tell Corona the size of the original 1x image sheet. For example, if you're developing for both iPad and iPad&nbsp;Retina, and you're using an image sheet of 1000&times;1000 for the regular iPad, you should specify `1000` for both of these values and then design your Retina image sheet at 2000&times;2000.

``````lua
local options =
{
	width = 100,
	height = 100,
	numFrames = 10,
	sheetContentWidth = 1000,  --width of original 1x size of entire sheet
	sheetContentHeight = 1000  --height of original 1x size of entire sheet
}
local sheet = graphics.newImageSheet( "mySheet.png", options )
``````

For details on content scaling and dynamic image selection (which&nbsp;applies to image sheets&nbsp;too), please refer to the [Project&nbsp;Configuration][guide.basics.configSettings] guide.




<a id="display"></a>

## Displaying Images

To display an image (frame) from an image sheet, use the existing display APIs but specify the sheet and a frame number instead of just the image name:

``````lua
local sheet = graphics.newImageSheet( "mySheet.png", options )

local frame1 = display.newImage( sheet, 1 )
local frame2 = display.newImage( sheet, 2 )
``````

If you require dynamically-selected images, use [display.newImageRect()][api.library.display.newImageRect] and specify the width and height as usual:

``````lua
local sheet = graphics.newImageSheet( "mySheet.png", options )

local frame1 = display.newImageRect( sheet, 1, 232, 276 )
local frame2 = display.newImageRect( sheet, 2, 277, 276 )
``````




<a id="trimming"></a>

## Trimming Notes

As noted above, popular image packing programs offer the option to maximize (compact) your image sheets. Essentially, this means that the source images will be __trimmed__ of empty surrounding space before they're packed into the final image sheet. These programs make intelligent use of the overall sheet dimensions and automatically arrange the images into the most efficient layout possible. For example, if you want to pack the two individual bird images into one image sheet using a packing program, the result may be as follows:

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

----------------------------------------------	------------------	----------------------------------------------	------------------	----------------------------------------------
![][images.simulator.image-sheets-bird1]		   &nbsp;+&nbsp;	![][images.simulator.image-sheets-bird2]		  &nbsp;=&nbsp;		![][images.simulator.image-sheets-bird3]
----------------------------------------------	------------------	----------------------------------------------	------------------	----------------------------------------------

</div>

Note that the transparent space, represented by the gray checkerboard in the above examples, is trimmed off and the birds are packed closely together to achieve the smallest possible image sheet. With this change, the image sheet is now 450&times;262 instead of 512&times;276.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

While trimming is often necessary to achieve the smallest possible image sheets, there are some important usage notes that you must be aware of, particularly in regards to positioning.

When you place one of these images on the screen or use them in a sprite animation, you will typically want the images to be positioned as if they were __not__ trimmed — meaning, the empty space that was trimmed is respected, not discarded, in regards to screen positioning. This ensures that the images align properly with each other, especially in an animation where the trimmed area will often vary per frame.

Corona manages this with some additional parameters in the image sheet setup. These include `sourceX`, `sourceY`, `sourceWidth`, and `sourceHeight`. These are added to the image sheet `options` as follows:

``````lua
local options =
{		
	frames =
	{
		{	-- frame 1
			x = 0,
			y = 0,
			width = 203,
			height = 256,
			sourceX = 60,
			sourceY = 11,
			sourceWidth = 277,
			sourceHeight = 276
		},
		{	-- frame 2
			x = 203,
			y = 0,
			width = 247,
			height = 262,
			sourceX = 16,
			sourceY = 5,
			sourceWidth = 277,
			sourceHeight = 276
		},
	},
	sheetContentWidth = 450,
	sheetContentHeight = 262
}
local sheet = graphics.newImageSheet( "mySheet.png", options )
``````

<div style="margin-top: 14px; margin-bottom: 4px;">

Notice how in both frames, the `sourceWidth` and `sourceHeight` parameters match the size of the original, untrimmed frames. This imaginary "canvas" is what you must consider when positioning a trimmed image on the screen. Effectively, the image will be positioned in respect to the __center__ point of the untrimmed frame size.

</div>
</div>
