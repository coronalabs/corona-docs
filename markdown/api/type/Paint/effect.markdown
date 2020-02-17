# fill.effect

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          filter, generator, composite, effect, procedural textures, multitexturing
> __See also__          [Paint][api.type.Paint]
>						[object.fill][api.type.ShapeObject]
>						[Filters/Generators/Composites][guide.graphics.effects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Apply shader effects to an object, including filters, generators (<nobr>procedurally-generated</nobr> textures), and composites (multitexturing).

See the [Filters/Generators/Composites][guide.graphics.effects] guide for a complete list of effects.

## Example

``````lua
-- Apply blur
object.fill.effect = "filter.blur"

-- Remove blur
object.fill = nil
``````