
# requir<span style="display: none;">X</span>e()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [package][api.library.package]
> __Return value__      [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          module, require
> __See also__          [package.loaded][api.library.package.loaded]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Loads the given module. 

The function starts by looking into the [package.loaded][api.library.package.loaded] table to determine whether `modname` is already loaded. If it is, `require()` returns the value stored at `package.loaded[modname]`. Otherwise, it tries to find a loader for the module.

To find a loader, `require()` is guided by the `package.loaders` array. By changing this array, you can change how `require()` looks for a module. The following explanation is based on the default configuration for `package.loaders`.

First, `require()` queries `package.preload[modname]`. If it has a value, this value (which should be a function) is the loader. Otherwise, `require()` searches for a Lua loader using the path stored in `package.path`. If that also fails, it tries an <nobr>all-in-one</nobr> loader (see&nbsp;[package.loaders][api.library.package.loaders]).

Once a loader is found, `require()` calls the loader with a single argument of `modname`. If the loader returns any value, `require()` assigns the returned value to `package.loaded[modname]`. If the loader returns no value and has not assigned any value to `package.loaded[modname]`, `require()` assigns `true` to this entry. In any case, `require()` returns the final value of `package.loaded[modname]`.

If there is any error loading or running the module, or if it cannot find any loader for the module, `require()` signals an error.

## Simulator vs Device

There are critical differences in behavior depending on whether your code is running in the Simulator or on device. These differences are a result of fundamental OS differences between file system behavior.

On many systems, the OS file system is __not__ case sensitive. Therefore, modules will load correctly even though the actual file name and the Lua string passed to `require()` have different case. On devices, however, the file name is typically case sensitive. In this case, the modules will __fail__ to load if the case of the actual file name and the Lua string do not match.

## Naming Restrictions

### Forbidden Characters

The `module` string can't have any `.` characters except when specifying subdirectories (iOS&nbsp;only). For example, the following will load the `bar.lua` file from the `foo` subdirectory:

``````lua
local fooBar = require( "foo.bar" )
``````

### Reserved Names

On iOS, you cannot name the subdirectory `resources` or you will get a code signing error when you do a build. This is not a problem on Android, but it's best to avoid using this directory name.


## Syntax

	local name = require( "moduleName" )
	local name = require "moduleName"

##### moduleName ~^(required)^~
_[String][api.type.String]._ The name of the module to load. Do __not__ append the `.lua` extension to this string.

## Example

``````lua
-- Require the physics library and assign it to the local variable "physics"
local physics = require( "physics" )
``````
