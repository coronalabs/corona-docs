# Chapter 1 &mdash; Creating an App


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.intro] _|_ [Next][guide.programming.02] __&rang;__

</div>
</div>


In this chapter we are going to create a simple <nobr>tap-based</nobr> game to keep a balloon in the air, along with covering some of the basics of app development. We will keep this first project as simple as possible for those who are new or have been away from programming for a while.

<div class="guides-toc">

* [Using Corona](#using)
* [Creating an App](#createapp)
* [Extra Credit](#extracredit)
* [Chapter Concepts](#concepts)

</div>


<a id="using"></a>

## Using Corona

### Corona Scripting

Corona uses the [Lua](https://www.lua.org/) scripting language. If you've ever programmed in any language, you will find Lua an easy transition. Our [Introduction to Lua][guide.start.introLua] guide provides an overview of Lua, or you can [learn Lua on YouTube](https://www.youtube.com/playlist?list=PLxgtJR7f0RBKGid7F2dfv7qc-xWwSee2O). In a very short time, you will find yourself writing that great app that you've dreamed of creating!

If you're completely new to programming, Lua is still easy to learn and this guide will help you along.

### Text Editors

In addition to CORONA_CORE_PRODUCT, you will need a __text&nbsp;editor__. There are several editors available and choosing one is much like choosing a car&nbsp;&mdash; everybody has their own preferences and you should explore which one suits you best.

If you don't already have a favorite text editor, the following options are recommended:

<div class="inner-table">

Editor																Add-On Package																					 macOS		 Windows
------------------------------------------------------------------	----------------------------------------------------------------------------------------------	----------	----------
[Atom](https://atom.io)												[autocomplete-corona](http://bit.ly/1SA5cXv)													 &#x2713;	 &#x2713;
[Xcode](https://developer.apple.com/xcode/)							[Corona Plugin for Xcode](https://marketplace.coronalabs.com/asset/corona-plugin-for-xcode)		 &#x2713;
[Visual Studio Code](https://code.visualstudio.com/)				[Corona Tools](http://bit.ly/1SHiqgK)															 &#x2713;	 &#x2713;
[Sublime Text](http://www.sublimetext.com)							[Corona Editor](http://bit.ly/1QGh44H)															 &#x2713;	 &#x2713;
[Vim](http://www.vim.org)																																			 &#x2713;	 &#x2713;
[ZeroBrane Studio](https://studio.zerobrane.com)																													 &#x2713;	 &#x2713;
[Notepad++](http://notepad-plus-plus.org)																																		 &#x2713;
[TextWrangler](http://www.barebones.com/products/textwrangler/)																										 &#x2713;
[TextMate](http://macromates.com)																																	 &#x2713;
------------------------------------------------------------------	----------------------------------------------------------------------------------------------	----------	----------

</div>




<a id="createapp"></a>

## Creating an App

<div class="float-right" style="max-width: 240px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-balloon-0]

</div>

Your first app is going to be very simple, but it will demonstrate some important concepts. We are going to make a simple tapping game to keep a balloon in the air. Each time the balloon is tapped, we will "push" it a little higher.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The best way to use this guide is to follow every step&nbsp;&mdash; type in the code, add the images, and see your project gradually come to life. It may take a little more time, but you will gain a much better understanding.

* Included with each chapter is a downloadable file which contains all of the images, audio files, and other assets related to that chapter. This chapter's source files are available [here](https://github.com/coronalabs/GettingStarted01/archive/master.zip).

</div>

### Starting a Project

Creating a new project in Corona is easy. In just a few simple steps you'll be ready to make your first app!

1. Open the __Corona Simulator__.

2. Click __New&nbsp;Project__ from the welcome window or select __New&nbsp;Project...__ from the __File__ menu.

<!--- TODO: Fix the platform-different citation below -->

3. For the project/application name, type `BalloonTap` and ensure that the __Blank__ template option is selected. Leave the other settings at default and click __OK__ (Windows) or __Next__ (Mac). This will create the basic files for your first game in the location (folder) that you specified. This is also the folder in which you'll place all of your app files/assets, including images, program files, etc.

### Including Images

For this project, you will need three __image&nbsp;files__, placed within the `BalloonTap` project folder created above:

<div class="inner-table">

File					Size (w&times;h)	Usage
----------------------	------------------	--------------------------------------------------
`background.png`		360 &times; 570		The background&nbsp;&mdash; purely decorative so that we're not staring at a black background.
`platform.png`			300 &times; 50		The platform/floor&nbsp;&mdash; keeps the balloon from falling off the bottom of the screen.
`balloon.png`			112 &times; 112		The balloon.
----------------------	------------------	--------------------------------------------------

</div>

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

To get going quickly, you can download and use the default images included with this chapter's [source files](https://github.com/coronalabs/GettingStarted01/archive/master.zip). Inside the archive, you'll find the three images outlined above.

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you choose to create your own images for this project or any other project, note these basic image guidelines:

* Corona supports PNG and JPG format.
* Images should not contain an embedded ICC profile.
* Avoid progressive JPG files since they will take much longer to load.

</div>
</div>

### Loading the Background

The first image that we need to load is the background. Corona places everything on the screen from back to front in regards to layering, so the first image we load will exist behind other images that are loaded afterward. While there are ways to change the layering order of images and send them to the back or front of the display stack, we'll keep this project simple and load them in a logical order.

Using your chosen text editor, locate and open the `main.lua` file within your project folder. The `main.lua` file is the foundational <nobr>"core program file"</nobr> of every Corona project and you cannot create an app without it. This is the Lua file with which the application starts, every time you run the app.

In this `main.lua` file, type in the highlighted command:

``````{ brush="lua" gutter="true" first-line="1" highlight="[7]" }
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect( "background.png", 360, 570 )
``````

There are a several aspects involved with this command. Let's break it down:

* The first word, `local`,  is a Lua command indicating that the next word will be a __variable__. A&nbsp;variable, just like you learned in math class, is used to store a value. In this case, that value will be an image used as your background.

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that `local` is always lowercase and it's used here to declare a variable; for example, the first time you use the variable, you should add the word `local` in front of it.

</div>
</div>
</div>

* The second word, `background`, is the __name__ of our variable. Any time we want to make changes to the image stored in `background`, we will use this variable name.

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Remember to always use different variable names each time you use a variable. Just as it gets confusing if everyone in a classroom is named "John," using the same variable name for all of your objects creates confusion in your program.

</div>
</div>
</div>

* The `=` (equal&nbsp;sign) is used to assign the variable `background` to an image.

* `display.newImageRect()` is one of the Corona APIs <nobr>(Application Programming Interface)</nobr>. It is used to load an image from a file so that you can use it in the app. There are a couple of ways to load an image into your app, but `display.newImageRect()` is special in that it can resize/scale the image (this&nbsp;will be explained in just a&nbsp;moment).

* Inside the parentheses are the __parameters__ which we pass to `display.newImageRect()`, sometimes referred to as __arguments__. The first parameter is the name of the image file that we want to load, including the file extension (`.png`).

<div class="code-indent" style="margin-bottom: 20px;">

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

The specified name must match the actual file name exactly, including case-sensitive matching! For instance, if the actual file name is `background.png`, do __not__ enter it as `"BackGround.PNG"`.

</div>
</div>

The next two parameters, `360` and `570` specify the size that we want the background image to be. In this case, we'll simply use the image's pixel dimensions, although as noted above, `display.newImageRect()` allows you to resize/scale the image via these numbers.

</div>

The final step for the background is to position it at the correct location on the screen. Immediately following the line you just entered, add the two highlighted commands:

``````{ brush="lua" gutter="true" first-line="7" highlight="[8,9]" }
local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY
``````

By default, Corona will position the center of an object at the coordinate point of `0,0` which is located in the <nobr>upper-left</nobr> corner of the screen. By changing the object's `x` and `y` properties, however, we can move the background image to a new location.

For this project, we'll place the background in the center of the screen&nbsp;&mdash; but what if we don't know exactly which coordinate values represent the center? Fortunately, Corona provides some convenient shortcuts for this. When you specify the values `display.contentCenterX` and `display.contentCenterY`, Corona will set the center coordinates of the screen as the `background.x` and `background.y` properties.

<div class="float-right" style="max-width: 240px; margin-top: 16px; clear: both;">

![][images.docs.sbs-balloon-1]

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of your code! Save your modified `main.lua` file and then, from within the Corona&nbsp;Simulator, "relaunch" it using <nobr>⌘-R</nobr> <nobr>(Command-R)</nobr>. If all went well, the background should now be showing, centered on the screen.

If you get an error or can't see the background, there are a few possibilities as to the cause:

<div style="margin-bottom: -10px;">

* One of the commands was typed incorrectly.
* The image file isn't in the same folder as `main.lua`.
* The specified filename and/or extension is incorrect or mismatched in case.

</div>

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Remember that the <nobr>__Corona Simulator Console__</nobr> window is a valuable place to check for and diagnose potential errors in your code. On Windows, this panel is always accessible in the Simulator. On&nbsp;Mac, if this window isn't already open, you can view it by selecting <nobr>__Window__ &rarr; __Console__</nobr>.

</div>
</div>

### Loading the Platform

Time to load the platform. This is very similar to loading the background. Following the three lines of code you've already typed, enter the following highlighted commands:

``````{ brush="lua" gutter="true" first-line="7" highlight="[11,12,13]" }
local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25
``````

As you probably noticed, there is one minor change compared to the background: instead of positioning the platform in the vertical center, we want it near the bottom of the screen. By using the command `display.contentHeight`, we know the height of the content area. But remember that `platform.y` places the __center__ of the object at the specified location. So, because the height of this object is 50 pixels, we subtract 25 pixels from the value, ensuring that the entire platform can be seen on screen.

<div class="float-right" style="max-width: 240px; margin-top: 12px; clear: both;">

![][images.docs.sbs-balloon-2]

</div>

Save your `main.lua` file and relaunch the Simulator to see the platform graphic.

### Loading the Balloon

To load the balloon, we'll follow the same process. Below the previous commands, type these lines:

``````{ brush="lua" gutter="true" first-line="15" highlight="[15,16,17]" }
local balloon = display.newImageRect( "balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
``````

In addition, to give the balloon a slightly transparent appearance, we'll reduce the object's opacity (alpha) slightly. On the next line, set the balloon's `alpha` property to 80% (`0.8`):

``````{ brush="lua" gutter="true" first-line="15" highlight="[18]" }
local balloon = display.newImageRect( "balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
``````

Save your `main.lua` file and relaunch the Simulator. There should now be a balloon in the center of the screen.

### Adding Physics

Time to get into physics! Corona includes the [Box2D](http://www.box2d.org/) physics engine for your use in building apps. While using physics is not required to make a game, it makes it much easier to handle many game situations.

Including physics is very easy with Corona. Below the previous lines, add these commands:

``````{ brush="lua" gutter="true" first-line="20" highlight="[20,21]" }
local physics = require( "physics" )
physics.start()
``````

Let's explain these two lines in a little more detail:

* The command <nobr>`local physics = require( "physics" )`</nobr> loads the Box2D physics engine into your app and associates it with the local variable `physics` for later reference. This gives you the ability to call other commands within the physics library using the `physics` namespace variable, as you'll see in a moment.

* `physics.start()` does exactly what you might guess&nbsp;&mdash; it starts the physics engine.

If you save and relaunch you won't see any difference in your <nobr>game...&nbsp;yet</nobr>. That is because we haven't given the physics engine anything to do. For physics to work, we need to convert the images/objects that were created into physical objects. This is done with the command `physics.addBody`:

``````{ brush="lua" gutter="true" first-line="20" highlight="[23]" }
local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
``````

This tells the physics engine to add a physical "body" to the image that is stored in `platform`. In addition, the second parameter tells Corona to treat it as a __static__ physical object. What does this mean? Basically, static physical objects are not affected by gravity or other physical forces, so anytime you have an object which shouldn't move, set its type to `"static"`.

Now add a physical body to the balloon:

``````{ brush="lua" gutter="true" first-line="20" highlight="[24]" }
local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

In contrast to the platform, the balloon is a __dynamic__ physical object. This means that it's affected by gravity, that it will respond physically to collisions with other physical objects, etc. In this case, the second parameter (`"dynamic"`) is actually optional because the default body type is already dynamic, but we include it here to help with the learning process.

</div>
</div>

The final part of this `physics.addBody` command is used to adjust the balloon's body properties&nbsp;&mdash; in this case we'll give it a round shape and adjust its bounce/restitution value. Parameters must be placed in curly brackets (`{}`) (referred to as a __table__ in the Lua programming language).

* Because the balloon is a round object, we assign it a `radius` property with a value of `50`. This value basically matches the size of our balloon image, but you may need to adjust it slightly if you created your own balloon image.

* The `bounce` value can be any <nobr>non-negative</nobr> decimal or integer value. A value of `0` means that the balloon has no bounce, while a value of `1` will make it bounce back with 100% of its collision energy. A value of `0.3`, as seen above, will make it bounce back with 30% of its energy.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* A `bounce` value greater than `1` will make an object bounce back with more than 100% of its collision energy. Be careful if you set values above `1` since the object may quickly gain momentum beyond what is typical or expected.

* Even if you change the balloon's `bounce` property to `0`, it will still bounce off the `platform` object because, by default, objects have a bounce value of `0.2`. To completely remove bouncing in this game, set both the balloon __and__ the platform to `bounce=0`.

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Save your `main.lua` file and relaunch the Simulator. As a fun experiment, you can try adjusting the `bounce` value and relaunch the project to see the effect.

</div>
</div>

### Functions

At this point, we have a balloon that drops onto a platform and bounces slightly. That's not very fun, so let's make this into a game! For our balloon tap game to work, we need to be able to push the balloon up a little each time it's tapped.

To perform this kind of feature, programming languages use what are called __functions__. Functions are short (usually) sections of code that only run when we tell them to, like when the player taps the balloon.

Let's create our first function:

``````{ brush="lua" gutter="true" first-line="26" highlight="[26,27,28]" }
local function pushBalloon()

end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Functions are essential to developing apps with Corona, so let's examine the basic structure:

<div style="margin-bottom: -10px;">

* As before, we use the keyword `local` to declare the function.

* The keyword `function` tells Corona that this is a function and that its set of commands will be called by the name `pushBalloon`.

* The ending parentheses (`()`) are required. In later chapters we will put something inside these parentheses, but for now you can leave this as shown.

* As mentioned above, functions are <nobr>self-contained</nobr> sections (blocks) of code which run only when we tell them to. Thus, whenever you create a function, you __must__ close it with the keyword `end`. This tells Lua that the function is finished.

</div>
</div>
</div>

Excellent, we now have a function! However, it's currently an empty function so it won't actually do anything if we run it. Let's fix that by adding the following line of code __inside__ the function, between where we declare the function (its&nbsp;opening&nbsp;line) and the closing `end` keyword:

``````{ brush="lua" gutter="true" first-line="26" highlight="[27]" }
local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

It's considered good programming practice to indent at least one __tab__ or <nobr>3-4</nobr> spaces when you add lines of code inside functions. This makes your code more readable and it's easier to recognize functions in longer programs.

</div>
</div>

`balloon:applyLinearImpulse` is a really cool command. When applied to a dynamic physical object like the balloon, it applies a "push" to the object in any direction. The parameters that we pass tell the physics engine how much force to apply (both&nbsp;horizontally and&nbsp;vertically) and also where on the object's body to apply the force.

The first two parameters, `0` and `-0.75`, indicate the amount of directional force. The first number is the horizontal, or __x__ direction, and the second number is the vertical, or __y__ direction. Since we only want to push the balloon upwards <nobr>(not left or right)</nobr>, we use `0` as the first parameter. For the second parameter, with a value of `-0.75`, we tell the physics engine to push the balloon up a little bit. The value of this number determines the amount of force that is applied: the bigger the number, the higher the force.

<div class="float-right" style="max-width: 360px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.simulator.axes]

</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

As shown in the diagram at right, positive __x__ values in Corona extend to the __right__, while positive __y__ values extend __downward__ (not&nbsp;upward as in the [Cartesian](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) coordinate&nbsp;system). This is why we use a negative value (`-0.75`) to push the balloon upward.

</div>
</div>

The third and fourth parameters, `balloon.x` and `balloon.y`, tell the physics engine where to apply the force, relative to the balloon itself. If you apply the force at a location which is not the center of the balloon, it may cause the balloon to move in an unexpected direction or spin around. For this game, we will keep the force focused on the center of the balloon.

That's it! We could, if needed, add additional commands inside the `pushBalloon()` function, but for this simple game, we only need to push the balloon upward with a small amount of force.

### Events

Events are what create interactivity and, in many ways, Corona is an <nobr>event-based</nobr> framework where information is dispatched during a specific event to an __event&nbsp;listener__. Whether that event is the user touching an object/button, tapping the screen, or (in&nbsp;this&nbsp;game) tapping the balloon, Corona can react by triggering an event.

Adding an event listener is easy&nbsp;&mdash; do so now, following the function:

``````{ brush="lua" gutter="true" first-line="26" highlight="[30]" }
local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
end

balloon:addEventListener( "tap", pushBalloon )
``````

Let's inspect the structure of this new command:

* First, we must tell Corona which object is involved in the event listener. For this game, we want to detect an event related directly to the `balloon` object.

* Immediately following this, add a colon (`:`), then `addEventListener`. In&nbsp;Lua, this is called an __object&nbsp;method__. Essentially, `addEventListener`, following the colon, tells Corona that we want to add an event listener to `balloon`, specified before the colon.

* Inside the parentheses are two parameters which complete the command. The first parameter is the __event&nbsp;type__ which Corona will listen for, in this case `"tap"`. The second parameter is the __function__ which should be run (called) when the event occurs, in this case the `pushBalloon()` function which we wrote in the previous section. Essentially, we're telling Corona to run the `pushBalloon()` function every time the user taps the balloon.

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

That is everything&nbsp;&mdash; you have a functional game now! If you save your `main.lua` file and relaunch the Simulator, it should be ready to go. Try your best to continue tapping/clicking the balloon and preventing it from touching the platform!

</div>
</div>

Here is the complete program, just in case you missed something:

``````{ brush="lua" gutter="true" first-line="1" }
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect( "balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
end

balloon:addEventListener( "tap", pushBalloon )
``````




<div class="float-right" style="max-width: 140px; margin-top: 36px; margin-bottom: 16px; clear: both;">

![][images.simulator.pastel-rocket]

</div>

<a id="extracredit"></a>

## Extra Credit

Congratulations, you have created a basic game in just 30 lines of code! But there is something missing, isn't there? Wouldn't it be nice if the game kept track of how many times the balloon was tapped? Fortunately that's easy to add!

First, let's create a local Lua variable to keep track of the tap count. You can add this at the very top of your existing code. In this case, we'll use it to store an __integer__ instead of associating it with an image. Since the player should begin the game with no score, we'll initially set its value to `0`, but this can change later.

``````{ brush="lua" gutter="true" first-line="7" highlight="[7]" }
local tapCount = 0

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY
``````

Next, let's create a visual object to display the number of taps on the balloon. Remember the rules of layering discussed earlier in this chapter? New objects will be placed in front of other objects which were loaded previously, so this object should be loaded __after__ you load the background (otherwise&nbsp;it will be placed behind the background and you won't&nbsp;see&nbsp;it).

After the three lines which load/position the background, add the following highlighted command:

``````{ brush="lua" gutter="true" first-line="7" highlight="[13]" }
local tapCount = 0

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
``````

Let's inspect this command in more detail:

* The command begins with <nobr>`local tapText`</nobr> which you should easily recognize as the declaration of a variable `tapText`.

* `display.newText()` is another Corona&nbsp;API, but instead of loading an image as we did earlier, this command creates a __text__ object. Because we are assigning the variable `tapText` to this object, we'll be able to make changes to the text during our game, such as changing the printed number to match how many times the balloon was tapped.

* Inside the parentheses are the parameters which we pass to `display.newText()`. The first parameter is the initial printed value for the text, but notice that instead of setting a direct string value like `"0"`, we actually assign the __variable__ which we declared earlier (`tapCount`). In Corona, it's perfectly valid to specify a variable as a parameter of an API, as long as it's a valid variable and the API accepts the variable's type as that parameter.

<div class="code-indent">

The second two parameters, `display.contentCenterX` and `20`, are used to position this text object on the screen. You'll notice that we use the same shortcut of `display.contentCenterX` to position the object in the horizontal center of the screen, and `20` to set its vertical __y__ position near the top of the screen.

The fourth parameter for this API is the __font__ in which to render the text. Corona supports [custom fonts][guide.system.customFont] across all platforms, but for this game we'll use the default system font by specifying `native.systemFont`.

The final parameter (`40`) is the intended __size__ of the rendered text.

</div>

<div class="float-right" style="max-width: 240px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-balloon-3]

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of this new code. Save your modified `main.lua` file and relaunch the Simulator. If all went well, the text object should now be showing, positioned near the top of the screen.

</div>
</div>

Continuing with our program &mdash; by default, text created with `display.newText()` will be white. Fortunately, it's easy to change this. Directly following the line you just added, type the highlighted command:

``````{ brush="lua" gutter="true" first-line="13" highlight="[14]" }
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )
``````

<div class="float-right" style="max-width: 240px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-balloon-4]

</div>

Simply put, this `setFillColor()` command modifies the fill color of the object `tapText`. The `setFillColor()` command accepts up to four numeric parameters in the range of <nobr>`0` to `1`</nobr>, one each for the color channels __red__, __green__, __blue__, and __alpha__. In this game, we're filling the object with solid black, so the first three channels are set to `0` (alpha&nbsp;defaults to `1` and it can be omitted in this&nbsp;case).

Let's move on! The new text object looks nice, but it doesn't actually do anything. To make it update when the player taps the balloon, we'll need to modify our `pushBalloon()` function. Inside this function, following the `balloon:applyLinearImpulse()` command, insert the two highlighted lines:

``````{ brush="lua" gutter="true" first-line="31" highlight="[33,34]" }
local function pushBalloon()
	balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
	tapCount = tapCount + 1
	tapText.text = tapCount
end
``````

Let's examine these lines individually:

<div class="float-right" style="max-width: 240px; margin-top: 12px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-balloon-0]

</div>

* The <nobr>`tapCount = tapCount + 1`</nobr> command increases the `tapCount` variable by 1 each time the balloon is tapped.

* The second new command, <nobr>`tapText.text = tapCount`</nobr>, updates the `text` property of our `tapText` object. This allows us to quickly change text without having to create a new object each time.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Look carefully &mdash; to update the on-screen text, we update a __property__ of the text object, not the object itself. In this case, we modify the `text` property of `tapText` by writing `tapText.text`, <nobr>followed by `=`</nobr>, then its new value. Because we increase the value of the `tapCount` variable on the line directly before, then update the text object with that same variable value, the visual display will always mirror the internal `tapCount` value.

</div>
</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

That's it! If you save your `main.lua` file and relaunch the Simulator, your game is essentially finished&nbsp;&mdash; now, each time you tap the balloon, the counter at the top of the screen will increase by 1, effectively keeping score.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

The complete `BalloonTap` program is available for download [here](https://github.com/coronalabs/GettingStarted01/archive/master.zip). If your project isn't working as expected, please download this source code and compare it with what you've created.

</div>
</div>




<a id="concepts"></a>

## Chapter Concepts

We've covered many concepts in this chapter. It may seem a bit overwhelming, but be patient, look at your code, and read through the sections again if necessary. If you need help, the [Corona Forums](https://forums.coronalabs.com/) are a friendly venue to communicate with other Corona developers and staff members.

Here's a quick overview of what you learned in this chapter:

<div class="inner-table">

Command/Property															Description
--------------------------------------------------------------------------	-----------------------------------------
[display.newImageRect()][api.library.display.newImageRect]					Loads and displays an image on the screen.
[object.x][api.type.DisplayObject.x]										Sets the horizontal __x__ position of an object.
[object.y][api.type.DisplayObject.y]										Sets the vertical __y__ position of an object.
[display.contentCenterX][api.library.display.contentCenterX]				Shortcut for the center of the content area along the __x__ axis.
[display.contentCenterY][api.library.display.contentCenterY]				Shortcut for the center of the content area along the __y__ axis.
[object.alpha][api.type.DisplayObject.alpha]								Sets the alpha level of an object (opacity/transparency).
[require()][api.library.package.require]									Loads a given module or library, for example `"physics"`.
[physics.start()][api.library.physics.start]								Starts the physics engine.
[physics.addBody()][api.library.physics.addBody]							Adds a physical body to an object.
[object:applyLinearImpulse()][api.type.Body.applyLinearImpulse]				Applies a simulated impulse force to a physical object.
[object:addEventListener()][api.type.EventDispatcher.addEventListener]		Adds an event listener to an object, for example `"tap"`.
[display.newText()][api.library.display.newText]							Creates a text object on the screen.
[object:setFillColor()][api.type.ShapeObject.setFillColor]					Sets the fill color for text and vector objects.
--------------------------------------------------------------------------	-----------------------------------------

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-pencil" style="font-size: 31px; padding-left: 2px;"></div>
</div>
<div class="docs-tip-inner-right">

How are you enjoying this guide? Is&nbsp;it&nbsp;helpful? Please <a href="https://docs.google.com/forms/d/e/1FAIpQLScqNwYqPM8S1DorhV5K1nDlxZYTN2SFnMn0wYCpv8r3AiQtsg/viewform" target="_new">fill out a quick survey</a> and help us improve the Corona learning experience!

<a href="https://docs.google.com/forms/d/e/1FAIpQLScqNwYqPM8S1DorhV5K1nDlxZYTN2SFnMn0wYCpv8r3AiQtsg/viewform" target="_blank" class="cta-button" style="background-color: #4fa0e6;">Provide Feedback</a>

</div>
</div>


##

<div class="walkthrough-nav">

__&lang;__ [Introduction to Corona][guide.programming.intro] _|_ [Chapter 2 &mdash; Upward &amp; Onward][guide.programming.02] __&rang;__

</div>
