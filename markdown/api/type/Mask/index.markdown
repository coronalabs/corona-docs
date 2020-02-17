# Mask

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Userdata][api.type.Userdata]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          graphics, mask, image mask
> __See also__          [Masking Images][guide.media.imageMask] _(guide)_
>						[graphics.newMask()][api.library.graphics.newMask]
>						[object:setMask()][api.type.DisplayObject.setMask]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Mask objects are created with [graphics.newMask()][api.library.graphics.newMask] and have no properties and methods. They are used with [display object][api.type.DisplayObject] methods such as [object:setMask()][api.type.DisplayObject.setMask].


## Gotchas

There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other masked display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.