# Array

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Library__           [table.*][api.library.table]
> __Keywords__          table, array
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Lua arrays are just Lua [tables][api.type.Table] except they contain only numerical indices and the indices are consecutive starting at 1. When inserting or removing values from Lua arrays, you should use the [table.insert()][api.library.table.insert] and [table.remove()][api.library.table.remove] library functions.


## Table Library

In Lua, the __library__ called [table][api.library.table] is a collection of functions used to manipulate Lua tables as (numerically-indexed) arrays. 

## Array vs. Table

There is no special "array" type in Lua. Instead, Lua tables can be either associative arrays (key-value pairs) or numerically-indexed arrays (consecutive values).

Some function parameters or results in the Corona API expect a numerically-indexed array. In those cases, we explicitly mention the type as "array" instead of "table" to emphasize that the table should be a pure numerical array.