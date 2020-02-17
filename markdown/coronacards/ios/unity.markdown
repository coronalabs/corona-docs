# CoronaCards: Unity Integration — iOS

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          CoronaCards, iOS, Unity
> __See also__          [Xcode Project Setup — iOS][coronacards.ios.setup]
>                       [Native/Lua Communication — iOS][coronacards.ios.communication]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This guide explains how to integrate CoronaCards within a Unity project for iOS.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This process has been tested with Unity 4.3, but the same general integration should work with earlier versions.
* Unity is a trademark of Unity Technologies and is in no way associated or affiliated with Corona Labs.

</div>


## Xcode Project Setup

Please refer to [Xcode Project Setup — iOS][coronacards.ios.setup]


## Integrating CoronaCards

Basic integration of CoronaCards within Unity can be achieved by modifying the `UnityViewController` that is generated from the Unity project. This `UnityViewController` becomes the root controller upon which the `CoronaViewController` will overlay.

##### Example

To add the `CoronaViewController` and `CoronaView` to the view controller hierarchy, add a member in `UnityAppController.h` via the process outlined below. In this example, we'll add a simple Corona project to the native Xcode Unity project, set to run as an overlay.

1. Add the following line to the `UnityAppController` interface:

<div class="image-indent">

``````
CoronaViewController* _coronaController;
``````

</div>

2. Add the following code at the end of the `createViewHierarchy` method in `UnityAppController.mm`:

<div class="image-indent">

``````c
- (void)createViewHierarchy
{
	//Unity Specific code
	//...
	//...
	//...

	//CoronaCards code
	_coronaController = [[[CoronaViewController alloc] init] autorelease];
	[_rootController addChildViewController:_coronaController];

	CoronaView *coronaView = (CoronaView *)_coronaController.view;

	//Define the region for CoronaCards - example is 100X100
	CGRect rect = CGRectMake(0,0,100,100);
	
	coronaView.frame = rect;
	
	[_rootView addSubview:coronaView];

	// Transparent background
	coronaView.backgroundColor = [UIColor clearColor];
	coronaView.opaque = NO;

	[coronaView run];
}
``````

</div>

3. Add the following code to the beginning of the repaint method in `UnityAppController.mm`:

<div class="image-indent">

``````
- (void)repaint
{
	//Added for OpenGL context
	[EAGLContext setCurrentContext:_mainDisplay->surface.context];

	//Unity Specific code
	//...
	//...
	//...
} 
``````

</div>

### Transparent Views

In iOS, a CoronaView can have transparent backgrounds. To accomplish this, two things are required:

First, instruct iOS to enable transparency in the `UIView` itself:

``````
// [Obj-C]
coronaView.backgroundColor = [UIColor clearColor];
coronaView.opaque = NO;
``````

Second, tell Corona to utilize an transparent OpenGL surface by setting the `alpha` key to `0`:

``````lua
-- [Lua]
display.setDefault( "background", 0, 0, 0, 0 )
``````


## Native/Lua Communication

Once integrated, a Corona-based view can communicate with the native app and <nobr>vice-versa.</nobr> Learn more in the <nobr>[Native/Lua Communication][coronacards.ios.communication]</nobr> guide.
