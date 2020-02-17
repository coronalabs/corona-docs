
# show

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, show, event
> __See also__          [composer.*][api.library.composer]
>						[composer.gotoScene()][api.library.composer.gotoScene]
>						[composer.showOverlay()][api.library.composer.showOverlay]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is dispatched to the new active [scene][api.type.Scene], initiated via [composer.gotoScene()][api.library.composer.gotoScene] or [composer.showOverlay()][api.library.composer.showOverlay]).

For this event, `event.phase` is the [string][api.type.String] value of `"will"` if the scene is about to become active, or `"did"` after the scene comes on screen. If a scene transition effect is specified, the `"will"` phase is dispatched before the scene effect begins execution. In contrast, the `"did"` phase is not dispatched until after the effect is finished.


## Properties

#### [event.name][api.event.scene.show.name]

#### [event.params][api.event.scene.show.params]

#### [event.phase][api.event.scene.show.phase]
