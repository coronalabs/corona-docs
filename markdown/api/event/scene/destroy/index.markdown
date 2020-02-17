
# destroy

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, destroy, event
> __See also__          [composer.*][api.library.composer]<br/>[composer.removeScene()][api.library.composer.removeScene]<br/>[composer.removeHidden()][api.library.composer.removeHidden]<br/>[composer.hideOverlay()][api.library.composer.hideOverlay]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is dispatched before a [scene][api.type.Scene] is recycled and it's a direct result of calling [composer.removeScene()][api.library.composer.removeScene], [composer.removeHidden()][api.library.composer.removeHidden], or [composer.hideOverlay()][api.library.composer.hideOverlay]. This event may also be triggered if the OS issues a low memory warning and the [composer.recycleAutomatically][api.library.composer.recycleAutomatically] property is set to `true` (default).

This event will not be dispatched if the scene's `self.view` property doesn't exist &mdash; for example, if the scene has been recycled or `self.view` was never created.


## Properties

#### [event.name][api.event.scene.destroy.name]
