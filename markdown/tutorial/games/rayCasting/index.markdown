# Ray Casting and Reflection

This tutorial discusses __ray&nbsp;casting__ and __reflection__, achieved via the [physics.rayCast()][api.library.physics.rayCast] and [physics.reflectRay()][api.library.physics.reflectRay] APIs respectively. It also follows along with a "real&nbsp;world" demo project available for download [here](https://github.com/coronalabs/samples-coronasdk/tree/master/Physics/RayCasting).


## What is Ray Casting?

At the most basic level, __ray&nbsp;casting__ involves transmitting <nobr>a ray &mdash;</nobr> a straight line&nbsp;&mdash; from one point to another point, using it to detect if one or more [physics bodies][api.type.Body] resides in that path. Among other things, this can be used to detect if an object resides in the firing path of a gun, the <nobr>"line-of-sight"</nobr> of an enemy, etc. Essentially, it's a quick and efficient way to query the physics world for the presence of other physics objects.

Corona also features a convenient API for __reflecting__ a ray from any object it strikes. From any ray cast with a registered hit, [physics.reflectRay()][api.library.physics.reflectRay] returns a vector representing the direction of the reflection, with a magnitude (length) of `1`. This tutorial demonstrates both ray casting and ray reflection in practical usage.


## Room of Mirrors

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you haven't downloaded the [demo project](https://github.com/coronalabs/samples-coronasdk/tree/master/Physics/RayCasting), please do so and follow along with the code.

</div>
</div>

An important step in this demo is configuring the <nobr>"world" &mdash;</nobr> in this case a room of mirrors with a laser turret in the center. You can set up your physics world however you wish, but this example loops through a series of tables containing `x`, `y`, and `rotation` values for each mirror:

``````lua
-- Set up mirror positions relative to the center of the content area
local mirrorSet = {
    { 0, -125, 90 },    -- top
    { 105, -60, -35 },  -- right-upper
    { 105, 60, 35 },    -- right-lower
    { 0, 125, 90 },     -- bottom
    { -105, -60, 35 },  -- left-upper
    { -105, 60, -35 }   -- left-lower
}
``````

The turret itself is a standard display object with a radial physics body&nbsp;&mdash; yes, ray casting detection/reflection works on radial bodies too!

``````lua
-- Create turret
turret = display.newImageRect( mirrorGroup, "turret.png", 48, 48 )
physics.addBody( turret, "dynamic", { radius=18 } )
turret.x, turret.y = display.contentCenterX, display.contentCenterY
``````

Next, we start the turret rotating by setting its angular velocity to the `turretSpeed` variable located near the beginning of the sample code. Then, we start a repeating timer to fire the laser every 2000 milliseconds.

``````{ brush="lua" gutter="false" first-line="1" highlight="[2,5]" }
-- Start rotating turret
turret.angularVelocity = turretSpeed

-- Start repeating timer to fire beams
timer.performWithDelay( 2000, fireOnTimer, 0 )
``````


## Casting the Ray

Casting the actual ray is simple. Locate the `castRay()` function and inspect the highlighted line:

``````{ brush="lua" gutter="false" first-line="1" highlight="[4]" }
local function castRay( startX, startY, endX, endY )

    -- Perform ray cast
    local hits = physics.rayCast( startX, startY, endX, endY, "closest" )
``````

The first four arguments to [physics.rayCast()][api.library.physics.rayCast] indicate an __x__ and __y__ starting position, along with an __x__ and __y__ destination. Here, these values are passed in to the `castRay()` function as `startX`, `startY`, `endX`, and `endY` respectively.

The fifth argument, while optional, is worth noting because it indicates the "type" of result(s) you want returned from the ray cast. The following options are currently available:

* `"any"` &mdash; Returns the __first__ valid result, but not necessarily the closest to the starting point.
* `"closest"` &mdash; Returns the __closest__ result from the starting point (default&nbsp;return value if no other option is&nbsp;specified).
* `"sorted"` &mdash; Returns __all__ of the results, sorted from closest to furthest from the starting point.
* `"unsorted"` &mdash; Returns __all__ of the results, without any sorting algorithm applied.


## Utilizing the Results

The [physics.rayCast()][api.library.physics.rayCast] API returns an [array][api.type.Array] of [tables][api.type.Table] describing each hit, but since we're only interested in the __first__ hit that the ray cast registers (in&nbsp;this case the __closest__ to the ray's starting&nbsp;point), we'll only deal with the first table in the array:

``````{ brush="lua" gutter="false" first-line="1" highlight="[10,13]" }
local function castRay( startX, startY, endX, endY )

    -- Perform ray cast
    local hits = physics.rayCast( startX, startY, endX, endY, "closest" )

    -- There is a hit; calculate the entire ray sequence (initial ray and reflections)
    if ( hits and beamGroup.numChildren <= maxBeams ) then

        -- Store first hit to variable (just the "closest" hit was requested, so use "hits[1]")
        local hitFirst = hits[1]

        -- Store the hit X and Y position to local variables
        local hitX, hitY = hitFirst.position.x, hitFirst.position.y
``````

From the table representing the first hit <nobr>(`hits[1]`, set to `hitFirst`)</nobr>, we get the following details:

* `object` &mdash; The physical object colliding with the ray.
* `position.x` &mdash; The __x__ collision point with `object`, in content space.
* `position.y` &mdash; The __y__ collision point with `object`, in content space.
* `normal.x` &mdash; The __x__ component of the normal of the `object` surface hit, in local space.
* `normal.y` &mdash; The __y__ component of the normal of the `object` surface hit, in local space.

Using this information, we can draw a layered set of lines from the starting point to the hit point:

