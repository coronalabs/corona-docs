# collectgarbage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          garbage collection, garbage, memory, resources
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A generic interface to Lua's garbage collector. Using this function is not required because Lua has automatic garbage collection features.

## Syntax

	collectgarbage( [opt [, arg]] )

##### opt ~^(required)^~
_[String][api.type.String]._ Performs garbage collection functions differently based on this option. Acceptable values include:

* `"collect"` &mdash; performs a full garbage-collection cycle. This is the default option.
* `"stop"` &mdash; stops the garbage collector.
* `"restart"` &mdash; restarts the garbage collector.
* `"count"` &mdash; returns the total memory in use by Lua (in kilobytes).
* `"step"` &mdash; performs a garbage-collection step. The step "size" is controlled by `arg` (larger values mean more steps) in a non-specified way. If you want to control the step size you must experimentally tune the value of `arg`. Returns `true` if the step finished a collection cycle.
* `"setpause"` &mdash; sets `arg` as the new value for the pause of the collector. Returns the previous value for pause.
* `"setstepmul"` &mdash; sets `arg` as the new value for the step multiplier of the collector. Returns the previous value for step.

##### arg ~^(optional)^~
_Any._ Arguments that are directly related to the value you chose for `opt`. Many options do not need arguments to be passed.