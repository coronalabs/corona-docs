# object:setActiveSegment()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, segmented control, SegmentedControlWidget, setActiveSegment
> __See also__          [object.segmentNumber][api.type.SegmentedControlWidget.segmentNumber]
>						[widget.newSegmentedControl()][api.library.widget.newSegmentedControl]
>						[SegmentedControlWidget][api.type.SegmentedControlWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the active segment for a [SegmentedControlWidget][api.type.SegmentedControlWidget].


## Syntax

	object:setActiveSegment( segmentNumber )

##### segmentNumber ~^(required)^~
_[Number][api.type.Number]._ The segment to set as active. Minimum value is `1`. Maximum value is the total number of segments in the control.

## Example

``````lua
-- Set segment #3 as active
mySegmentedControl:setActiveSegment( 3 )
``````