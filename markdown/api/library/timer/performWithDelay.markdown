
# timer.performWithDelay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [timer.*][api.library.timer]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, delay, performWithDelay
> __See also__          [timer][api.event.timer]
>                       [timer.pause()][api.library.timer.pause]
>                       [timer.cancel()][api.library.timer.cancel]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Calls a specified function after a delay. This function returns a [table][api.type.Table] that can be used with other [timer][api.library.timer] functions. For example, the returned table can be passed to [timer.cancel()][api.library.timer.cancel] to cancel the invocation of the specified listener.


## Gotchas

Timers will be automatically paused when the application is suspended and resume when the application is resumed. However, to avoid unwanted behaviours, it is strongly advised to handle your timers __manually__. Thus, if you have running timers that are not paused and resumed (in&nbsp;code) upon suspension of the app, you should handle this task by calling [timer.pause()][api.library.timer.pause] and [timer.resume()][api.library.timer.resume] on all applicable timers.

Timers will __not__ be automatically cancelled when changing a scene. Thus, if you have running timers that are not cancelled, you must handle this __manually__ by calling [timer.cancel()][api.library.timer.cancel] on all applicable timers.


## Syntax

	timer.performWithDelay( delay, listener [, iterations] [, tag] )

##### delay ~^(required)^~
_[Number][api.type.Number]._ The delay in milliseconds, for example, `1000` = 1 second. Note that timers cannot execute faster than the runtime framerate of the app. For example, if the framerate of the app is `60` frames per second, as defined in the `config.lua` file \([guide][guide.basics.configSettings]\), the shortest delay for a timer is approximately `16.667` milliseconds <nobr>(`1000`/`60` = ~`16.667`)</nobr>.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener to invoke after the delay. This may be either a function listener or a table listener. If a table listener, it must have a timer method because timer events are sent to the listener.

##### iterations ~^(optional)^~
_[Number][api.type.Number]._ Optionally specify the number of times `listener` is to be invoked. By default, it is `1`; pass `0` or `-1` if you want the timer to loop forever.

##### tag ~^(optional)^~
_[String][api.type.String]._ Optionally assign a `tag` to the timer. You can pause, resume or cancel all timers that share the same `tag` with a single function call. Note: Using `tag` requires `Solar2D 2020.3611` or a newer build.


## Examples

##### Function Listener

`````lua
local function listener( event )
    print( "listener called" )
end
 
timer.performWithDelay( 1000, listener )
`````

##### Table Listener

`````lua
local listener = {}
function listener:timer( event )
    print( "listener called" )
end
 
timer.performWithDelay( 1000, listener )
`````

##### Passing Parameters (1)

`````lua
-- Lua closure method

local function spawnBall( randomPosition )
    ballPosition = display.newCircle( 100, 100, 20 )
    ballPosition.x = randomPosition
end

-- Obtain a random number for the spawned object's x position
local randomPosition = 100 + math.random(200)

-- Wrap "spawnBall" and "randomPosition" inside a closure
local myClosure = function() return spawnBall( randomPosition ) end
timer.performWithDelay( 2000, myClosure, 1 )
`````

##### Passing Parameters (2)

``````lua
-- Variable handle method

local function onTimer( event )
    -- Access "params" table by pointing to "event.source" (the timer handle)
    local params = event.source.params
    print( params.myParam1 )
    print( params.myParam2 )
end

-- Assign the timer to a variable "tm"
local tm = timer.performWithDelay( 1000, onTimer )
-- Assign a table of parameters to the "tm" handle
tm.params = { myParam1 = "Parameter1", myParam2 = "Parameter2" }
``````

## Extras

* [Source code](https://github.com/coronalabs/framework-timer)

If you want to add new functionality or modify existing ones, you can download or fork the source code from GitHub and include in your project(See [Using External Modules][tutorial.basics.externalModules]).
