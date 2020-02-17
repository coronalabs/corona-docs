
# Techniques for Swapping Images

Sometimes, the design of an app dictates the need for "image&nbsp;swapping" in which the developer displays an image at a given location and then, after some time or some action, swaps that image for another. Here's a theoretical example:

``````lua
local myImage = display.newImageRect( "image1.png", 64, 64 )

-- After some time or upon some event
myImage:swapImage( "image2.png" )
``````

However, this is not how Corona works because `:swapImage()` is __not__ a <nobr>built-in</nobr> Corona method. When Corona builds an image, it has to read the file in from the app bundle's file system, allocate texture memory for the image, render the PNG or JPG compressed data into four color channels, and return a display object. To "swap" that image, Corona would need to destroy the object and create a new image, effectively resulting in the same amount of work as illustrated in this example:

``````lua
local myImage = display.newImageRect( "image1.png", 64, 64 )

-- After some time or upon some event
display.remove( myImage )
myImage = display.newImageRect( "image2.png", 64, 64 )
``````

In this theoretical scenario, by destroying `image1.png` with the [display.remove()][api.library.display.remove] call, you're probably not planning on using it again soon. The advantage to this method is that it minimizes texture memory since only one of the two images is loaded at once. However, if you want to get the original image back, you're caught in this cycle of image loading and unloading over and over. In itself, this is an inefficient process that can impact performance. Thus, if you need to swap images more frequently, you should explore other techniques. Let's look at a few options:


## 2-Image Swap

If you have two images, you can simply load them both, add them to a display group, and reference the images as parameters of the group. In this example, we load two images, `redBall` and `blueBall`. We then position them at the same location, making one visible and the other not. 

``````lua
-- Create a basic display group
local imageGroup = display.newGroup()

-- Create a red ball inside the group
local redBall = display.newImageRect( imageGroup, "red-ball.png", 128, 128 )
redBall.x = display.contentCenterX
redBall.y = display.contentCenterY

-- Create a blue ball inside the same group
local blueBall = display.newImageRect( imageGroup, "blue-ball.png", 128, 128 )
blueBall.x = display.contentCenterX
blueBall.y = display.contentCenterY

-- Make the blue ball invisible
blueBall.isVisible = false
``````

Now let's focus on the swapping code:

``````lua
for i = 1,imageGroup.numChildren do
	if ( imageGroup[i].isVisible == false ) then
		imageGroup[i].isVisible = true
	else
		imageGroup[i].isVisible = false
	end
end
``````

Simply enough, this code loops through the children of `imageGroup` which are obviously `redBall` and `blueBall`. If the child is invisible, it's toggled back to visible and <nobr>vice-versa</nobr> <nobr>(visible to invisible)</nobr>.


## Fill Swap

You can also take advantage of the graphics "fill" methods to swap images:

``````lua
local image1 = { type="image", filename="red-ball.png" }
local image2 = { type="image", filename="blue-ball.png" }

local ball = display.newRect( display.contentCenterX, display.contentCenterY, 128, 128 )
ball.fill = image1
ball.isShowing = "image1"
``````

This method eliminates the need for the display group&nbsp;&mdash; we just create a base display object (in&nbsp;this&nbsp;case a rectangle the size of the&nbsp;images) and fill it with the `image1` paint of <nobr>`red-ball.png`</nobr>. We also declare one additional property for the ball, `isShowing`, to be used in the swapping code as follows:

``````lua
if ( ball.isShowing == "image1" ) then
	ball.fill = image2
	ball.isShowing = "image2"
else
	ball.fill = image1
	ball.isShowing = "image1"
end
``````


## Multi-Image Swap

Sometimes you'll want to swap more than two images. In this case, we can go back to the display group model, load all of the images into an array, and access them via their index number. Here, we iterate through the `imageCache` table to create the display objects, storing them in the `balls` table as we go along, and make each one invisible. Then, we make the first one visible again.

``````lua
local imageGroup = display.newGroup()

