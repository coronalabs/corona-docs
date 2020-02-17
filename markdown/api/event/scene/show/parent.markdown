
# event.parent

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [show][api.event.scene.show]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, show, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When an overlay is shown, this overlay-specific scene event is dispatched to the overlay scene. It provides you with a reference to the parent scene object so that you may call functions/methods within it. See the [composer.hideOverlay()][api.library.composer.hideOverlay] documentation for a usage example.