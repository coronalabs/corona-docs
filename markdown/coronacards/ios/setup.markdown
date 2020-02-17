# CoronaCards &mdash; iOS

## Xcode Project Setup

This guide outlines how to configure CoronaCards for usage with an existing <nobr>iOS-based</nobr> Xcode project.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you're creating a __new__ <nobr>CoronaCards-based</nobr> project, you can use [CoronaCards Xcode project templates](https://github.com/CoronaCards/project-templates-ios). Simply follow the instructions in the `README`.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

In order for any CoronaCards project to work, you must put a valid `license.ccdata` file near `main.lua`, otherwise you'll get a black screen and corresponding error message in the console.

</div>

1. First, link your app to the C++ library. The easiest way is to rename your `main.m` file to `main.mm` within the __Supporting&nbsp;Files__ branch of the Xcode project tree.

2. Include the CoronaCards framework in your project's frameworks by dragging `/Users/Shared/CoronaLabs/ios/CoronaCards.framework` to the __Frameworks__ group in your Xcode project.

    In addition, CoronaCards depends on several other frameworks. These can be added from the __General__ properties view. In this viewport, scroll down to __Linked&nbsp;Frameworks&nbsp;and&nbsp;Libraries__, then press the __+__ button to link the frameworks listed below. Note that `CoronaCards.framework` is already on the list because you copied it to your __Frameworks__ group.

<div class="code-indent">
<div class="inner-table vert-compact">

Framework																&nbsp;
---------------------------------------------------------------------	--------
`AdSupport.framework` (may be skipped if your app doesn't use ads)
`AudioToolbox.framework` &nbsp;
`AVFoundation.framework` &nbsp;
`CFNetwork.framework` &nbsp;
`CoreGraphics.framework` &nbsp;
`CoreLocation.framework` &nbsp;
`CoreMedia.framework` &nbsp;
`CoreMotion.framework` &nbsp;
`CoreVideo.framework` &nbsp;
`Foundation.framework` &nbsp;
`GameController.framework` (with status `optional`)
`GLKit.framework` &nbsp;
`ImageIO.framework` &nbsp;
`MediaPlayer.framework` &nbsp;
`MobileCoreServices.framework` &nbsp;
`OpenAL.framework` &nbsp;
`OpenGLES.framework` &nbsp;
`QuartzCore.framework` &nbsp;
`Security.framework` &nbsp;
`SystemConfiguration.framework` &nbsp;
`UIKit.framework` &nbsp;
---------------------------------------------------------------------	--------

</div>

Also, link the following libraries in the same way:

<div class="inner-table vert-compact">

Library																	&nbsp;
---------------------------------------------------------------------	--------
`libsqlite3` &nbsp;
`libobjc` &nbsp;
---------------------------------------------------------------------	--------

</div>
</div>

3. Click the __Build&nbsp;Settings__ tab to configure build settings. Ensure that the __All__ <nobr>sub-tab</nobr> is selected and then set the following:

<div class="code-indent">
<div class="inner-table">

Section				Setting							Value
------------------	------------------------------	-----------------------------------
Search Paths		Framework Search Paths			`/Users/Shared/CoronaLabs/ios/`
Build Options		Enable Bitcode					No
Deployment			iOS Deployment Target			`iOS 8.0` or higher
Deployment          Strip Style                     Non-Global Symbols
Linking				Other Linker Flags				`-ObjC`
------------------	------------------------------	-----------------------------------

</div>
</div>

4. Lua code and assets for CoronaCards must be copied to the app bundle before deployment, so you must configure the run script. The best method is to create a `Corona` folder in your project via the Finder and place your assets within it. Then, configure a __Run&nbsp;Script&nbsp;Build&nbsp;Phase__ to copy the assets upon building the project:

<div class="code-indent">

* Click on the __Build Phases__ tab.
* From the Xcode main menu, select __Editor__ &rarr; __Add Build Phase__ &rarr; __Add Run Script Build Phase__.
* In the viewport, notice the __Run Script__ entry. Expand this tree if necessary and, in the code editor box just below the input field containing `/bin/sh`, enter these two lines of code:

<div class="image-indent">

``````
echo "Copying Corona assets"
ditto -V $PROJECT_DIR/Corona "$TARGET_BUILD_DIR"/"$EXECUTABLE_FOLDER_PATH"
``````

</div>
</div>


##

<div class="walkthrough-nav">

__&lang;__ [Guide Index][coronacards.ios] _|_ [Obj-C/UIKit Integration][coronacards.ios.uikit] __&rang;__

</div>
