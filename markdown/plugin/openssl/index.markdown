# openssl.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          openssl, security
> __Platforms__			Android, iOS, macOS, Windows
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The OpenSSL plugin provides access to the OpenSSL library as exposed by George Zhao's [lua-openssl](https://github.com/zhaozg/lua-openssl).

The OpenSSL plugin allows you to do secure socket communication in Lua using __luasec__. This wraps your insecure protocol in SSL. Please refer to the [samples](https://github.com/coronalabs/plugins-sample-openssl) in the GitHub repository.


## Gotchas

* This plugin includes software developed by the [OpenSSL Project](http://www.openssl.org/) for use in the OpenSSL Toolkit. Before using this plugin, ensure that you conform with their [license](https://www.openssl.org/source/license.txt).

* HTTPS requests are done more easily using [network.request()][api.library.network.request] &mdash; web documents shouldn't be requested using __luasec__.

## Syntax

	local openssl = require( "plugin.openssl" )


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.openssl"] =
		{
			publisherId = "com.coronalabs",
		},
	},		
}
``````


## Documentation

[http://www.openssl.org/docs/](http://www.openssl.org/docs/)


## Support

* [Solar2D Forums](https://forums.solar2d.com/c/corona-marketplace/corona-premium-plugins/)

## Examples

* [Solar2D Samples](https://github.com/coronalabs/plugins-sample-openssl)
