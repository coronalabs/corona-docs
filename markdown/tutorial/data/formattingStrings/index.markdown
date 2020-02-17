# Formatting String Values

There may come a time when you need to output a number with specific formatting, such as displaying a value like `3.1415926` with only two decimal places. Or perhaps you need to lay out a table and produce column data, like a leaderboard. This is where [string.format()][api.library.string.format] comes into play. Using this, you can provide a __format&nbsp;string__ plus a series of values to format and the API will return a single string formatted to your specifications.


## Formatting Basics

The __format&nbsp;string__ (the&nbsp;first parameter to&nbsp;[string.format()][api.library.string.format]) can contain text and __format&nbsp;codes__ which produce the desired output string. Let's look at a simple example:

``````lua
string.format( "Bill made $%6.2f dollars at the yard sale.", 11.25017 )
``````

Within the format string, notice the format code of `%6.2f`. This directly coincides with the second parameter, `11.25017`, and if we output this code to the console it will appear as this:

``````
Bill made $ 11.25 dollars at the yard sale.
``````

Let's inspect the format code of `%6.2f` in further detail.

* In all places within the format string where you want to output a formatted value, begin with a __percent&nbsp;sign__ (`%`).

* Following this, the `6` parameter instructs the method to use 6 total characters to output the value.

* Next, `.2` indicates the number of decimal places to include __after__ the decimal, in&nbsp;this case&nbsp;2, commonly used to specify monetary values.

* Finally, the `f` parameter indicates a Lua "conversion&nbsp;specifier," in this case a __floating&nbsp;point&nbsp;number__, most of which behave just like those in the family of C/C++ [printf](http://www.cplusplus.com/reference/clibrary/cstdio/printf/) functions.


## Justification and Placeholders

In the example above, the number only occupied 5 of the allotted 6 characters, so the string is padded with spaces. By default, spaces will be added to the __left__ in order to simulate right justification, because numbers are often right justified. However, when outputting alphabetical values like names, you'll usually want them to be standard (left) justified. To accomplish this, simply use a __minus&nbsp;sign__ (`-`) as part of the format code:

``````lua
string.format( "%-20s %-10d.", "Albert Einstein", "29314" )
``````

If we output this code, it will appear like this:

``````
Albert Einstein     29314     .
``````

In this output, carefully observe the "placeholder" spaces. Because we specified 20 total places for the string <nobr>`Albert Einstein`</nobr> (15&nbsp;characters) and justified it to the __left__ using the `-` sign, 5&nbsp;placeholder spaces will be output before the next part of the output string (`29314`). Similarly, since we specified 10 total places for the string `29314`, 5&nbsp;placeholder spaces will be output before the end of the <nobr>format string (`.`)</nobr>.


## Leading Zeros

The [string.format()][api.library.string.format] API can also be used to format numbers such as high scores, in which you might want to include leading zeros:

``````lua
string.format( "%07d", 1050 )
``````

This will result in a value of `0001050` because we specified `0` (to&nbsp;pad the value with leading&nbsp;zeros) and we indicated `7` total spaces for the formatted output.


## Conversion Specifiers

As noted above, you can use various "conversion&nbsp;specifiers" in the format string, including:

<div class="inner-table">

 Specifier		Output
--------------	------------------
 `s`			<nobr>String of characters</nobr>
 `d`			<nobr>Signed decimal integer</nobr>
 `f`			<nobr>Decimal floating point</nobr>
--------------	------------------

</div>

Basically, aside from a few exceptions, Lua's [string.format()][api.library.string.format] API uses the same parameters as those in the family of C/C++ [printf](http://www.cplusplus.com/reference/clibrary/cstdio/printf/) functions.


## Conclusion

As you can see, the [string.format()][api.library.string.format] API is very powerful and it can be used to format strings for text display or UI needs, among other tasks. It may require some experimentation to accomplish the exact formatting that you desire, but with a little testing, you can format a string in virtually any manner necessary.
