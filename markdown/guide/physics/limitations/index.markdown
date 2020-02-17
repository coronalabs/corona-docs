# Physics Notes/Limitations

There are certain behavioral aspects and limitations which should be noted when using physics. This guide outlines the most important and common among these.

<div class="guides-toc">

* [Groups and Collisions](#groups)
* [Object Scaling](#scaling)
* [Transitions](#transitions)

</div>


<a id="groups"></a>

## Groups and Collisions

Display objects with physical bodies can, of course, be placed in different [display&nbsp;groups][api.library.display.newGroup] for <nobr>z-index</nobr> layering purposes. However, if you need to detect collisions between objects in different groups, you should __not__ move, scale, or rotate entire display groups __independently__ of each other because of underlying Box2D functionality.

It is valid to move, scale, or rotate a series of groups in unison or <nobr>lock-step</nobr> as long as these groups maintain the same coordinate origin, angle, and scale. However, if groups are moved, scaled, or rotated independently of each other, the Box2D collision system will consider the physics bodies to be in their original state, not as they appear as a result of transforming the group.

This also applies to the [physics.setDrawMode()][api.library.physics.setDrawMode] `"hybrid"` and `"debug"` modes&nbsp;&mdash; even though these draw modes will suggest that the bodies have changed as a result of modifying the group, the collision system will still consider them to be in their original state.




<a id="scaling"></a>

## Object Scaling

Display objects with physical bodies should generally __not__ be scaled via [object:scale()][api.type.DisplayObject.scale], [object.xScale][api.type.DisplayObject.xScale], or [object.yScale][api.type.DisplayObject.yScale]. This is because the physics engine will still consider the physical body as it was originally defined. Essentially, if you scale the object up or down, the display object portion will visually reflect the applied scale, but the physical body will not be affected.




<a id="transitions"></a>

## Transitions

### Movement

Display objects with physical bodies can be moved via [transitions][guide.media.transitionLib], but it's important to understand that these __transitional__ movements function independently of __physical__ movements. Thus, using transitional movement on physical objects should be handled carefully or avoided entirely.

For example, if a physical object is falling under the effect of simulated gravity, and then you apply a transition to a specific vertical point in the upward direction, the object's actual <nobr>on-screen</nobr> position will be controlled by both systems. However, these two systems are not truly aware of each other&nbsp;&mdash; in this case, gravity will force the object downward while the transition attempts to pull it back upward, resulting in awkward behavior where each system fights the other to maintain control of the object.

Transitional movement can still be used on physical bodies, but you should ensure that there is no competing physical force or velocity on the object at the time the transition begins. One way to achieve this is by putting the body to sleep via <nobr>`object.isAwake = false`</nobr> \([reference][api.type.Body.isAwake]\). This will prevent global forces like gravity from affecting the object during the transition, but use caution with this approach since any direct physical influence on the object will cause it to wake up.

If physical interaction occurs at any point during the transition&nbsp;&mdash; collision with another object, for&nbsp;example&nbsp;&mdash; you should immediately cancel the transition via [transition.cancel()][api.library.transition.cancel] to prevent any further conflict between the two systems attempting to control the object.

### Joints

Generally, you should avoid using any type of transitional movement or rotation upon a physical structure that consists of several distinct bodies attached by physical [joints][guide.physics.physicsJoints]. If you apply a transition to just one of the bodies, the objects joined to that body may be incapable of maintaining synchronization with the transition occuring on the single body. This is especially true if the transition results in a fast or sudden shift in position or angle.
