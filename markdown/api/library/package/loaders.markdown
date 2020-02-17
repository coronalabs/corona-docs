# package.loaders

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Library__           [package.*][api.library.package]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          package
> __See also__          [require()][api.library.package.require]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A table used by `require()` to control how to load modules.

Each entry in this table is a searcher function. When looking for a module, `require()` calls each of these searchers in ascending order, with the module name (the argument given to `require()`) as its sole parameter. The function may return another function (the module loader) or a string explaining why it did not find that module (or `nil` if it has nothing to say).

When running in the Simulator, the searcher looks for Lua files that can serve as Lua libraries. As long as these files are in the same directory as your `main.lua` file, they will be packaged for you during device builds.


## Syntax

	package.loaders
