# GroupObject

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          group, display group, groups
> __See also__          [display.newGroup()][api.library.display.newGroup]
>						[Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Group objects are a special type of [display object][api.type.DisplayObject]. You can add other display objects as children of a group object. You can also remove them. Even if an object is not visible, it remains in the group object until explicitly removed. Thus, to minimize memory consumption, you should explicitly remove any object that will no longer be used.

All objects are implicitly added to the current stage, which itself is a kind of group object.

Corona does not have layers or levels but groups can be used to simulate the functionally. Objects added to groups can be moved and transposed as a group by controlling the group object.

Child objects can also be accessed by array index, for example:

`````lua
group[4]:removeSelf()
`````

See the [Group Programming][guide.graphics.group] guide for more information about group objects.


## Gotchas

Using groups with the physics engine has some limitations — see the [Physics Notes/Limitations][guide.physics.limitations] guide.


## Properties

_(Inherits properties from [DisplayObject][api.type.DisplayObject])_

#### [object.anchorChildren][api.type.GroupObject.anchorChildren]

#### [object.numChildren][api.type.GroupObject.numChildren]


## Methods

_(Inherits methods from [DisplayObject][api.type.DisplayObject])_

#### [object:insert()][api.type.GroupObject.insert]

#### [object:remove()][api.type.GroupObject.remove]

