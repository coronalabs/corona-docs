<style>

.inner-table img {
    max-width: 200px;
    margin-top: 4px;
    margin-bottom: 4px;
}

.inner-table.compact table th, .inner-table.compact table td {
	border-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
}

</style>

# Monetization Guide

This guide will help you navigate options for monetization in <nobr>Corona-built</nobr> apps.

<div class="guides-toc">

* [What is Monetization?](#overview)
* [Monetization Methods](#methods)
* [In-App Advertising Options](#ad-options)
* [Ad Provider Comparison](#comparison)

</div>


<a id="overview"></a>

## What is Monetization?

__Monetize__ is a tech jargon term which basically means "make&nbsp;money," but in a somewhat kinder tone. When applied to building software applications (apps), some people are willing to create them as a hobby, but if you're a business or even an individual, it's usually necessary to earn income from your hard work.

As the mobile app marketplace has evolved, pressure has increased on pushing costs down. Many users expect apps to be free, and most want to use/play an app before they potentially pay money for it. In other segments like console gaming, it's common to pay <nobr>$20-$50</nobr> for a game before you ever see it, and even paying hundreds of dollars for a business or <nobr>productivity-related</nobr> desktop application isn't out of the realm of possibility.

This guide will help you understand the monetization options and methods available to Corona developers.




<a id="methods"></a>

## Monetization Methods

With a <nobr>Corona-built</nobr> app, you have an opportunity to use three primary forms of monetization, or a combination of all of them.

### Paid App

Under the __paid&nbsp;app__ model, customers pay an initial price for an app, usually in the range of $0.99 to $4.99. This model was the standard during the early days of the "app&nbsp;revolution" and it remains common today. However, many customers like to try apps before they buy, so the paid app model has decreased in favor compared to the following monetization models.

<!---

To initially satisfy this desire, many app developers would offer two versions of an app: a&nbsp;free "limited" version plus a <nobr>full-featured</nobr> version at a set price. Unfortunately, this practice started clogging up the app stores and many customers would never purchase the full version after testing out the free version.

-->

### In-App Purchases

These days, __in-app purchases__ (IAP) are a common model for app monetization. Using IAP, you can offer your app to customers for free&nbsp;&mdash; or a significantly reduced price&nbsp;&mdash; and then offer the ability to "unlock" various features or purchase virtual products from within the app. This model can attract users who are hesitant to pay for an app without trying it first.

<!---

* If you (the developer) decide, multiple unique purchase types can be configured and your <nobr>in-app</nobr> "store" can even adapt over time to offer different products, special sales, etc. This allows the customer to purchase exactly what they want, when they want it, and potentially purchase the same item numerous times. Typical <nobr>in-app</nobr> purchases include gems/coins which can be used for other virtual products, character upgrades, colorful customization options, and unlocking of special bonus levels&nbsp;&mdash; literally anything within your imagination is possible!

-->

### In-App Advertising

The final popular monetization option is <nobr>__in-app advertising__</nobr>. Under this model, you display advertisements and other promotions to your users. If they interact with these units, you get an incremental amount of money.

One advantage of <nobr>in-app</nobr> advertising is that, for many apps, <nobr>in-app</nobr> purchases are a <nobr>one-time-only</nobr> transaction, as is the paid app model. Advertising, however, continues to generate revenue for the lifespan of the app.

In the next section, we'll discuss the options, benefits, and other considerations of monetizing with <nobr>in-app</nobr> advertising.




<a id="ad-options"></a>

## In-App Advertising Options

Corona supports a wide variety of __ad&nbsp;providers__, each offering a variety of __unit&nbsp;types__ to suit your design/UI needs and monetization goals. The following sections outline the core options.

<div class="float-right" style="margin-top: 16px; margin-bottom: 12px; margin-right: 0px; margin-left: 10px; clear: left;">
<div class="inner-table compact">

 Banner														 Static Interstitial
------------------------------------------------------	--	------------------------------------------------------
 ![][images.docs.plugin-screenshot-ca-banner]				 ![][images.docs.plugin-screenshot-applovin]
------------------------------------------------------	--	------------------------------------------------------

</div>
</div>

### Banners

Banner ads occupy a relatively small portion of the screen, typically 50 pixels vertically in a 320&times;480 content area, and you can choose to display them at the top or bottom of the screen. Depending on the placement, you may need to reserve space or adjust the underlying content so that the banner doesn't obscure any interactive elements.

Banner ads work best when the user has time to interact with the ad and it doesn't hinder their experience. For instance, you should __not__ place banners in <nobr>time-sensitive</nobr> or <nobr>high-action</nobr> scenes of a game since it's unlikely the user will stop playing to interact with the ad.

Not sure where to start? See the [comparison chart](#comparison) below for providers of banner ads.

### Static Interstitials

Static interstitial ads occupy the entire screen or obscure the underlying content. Because of this, the user must interact with it in some way, either by exploring the content or closing the ad. These ads are best shown at logical breaks in the app, for example between scenes or at another natural pause point.

Because of their size and level of detail, static interstitial ads may load slower than banners. Fortunately, most ad plugins either <nobr>pre-cache</nobr> static interstitial ads in the background, or they provide a method to <nobr>pre-load</nobr> these ads so that you can show them quickly when you need to.

Since you're giving the entire screen to the advertiser for a period of time, they tend to pay more for the privilege which equates to higher revenue on your part.

Not sure where to start? See the [comparison chart](#comparison) below for providers of static interstitial ads.

<div class="clear"></div>
<div class="float-right" style="margin-top: 16px; margin-bottom: 12px; margin-right: 0px; margin-left: 10px; clear: left;">
<div class="inner-table compact">

 Video Interstitial											 Rewarded Video
------------------------------------------------------	--	------------------------------------------------------
 ![][images.docs.plugin-screenshot-applovin-2]				 ![][images.docs.plugin-screenshot-mediabrix]
------------------------------------------------------	--	------------------------------------------------------

</div>
</div>

### Video Interstitials

Video interstitial ads are the next evolution in interstitial ads. Like a television commercial, video interstitial ads play for around <nobr>15-30</nobr> seconds and they tend to have a __call&nbsp;to&nbsp;action__ (CTA) screen at the end. Most video interstitial ads must play for a minimum duration, at which point the user can skip to the CTA screen. If the ad prompts users to install another app or game, the CTA screen gives them an option to install it.

Because you're requiring users to watch the ad for a minimum duration and then provide a secondary interaction, video interstitial ads tend to pay higher rates than static interstitial ads.

Not sure where to start? Not sure where to start? See the [comparison chart](#comparison) below for providers of video interstitial ads.

### Rewarded Videos

Rewarded videos are an exciting alternative to normal video interstitial ads. With this ad type, you offer users <nobr>in-app</nobr> currency or virtual rewards in exchange for watching an ad. Most customers respond well to rewarded videos since they'll happily watch a short video to earn an instant reward.

Unlike static interstitial and video interstitial ads which should be shown at logical pause points, rewarded video prompts can be attached to a button or other UI element so that users can choose when they want to earn a reward in exchange for watching a video ad.

<!---

Note that for some providers, you must take additional steps to fully implement rewarded videos. See the [Handling Rewards](#rewards) section below for more information.

-->

Not sure where to start? See the [comparison chart](#comparison) below for providers of rewarded videos.

<div class="clear"></div>
<div class="float-right" style="margin-top: 16px; margin-bottom: 12px; margin-right: 0px; margin-left: 10px; clear: left;">
<div class="inner-table compact">

 Offer Wall													 Poll/Survey
------------------------------------------------------	--	------------------------------------------------------
 ![][images.docs.plugin-screenshot-trialpay]				 ![][images.docs.plugin-screenshot-pollfish]
------------------------------------------------------	--	------------------------------------------------------

</div>
</div>

### Offer Walls

Offer walls are like rewarded videos in that the user is rewarded for various actions (offers). Offers can range from purchasing a magazine subscription to installing an app. Essentially, users are presented with a screen containing multiple offers and they can decide which they are interested in, then complete the task to receive their reward.

Offer walls are <nobr>full-screen</nobr> entities and they should be presented at logical pause points in the app. You (the&nbsp;developer) get paid per completed offer and some offers are worth more than others. In general, you will need to set up your own exchange rate and offer users higher rewards for completing <nobr>higher-tier</nobr> offers.

Not sure where to start? See the [comparison chart](#comparison) below for providers of offer&nbsp;walls.

### Polls/Surveys

Polls and surveys focus on gathering information from the user, after which you get paid for helping the advertiser collect valuable intelligence. For example, a company might offer a survey about customer habits and desires in order to improve their marketing efforts (and&nbsp;they're willing to pay for that&nbsp;data).

Be aware that some polls/surveys collect demographic data such as the user's gender, age, and so forth. For this reason, you should include a privacy policy somewhere within the app to inform users about what is being collected.

Since polls and surveys are not advertisements, users tend to participate more actively. Some poll/survey plugins even let you conduct your own personalized surveys in order to understand your audience better.

Not sure where to start? See [PeanutLabs][plugin.peanutlabs], [Persona.ly][plugin.personaly], and [Pollfish][plugin.pollfish] as providers of polls/surveys.

<div class="clear"></div>
<div class="float-right" style="margin-top: 16px; margin-bottom: 12px; margin-right: 0px; margin-left: 0px; clear: left;">
<div class="inner-table compact">

	 Child-Safe
--	------------------------------------------------------
	 ![][images.docs.plugin-screenshot-kidoz]
--	------------------------------------------------------

</div>
</div>

<!---

### Audio Ads

Audio ads can be thought of like radio commercials and sponsorships. They can be pure audio that plays at the beginning of a level or activity that says "This round sponsored by XYZ Acme Company. Bringing better gizmos to life." or they can be interstitial ads with an audio track. These are usually faster to load than video and the audio-only ads can be considered an additional placement opportunity.

-->

### Child-Safe Ads

Apps designed for children&nbsp;&mdash; educational apps, <nobr>e-books</nobr>, and games, for instance&nbsp;&mdash; have traditionally been difficult to monetize. First, many operating systems offer parents a lock setting which prevents the child from making <nobr>in-app</nobr> purchases, so that model becomes ineffective in most cases. Secondly, in terms of advertising, the United&nbsp;States and many other countries have strict laws which prevent children from accessing content outside of the app and rules about what information can be collected from children (essentially&nbsp;none).

Fortunately, some ad providers help developers monetize <nobr>child-targeted</nobr> apps. For instance, they monitor outgoing advertisements to ensure that each is compliant with laws like [COPPA](https://www.ftc.gov/enforcement/rules/rulemaking-regulatory-reform-proceedings/childrens-online-privacy-protection-rule).

Not sure where to start? See [AdMob][plugin.admob], [KIDOZ][plugin.kidoz], and [SuperAwesome][plugin.superawesome] as providers of <nobr>child-safe</nobr> ads.

### Ad Mediation

Advertisers "purchase" ads by buying a certain number of __impressions__ through the ad provider. An impression is basically a single ad view. For example, an advertiser might buy 100,000 interstitial ad impressions through a given provider. Those impressions are then spread out among all users who receive ads from that provider. This pool of ads is called __inventory__.

Often there isn't enough inventory for every user, so the provider may not be able to deliver an ad. This is known as a low __fill&nbsp;rate__. In these cases, you will typically see a message in your console log reporting that no fill is available.

Fill rates are highly dependent on the geographic location of the user. For instance, some ad providers have very high fill rates in the United&nbsp;States, but in other countries the fill rate for the same provider could be minimal.

To help prevent low fill rate, some developers include multiple ad plugins/providers in their app and, if they don't receive an ad from one provider, they request an ad from another provider, repeating this request process until an ad can be received and displayed. However, this can be a tedious process for the developer and potentially delay an ad being shown to the end user.

To solve this, some ad providers offer a service called __mediation__. Essentially, they include multiple advertisement servers as their source for ads and call upon them until an ad is received, at which point it's delivered to your app. The end benefit for you (the&nbsp;developer) is that you don't need to build your own system to request and potentially <nobr>re-request</nobr> ads as described above&nbsp;&mdash; you just use one ad provider plugin and get a 100% fill rate! In addition, ad providers which support mediation attempt to deliver <nobr>higher-paying</nobr> ads first.

Not sure where to start? Explore [Appodeal][plugin.appodeal] as a provider for ad mediation.




<a id="comparison"></a>

## Ad Provider Comparison

Corona supports a variety of [plugins][plugin] for <nobr>in-app</nobr> advertising and monetization. The following chart outlines the basic unit types and features for each plugin, allowing you to choose the best provider(s) for your needs.

<div class="inner-table">

Plugin													Unit Types																				Unique Features	 
------------------------------------------------------	--------------------------------------------------------------------------------------	----------------------
[AdColony][plugin.adcolony]								video interstitial; rewarded&nbsp;video
[AdMob][plugin.admob]									banner; static&nbsp;interstitial; video&nbsp;interstitial								child-safe
[AppLovin Max][plugin.applovinMax]								static&nbsp;interstitial; video&nbsp;interstitial; rewarded&nbsp;video			ad&nbsp;mediation
[Appnext][plugin.appnext]								static interstitial; video&nbsp;interstitial; rewarded&nbsp;video; other
[Appodeal][plugin.appodeal]								banner; static&nbsp;interstitial; video&nbsp;interstitial; rewarded&nbsp;video			ad&nbsp;mediation
[Chartboost][plugin.chartboost]							static interstitial; video&nbsp;interstitial; rewarded&nbsp;video; other
[Facebook Audience Network][plugin.fbAudienceNetwork]	banner; static&nbsp;interstitial
[InMobi][plugin.inmobi]									banner; static&nbsp;interstitial
[KIDOZ][plugin.kidoz]									banner; static&nbsp;interstitial; other													child-safe
[MediaBrix][plugin.mediaBrix]							static interstitial; video&nbsp;interstitial; rewarded&nbsp;video; other
[PeanutLabs][plugin.peanutlabs]							offer wall; poll/survey
[Persona.ly][plugin.personaly]							rewarded video; offer&nbsp;wall; poll/survey
[Pollfish][plugin.pollfish]								poll/survey
[RevMob][plugin.revmob]									banner; static&nbsp;interstitial; video&nbsp;interstitial; rewarded&nbsp;video
[SuperAwesome][plugin.superawesome]						banner; static&nbsp;interstitial; video&nbsp;interstitial								child-safe
[Supersonic][plugin.supersonic]							static interstitial; rewarded&nbsp;video; offer&nbsp;wall
[TrialPay][plugin.trialPay]								static interstitial; video&nbsp;interstitial; rewarded&nbsp;video; offer&nbsp;wall
[Unity Ads][plugin.unityads-v4]							video interstitial; rewarded&nbsp;video
[Vungle][plugin.vungle]									video interstitial; rewarded&nbsp;video
------------------------------------------------------	--------------------------------------------------------------------------------------	----------------------

</div>




<!---

<a id="rewards"></a>

## Handling Rewards

Many providers that offer rewards to end users need a way to keep track of those rewards and notify you (the&nbsp;developer) so that you can process the transaction. Because each user is unique, you may need to come up with a unique user&nbsp;ID&nbsp;&mdash; this could be a value that users enter within the app, or if you're using Facebook as a login tool, you could use their Facebook&nbsp;ID. You should __not__ tie identifiers to physical device&nbsp;IDs.

The ad provider may also ask&nbsp;&mdash; or in some cases require&nbsp;&mdash; that you have a <nobr>web-based</nobr> database to track and record the results of reward transactions. In this case, you might have a PHP or .NET script running on your web host that the ad provider can call from their servers. Essentially, they pass information to your database regarding the reward transaction, such as the ID of the user, how much he/she earned in rewards, and other useful data. Your Corona app can then use [network.request()][api.library.network.request] to call a second script that queries the database and finds the user's most recent record (reward&nbsp;data). Finally, your app grants them the reward, completing the transaction.

Most providers that have these requirements guide you through the setup process in their developer dashboard.

-->
