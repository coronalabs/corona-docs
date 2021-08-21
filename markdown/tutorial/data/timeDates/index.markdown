# Utilizing Time and Dates

Working with "time" in any programming language can be initially challenging, since it's not always obvious what various time/date functions mean and how they behave. This tutorial discusses some of these issues and shows you how to work with things like date calculations, time zones, and date formatting.


## Microseconds and Milliseconds

Before we get to code, there are several important concepts to understand. To a computer, the basic unit of time is a __second__. From that one value, we can determine any date, or with fractions, even smaller measures of time.

While one second is a short period of time to a human, it's actually a very long period of time to a computer. Just as humans break down long periods of time into smaller blocks, computers do as well. Besides __seconds__, many functions work in __milliseconds__ <nobr>(1/1000th of a second)</nobr>. Other functions work in __microseconds__ <nobr>(1/1,000,000th of a second)</nobr>.

In Corona, the [system.getTimer()][api.library.system.getTimer] call returns the amount of time since your app started running, and the value is typically returned in __milliseconds__, where the fractional part represents microseconds if the hardware supports it. Most devices will return a fractional time like:

``````
1839.3949
``````

For Corona apps where we deal with frame rates of 30 or 60 frames per second (1/30th&nbsp;to 1/60th of a&nbsp;second), having resolution more accurate than 1/1000th of a second isn't important. That leaves us with functions that run on __milliseconds__, including:

* [timer.performWithDelay()][api.library.timer.performWithDelay]
* [transition.to()][api.library.transition.to] / [transition.from()][api.library.transition.from]
* [audio.play()][api.library.audio.play]

Since each of these accepts time in milliseconds, you would, for example, provide a value of `5000` to the function for an equivalent of 5 seconds. &frac12; second would be `500`, 2&frac12; seconds would be `2500`, and so on. Basically, just multiply the time you want in seconds by `1000` to get the time for any of these functions.


## Longer Periods of Time

As stated above, the basic unit of time for a computer is one second. Both iOS and Android, as well as macOS, are based on operating systems derived from Unix, and in those operating systems the standard "time" function returns the number of seconds since <nobr>January 1, 1970</nobr> at midnight. Microsoft uses a different reference point, but since many apps are built using the language C, which had its origins in Unix, their library also uses this __time&nbsp;reference&nbsp;point__ or "Epoch." Under this system, "negative" times are before 1970 and "positive" times are after 1970.

In Corona, to get the current __number&nbsp;of&nbsp;seconds__ since <nobr>January 1, 1970</nobr>, you can use the [os.time()][api.library.os.time] call:

``````lua
print( os.time() )
``````

This outputs something like `1497577639`. That number by itself is somewhat meaningless and you can't really determine the "real&nbsp;world" time that it represents, but it __is__ very useful to calculate __date&nbsp;math__. For example, imagine that you're building a <nobr>turn-based</nobr> game and you want to check if the player needs a "nudge" because they're taking too long to play their turn. To begin, you could store the time of their last move:

``````lua
player[1].lastMove = os.time()
``````

Then, if you want to check if they've made a move in the last hour, you could write:

``````lua
local now = os.time()

if ( now > ( player[1].lastMove + 3600 ) ) then
	-- Nudge the player
end
``````

Where did the `3600` come from? Simple! `3600` is 60 seconds multiplied by 60 minutes, thus one hour.

Essentially, with time in seconds as an integer value, it becomes very easy to do date math:

* Has one day elapsed? Use `86400` <nobr>( `24 * 60 * 60` )</nobr>.
* Is your time older than a week? Use `604800` <nobr>( `7 * 24 * 60 * 60` )</nobr>.
* Set an alarm in 30 days? Use `2592000` <nobr>( `30 * 24 * 60 * 60` )</nobr>.


## Working With Dates

Dates are a bit more challenging because they are __strings__ which can be formatted in seemingly infinite ways, including:

* `April 1, 2010 4:53pm`
* `April 1, 2010 4:53 P.M.`
* `4/1/10 16:53 MT`
* `Sun Jan 13 15:17:32 EST 2013`
* `13-JAN-13 15:17`

As a developer, you need to parse dates into their <nobr>"component values" &mdash; that is,</nobr> you must get each part of the date/time string: __month__, __day__, __year__, __hour__, __minute__, __seconds__, and __time&nbsp;zone__.

### ISO-8601

One common date format is the <nobr>__ISO-8601__</nobr> time format, a string that looks like this:

``````
2017-01-12T12:04:35.03-0400
``````

This may look a bit menacing, so let's separate out the elements for further inspection:

``````
2017-01-12    T    12:04:35.03    -0400
``````

Much better! Now it's clearer what each element represents:

1. The part before the `T` is a date in a very predictable and <nobr>easy-to-separate</nobr> format: __year__, __month__, and __day__ as positive integers separated by hyphens.

