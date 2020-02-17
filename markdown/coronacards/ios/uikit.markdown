# CoronaCards — iOS

## Obj-C/UIKit Integration

CoronaCards provides two classes for your usage: `CoronaView` and `CoronaViewController`. This guide explains how to integrate these within a native iOS project.

### CoronaView

The `CoronaView` class is a subclass of the `UIView`/`GLKView` class. If you're using the Xcode&nbsp;Storyboard / Interface&nbsp;Builder, you need to override `UIView` with `CoronaView`. This allows you to create a <nobr>full-screen</nobr> CoronaCards app within a Single&nbsp;View&nbsp;Application project.

### CoronaViewController

The `CoronaViewController` is a subclass of the `UIViewController`/`GLKViewController` class. If you're building a <nobr>multi-view</nobr> app, you can programmatically make the `CoronaView` a child view. Typically, you instantiate a `CoronaViewController` when it's not the root controller, for example when the `CoronaViewController` is a child of another controller.

When creating a `CoronaViewController` as a child controller, you must override the `viewDidLoad` method of the parent controller via the following steps:

1. Instantiate the `CoronaViewController` and ensure that it exists for the lifetime of the `CoronaView`. In the example below, `coronaController` is a property of the parent controller that implicitly retains upon assignment.

2. Add the `CoronaViewController` as a child controller of the parent. This ensures that notifications from the parent controller are propagated to the `CoronaViewController`, for example when the parent view appears or disappears.

3. Size the `CoronaView`. When this view is loaded programmatically, it defaults to the size of the screen.

4. Add the `CoronaView` as a child view of the parent controller's view.

5. Tell `CoronaView` which `main.lua` file to run. In the example below, we run the `main.lua` that is present at the root of the `.app` bundle. However, you can choose an arbitrary `main.lua` file by calling `runWithPath:parameters:` instead.

``````c
// This method belongs to the parent UIViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.coronaController = [[[CoronaViewController alloc] init] autorelease];  // (Step 1)
	[self addChildViewController:self.coronaController];  // (Step 2)

	CoronaView *coronaView = (CoronaView *)self.coronaController.view;

	// Same size as parent view
	coronaView.frame = self.view.frame;  // (Step 3)

	[self.view addSubview:coronaView];  // (Step 4)

	[coronaView run];  // (Step 5)
}
``````

### Transparent Overlays

In iOS, a `CoronaView` can have a transparent background. To accomplish this, two things are required:

1. Instruct iOS to enable transparency in the `UIView` itself:

<div class="code-indent">

``````
// [Obj-C]
coronaView.backgroundColor = [UIColor clearColor];
coronaView.opaque = NO;
``````

</div>

2. Tell Corona to utilize an transparent OpenGL surface by setting the `alpha` key to `0`:

<div class="code-indent">

``````lua
-- [Lua]
display.setDefault( "background", 0, 0, 0, 0 )
``````

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Xcode Project Setup][coronacards.ios.setup] _|_ [Native/Lua Communication][coronacards.ios.communication] __&rang;__

</div>
