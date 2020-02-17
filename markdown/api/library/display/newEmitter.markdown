# display.newEmitter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [EmitterObject][api.type.EmitterObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          newEmitter
> __See also__			[EmitterObject:start()][api.type.EmitterObject.start]
>						[EmitterObject:stop()][api.type.EmitterObject.stop]
>						[EmitterObject:pause()][api.type.EmitterObject.pause]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function creates an [EmitterObject][api.type.EmitterObject], used to display particle effects.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Particles emitted by an emitter are __not__ automatically removed unless their lifespan completes, nor are they destroyed if they move off screen. If you're using [Composer][api.library.composer] for scene management, emitters created with	`display.newEmitter()` should be inserted into the Composer scene view (or&nbsp;a&nbsp;child group of the scene&nbsp;view) so that they will be removed when the scene is exited. If you're not using Composer, you can manually destroy the emitter with [object:removeSelf()][api.type.Joint.removeSelf] or [display.remove()][api.library.display.remove] to remove all particles it generated.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

On macOS, [Particle Designer](http://71squared.com/particledesigner) can be used to design and output emitters as <nobr>JSON-encoded</nobr> files. Otherwise, emitter properties can simply be passed to this function as <nobr>key-value</nobr> pairs in a Lua table. See the examples below for usage details.

</div>


## Syntax

	display.newEmitter( emitterParams [, baseDir] )

##### emitterParams ~^(required)^~
_[Table][api.type.Table]._ A table of parameters for the emitter. See the [EmitterObject][api.type.EmitterObject] documentation for a list of valid properties.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where the particle emitter image file is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.


## Examples

##### Key-Value Parameters

``````lua
-- Table of emitter parameters
local emitterParams = {
	startColorAlpha = 1,
	startParticleSizeVariance = 53.47,
	startColorGreen = 0.3031555,
	yCoordFlipped = -1,
	blendFuncSource = 770,
	rotatePerSecondVariance = 153.95,
	particleLifespan = 0.7237,
	tangentialAcceleration = -144.74,
	finishColorBlue = 0.3699196,
	finishColorGreen = 0.5443883,
	blendFuncDestination = 1,
	startParticleSize = 50.95,
	startColorRed = 0.8373094,
	textureFileName = "fire.png",
	startColorVarianceAlpha = 1,
	maxParticles = 256,
	finishParticleSize = 64,
	duration = -1,
	finishColorRed = 1,
	maxRadiusVariance = 72.63,
	finishParticleSizeVariance = 64,
	gravityy = -671.05,
	speedVariance = 90.79,
	tangentialAccelVariance = -92.11,
	angleVariance = -142.62,
	angle = -244.11
}

-- Create the emitter
local emitter = display.newEmitter( emitterParams )

-- Center the emitter within the content area
emitter.x = display.contentCenterX
emitter.y = display.contentCenterY
``````

##### Particle Designer

``````lua
-- Require the JSON library for decoding purposes
local json = require( "json" )

-- Read the exported Particle Designer file (JSON) into a string
local filePath = system.pathForFile( "fire.json" )
local f = io.open( filePath, "r" )
local emitterData = f:read( "*a" )
f:close()

-- Decode the string
local emitterParams = json.decode( emitterData )

-- Create the emitter with the decoded parameters
local emitter = display.newEmitter( emitterParams )

-- Center the emitter within the content area
emitter.x = display.contentCenterX
emitter.y = display.contentCenterY
``````