2. The letter `T` indicates that the __time__ part is starting; afterward there's another series of positive integers which indicate __hour__, __minutes__, and __seconds__, separated by colons. Note that the __seconds__ value may be a floating point number which represents a whole plus a fractional amount of seconds.

3. Finally, the string may have an optional __time&nbsp;zone__ string indicating the zone the time originated in. We'll talk more about the time zone format in a bit.

To convert an <nobr>ISO-8601</nobr> date into a useful __timestamp__ which we can use for date math, let's use the `string:match()` function and, once&nbsp;again, the `os.time()` function. Above, we simply called `os.time()` without parameters to retrieve the number of seconds since <nobr>January 1, 1970</nobr>, but `os.time()` also accepts an optional [table][api.type.Table] parameter containing values which represent each of the date components.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,7,8,9]" }
local dateString = "2017-01-12T12:04:35.03-0400"

local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%p])(%d%d)%:?(%d%d)"

local year, month, day, hour, minute, seconds, tzOffset, offsetHour, offsetMin = dateString:match( pattern )

local timestamp = os.time(
	{ year=year, month=month, day=day, hour=hour, min=minute, sec=seconds }
)
``````

We now have a value that is in seconds since <nobr>January 1, 1970</nobr> and we can use it in date math, but there's one final problem: we haven't adjusted for __time&nbsp;zones__. Fortunately, it's easy to fix since we now have the base time in seconds:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11,12,13,14]" }
local timestamp = os.time(
	{ year=year, month=month, day=day, hour=hour, min=minute, sec=seconds }
)

local offset = 0
if ( tzOffset ) then
	if ( tzOffset == "+" or tzOffset == "-" ) then  -- We have a timezone
		offset = offsetHour * 60 + offsetMin
		if ( tzOffset == "-" ) then
			offset = offset * -1
		end
		timestamp = timestamp + offset
	end
end
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* It's important to consider time zones because, by default, `os.time()` returns its value local to the time zone you're in. You can easily compare "now" to a timestamp and determine if something is in the past or future, or if a given amount of time has elapsed.

* In a date string, an ending character `Z` indicates that the time is in __Coordinated&nbsp;Universal&nbsp;Time__ or __UTC__. If it's in UTC or local time, you don't need to make any time zone adjustments.

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Here is a complete function which combines the aspects discussed in this section:

``````lua
local function makeTimeStamp( dateString )

	local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%p])(%d%d)%:?(%d%d)"
	local year, month, day, hour, minute, seconds, tzOffset, offsetHour, offsetMin = dateString:match( pattern )
	local timestamp = os.time(
		{ year=year, month=month, day=day, hour=hour, min=minute, sec=seconds }
	)

	local offset = 0
	if ( tzOffset ) then
		if ( tzOffset == "+" or tzOffset == "-" ) then  -- We have a timezone
			offset = offsetHour * 60 + offsetMin
			if ( tzOffset == "-" ) then
				offset = offset * -1
			end
			timestamp = timestamp + offset
		end
	end
	return timestamp
end
``````

</div>
</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Despite its power and convenience, this code does __not__ compensate for Daylight&nbsp;Savings&nbsp;Time, a topic that's beyond the scope of this tutorial.

</div>
</div>


## Converting a Timestamp

At some point, you will probably need to go the "other&nbsp;way" with your time and convert it to a date string in a format that users can understand. This is the purpose of the [os.date()][api.library.os.date] function.

The `os.date()` function takes two optional parameters. Calling it with no parameters will return the current date/time for the time zone you're in (or&nbsp;the zone your device thinks you're&nbsp;in). This will be in a format like:

``````
Sat Jan 12 14:07:30 2013
``````

Fortunately, you can specify various formatting parameters to build dates as you like. These format parameters are based on the Unix/C++ library function [strftime](https://strftime.org/), and with that you can format the date/time in many different ways. 

``````lua
print( os.date("%A") )          -- Outputs a string representing the weekday
print( os.date("%A %l:%M%p") )  -- Outputs something like "Saturday 2:30PM"
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

By default, the values returned by [os.date()][api.library.os.date] will be based on your locale or time zone. This is crucial to understand if you want to create the type of date above, possibly for a multiplayer game with players in different time zones. In cases like these, you need to output the time based on __UTC__ by placing a single `!` in front of the `format` parameter:

``````lua
print( os.date("!%Y-%m-%dT%XZ") )  -- In UTC; outputs something like "2017-06-16T19:32:23Z"
``````

</div>


## Conclusion

Dealing with time and dates can be heavy on syntax, but hopefully this tutorial has exhibited that it's not an insurmountable task. With a little effort and the convenient functions/methods above, you can "wield&nbsp;time" in ways that you might not have considered in the past.
