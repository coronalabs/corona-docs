# Encoding URLs for Network Usage

One aspect which sometimes challenges users of Corona's [network][api.library.network] library is how to properly encode URLs. Let's look at an example:

`https://www.google.com/search?q=coronalabs&ie=utf-8&client=firefox-a&channel=sb`

This URL can initially be dissected into the following aspects:

* The schema, in this case `https://`.
* The domain name, in this case `www.google.com`.
* The script to run, in this case `/search`.

Following this, there is a series of <nobr>key-value</nobr> pairs which is started by a question&nbsp;mark&nbsp;(`?`) and where each additional pair is separated by an ampersand&nbsp;(`&`). Each actual key and associated value is separated by an equal&nbsp;sign&nbsp;(`=`). In this example, we have the following <nobr>key-value</nobr> pairs:

* `q` = `coronalabs`
* `ie` = `utf-8`
* `client` = `firefox-a`
* `channel` = `sb`


## Encoding Rules

It's important to understand the components of URLs and the usage of the <nobr>symbols `/`, `.`, `?`, and `&`</nobr>. URLs can __not__ contain spaces, nor can the keys/values contain spaces or symbols, including <nobr>UTF-8</nobr> characters. In your browser, when you enter a URL which has spaces or special characters, the browser safely converts them for you. Some people test a URL in the browser, assume that it works, and attempt to use it internally with [network.request()][api.library.network.request] only to discover that it fails.

Some basic rules for a <nobr>__properly-encoded__</nobr> URL are:

* Spaces are converted to plus signs (`+`).
* Other symbols are converted to a hexadecimal value that is prefixed by a percent&nbsp;sign&nbsp;(`%`).

To illustrate this concept, let's consider another URL:

`https://www.google.com/search?q=Corona tutorials & guides`

When encoded properly, the URL looks like this:

`https://www.google.com/search?q=Corona+tutorials+%26+guides`


## Encoding Function

When using a URL with Corona's [network][api.library.network] library, it's your responsibility to encode it properly so that it can be safely transported across the Internet. Fortunately, a small Lua function can do the work for us:

``````lua
function string.urlEncode( str )

	if ( str ) then
		str = string.gsub( str, "\n", "\r\n" )
		str = string.gsub( str, "([^%w ])",
			function( c )
				return string.format( "%%%02X", string.byte(c) )
			end
		)
		str = string.gsub( str, " ", "+" )
	end
	return str
end
``````

Using this function, we can then encode URLs like this:

``````lua
local searchQuery = "Corona tutorials & guides"
local URL = "https://google.com/q=" .. string.urlEncode( searchQuery )
``````

Alternatively, since we added this function to Corona's <nobr>built-in</nobr> [string][api.library.string] library, it can also be used in the colon operator syntax:

``````lua
local searchQuery = "Corona tutorials & guides"
local URL = "https://google.com/q=" .. searchQuery:urlEncode()
``````

That's it! Once the URL is properly encoded, we can use it within Corona's [network][api.library.network] functions to make network requests, pass the URL to a [native.newWebView()][api.library.native.newWebView], or use it with any other API/function that requires a URL.


## Conclusion

In summary, remember that URLs __must__ be encoded if they contain spaces, symbols, or binary data like <nobr>UTF-8</nobr> <nobr>multi-byte</nobr> characters. The handy function in this tutorial simplifies the encoding process and can help you build better <nobr>network-based</nobr> apps.
