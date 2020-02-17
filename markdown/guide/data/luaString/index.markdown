# Lua String Manipulation

This guide discusses how to manipulate and match strings in Lua.

<div class="guides-toc">

* [Overview](#overview)
* [String Functions](#functions)
* [String Patterns](#patterns)

</div>


<a id="overview"></a>

## Overview

The Corona [string][api.library.string] library provides generic functions for string manipulation, such as pattern matching and finding/extracting substrings. When indexing a string in Lua, the first character is at position 1, not at position 0 as in C. Indices are allowed to be negative and are interpreted as indexing backwards from the end of the string. Thus, the last character is at position -1, and so on.

The string library provides all of its functions inside the table string. It also sets a metatable for strings where the `__index` field points to the string table. Therefore, you can use the string functions in object-oriented style. For instance, `string.byte(s,i)` can be written as `s:byte(i)`.

The string library assumes one-byte character encodings.




<a id="functions"></a>

## String Functions

<div class="inner-table">

Function											Description
--------------------------------------------------	--------------------------
[string.byte()][api.library.string.byte]			Returns the internal numerical codes of the characters in a string.
[string.char()][api.library.string.char]			Returns a string in which each character has the internal numerical code equal to its corresponding argument.
[string.ends()][api.library.string.ends]			Returns a [boolean][api.type.Boolean] `true` or `false` depending on whether a given string ends with specified characters.
[string.find()][api.library.string.find]			Looks for the first match of a [pattern](#patterns) in a string. If found, it returns the indices where the occurrence starts and ends; otherwise, returns `nil`.
[string.format()][api.library.string.format]		Returns a formatted string following the description given in its arguments.
[string.gmatch()][api.library.string.gmatch]		Returns a [pattern](#patterns)-finding iterator.
[string.gsub()][api.library.string.gsub]			Replaces all occurrences of a [pattern](#patterns) in a string.
[string.len()][api.library.string.len]				Returns the length of a string (number of characters).
[string.lower()][api.library.string.lower]			Changes uppercase characters in a string to lowercase.
[string.match()][api.library.string.match]			Extracts substrings by matching [patterns](#patterns) in a string.
[string.rep()][api.library.string.rep]				Replicates a string by returning a string that is the concatenation of `n` copies of a specified string.
[string.reverse()][api.library.string.reverse]		Reverses a string.
[string.starts()][api.library.string.starts]		Returns a [boolean][api.type.Boolean] `true` or `false` depending on whether a given string starts with specified characters.
[string.sub()][api.library.string.sub]				Returns a substring (a specified portion of an existing string).
[string.upper()][api.library.string.upper]			Changes lowercase characters in a string to uppercase.
--------------------------------------------------	--------------------------

</div>




<a id="patterns"></a>

## String Patterns

String functions such as [string.find()][api.library.string.find], [string.match()][api.library.string.match], [string.gmatch()][api.library.string.gmatch] and [string.gsub()][api.library.string.gsub] typically require a __string&nbsp;pattern__ to search and replace on. A pattern must be constructed very carefully, otherwise the function will return `nil` or the string will be improperly altered.

### Character Classes

A __character class__ is used to represent a set of characters. The following combinations are allowed in describing a character class, where the class is __not__ one of the magic characters `^`, `$`, `(`, `)`, `%`, `.`, `[`, `]`, `*`, `+`, `-`, or `?`.

<div class="inner-table">

Class		Description
----------	-------------
`.`			Represents all characters.
`%a`		Represents all letters.
`%c`		Represents all control characters.
`%d`		Represents all digits.
`%l`		Represents all lowercase letters.
`%p`		Represents all punctuation characters.
`%s`		Represents all space characters.
`%u`		Represents all uppercase letters.
`%w`		Represents all alphanumeric characters.
`%x`		Represents all hexadecimal digits.
`%z`		Represents the character with representation `0`.
`%x`		When `x` is any non-alphanumeric character, this is the standard way to escape the magic characters. Any punctuation character — even&nbsp;non-magic — can be preceded by a `%` when used to represent itself in a pattern.
`[set]`		Represents the union of all characters in `set`. A range of characters can be specified by separating the end characters of the range with a&nbsp;`-`&nbsp;(hyphen). All classes described above can also be used as components in the set. All other characters in `set` represent themselves. For example, `[%w_]` or `[_%w]` represents all alphanumeric characters plus the underscore. <nobr>`[0-7]`</nobr> represents the octal digits. <nobr>`[0-7%l%-]`</nobr> represents the octal digits plus lowercase letters plus the `-` character. The interaction between ranges and classes is not defined, so patterns like <nobr>`[%a-z]`</nobr> or <nobr>`[a-%%]`</nobr> have no meaning.
`[^set]`	Represents the complement of `set` as interpreted above.
----------	-------------

</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* For all classes represented by single letters&nbsp;&mdash; `%a`, `%c`, etc. — the corresponding uppercase letter represents the complement of the class. For instance, `%S` represents all <nobr>non-space</nobr> characters.

* The definition of letter, space, and other character groups depend on the current locale. In particular, the class <nobr>`[a-z]`</nobr> may not be equivalent to `%l`.

</div>

### Patterns and Pattern Items

A __pattern__ is a sequence of __pattern items__ (see below). A&nbsp;`^` at the beginning of a pattern anchors the match at the beginning of the subject string. A&nbsp;`$` at the end of a pattern anchors the match at the end of the subject string. At other positions, `^` and `$` have no special meaning and simply represent themselves. A pattern cannot contain embedded zeros; use `%z` instead.

A __pattern item__ is defined by any of the following:

* A single character class, which matches any single character within the class.

* A single character class followed by `*`, which matches 0 or more repetitions of characters in the class. These repetition items will always match the longest possible sequence.

* A single character class followed by `+`, which matches 1 or more repetitions of characters in the class. These repetition items will always match the longest possible sequence.

* A single character class followed by `-`, which also matches 0 or more repetitions of characters in the class. Unlike `*`, these repetition items will always match the shortest possible sequence.

* A single character class followed by `?`, which matches 0 or 1 occurrences of a character in the class.

* `%n`, for `n` between 1 and 9; this pattern matches a substring equal to the `n`-th captured string (see&nbsp;next).

* `%bxy`, where `x` and `y` are two distinct characters; this pattern item matches strings that start with `x`, end with `y`, and where the `x` and `y` are balanced. To clarify, if you read the string from left to right, counting +1 for an `x` and -1 for a `y`, the ending `y` is the first `y` where the count reaches 0. For example, the item `%b()` matches expressions with balanced parentheses.

### Captures

A pattern can contain sub-patterns enclosed in parentheses. These describe __captures__. When a match succeeds, the substrings of the main string that match captures are stored (captured) for future use. Captures are numbered according to their left parentheses. For instance, in the pattern `(a*(.)%w(%s*))`, the part of the string matching `a*(.)%w(%s*)` is stored as the first capture and therefore has number&nbsp;1. The character matching `.` is captured with number&nbsp;2, and the part matching `%s*` has number&nbsp;3.

As a special case, the empty capture `()` captures the current string position (number). For instance, if we apply the pattern `()aa()` on the string `flaaap`, there will be two captures: 3&nbsp;and&nbsp;5.