``````lua
local function drawBeam( startX, startY, endX, endY )

    -- Draw a series of overlapping lines to represent the beam
    local beam1 = display.newLine( beamGroup, startX, startY, endX, endY )
    beam1.strokeWidth = 2 ; beam1:setStrokeColor( 1, 0.312, 0.157, 1 ) ; beam1.blendMode = "add" ; beam1:toBack()
    local beam2 = display.newLine( beamGroup, startX, startY, endX, endY )
    beam2.strokeWidth = 4 ; beam2:setStrokeColor( 1, 0.312, 0.157, 0.706 ) ; beam2.blendMode = "add" ; beam2:toBack()
    local beam3 = display.newLine( beamGroup, startX, startY, endX, endY )
    beam3.strokeWidth = 6 ; beam3:setStrokeColor( 1, 0.196, 0.157, 0.392 ) ; beam3.blendMode = "add" ; beam3:toBack()
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that this sample uses three lines of varying widths, layered over each other, with a [blend mode][api.type.DisplayObject.blendMode] of `"add"`. This creates a nice visual appearance of a laser with a brighter center region that fades out to red/orange toward the edges.

</div>
</div>


## Reflecting the Ray

If you wish to __reflect__ the ray off a surface it hits, Corona provides the convenient [physics.reflectRay()][api.library.physics.reflectRay] API. As stated earlier, this returns a vector representing the direction of the reflection, with a magnitude (length) of `1`.

Calling this function requires three arguments:

* `from_x` &mdash; The starting __x__ position of the original ray cast.
* `from_y` &mdash; The starting __y__ position of the original ray cast.
* `hit` &mdash; An entry in the `hits` array, as returned by the cast ray.

In our sample, the [physics.reflectRay()][api.library.physics.reflectRay] call looks like this:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1]" }
local reflectX, reflectY = physics.reflectRay( startX, startY, hitFirst )
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Notice that the `from_x` and `from_y` arguments are based on the __original&nbsp;ray&nbsp;cast__ starting position <nobr>(`startX` and `startY`)</nobr>, __not__ the hit position of `endX` and `endY`. In other words, [physics.reflectRay()][api.library.physics.reflectRay] only handles __one__ reflection, not a recursive series of reflections. To make the laser continue bouncing/reflecting from mirror to mirror, we'll need to do another ray cast each time, as demonstrated below.

</div>

To extrude the reflected ray and set a destination point for it, just factor in a vector length of your choosing and sum it to the hit point:

``````{ brush="lua" gutter="false" first-line="1" highlight="[2,3,4]" }
local reflectX, reflectY = physics.reflectRay( startX, startY, hitFirst )
local reflectLen = 1600
local reflectEndX = ( hitX + ( reflectX * reflectLen ) )
local reflectEndY = ( hitY + ( reflectY * reflectLen ) )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

In this example, we use `1600` for the reflected vector length, but it can be set to whatever you need. In fact, this value is somewhat arbitrary and, unless you have some specific need to limit the reflected ray's length, it's usually best to set this length to a value much greater than the distance it may travel before hitting another object.

</div>

Using this new information, we can call the `castRay()` function again (after&nbsp;a very small delay of 40&nbsp;milliseconds) to draw a new set of lines from the hit point to the next destination point:

``````{ brush="lua" gutter="false" first-line="1" highlight="[6,7,8,9]" }
local reflectX, reflectY = physics.reflectRay( startX, startY, hitFirst )
local reflectLen = 1600
local reflectEndX = ( hitX + ( reflectX * reflectLen ) )
local reflectEndY = ( hitY + ( reflectY * reflectLen ) )

-- If the ray is reflected, cast another ray
if ( reflectX and reflectY ) then
    timer.performWithDelay( 40, function() castRay( hitX, hitY, reflectEndX, reflectEndY ); end )
end
``````


## Terminating the Process

In the demo project, inside the `castRay()` function, inspect the following line:

``````lua
if ( hits and beamGroup.numChildren <= maxBeams ) then
``````

Basically, this conditional check ensures that the `castRay()` function only repeats until there are no more hits __or__ when the `maxBeams` value is reached. This is useful for stopping the reflection process when a particular beam begins to bounce directly back and forth between two surfaces in such a similar pattern that it could repeat almost indefinitely.

When either condition is satisfied and the process is terminated, we draw one final beam, then we call a basic transition to fade out the parent display group:

``````lua
-- Draw the final beam
drawBeam( startX, startY, endX, endY )

-- Fade out entire beam group after a short delay
transition.to( beamGroup, { time=800, delay=400, alpha=0, onComplete=resetBeams } )
``````

Upon completion of the transition, we call the `resetBeams()` function which clears/resets the group:

``````lua
local function resetBeams()

    -- Clear all beams/bursts from display
    for i = beamGroup.numChildren,1,-1 do
        local child = beamGroup[i]
        display.remove( child )
        child = nil
    end

    -- Reset beam group alpha
    beamGroup.alpha = 1

    -- Restart turret rotating after firing is finished
    turret.angularVelocity = turretSpeed
end
``````

This essentially completes the demo walkthrough&nbsp;&mdash; on a repeating timer, a ray cast is made from the turret and a set of laser lines is drawn. If the ray hits another object in the physics world, the ray's reflection is calculated and extruded to another point. Based on that data, another ray cast is performed and the process continues until there are either no more hits __or__ the beam threshold is reached.


## Conclusion

As you can see, ray casting can be a useful addition to your physics toolset. From querying the physics world to calculating a potential path of a moving object, ray casting is fast, simple, and can be accomplished in just a few lines of code.


