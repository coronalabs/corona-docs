# String

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Library__           none
> __Keywords__          string
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A __string__ represents arrays of characters. Lua is 8-bit clean: strings can contain any 8-bit character, including embedded zeros (`\0`).

## Literal strings

Literal strings can be delimited by matching single or double quotes, and can contain the following C-like escape sequences: `\a` (bell), `\b` (backspace), `\f` (form feed), `\n` (newline), `\r` (carriage return), `\t` (horizontal tab), `\v` (vertical tab), `\\` (backslash), `\"` (quotation&nbsp;mark), and `\'` (apostrophe). Moreover, a backslash followed by a real newline results in a newline in the string. A character in a string can also be specified by its numerical value using the escape sequence `\ddd`, where `ddd` is a sequence of up to three decimal digits. Note that if a numerical escape is to be followed by a digit, it must be expressed using exactly three digits. Strings in Lua can contain any 8-bit value, including embedded zeros, which can be specified as `\0`.

Literal strings can also be defined using a long format enclosed by long brackets. We define an opening long bracket of level __n__ as an opening square bracket, followed by __n__ equal signs, followed by another opening square bracket. So, an opening long bracket of level 0 is written as `[[`, an opening long bracket of level 1 is written as `[=[`, and so on. A closing long bracket is defined similarly; for instance, a closing long bracket of level 4 is written as `]====]`. A long string starts with an opening long bracket of any level and ends at the first closing long bracket of the same level. Literals in this bracketed form can run for several lines, do not interpret any escape sequences, and ignore long brackets of any other level. They can contain anything except a closing bracket of the proper level.

For convenience, when the opening long bracket is immediately followed by a newline, the newline is not included in the string. As an example, in a system using ASCII (in which `a` is coded as 97, "newline" is coded as 10, and `1` is coded as 49), the five literal strings below denote the same string:

``````lua
 a = 'alo\n123"'
 a = "alo\n123\""

 a = '\97lo\10\04923"'
 a = [[alo
 123"]]
 a = [==[
 alo
 123"]==]
``````

## Coercion

Lua provides automatic conversion between string and number values at run time. Any arithmetic operation applied to a string tries to convert this string to a number, following the usual conversion rules. Conversely, whenever a number is used where a string is expected, the number is converted to a string, in a reasonable format. For complete control over how numbers are converted to strings, use the [string.format()][api.library.string.format] function.

## Concatenation

The string concatenation operator in Lua is denoted by two dots (`'..'`). If both operands are strings or numbers, then they are converted to strings according to the rules mentioned in __Coercion__ above. Otherwise, the "concat" metamethod is called.

## Length

The length operator is denoted by the unary operator `#`. The length of a string is its number of bytes (that is, the usual meaning of string length when each character is one byte).


##

Content in this page is cited from the [Lua 5.1 Reference Manual](https://www.lua.org/manual/5.1/), freely available under the terms of the [Lua&nbsp;license](https://www.lua.org/license.html).