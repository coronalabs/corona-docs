
# hide

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, hide, event
> __See also__          [composer.*][api.library.composer]<br/>[composer.gotoScene()][api.library.composer.gotoScene]<br/>[composer.hideOverlay()][api.library.composer.hideOverlay]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is dispatched to the currently active [scene][api.type.Scene] when a new scene is called via [composer.gotoScene()][api.library.composer.gotoScene] or an overlay scene is hidden via [composer.hideOverlay()][api.library.composer.hideOverlay].

For this event, `event.phase` is the [string][api.type.String] value of `"will"` when the scene is on screen (but&nbsp;is about to go off&nbsp;screen). In contrast, `event.phase` will be the [string][api.type.String] value of `"did"` immediately after the scene goes off screen. If a scene transition effect is specified for the new scene or the overlay, the `"will"` phase is dispatched before the effect begins execution and the `"did"` phase is dispatched after the effect is finished.


## Properties

#### [event.name][api.event.scene.hide.name]

#### [event.phase][api.event.scene.hide.phase]
