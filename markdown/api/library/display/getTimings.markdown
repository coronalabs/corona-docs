# display.getTimings()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          performance, profiling, timing, debug
> __See also__          [display.enableStatistics()][api.library.display.enableStatistics]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a detailed, hierarchical breakdown of frame timings for the `"update"` and `"render"` phases of the engine. This function is useful for profiling and debugging performance issues in your project.

The engine internally records timestamps at significant steps during each frame—such as before and after event dispatch, physics updates, and drawing operations. `display.getTimings()` retrieves these measurements, providing insight into where time is being spent.

Timings are reported in **microseconds** and are reset at the beginning of each new frame. To obtain meaningful data, you should call this function once per frame, typically from a `lateUpdate` listener or a repeating timer.

## Syntax

    display.getTimings( [table,] category )

##### table ~^(optional)^~
_[Table][api.type.Table]._ An optional table to fill with the timing results. If provided, the table is cleared and reused for performance. If omitted, a new table is created and returned.

##### category ~^(required)^~
_[String][api.type.String]._ The timing category to retrieve. Valid values are:

* `"update"` — Timings from the update phase (Lua code, event listeners, physics, etc.)
* `"render"` — Timings from the render phase (drawing operations)

## Return Value

_[Number][api.type.Number]._ The number of elements added to the table (or the newly created table). The table structure alternates between:

* A **string label** describing the timing point, followed by a **number** representing the elapsed time in microseconds, _or_
* A **string sublist name** followed by `nil`, indicating the start of a nested timing scope

Sublists allow for hierarchical timing data—for example, an event listener may have its own internal timings that are grouped under its name.

### Table Structure

`````lua
-- For 'update' category
{
  "Display::Update Begin", 0,
  "Run sprite player", 1,
  "Queue updatables", 2,
  "Prepare for frame event", 3,
  "enterFrame (event)", false,
  "FrameEvent", 89,
  "LateUpdate", 103,
  "Display::Update End", 104,
  -- ... more entries
}

-- For 'render' category
{
  "Display::Render Begin", 0,
  "Scene: Begin Render", 16,
  "Scene: Preload", 22,
  "Scene: UpdateTextures", 23,
  "Scene: Setup", 25,
  "Scene: Issue Clear Command", 27,
  "Scene: Issue Draw Commands", 59,
  -- ... more entries
}
`````

## Example

`````lua
local timings = {}

local function printTimings(category)
    local sizeTimings = display.getTimings(timings, category)
    print("> " .. category)

    for i = 1, sizeTimings, 2 do
        local key = timings[i]
        local value = timings[i + 1]

        if type(value) == "boolean" then
            -- Converting boolean value to string
            value = timings[ i + 1 ] and 'true' or 'false'
        else
            -- convert μs to miliseconds
            value = (value / 1000) .. " ms"
        end

        print (key .. " -> " .. value .. "\n")
    end
end

Runtime:addEventListener("lateUpdate", function ()
    printTimings("update")
    print("")
    printTimings("render")
    print("<<>>")
end)
`````
