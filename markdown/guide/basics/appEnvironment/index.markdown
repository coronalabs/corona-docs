# Application Environment

Corona automatically adds key infrastructure into your application. This infrastructure handles user input and displays content on the screen for you, but you are responsible for configuring how user input is handled and what content goes on the screen to create the application's user interface, behavior, and features. This guide provides an overview of the <nobr>application-level architecture</nobr>.

<div class="guides-toc">

* [Life Cycle](#lifecycle)
* [Global Runtime Object](#globalruntime)
* [Sandbox](#sandbox)
* [Application Events](#appevents)

</div>



<a id="basicstruct"></a>

## Life Cycle

When your application launches, some initialization work is performed on your behalf. After that, you have the opportunity to do initial setup such as defining functions, registering for events, drawing images, etc. via the code in `main.lua`.

Once the initial setup is complete, the application enters an event/drawing loop in which [events][guide.events.detectEvents] trigger listeners in your code, resulting in changes to the screen. Keep in mind that the screen will not update until your initial setup is complete. Therefore, it is recommended that you "lazily" perform operations.



<a id="globalruntime"></a>

## Global Runtime Object

There is a global object called __Runtime__. This object's principal job is to register events that have no specific target on screen such as `enterFrame` or `system` events. See [Basic Interactivity and Event Detection][guide.events.detectEvents] for more information.




<a id="sandbox"></a>

## Sandbox

For security reasons, your application runs in its own sandbox. This means that your application has limited access to files, memory, network resources, etc. Practically speaking, your files&nbsp;&mdash; application images, data, <nobr>preferences, etc. &mdash;</nobr> are stored in a location that no other application can access. The paths to these files are unique to your application. Corona provides you with APIs to generate these paths. See [here][api.library.system.pathForFile] for more information.




<a id="appevents"></a>

## Application Events

### Termination

Registering the `applicationExit` event allows you to save any unsaved data, save the state of the application, or perform cleanup tasks such as deleting temporary files. See the [system&nbsp;events][api.event.system.type] documentation for more information.

### Interruptions

Your application can be interrupted by a variety of events. For example, your app may be interrupted by a phone call, a message, an alert, or the device going to sleep. Depending on the situation, the interruption may be temporary&nbsp;&mdash; or it may result in termination of the app. Temporary interruptions may affect time-based procedures within the app. To handle these situations, you should listen for the `applicationSuspend` and `applicationResume` events and handle them as needed.
