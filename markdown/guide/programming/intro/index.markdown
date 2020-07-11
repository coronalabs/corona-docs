# Introduction to CORONA_CORE_PRODUCT

Welcome to CORONA_CORE_PRODUCT! Before creating an actual app, we'll provide some basic information and discuss how to get started.

<div class="guides-toc">

* [What is CORONA_CORE_PRODUCT ?](#whatis)
* [Why Choose CORONA_CORE_PRODUCT ?](#whychoose)
* [How CORONA_CORE_PRODUCT Works](#howworks)
* [The CORONA_CORE_PRODUCT Suite](#thesuite)
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

## What is CORONA_CORE_PRODUCT ?

CORONA_CORE_PRODUCT is a __cross-platform__ framework used to rapidly create apps and games for mobile devices and desktop systems. That means you can create your project once and publish it to multiple types of devices, including Apple iPhone and iPad, Android phones and tablets, Amazon&nbsp;Fire, Mac&nbsp;desktop, Windows&nbsp;Desktop, and even connected TVs such as Apple&nbsp;TV, Fire&nbsp;TV, and Android&nbsp;TV.

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

## Why Choose CORONA_CORE_PRODUCT ?

CORONA_CORE_PRODUCT is used by professional programmers, mobile app developers, businesses, schools, and universities to develop engaging games, educational apps, business/utility apps, and more. CORONA_CORE_PRODUCT is easy enough to learn for those who are just starting, yet powerful enough for the experienced developer. With CORONA_CORE_PRODUCT you get all of these benefits:

<!--- 1 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-magic" style="font-size: 20px; padding-left: 1px; padding-top: 9px;"></div></div>

A __complete framework__ which lets you create games, educational apps, business/utility apps, and more.

</div>
<!--- 2 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-arrows-alt" style="font-size: 20px; padding-left: 2px; padding-top: 8px;"></div></div>

__Cross-platform__ &mdash; develop for mobile, desktop, and connected TV devices with just one code base.

</div>
<!--- 3 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-list-ol" style="font-size: 20px; padding-top: 8px;"></div></div>

Development is done in [Lua](https://www.lua.org/), a powerful and <nobr>easy-to-learn</nobr> scripting language.

</div>
<!--- 4 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-wifi" style="font-size: 20px; padding-left: 1px; padding-top: 9px;"></div></div>

Optimize your workflow with [real-time device testing][guide.distribution.liveBuild]&nbsp;&mdash; build and deploy your app just once and then see code/assets update almost instantly on your devices, all over a local network.

</div>
<!--- 5 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-cog" style="font-size: 25px; padding-left: 1px; padding-top: 6px;"></div></div>

Over [1000 APIs][api] enable you to transform your ideas into stunning and innovative app experiences.

</div>
<!--- 6 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-bolt" style="font-size: 23px; padding-top: 6px; padding-left: 2px;"></div></div>

[Plugins](PLUGINS_DIR) give developers access to additional functionality, tools, and services.

</div>
<!--- 7 --->
<div class="fa-list-element"><div class="fa-list-element-tile">
<div class="fa fa-rocket" style="font-size: 21px; padding-top: 7px;"></div></div>

All kinds of plugins to help you succeed, with just a few lines of code. Spend time making awesome apps, not implementing <nobr>third-party</nobr> software development kits!

</div>
<!--- 8 --->
<div class="fa-list-element"><div class="fa-list-element-tile" style="background-color: #fc6420;">
<div class="fa fa-shopping-bag" style="font-size: 18px; padding-top: 8px; padding-left: 1px;"></div></div>

Supported by <nobr>third-party</nobr> marketplaces such as [Solar2D Marketplace](https://solar2dmarketplace.com/) and [Solar2D Plugins](https://www.solar2dplugins.com/).

</div>




<a id="howworks"></a>

## How CORONA_CORE_PRODUCT Works

<div class="float-right" style="max-width: 330px; margin-bottom: 16px; clear: both;">

![][images.docs.corona-live-builds]

</div>

CORONA_CORE_PRODUCT is a [Lua](https://www.lua.org/)-based framework that provides a [large set of APIs][api] and [plugins](PLUGINS_DIR), allowing developers to quickly and easily make apps that can run on multiple types of devices.

With the <nobr>built-in</nobr> Simulator, you can preview how your app will appear and respond on many types of devices, all without having to compile or deploy it for testing. When you're ready, you can conduct [real-time device testing][guide.distribution.liveBuild] to see how your app performs on actual devices.

In addition to the core framework, CORONA_CORE_PRODUCT includes many [plugins](PLUGINS_DIR) which add specific functionality and help speed up the development of your app. Want to monetize your apps with <nobr>in-app</nobr> advertising? See our [Monetization Guide][guide.monetization.monetization] for options. Want to connect to Facebook? Simply use the convenient [Facebook][plugin.facebook-v4] plugin. By using a plugin, you are able to focus on building your app and while leveraging stable <nobr>add-ons</nobr>.

<div style="max-width: 1600px; margin-top: 12px; margin-bottom: 12px;">

![][images.docs.corona-key-plugins]

</div>

Essentially, CORONA_CORE_PRODUCT focuses on helping you make your app quickly! Most developers report that they're able to complete apps much faster using CORONA_CORE_PRODUCT versus other systems. With the benefit of writing just one code base that can be deployed to multiple platforms, choosing CORONA_CORE_PRODUCT is a natural choice.




<a id="thesuite"></a>

## The CORONA_CORE_PRODUCT Suite

There are three variants of CORONA_CORE_PRODUCT so that you can use the toolset which is best for your needs:

### CORONA_CORE_PRODUCT

[CORONA_CORE_PRODUCT](REVISION_URL) is a <nobr>full-featured</nobr>, <nobr>cross-platform</nobr> framework that enables developers to create apps rapidly and publish to all major platforms. CORONA_CORE_PRODUCT is completely free and there are no restrictions on which supported platforms you can build and publish your projects.

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

If you're new to CORONA_CORE_PRODUCT or app development, download [CORONA_CORE_PRODUCT](REVISION_URL)&nbsp;&mdash; it&nbsp;contains all of the core features to get started quickly!

<a href="https://github.com/coronalabs/corona/releases" target="_blank" class="cta-button">Download CORONA_CORE_PRODUCT</a>

</div>
</div>

### CORONA_NATIVE_PRODUCT

CORONA_NATIVE_PRODUCT provides <nobr>low-level</nobr> access to the operating system and native&nbsp;APIs. While most apps designed using CORONA_CORE_PRODUCT do not require this level of access, it allows you to use native languages like <nobr>Obj-C</nobr> or Java to pass information between the native code and Lua code.

### CoronaCards

[CoronaCards](http://coronacards.com/) is used to implement CORONA_CORE_PRODUCT inside native apps or other frameworks. This allows developers to embed CORONA_CORE_PRODUCT resources without interfering with the main application stack.




<a id="systemreqs"></a>

## System Requirements

What do you need to get started? In addition to CORONA_CORE_PRODUCT, you will need an IDE or a text editor (we'll&nbsp;discuss this further in Chapter&nbsp;1).

The specific system requirements depend on whether you are developing on a Mac or Windows system:

<div class="docs-tip-outer" style="background-color: #a5aec9;">
<div class="docs-tip-inner-left">
<div class="fa fa-apple" style="font-size: 36px; margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

CORONA_CORE_PRODUCT for __macOS__ supports building applications for iOS, Android, tvOS, and <nobr>macOS desktop</nobr>. It requires the following basic system elements:

* macOS 10.11 or later
* Xcode (minimum version allowed by Apple to submit apps to the App Store)

For more details, see the [System Requirements][guide.start.systemReqs] page. If you're ready to install, please proceed to [Installing CORONA_CORE_PRODUCT &mdash; macOS][guide.start.installMac].

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

For more details, see the [System Requirements][guide.start.systemReqs] page. If you're ready to install, please proceed to [Installing CORONA_CORE_PRODUCT &mdash; Windows][guide.start.installWin].

</div>
</div>




<a id="start"></a>

## Getting Started

### Join the community

The CORONA_CORE_PRODUCT community is friendly and helpful! You can interact with other CORONA_CORE_PRODUCT developers in various ways:

* [Forums](https://forums.solar2d.com/)
* [Discord](https://discord.gg/Abf5V9G/)

<a href="https://github.com/coronalabs" target="_new"><div class="social-button"><div class="fa fa-github"></div></div></a>
<a href="https://www.facebook.com/Solar2D" target="_new"><div class="social-button"><div class="fa fa-facebook-official" style="padding-left: 2px;"></div></div></a>
<a href="https://twitter.com/Solar2Dev" target="_new"><div class="social-button"><div class="fa fa-twitter" style="font-size: 22px; padding-top: 11px; padding-left: 2px;"></div></div></a>
<a href="https://www.linkedin.com/company/solar2d/" target="_new"><div class="social-button"><div class="fa fa-linkedin" style="padding-top: 8px; padding-left: 1px;"></div></div></a>
<div class="clear"></div>

### Check the resources

There are several places where you can learn more about CORONA_CORE_PRODUCT:

* [Developer Guides][guide] go further in depth on many selected topics.
* The [API Reference][api] site provides details about every API.
* Additional books and online courses for CORONA_CORE_PRODUCT can be found [here](https://burtonsmediagroup.com/books/coronasdk/).

### Create a project

The most fun way to learn CORONA_CORE_PRODUCT is to [create a simple game][guide.programming.01]. Don't worry if you've never created a mobile app or programmed before&nbsp;&mdash; the chapters in this guide will walk you through the entire process from start to finish.

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating a project][guide.programming.01] __&rang;__

</div>
<div class="clear"></div>


<!--- LEGAL -->

##

<div class="tiny-copy">

Apple and the Apple logo are trademarks of Apple&nbsp;Inc., registered in the U.S. and other countries. App&nbsp;Store is a service mark of Apple&nbsp;Inc. Mac and the Mac logo are trademarks of Apple&nbsp;Inc., registered in the U.S. and other countries.

Google Play, Android&nbsp;TV, Google&nbsp;Play, AdMob, and the Google&nbsp;Analytics logo are trademarks of Google&nbsp;Inc.

Amazon, Kindle, Echo, Alexa, Dash, Fire and all related logos are trademarks of Amazon.com, Inc. or its affiliates.

Microsoft, Encarta, MSN, and Windows are either registered trademarks or trademarks of Microsoft&nbsp;Corporation in the United&nbsp;States and/or other countries.

Steam and the Steam logo are trademarks and/or registered trademarks of Valve&nbsp;Corporation in the U.S. and/or other countries.

</div>