local imageCache = {
	"red-ball.png",
	"blue-ball.png",
	"green-ball.png",
	"yellow-ball.png",
	"purple-ball.png"
}

local balls = {}
for i = 1,#imageCache do
	balls[i] = display.newImageRect( imageGroup, imageCache[i], 128, 128 )
	balls[i].x = display.contentCenterX
	balls[i].y = display.contentCenterY
	balls[i].isVisible = false
end

imageGroup.isShowing = 1
balls[imageGroup.isShowing].isVisible = true
``````

Now, to manage the swapping, we can execute the following code, setting the local variable `showingImage` to the index of the image we want to show. In this case, the value of `4` will show the <nobr>`yellow-ball.png`</nobr> image because that image was declared in the 4th position of the `imageCache` array.

``````lua
local showingImage = 4

for i = 1,imageGroup.numChildren do
	if ( i == showingImage ) then
		imageGroup[i].isVisible = true
	else
		imageGroup[i].isVisible = false
	end
end
``````


## Image Sheets and Sprites

While the above methods are all perfectly valid, using individual image files is not the best use of memory and loading time. Also, creating/storing a large amount of individual files in your project directory can get chaotic. This is why we encourage the use of [image sheets][guide.media.imageSheets] in which you load a single image sheet/atlas containing all of the individual images and then display a specific frame from it. Image sheets take a little more initial setup but the the benefits are well worth it.

<div style="max-width: 320px;">

![][images.docs.colored-balls]

</div>

Converting the above code to an image sheet may look like this:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9,10,13,14]" }
local imageGroup = display.newGroup()

local sheetOptions = {
	width = 128,
	height = 128,
	numFrames = 5,
	sheetContentWidth = 640,
	sheetContentHeight = 128
}
local ballSheet = graphics.newImageSheet( "ballSheet.png", sheetOptions )

local balls = {}
for i = 1,sheetOptions.numFrames do
	balls[i] = display.newImageRect( imageGroup, ballSheet, i, 128, 128 )
	balls[i].x = display.contentCenterX
	balls[i].y = display.contentCenterY
	balls[i].isVisible = false
end

imageGroup.isShowing = 2
balls[imageGroup.isShowing].isVisible = true
``````

From a code perspective, this is not much different from the array method above, other than the efficiencies gained from using image sheets&nbsp;&mdash; but image sheets are a gateway to __sprites__, an excellent way swap images!

### Sprite Frame Swapping

Corona includes a comprehensive [sprite][guide.media.spriteAnimation] engine. While the term "sprite" may seem to indicate only an __animated__ object in a game, you should consider it as simply an ordered sequence of images which can be used for multiple purposes, including swapping images.

Let's look at a <nobr>sprite-based</nobr> version which builds upon the image sheet version above:

``````{ brush="lua" gutter="false" first-line="1" highlight="[10,11]" }
local sheetOptions = {
	width = 128,
	height = 128,
	numFrames = 5,
	sheetContentWidth = 640,
	sheetContentHeight = 128
}
local ballSheet = graphics.newImageSheet( "ballSheet.png", sheetOptions )

local ball = display.newSprite( ballSheet, { name="balls", start=1, count=sheetOptions.numFrames } )
ball:setFrame( 2 )
ball.x = display.contentCenterX
ball.y = display.contentCenterY
``````

Like the version using graphics fills, we no longer need the display group (`imageGroup`) since the sprite is, by&nbsp;definition, a <nobr>multi-frame</nobr> object than can reside in any group by itself. Once the image sheet is set up, simply call [display.newSprite()][api.library.display.newSprite] with the image sheet and the sequence data. Next, use the [object:setFrame()][api.type.SpriteObject.setFrame] method to pick which frame to display and the sprite engine handles the rest&nbsp;&mdash; no need to toggle the visibility of other images as in some of the other examples.


## Conclusion

As you can see, there are various approaches and methods to the "swap&nbsp;images" concept and it depends on your needs and design specifics as to which method is most suitable. From individual images to fills to sprites, Corona has you covered!
