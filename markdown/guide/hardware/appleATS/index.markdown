# Managing App Transport Security — iOS&nbsp;&amp;&nbsp;macOS

This guide discusses Apple's App Transport Security and how to manage it within your apps.

<div class="guides-toc">

* [Overview](#overview)
* [Prerequisites](#prerequisites)
* [Valid Connections](#valid)
* [Configuring Connections](#configuring)
* [Corona Simulator](#simulator)

</div>


<a id="overview"></a>

## Overview

With each major upgrade of its operating systems, Apple introduces new features which all iOS and macOS developers must be aware of. In iOS&nbsp;9 and macOS&nbsp;10.11, a particularly important feature known as __App&nbsp;Transport&nbsp;Security__ was introduced, hereafter referred to as __ATS__.

Essentially, ATS is Apple's new guard against insecure HTTP and weaker/older HTTPS connections. Apple suggests that you adopt ATS as soon as possible, regardless of whether you're creating a new app or updating an existing one. The intent is to protect your app's users from exploits inherent in older Internet protocols, so the best approach is always to work with it rather than just turn it off (an option that Apple will remove in the near future anyway).

For comprehensive details and usage specifications for ATS, please see Apple's [documentation](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/plist/info/NSAppTransportSecurity).




<a id="prerequisites"></a>

## Prerequisites

ATS applies to both iOS and macOS apps which meet these criteria:

* All apps which use [high-level network-related][api.library.network] APIs (socket level APIs are not affected).
* iOS apps built to target the iOS&nbsp;9&nbsp;SDK or higher.
* macOS apps built to target macOS 10.11 or higher.


<a id="valid"></a>

## Valid Connections

The following conditions must be met for a connection to be allowed through ATS:

* HTTPS must be used to connect to the server.
* The server must support TLS v1.2 or higher.
* Certificates must be valid and signed using SHA256 or better. They must also use a <nobr>2048-bit</nobr> or greater RSA key or a <nobr>256-bit</nobr> or greater Elliptic Curve key. Any <nobr>up-to-date</nobr> certificate should meet these criteria.




<a id="configuring"></a>

## Configuring Connections

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

While we provide this information for reference, Corona&nbsp;Labs does __not__ encourage bypassing ATS for any connection since its intent is to protect users' privacy.

</div>

ATS can be configured to manage certain specific endpoints that do not meet the [valid connections](#valid) requirements outlined above. The following steps outline this process:

1. Configuring ATS begins with the addition of the `NSAppTransportSecurity` <nobr>key-value</nobr> pair within the <nobr>`iphone` &rarr; `plist`</nobr> table of your app's `build.settings` file \([guide][guide.distribution.buildSettings]\):

<div class="code-indent">

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSAppTransportSecurity =
			{

			},
		},
	},
}
``````

</div>

2. Inside the `NSAppTransportSecurity` table, add a `NSExceptionDomains` <nobr>key-value</nobr> pair. This allows you to specify ATS exceptions for specific domains.

<div class="code-indent">

``````lua
NSAppTransportSecurity =
{
	NSExceptionDomains =
	{

	},
},
``````

</div>

3. Inside the `NSExceptionDomains` table, include distinct <nobr>key-value</nobr> pairs to describe <nobr>domain-specific</nobr> network connection configuration exceptions. An exception domain's <nobr>top-level</nobr> key is the domain name string for which you want to specify a connection configuration. Because of Lua naming convention rules, you will typically need to specify these names within brackets/quotes, for instance `["example.com"]`.

<div class="code-indent">

``````lua
NSAppTransportSecurity =
{
	NSExceptionDomains =
	{
		["example.com"] =
		{

		},
	},
},
``````

</div>

4. Finally, to configure the exception domain, include <nobr>key-value</nobr> pairs which describe <nobr>server-specific</nobr> exceptions to your app's overall intended network behavior. For instance:

<div class="code-indent">

``````lua
NSAppTransportSecurity =
{
	NSExceptionDomains =
	{
		["example.com"] =
		{
			NSIncludesSubdomains = true,
			NSThirdPartyExceptionAllowsInsecureHTTPLoads = true,
		},
	},
},
``````

The following table summarizes the valid options. For comprehensive details, please see Apple's [documentation](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/plist/info/NSAppTransportSecurity).

<div class="inner-table">

Key													Value							Description
--------------------------------------------------	------------------------------	----------------------
`NSIncludesSubdomains`								[boolean][api.type.Boolean]		An optional boolean value that, when set to `true`, applies the `NSExceptionDomains` exceptions to all subdomains of the domain whose name is the <nobr>top-level</nobr> key. Default is `false`.
`NSExceptionAllowsInsecureHTTPLoads`				[boolean][api.type.Boolean]		An optional boolean value that, when set to `true`, allows insecure HTTP loads. Use this key to describe your app's intended network behavior for a domain whose security attributes you __can__ control. Default is `false`.
`NSExceptionRequiresForwardSecrecy`					[boolean][api.type.Boolean]		An optional boolean value for overriding the requirement that a server supports forward secrecy (FS). Use this key to describe your app's intended network behavior for a domain whose security attributes you __can__ control. Default is `true`.
`NSExceptionMinimumTLSVersion`						[string][api.type.String]		An optional string value that specifies the minimum Transport Layer Security (TLS) version for connections. Use this key to describe your app's intended network behavior for a domain whose security attributes you __can__ control. Default value is `TLSv1.2`. 
`NSThirdPartyExceptionAllowsInsecureHTTPLoads`		[boolean][api.type.Boolean]		A version of the `NSExceptionAllowsInsecureHTTPLoads` key to be used to configure connections for a domain whose security attributes you __cannot__ control.
`NSThirdPartyExceptionRequiresForwardSecrecy`		[boolean][api.type.Boolean]		A version of the `NSExceptionRequiresForwardSecrecy` key to be used to configure connections for a domain whose security attributes you __cannot__ control.
`NSThirdPartyExceptionMinimumTLSVersion`			[string][api.type.String]		A version of the `NSExceptionMinimumTLSVersion` key to be used to configure connections for a domain whose security attributes you __cannot__ control.
--------------------------------------------------	------------------------------	----------------------

</div>
</div>

5. Putting it together, an example ATS configuration block within `build.settings` may be structured like this:

<div class="code-indent">

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSAppTransportSecurity =
			{
				NSExceptionDomains =
				{
					["example.com"] =
					{
						NSIncludesSubdomains = true,
						NSThirdPartyExceptionAllowsInsecureHTTPLoads = true,
					},
				},
			},
		},
	},
}
``````

</div>

### Bypassing ATS

As a last resort, ATS can also be configured to __allow__ insecure connections by default. This can be accomplished by including the `NSAllowsArbitraryLoads` key within the `NSAppTransportSecurity` table and setting its value to `true`:

``````lua
NSAppTransportSecurity =
{
	NSAllowsArbitraryLoads = true,
},
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you globally bypass ATS in this manner, exception domains can still be defined as outlined above. In this case, you can effectively __increase__ restrictions on a specific server. For example, setting the value of a named server's `NSExceptionAllowsInsecureHTTPLoads` key to `false` <nobr>re-enables</nobr> HTTPS enforcement for that server.

</div>




<a id="simulator"></a>

## Corona Simulator

Since the Corona Simulator on macOS must simulate all types of devices, including those that do not implement ATS, it turns it off for all connections.
