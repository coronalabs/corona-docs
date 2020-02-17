
# create

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, create, event
> __See also__          [composer.*][api.library.composer]<br/>[composer.gotoScene()][api.library.composer.gotoScene]<br/>[composer.loadScene()][api.library.composer.loadScene]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is dispatched to the scene passed as the first argument to [composer.gotoScene()][api.library.composer.gotoScene] and [composer.loadScene()][api.library.composer.loadScene], but only if the scene's `self.view` does not exist.

If the scene's `self.view` already exists &mdash; for example, the scene was previously loaded and has not been removed or recycled &mdash; the `"create"` event will not be dispatched. Instead, a [show][api.event.scene.show] event is dispatched.

## Properties

#### [event.name][api.event.scene.create.name]

#### [event.params][api.event.scene.create.params]
