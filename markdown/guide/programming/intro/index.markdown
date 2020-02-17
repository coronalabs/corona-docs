# Introduction to Corona

Welcome to Corona! Before creating an actual app, we'll provide some basic information about Corona and discuss how to get started.

<div class="guides-toc">

* [What is Corona?](#whatis)
* [Why Choose Corona?](#whychoose)
* [How Corona Works](#howworks)
* [The Corona Suite](#thesuite)
* [System Requirements](#systemreqs)
* [Getting Started](#start)

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

</style>


<a id="whatis"></a>

## What is Corona?

Corona is a __cross-platform__ framework used to rapidly create apps and games for mobile devices and desktop systems. That means you can create your project once and publish it to multiple types of devices, including Apple iPhone and iPad, Android phones and tablets, Amazon&nbsp;Fire, Mac&nbsp;desktop, Windows&nbsp;Desktop, and even connected TVs such as Apple&nbsp;TV, Fire&nbsp;TV, and Android&nbsp;TV.

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




<a id="whychoose"></a>

## Why Choose Corona?

Corona is used by professional programmers, mobile app developers, businesses, schools, and universities to develop engaging games, educational apps, business/utility apps, and more. Corona is easy enough to learn for those who are just starting, yet powerful enough for the experienced developer. With Corona you get all of these benefits:

<!--- 1 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-magic" style="font-size: 20px; padding-left: 1px; padding-top: 9px;"></div></div>

Corona is a __complete framework__ which lets you create games, educational apps, business/utility apps, and more.

</div>
<!--- 2 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-arrows-alt" style="font-size: 20px; padding-left: 2px; padding-top: 8px;"></div></div>

Corona is __cross-platform__ &mdash; develop for mobile, desktop, and connected TV devices with just one code base.

</div>
<!--- 3 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-list-ol" style="font-size: 20px; padding-top: 8px;"></div></div>

Development is done in [Lua](https://www.lua.org/), a powerful and <nobr>easy-to-learn</nobr> scripting language.

</div>
<!--- 4 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-wifi" style="font-size: 20px; padding-left: 1px; padding-top: 9px;"></div></div>

Optimize your workflow with [real-time device testing](https://coronalabs.com/corona-live-builds/)&nbsp;&mdash; build and deploy your app just once and then see code/assets update almost instantly on your devices, all over a local network.

</div>
<!--- 5 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-cog" style="font-size: 25px; padding-left: 1px; padding-top: 6px;"></div></div>

Over [1000 APIs][api] enable you to transform your ideas into stunning and innovative app experiences.

</div>
<!--- 6 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-bolt" style="font-size: 23px; padding-top: 6px; padding-left: 2px;"></div></div>

Corona [plugins](https://marketplace.coronalabs.com/plugins) give developers access to additional functionality, tools, and services.

</div>
<!--- 7 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-rocket" style="font-size: 21px; padding-top: 7px;"></div></div>

Best-in-class [monetization plugins](https://marketplace.coronalabs.com/plugins/monetization) and [analytics plugins](https://marketplace.coronalabs.com/corona-plugins?filter=category.slug%3Aanalytics&sort=%2BDate&all=yes) help you succeed, all with just a few lines of code. Spend time making awesome apps, not implementing <nobr>third-party</nobr> software development kits!

</div>
<!--- 8 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-shopping-bag" style="font-size: 18px; padding-top: 8px; padding-left: 1px;"></div></div>

A huge selection of <nobr>third-party</nobr> [assets](https://marketplace.coronalabs.com/assets)&nbsp;&mdash; graphics, animations, music, sound&nbsp;effects, tools, and&nbsp;more&nbsp;&mdash; all conveniently available in the [Corona Marketplace](https://marketplace.coronalabs.com/assets).

</div>




<a id="howworks"></a>

## How Corona Works

<div class="float-right" style="max-width: 330px; margin-bottom: 16px; clear: both;">

![][images.docs.corona-live-builds]

</div>

Corona is a [Lua](https://www.lua.org/)-based framework that provides a [large set of APIs][api] and [plugins](https://marketplace.coronalabs.com/plugins), allowing developers to quickly and easily make apps that can run on multiple types of devices.

With the <nobr>built-in</nobr> Corona&nbsp;Simulator, you can preview how your app will appear and respond on many types of devices, all without having to compile or deploy it for testing. When you're ready, you can conduct <a href="https://coronalabs.com/corona-live-builds/" target="_new">real-time device testing</a> to see how your app performs on actual devices.

In addition to the core framework, Corona includes many [plugins](https://marketplace.coronalabs.com/plugins) which add specific functionality and help speed up the development of your app. Want to monetize your apps with <nobr>in-app</nobr> advertising? See our [Monetization Guide][guide.monetization.monetization] for options. Want to connect to Facebook? Simply use the convenient [Facebook][plugin.facebook-v4] plugin. By using a plugin, you are able to focus on building your app and while leveraging stable <nobr>add-ons</nobr>. Corona plugins are a vibrant part of the Corona ecosystem and new plugins are released on a consistent basis.

<div style="max-width: 1600px; margin-top: 12px; margin-bottom: 12px;">

![][images.docs.corona-key-plugins]

</div>

Essentially, Corona focuses on helping you make your app quickly! Most developers report that they're able to complete apps much faster using Corona versus other systems. With the added benefit of writing just one code base that can be deployed to multiple platforms, choosing Corona is a natural choice.




<a id="thesuite"></a>

## The Corona Suite

Corona Labs offers three variants of Corona so that you can use the toolset which is best for your needs:

### CORONA_CORE_PRODUCT

[CORONA_CORE_PRODUCT](https://coronalabs.com/product/) is a <nobr>full-featured</nobr>, <nobr>cross-platform</nobr> framework that enables developers to create apps rapidly and publish to all major platforms. CORONA_CORE_PRODUCT is completely free and there are no restrictions on which supported platforms you can build for, nor does Corona&nbsp;Labs charge you to publish your apps to the various marketplaces.

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

If you're new to Corona or new to app development, download [CORONA_CORE_PRODUCT](https://coronalabs.com/product/)&nbsp;&mdash; it&nbsp;contains all of the core features to get started quickly!

<a href="https://portal.coronalabs.com/" target="_blank" class="cta-button">Download CORONA_CORE_PRODUCT</a>

</div>
</div>

### CORONA_NATIVE_PRODUCT

CORONA_NATIVE_PRODUCT provides <nobr>low-level</nobr> access to the operating system and native&nbsp;APIs. While most apps designed using Corona do not require this level of access, it allows you to use native languages like <nobr>Obj-C</nobr> or Java to pass information between the native code and Lua code.

### CoronaCards

[CoronaCards](http://coronacards.com/) is used to implement Corona inside native apps or other frameworks. This allows developers to embed Corona resources without interfering with the main application stack.




<a id="systemreqs"></a>

## System Requirements

What do you need to get started? In addition to Corona, you will need an IDE or a text editor (we'll&nbsp;discuss this further in Chapter&nbsp;1).

The specific system requirements depend on whether you are developing on a Mac or Windows system:

<div class="docs-tip-outer" style="background-color: #a5aec9;">
<div class="docs-tip-inner-left">
<div class="fa fa-apple" style="font-size: 36px; margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

CORONA_CORE_PRODUCT for __macOS__ supports building applications for iOS, Android, tvOS, and <nobr>macOS desktop</nobr>. It requires the following basic system elements:

* macOS 10.11 or later
* Xcode (minimum version allowed by Apple to submit apps to the App Store)

For more details, see the [System Requirements][guide.start.systemReqs] page. If you're ready to install Corona now, please proceed to [Installing CORONA_CORE_PRODUCT &mdash; macOS][guide.start.installMac].

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-windows" style="font-size: 31px; margin-left: 0px; margin-top: 2px;"></div>
</div>
<div class="docs-tip-inner-right">

CORONA_CORE_PRODUCT for __Windows__ supports building applications for Android and Win32&nbsp;desktop. It requires the following basic system elements:

* Windows 10, Windows&nbsp;8, or Windows&nbsp;7
* 1 GHz processor (recommended)
* 1 GB of RAM (recommended)
* OpenGL 2.1 or higher (available in most modern Windows systems)

For more details, see the [System Requirements][guide.start.systemReqs] page. If you're ready to install Corona now, please proceed to [Installing CORONA_CORE_PRODUCT &mdash; Windows][guide.start.installWin].

</div>
</div>




<a id="start"></a>

## Getting Started

### Create an App!

The most fun way to learn Corona is to [create a simple game][guide.programming.01]. Don't worry if you've never created a mobile app or programmed before&nbsp;&mdash; the chapters in this guide will walk you through the entire process from start to finish.

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating an App][guide.programming.01] __&rang;__

</div>

### Learning Resources

There are several places where you can learn more about Corona:

* Corona [Developer Guides][guide] go further in depth on many selected topics.
* The [API Reference][api] site provides details about every API.
* Additional books and online courses for Corona can be found [here](https://coronalabs.com/resources/books/).

### Getting Help

The Corona community is friendly and helpful! You can interact with other Corona developers in various ways:

* [Corona Forums](https://forums.coronalabs.com/) &mdash; Get help from Corona developers and staff, or see how others tackled similar challenges.
* [IRC](https://coronalabs.com/community/irc/) &mdash; `#corona` on [irc.freenode.net](https://kiwiirc.com/client/irc.freenode.net/corona).

<a href="https://www.facebook.com/CoronaLabs" target="_new"><div class="social-button"><div class="fa fa-facebook-official"></div></div></a>
<a href="https://twitter.com/coronalabs" target="_new"><div class="social-button"><div class="fa fa-twitter" style="padding-left: 2px;"></div></div></a>
<a href="https://plus.google.com/+Coronalabsinc" target="_new"><div class="social-button"><div class="fa fa-google-plus" style="font-size: 22px; padding-top: 11px; padding-left: 2px;"></div></div></a>
<a href="https://www.linkedin.com/company/corona-labs" target="_new"><div class="social-button"><div class="fa fa-linkedin" style="padding-top: 8px; padding-left: 1px;"></div></div></a>
<a href="https://www.youtube.com/user/CoronaLabs" target="_new"><div class="social-button"><div class="fa fa-youtube" style="font-size: 23px; padding-top: 10px; padding-left: 1px;"></div></div></a>
<a href="https://github.com/coronalabs" target="_new"><div class="social-button"><div class="fa fa-github" style="font-size: 30px; padding-top: 7px; padding-left: 1px;"></div></div></a>
<div class="clear"></div>


##

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating an App][guide.programming.01] __&rang;__

</div>


<!--- LEGAL -->

##

<div class="tiny-copy">

Apple and the Apple logo are trademarks of Apple&nbsp;Inc., registered in the U.S. and other countries. App&nbsp;Store is a service mark of Apple&nbsp;Inc. Mac and the Mac logo are trademarks of Apple&nbsp;Inc., registered in the U.S. and other countries.

Google Play, Android&nbsp;TV, Google&nbsp;Play, AdMob, and the Google&nbsp;Analytics logo are trademarks of Google&nbsp;Inc.

Amazon, Kindle, Echo, Alexa, Dash, Fire and all related logos are trademarks of Amazon.com, Inc. or its affiliates.

Microsoft, Encarta, MSN, and Windows are either registered trademarks or trademarks of Microsoft&nbsp;Corporation in the United&nbsp;States and/or other countries.

Steam and the Steam logo are trademarks and/or registered trademarks of Valve&nbsp;Corporation in the U.S. and/or other countries.

</div>
