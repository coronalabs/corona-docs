# table.* (array)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Tables in Lua implement associative arrays. That is, they can be indexed not just with numbers, but also with strings or any other value of the language, except nil.

When you use tables, you should choose how to index Lua tables (either numerically or non-numerical numbers).

Most functions in the `table` library assume that the table represents a (numerically-indexed) array or list. For these functions, when we talk about the "length" of a table we mean the result of the length operator.

## Functions

#### [table.concat()][api.library.table.concat]

#### [table.copy()][api.library.table.copy]

#### [table.indexOf()][api.library.table.indexOf]

#### [table.insert()][api.library.table.insert]

#### [table.maxn()][api.library.table.maxn]

#### [table.remove()][api.library.table.remove]

#### [table.sort()][api.library.table.sort]

