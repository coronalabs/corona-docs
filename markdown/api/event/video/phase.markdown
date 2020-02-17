
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [video][api.event.video]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          video, phase
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying where in the video sequence the event occurred. Can be one of the following values:

* `"ready"` — indicates that the video is loaded and ready to play.
* `"ended"` — indicates that the video has completed on its own total play time \([object.totalTime][api.type.Video.totalTime]\).
