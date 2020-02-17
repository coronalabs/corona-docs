# Table

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Library__           [table.*][api.library.table]
> __Keywords__          table
> __See also__          [Introduction to Lua][guide.start.introLua] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The type table implements associative arrays, that is, arrays that can be indexed not only with numbers, but with any value (except&nbsp;`nil`). Tables can be __heterogeneous__; that is, they can contain values of all types (except&nbsp;`nil`). Tables are the sole data structuring mechanism in Lua; they can be used to represent ordinary arrays, symbol tables, sets, records, graphs, trees, etc.

To represent records, Lua uses the field name as an index. The language supports this representation by providing `a.name` as syntactic sugar for `a["name"]`. 

Like indices, the value of a table field can be of any type (except&nbsp;`nil`). In particular, because functions are first-class values, table fields can contain functions. Thus tables can also carry methods.

See the [Introduction to Lua][guide.start.introLua] guide for more information.