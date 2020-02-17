
# event.contact

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [PhysicsContact][api.type.PhysicsContact]
> __Event__             [postCollision][api.event.postCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          postCollision, contact
> --------------------- ------------------------------------------------------------------------------------------

## Overview

During a post-collision, there are multiple [contact][api.type.PhysicsContact] points that occur. You can manipulate these contact points to create certain effects.


## Gotchas

You should not hold onto the contact object. It is only valid in the scope of your collision listener.


## Properties

* `event.contact.isTouching` &mdash; indicates whether the two objects are touching <nobr>(read only)</nobr>.
* `event.contact.bounce` &mdash; specifies the bounce factor of the collision <nobr>(read or write)</nobr>.
* `event.contact.friction` &mdash; specifies the friction factor of the collision <nobr>(read or write)</nobr>.