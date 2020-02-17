# object:setProgress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, progress, progressViewWidget, setProgress
> __See also__          [object:getProgress()][api.type.ProgressViewWidget.getProgress]
>						[widget.newProgressView()][api.library.widget.newProgressView]
>						[ProgressViewWidget][api.type.ProgressViewWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the current progress of a [ProgressViewWidget][api.type.ProgressViewWidget].


## Syntax

	object:setProgress( progress )

##### progress ~^(required)^~
_[Number][api.type.Number]._ The progress (percentage) at which to set the progress view. This value must be between `0.0` (empty) and `1.0` (100%&nbsp;full).


## Example

``````lua
-- Set the progress to 50%
progressView:setProgress( 0.5 )
``````

