# Listener

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Function][api.type.Function]
> __Keywords__          function, listener
> __See also__          [event.*][api.event]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Events][api.event] are dispatched to listeners. Event listeners can be either [functions][api.type.Function] or [table][api.type.Table] objects.

In both cases, when an event occurs, the listener will be invoked and be supplied with a table representing the event. All events have a `name` property that corresponds to the name you use to register the event.

For more information, see the [Basic Interactivity and Event Detection][guide.events.detectEvents] guide.