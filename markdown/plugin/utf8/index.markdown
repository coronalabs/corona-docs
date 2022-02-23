# utf8.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string
> __Platforms__         Android, iOS, macOS, tvOS, Windows
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The [UTF-8](https://marketplace.coronalabs.com/plugin/utf-8) plugin, based on the [luautf8](https://github.com/starwing/luautf8) module, provides functions to manipulate <nobr>UTF-8</nobr> strings in Corona.

UTF-8 strings are composed of a mixture of <nobr>single-byte</nobr> and <nobr>multi-byte</nobr> Unicode characters which means that simple byte counting can't be used to determine things like string length or substring positions. The Lua string object can store <nobr>UTF-8</nobr> strings since it just considers them to be a sequence of bytes, but any operation that needs to understand the concept of a "character" won't work because Lua assumes all characters are one byte.

Essentially, if you need to handle actions like <nobr>upper-casing</nobr> or string substitutions with accented or <nobr>non-ASCII</nobr> characters, this plugin will be especially useful.


## Concepts

The UTF-8 plugin uses some concepts which should be understood before attempting to use it.

* __character position__ or `charpos` &mdash; The position of a character in the <nobr>UTF-8</nobr> string relative to the start of the string. The position of any character depends on the width <nobr>(number of bytes)</nobr> of all characters preceding it.

* __offset__ or `offset` &mdash; The number of characters that one character is from another. This may depend on the characters which exist between the two points.

* __code point__ or `codepoint` &mdash; Number which represents the character at a particular `charpos`. It is the Unicode standard code for that character.


## Syntax

	local utf8 = require( "plugin.utf8" )


## Functions

#### [utf8.charpos()][plugin.utf8.charpos]

#### [utf8.codepoint()][plugin.utf8.codepoint]

#### [utf8.codes()][plugin.utf8.codes]

#### [utf8.escape()][plugin.utf8.escape]

#### [utf8.fold()][plugin.utf8.fold]

#### [utf8.insert()][plugin.utf8.insert]

#### [utf8.ncasecmp()][plugin.utf8.ncasecmp]

#### [utf8.next()][plugin.utf8.next]

#### [utf8.remove()][plugin.utf8.remove]

#### [utf8.title()][plugin.utf8.title]

#### [utf8.width()][plugin.utf8.width]

<br />

In addition, the following functions mimic the respective [string][api.library.string] library functions except, in the <nobr>UTF-8</nobr> plugin, they handle <nobr>multi-byte</nobr> characters:

<div class="inner-table">

UTF-8 Plugin		Equivalent	  
------------------	------------------------------------------
`utf8.byte`			[string.byte()][api.library.string.byte]
`utf8.char`			[string.char()][api.library.string.char]
`utf8.find`			[string.find()][api.library.string.find]
`utf8.gmatch`		[string.gmatch()][api.library.string.gmatch]
`utf8.gsub`			[string.gsub()][api.library.string.gsub]
`utf8.len`			[string.len()][api.library.string.len]
`utf8.lower`		[string.lower()][api.library.string.lower]
`utf8.match`		[string.match()][api.library.string.match]
`utf8.reverse`		[string.reverse()][api.library.string.reverse]
`utf8.sub`			[string.sub()][api.library.string.sub]
`utf8.upper`		[string.upper()][api.library.string.upper]
------------------	------------------------------------------

</div>


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.utf8"] =
		{
			publisherId = "com.coronalabs"
		},
	},		
}
``````
