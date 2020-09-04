# Frequently Asked Questions (FAQ)

<div class="guides-toc">

* [What can I do with CORONA_CARDS_PRODUCT ?](#doWhat)
* [Why would I use CORONA_CARDS_PRODUCT ?](#useCases)
* [Should I use CORONA_CORE_PRODUCT, CORONA_NATIVE_PRODUCT, or CORONA_CARDS_PRODUCT ?](#chooseProduct)
* [If I use CORONA_CORE_PRODUCT or CORONA_NATIVE_PRODUCT, do I need CORONA_CARDS_PRODUCT ?](#neededProduct)
* [Can I do the same things with CORONA_CARDS_PRODUCT and CORONA_NATIVE_PRODUCT ?](#functionality)
* [How does CORONA_CARDS_PRODUCT work?](#worksHow)
* [What platforms does CORONA_CARDS_PRODUCT support?](#supportedPlatforms)
* [How should I develop the content running in CORONA_CARDS_PRODUCT ?](#developHow)

</div>


<a id="doWhat"></a>

## What can I do with CORONA_CARDS_PRODUCT ?

CORONA_CARDS_PRODUCT lets you take advantage of the power and ease-of-use of CORONA_CORE_PRODUCT, in any native app. You include it in your project like any other SDK and can display CORONA_CARDS_PRODUCT in any configuration (i.e., full screen, partial screen or transparent overlay).

In other words, with CORONA_CORE_PRODUCT / CORONA_NATIVE_PRODUCT, the full app is built with CORONA_CORE_PRODUCT. With CORONA_CARDS_PRODUCT, you have an app built natively or in another framework and then bring CORONA_CORE_PRODUCT into the mix.

Since you are using the same underlying platform, you can take advantage of almost all of CORONA_CORE_PRODUCT's 1000+ APIs. These include displaying OpenGL-accelerated graphics, audio, physics, animations and much, much more. 


<a id="useCases"></a>

## Why would I use CORONA_CARDS_PRODUCT ?

There are many reasons why developers, including publishers and ad networks, use CORONA_CARDS_PRODUCT. When developers are required to use a specific platform or companies already have large investments in other platforms and don't want to adopt another platform at the moment, can use CORONA_CARDS_PRODUCT to easily add richness/interactivity to their existing apps, across all platforms, in a very fast way and without having to adopt the full CORONA_CORE_PRODUCT stack.

There are also platforms, like Appcelerator and PhoneGap, that are not as well suited to rich interactive content, but that have other strengths. With CORONA_CARDS_PRODUCT inside those frameworks, developers can have the best of both worlds.


<a id="chooseProduct"></a>

## Should I use CORONA_CORE_PRODUCT, CORONA_NATIVE_PRODUCT, or CORONA_CARDS_PRODUCT ?

It depends entirely on your goals and what platforms you are using today. If you are starting fresh, we would recommend to take a look at [CORONA_CORE_PRODUCT](guide.programming.intro) or [CORONA_NATIVE_PRODUCT](native). Using CORONA_CORE_PRODUCT for your full app makes the entire process much easier. CORONA_NATIVE_PRODUCT includes everything in CORONA_CORE_PRODUCT and adds the ability to call any native library or API from your app.

However, if you are already using an alternative platform or need to work on an existing non-CORONA_CORE_PRODUCT app, then CORONA_CARDS_PRODUCT is probably the way to go. It will let you easily add CORONA_CORE_PRODUCT richness into those apps/platforms.


<a id="neededProduct"></a>

## If I use CORONA_CORE_PRODUCT or CORONA_NATIVE_PRODUCT, do I need CORONA_CARDS_PRODUCT ?

Probably not. CORONA_CARDS_PRODUCT is primarily relevant for developers actively using other platforms or that have apps built with other platforms. 


<a id="functionality"></a>

## Can I do the same things with CORONA_CARDS_PRODUCT and CORONA_NATIVE_PRODUCT ?

Yes, but you would be accomplishing them in a different way.

With CORONA_NATIVE_PRODUCT you are using CORONA_CORE_PRODUCT for the core of your app and you are then calling native libraries from within CORONA_CORE_PRODUCT. With CORONA_CARDS_PRODUCT, your app is built in another platform (or natively) and you are using CORONA_CORE_PRODUCT inside that app.

Either way, you would be combining CORONA_CORE_PRODUCT with native libraries. What method you prefer is really up to you and your project's requirements.


<a id="worksHow"></a>

## How does CORONA_CARDS_PRODUCT work?

Take a look at the [documentation and guides](coronacards). We have information on how to get started with native iOS and Android, as well as several other frameworks.


<a id="supportedPlatforms"></a>

## What platforms does CORONA_CARDS_PRODUCT support?

Today we support iOS, Android and HTML5 is in beta. Although it is obsolete, you can also use CORONA_CARDS_PRODUCT on Windows Phone 8 and 10 Mobile.
Essentially, any platform supported by CORONA_CORE_PRODUCT will probably be supported by CORONA_CARDS_PRODUCT since they are built on the same underlying core.

You can also use CORONA_CARDS_PRODUCT within frameworks like Appcelerator, PhoneGap, Unity and Xamarin (and any other framework that allows you to call native libraries). 


<a id="developHow"></a>

## How should I develop the content running in CORONA_CARDS_PRODUCT ?

We recommend that you use the CORONA_CORE_PRODUCT Simulator and a [text editor/IDE](guide.programming.01#text-editors), just as a regular CORONA_CORE_PRODUCT developer would. The simulator gives you the quick development and iteration speed and lets you use all CORONA_CORE_PRODUCT APIs to build things out. You can then put your lua files and assets into your project and run it within CORONA_CARDS_PRODUCT.

Just download [CORONA_CORE_PRODUCT](REVISION_URL) and you'll be building in no time.
