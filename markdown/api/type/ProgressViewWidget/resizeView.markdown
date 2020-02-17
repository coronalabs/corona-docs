# object:resizeView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, progress, progressViewWidget, resizeView
> __See also__          [widget.newProgressView()][api.library.widget.newProgressView]
>						[ProgressViewWidget][api.type.ProgressViewWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Resizes the width of a [ProgressViewWidget][api.type.ProgressViewWidget] after creation.


## Syntax

	object:resizeView( newWidth )

##### newWidth ~^(required)^~
_[Number][api.type.Number]._ The new width of the progress view.


## Example

``````lua
-- Resize to 200 pixels
progressView:resizeView( 200 )
``````

