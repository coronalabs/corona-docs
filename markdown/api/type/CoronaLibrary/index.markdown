# CoronaLibrary

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Table][api.type.Table]
> __Library__           none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          library
> __See also__          [CoronaPrototype:new()][api.type.CoronaPrototype]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This is the standard type for Corona libraries in Lua.

``````lua
local Library = require "CoronaLibrary"

-- Create library
local lib = Library:new{ name="mylibrary", publisherId="com.mycompany" }
``````


## Properties

_(Inherits properties from [CoronaPrototype][api.type.CoronaPrototype])_

#### [object.name][api.type.CoronaLibrary.name]

#### [object.publisherId][api.type.CoronaLibrary.publisherId]

#### [object.revision][api.type.CoronaLibrary.revision]

#### [object.version][api.type.CoronaLibrary.version]


## Methods

_(Inherits methods from [CoronaPrototype][api.type.CoronaPrototype])_

#### [object:getCurrentProvider()][api.type.CoronaLibrary.getCurrentProvider]

#### [object:setCurrentProvider()][api.type.CoronaLibrary.setCurrentProvider]

