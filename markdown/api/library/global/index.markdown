# (globals)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          global, globals
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The (globals) section covers basic functions of [Lua 5.1](https://www.lua.org/) which is the underlying programming language of CORONA_CORE_PRODUCT. All of the functions and objects listed below can be called as is (without&nbsp;a&nbsp;prefix). For example:

``````lua
globals.rawget()  -- incorrect; will produce an error
rawget()          -- correct
``````

## The Global Variable

`_G` is a global variable (not a function) that holds the global environment, that is, `_G._G` = `_G`. Lua itself does not use this variable; changing its value does not affect any environment, nor <nobr>vice-versa.</nobr> Use [setfenv()][api.library.global.setfenv] to change environments.


## Functions

#### [assert()][api.library.global.assert]

#### [collectgarbage()][api.library.global.collectgarbage]

#### [error()][api.library.global.error]

#### [getfenv()][api.library.global.getfenv]

#### [getmetatable()][api.library.global.getmetatable]

#### [ipairs()][api.library.global.ipairs]

#### [next()][api.library.global.next]

#### [pairs()][api.library.global.pairs]

#### [pcall()][api.library.global.pcall]

#### [print()][api.library.global.print]

#### [rawequal()][api.library.global.rawequal]

#### [rawget()][api.library.global.rawget]

#### [rawset()][api.library.global.rawset]

#### [select()][api.library.global.select]

#### [setfenv()][api.library.global.setfenv]

#### [setmetatable()][api.library.global.setmetatable]

#### [tonumber()][api.library.global.tonumber]

#### [tostring()][api.library.global.tostring]

#### [type()][api.library.global.type]

#### [unpack()][api.library.global.unpack]
