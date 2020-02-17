# Chapter 8 &mdash; Deployment

<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.07] _|_ [Guide Index][guide.programming]

</div>
</div>

<style>

.grad-back {
	display: flex;
	margin-top: 20px;
	margin-bottom: 20px;
	overflow: hidden;
	background: -moz-linear-gradient( top, #4e4946 0%, #978d86 100% );
	background: -webkit-linear-gradient( top, #4e4946 0%, #978d86 100% );
	background: linear-gradient( to bottom, #4e4946 0%, #978d86 100% );
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#4e4946", endColorstr="#978d86", GradientType=0 );
	max-width: 920px;
}
.contained-cell {
	width: 12%;
	padding-left: 10px;
	padding-right: 10px;
}
.contained-cell img {
	max-width: 75px;
}
.social-button {
    background-color: #e3f2fa;
    margin: 20px 8px 8px 0px;
    min-height: 44px;
    min-width: 44px;
    max-height: 44px;
    max-width: 44px;
    border-radius: 2px;
    text-align: center;
    float: left;
}
.social-button .fa {
    color: #09204a;
    font-size: 26px;
    overflow: hidden;
    padding: 9px 0px 0px 0px;
    opacity: 0.75;
}
.inner-table img {
    max-width: 250px;
    margin-top: 0px;
    margin-bottom: 4px;
}

.inner-table.compact table th, .inner-table.compact table td {
	border-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
}
.inner-table.compact table th {
	padding-left: 8px;
	padding-right: 8px;
}

</style>

Deployment is the culmination of all your hard work. Those hours of designing, programming, and testing have yielded a game that's ready to show to the world! In this chapter we'll discuss a few final considerations before publishing, as well as summarize the steps required for deployment.

<div class="guides-toc">

* [Icons](#icons)
* [Making it Yours](#yours)
* [Corona Live Builds](#live-builds)
* [Building and Publishing](#buildpublish)

</div>


<a id="icons"></a>

## Icons

<div class="float-right" style="max-width: 180px; margin-top: 2px; clear: left;">

![][images.docs.sbs-starexplorer-icon]

</div>

Each of the app stores &mdash; the [Apple App Store](https://www.apple.com/appstore)&trade;, [Google Play](https://play.google.com/store)&trade;, [Amazon Appstore](https://www.amazon.com/mobile-apps/b/ref=topnav_storetab_mas?ie=UTF8&node=2350149011)&trade;, etc.&nbsp;&mdash; has different __icon__ requirements and each requests various sizes and design considerations for different devices. There are several online services that will automatically create the entire set of required icons in the correct sizes, although you may wish to design them all yourself. Remember, these will be relatively small in size when they visually represent your app on an actual device, so fine details might be lost.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

You can find a full list of required icons for each platform [here][guide.distribution.buildSettings#custom-app-icons]. In addition, we've included a full set of icons for mobile devices in this chapter's [source files](https://github.com/coronalabs/GettingStarted08/archive/master.zip).

</div>
</div>




<a id="yours"></a>

## Making it Yours

This tutorial, and Star&nbsp;Explorer in general, is a starter project that many people complete and potentially submit to the app stores. As a result, many people have deployed the same identical game to prospective players. While this is acceptable, you should consider how to change and customize this game so that it's __yours__, distinct in certain ways from the base template we've provided. Here are some ideas:

* Change the art/audio to suit your personal taste. There are numerous visual and audio assets available in the <a href="https://marketplace.coronalabs.com/assets" target="_new">Corona Marketplace</a> which you can adapt for usage within the Star&nbsp;Explorer project.

* Change the game title on the title screen and/or use a different background image.

* Utilize additional asteroid image frames from the `gameObjects.png` image sheet, randomly spawning one of the variations in the `createAsteroid()` function.

* Implement particle-based effects such as explosions and laser trails using Corona's <nobr>built-in</nobr> [display.newEmitter()][api.library.display.newEmitter] feature.

Once you have a game of your own (based on Star&nbsp;Explorer or some other code base), proceed to the next sections for details on testing and building.




<a id="live-builds"></a>

## Corona Live Builds

<div class="float-right" style="max-width: 330px; margin-bottom: 16px; clear: both;">

![][images.docs.corona-live-builds]

</div>

While the Corona Simulator is a great way to test your game during development, nothing quite compares to seeing it run on an actual device!

The best solution is <a href="https://coronalabs.com/corona-live-builds/" target="_new">Corona Live Builds</a>. Using the power and speed of a local network, you can preview and test your game on multiple devices simultaneously, watching your game dynamically update as you edit its code and assets. With Corona&nbsp;Live&nbsp;Builds, you get <nobr>lightning-fast</nobr> development gratification.

To learn how to configure live builds, see the [Generating Live Builds][guide.distribution.liveBuild] guide.




<a id="buildpublish"></a>

## Building and Publishing

<!--- START PLATFORM ICONS -->

<div class="grad-back">
<div class="contained-cell" style="padding-left: 15px;">
<center>

![][images.docs.badge-app-store]

</center>
</div>
<div class="contained-cell">
<center>

![][images.docs.badge-google-play]

</center>
</div>
<div class="contained-cell">
<center>

![][images.docs.badge-amazon]

</center>
</div>
<div class="contained-cell">
<center>

![][images.docs.badge-windows]

</center>
</div>
<div class="contained-cell">
<center>

![][images.docs.badge-mac]

</center>
</div>
<div class="contained-cell">
<center>

![][images.docs.badge-tvos]

</center>
</div>
<div class="contained-cell">
<center>

![][images.docs.badge-android-tv]

</center>
</div>
<div class="contained-cell" style="padding-right: 15px;">
<center>

![][images.docs.badge-steam]

</center>
</div>
<div class="contained-cell" style="background-color: white; width: 4%;"></div>
</div>

<!--- END PLATFORM ICONS -->

Let's discuss building and publishing! You should always test your app on an actual device before submitting it to an app store. In fact, since this is your final phase of quality control, you should test on as many devices as possible.

The requirements are a little different depending on which platform you intend to deploy to, so we'll cover them separately.

### iOS

The first step in building for Apple&nbsp;iOS is __provisioning__, Apple's process for testing and distribution. You should follow the detailed instructions in the [Provisioning and Building — iOS][guide.distribution.iOSBuild] guide in order to test and deploy for iOS.

### Android

Deploying and publishing to the Google&nbsp;Play marketplace is a little different than Apple. Android uses a few specific naming conventions and has its own process for "signing" apps with your personal information. You can step through the entire process [here][guide.distribution.androidBuild].

### Kindle Fire

While Amazon's Kindle Fire is built upon the Android operating system, it has a few unique considerations for building. Complete instructions for building for Kindle&nbsp;Fire are available [here][guide.distribution.kindleBuild].

### Windows / macOS

Yes, you can even build your game as a Windows&nbsp;desktop or macOS&nbsp;desktop application! However, mobile apps and desktop apps operate very differently&nbsp;&mdash; you must consider how the app will run in a window, how to handle keyboard responses, if the game window can be resized, etc. Don't make the mistake of thinking that your game is ready for desktop deployment before studying the following guides:

* [Creating Win32 Desktop Apps][guide.distribution.win32Build]
* [Creating macOS Desktop Apps][guide.distribution.macOSBuild]

### Apple TV

Like desktop applications, there are several unique considerations which you must take into account before deploying your app to Apple&nbsp;TV. For detailed information, see the [Apple TV / tvOS][guide.distribution.tvos] guide.

### Android TV

Because Android apps are universal, it's simple to deploy to Android&nbsp;TV&nbsp;&mdash; just [build your app][guide.distribution.androidBuild] as a standard Android `.apk`, add two additional parameters to your `build.settings` file as outlined [here][guide.distribution.advancedSettings#android-tv], and include an Android&nbsp;TV banner as noted [here][guide.distribution.buildSettings#tvos-android-tv].

### Steam

To learn about deploying your desktop game to Steam, please see the [Steamworks plugin][plugin.steamworks] documentation.




## Congratulations!

You made it! Take a deep breath and be proud of how much you've learned in such a short time&nbsp;&mdash; you've built a complete game using Corona and you're ready to begin your grand adventure into the world of game creation. What enhancements can you add to Star&nbsp;Explorer to make it even better? How about making the large asteroids explode into a few smaller asteroids when they're hit? The game may also benefit from a few additional enemies to increase the challenge and variety.

What other ideas do you have? Do you want to make a puzzle game? A <nobr>point-and-click</nobr> adventure game? A platform game where you run, jump, collect coins, and avoid hazards to claim a prize? There's an endless variety of games you can make.

Thinking of <nobr>e-books</nobr> or educational apps? Want to build something <nobr>non-game-related</nobr> like a business or utility app? Corona can power these as well!

### Dream, Build, Ship!

Here are a few of the amazing apps built with Corona by creative dreamers just like you!

<iframe width="560" height="315" src="https://www.youtube.com/embed/AVcKdr6ODpM?rel=0&showinfo=0" frameborder="0" allowfullscreen></iframe>




## Where From Here?

### Demo Projects

Star Explorer is just the beginning! Now that you're comfortable using Corona and coding in Lua, check out some of our amazing [Demo Projects][guide.programming#demo-projects] which you can use as <nobr>open-source</nobr> templates for your own games!

<div class="inner-table compact">

 Match 3 Space RPG																	 Sticker Knight Platformer																		 Endless Sk8boarder
------------------------------------------------------------------------------	--	------------------------------------------------------------------------------------------	--	--------------------------
 [![][images.docs.ponywolf-match3-1]][guide.programming#match-3-space-rpg]			 [![][images.docs.ponywolf-platformer-1]][guide.programming#sticker-knight-platformer]			 [![][images.docs.ponywolf-sk8boarder-1]][guide.programming#endless-sk8boarder]
------------------------------------------------------------------------------	--	------------------------------------------------------------------------------------------	--	--------------------------

</div>

### Corona Community

As we mentioned in the beginning, the Corona community is friendly and helpful. You can interact with other developers in various ways:

* [Corona Forums](https://forums.coronalabs.com/) &mdash; Get help from Corona developers and staff, or see how others tackled similar challenges.
* [Slack](https://coronalabs.com/slack/) &mdash; `Corona Developer Network` on Slack.

<a href="https://www.facebook.com/CoronaLabs" target="_new"><div class="social-button"><div class="fa fa-facebook-official"></div></div></a>
<a href="https://twitter.com/coronalabs" target="_new"><div class="social-button"><div class="fa fa-twitter" style="padding-left: 2px;"></div></div></a>
<a href="https://plus.google.com/+Coronalabsinc" target="_new"><div class="social-button"><div class="fa fa-google-plus" style="font-size: 22px; padding-top: 11px; padding-left: 2px;"></div></div></a>
<a href="https://www.linkedin.com/company/corona-labs" target="_new"><div class="social-button"><div class="fa fa-linkedin" style="padding-top: 8px; padding-left: 1px;"></div></div></a>
<a href="https://www.youtube.com/user/CoronaLabs" target="_new"><div class="social-button"><div class="fa fa-youtube" style="font-size: 23px; padding-top: 10px; padding-left: 1px;"></div></div></a>
<a href="https://github.com/coronalabs" target="_new"><div class="social-button"><div class="fa fa-github" style="font-size: 30px; padding-top: 7px; padding-left: 1px;"></div></div></a>
<div class="clear"></div>

### Learning Resources

There are several places where you can learn more about Corona:

* Corona [Developer Guides][guide] go further in depth on many selected topics.
* The [API Reference][api] site provides details about every API.
* Additional books and online courses for Corona can be found [here](https://coronalabs.com/resources/books/).

### Providing Feedback

Have feedback or ideas for new things you want to see in Corona? New directions you hope the product will go? Please submit your requests at [feedback.coronalabs.com](feedback.coronalabs.com).

### Sharing the Love

One final note before you get back to working on your great app&nbsp;&mdash; please let us know when your app is in the store! We love seeing how our developers are using Corona and we enjoy highlighting the best <nobr>Corona-built</nobr> apps in the [Corona Showcase](https://coronalabs.com/corona-showcase/).

<!---

## Extra Credit

Short chapter to be added about:

1) Adding Flurry Analytics to your app to start tracking events because "your app will only be good as how you measure its success."
2) Adding push notifications into your app with OneSignal because it's easiest way to get your users to keep coming back to your app.
3) Adding attribution tracking via Kochava because it's important to know where your installs are coming from - organic and, if paid, which campaign.

-->


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 7 &mdash; Sounds and Music][guide.programming.07] _|_ [Guide Index][guide.programming]

</div>


<!--- LEGAL -->

##

<div class="tiny-copy">

Apple and the Apple logo are trademarks of Apple&nbsp;Inc., registered in the U.S. and other countries. App&nbsp;Store is a service mark of Apple&nbsp;Inc. Mac and the Mac logo are trademarks of Apple&nbsp;Inc., registered in the U.S. and other countries.

Google Play, Android&nbsp;TV, and the Google&nbsp;Play logo are trademarks of Google&nbsp;Inc.

Amazon, Kindle, Echo, Alexa, Dash, Fire and all related logos are trademarks of Amazon.com, Inc. or its affiliates.

Microsoft, Encarta, MSN, and Windows are either registered trademarks or trademarks of Microsoft&nbsp;Corporation in the United&nbsp;States and/or other countries.

Steam and the Steam logo are trademarks and/or registered trademarks of Valve&nbsp;Corporation in the U.S. and/or other countries.

</div>
