
# os.date()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      [String][api.type.String] or [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          time, date, format
> __See also__          [os.time()][api.library.os.time]
>						[os.clock()][api.library.os.clock]
>						[system.getTimer()][api.library.system.getTimer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a string or a table containing date and time, formatted according to the given string format. When called without arguments, `os.date()` returns a reasonable date and time representation that depends on the host system and on the current locale (that&nbsp;is, `os.date()` is equivalent to `os.date("%c")`).

## Syntax

	os.date( [format [, time] ] )

##### format ~^(optional)^~
_[String][api.type.String]._ If format starts with `!`, the date is formatted in Coordinated Universal Time. After this optional character, if format is the string `*t`, then date returns a table with the following fields: 

* `year` (four&nbsp;digits)
* `month` (1-12)
* `day` (1-31)
* `hour` (0-23)
* `min` (0-59)
* `sec` (0-61)
* `wday` <nobr>(weekday; Sunday is 1)</nobr>
* `yday` <nobr>(day of the year)</nobr>
* `isdst` (daylight&nbsp;saving flag, a&nbsp;boolean). 

If format is not `*t`, then `os.date()` returns the date as a string, formatted according to similar rules as the C function `strftime(3)`.

<div class="inner-table">

Code		Purpose
----------- ---------------------------------------------------------------------------
`%a`        Abbreviated weekday name
`%A`        Full weekday name 
`%b`        Abbreviated month name 
`%B`        Full month name 
`%c`        Date and time representation appropriate for locale 
`%d`        Day of month as decimal number (01 – 31) 
`%H`        Hour in 24-hour format (00 – 23) 
`%I`        Hour in 12-hour format (01 – 12) 
`%j`        Day of year as decimal number (001 – 366) 
`%m`        Month as decimal number (01 – 12) 
`%M`        Minute as decimal number (00 – 59) 
`%p`        Current locale's A.M./P.M. indicator for 12-hour clock 
`%S`        Second as decimal number (00 – 59) 
`%U`        Week of year as decimal number, with Sunday as first day of week (00 – 53) 
`%w`        Weekday as decimal number (0 – 6; Sunday is 0) 
`%W`        Week of year as decimal number, with Monday as first day of week (00 – 53) 
`%x`        Date representation for current locale 
`%X`        Time representation for current locale 
`%y`        Year without century, as decimal number (00 – 99) 
`%Y`        Year with century, as decimal number 
`%z`, `%Z`  The time-zone name or time zone abbreviation 
`%%`        Percent sign
----------- ---------------------------------------------------------------------------

</div>

Note that this list is somewhat dependent on the operating system, so don't rely on any additional format items when working on all platforms.

##### time ~^(optional)^~
_[Number][api.type.Number]._ If the `time` argument is present, this is the time to be formatted (see&nbsp;the [os.time()][api.library.os.time] function for a description of this&nbsp;value). Otherwise, `os.date()` formats the current time.


## Example

`````lua
local date = os.date( "*t" )    -- Returns table of date & time values in local time
print( date.year, date.month )  -- Print year and month
print( date.hour, date.min )    -- Print hour and minutes
print( os.date( "%c" ) )        -- Print time/date string, for example "Thu Oct 23 14:55:02 2010"

local date = os.date( "!*t" )    -- Returns table of date & time values in UTC
print( date.year, date.month )  -- Print year and month
print( date.hour, date.min )    -- Print hour and minutes
`````
