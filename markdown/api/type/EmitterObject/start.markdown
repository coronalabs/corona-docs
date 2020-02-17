# EmitterObject:start()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [EmitterObject][api.type.EmitterObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          EmitterObject, start
> __See also__			[display.newEmitter()][api.library.display.newEmitter]
>						[EmitterObject:stop()][api.type.EmitterObject.stop]
>						[EmitterObject:pause()][api.type.EmitterObject.pause]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Starts the emission of particles from an [EmitterObject][api.type.EmitterObject] if the emitter is [stopped][api.type.EmitterObject.stop], or resumes the emission of particles if the emitter is [paused][api.type.EmitterObject.pause].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Emitters begin in the "playing" state and do not need to be "started" by default.

* If you start an emitter from a "stopped" state, and there are existing particles from the emitter on screen <nobr>(from a previously-started emission)</nobr>, all existing particles will instantly be removed.

</div>

## Syntax

	EmitterObject:start()
