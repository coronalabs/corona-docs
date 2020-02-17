# CoronaCards — Windows&nbsp;Phone&nbsp;8

## Building for Device or Emulator

This guide outlines how to build a project for a Windows Phone device or the emulator.

### Building for a Windows Phone

1. In Visual Studio, view the __Solution Explorer__ panel.
2. Click the root __Solution__ item in the project tree.
3. In the __Properties__ panel for __Active config__, select either __Debug|ARM__ or __Release|ARM__.
4. Connect a Windows Phone device to your PC via USB.
5. Power on the Windows Phone and unlock the screen.
6. In the upper toolbar, directly to the right of the green arrow (&#9656;), select __Device__ and click to compile/run your application on the device.

<div style="width:90%;">

![][images.simulator.cc-wp8-config2A]

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If the device has not been registered for development, Visual Studio will display a deployment error. To&nbsp;unlock the device for development, run Microsoft's __Windows&nbsp;Phone Developer&nbsp;Registration__ application.

</div>

### Building for the Emulator

1. In Visual Studio, view the __Solution Explorer__ panel.
2. Click the root __Solution__ item in the project tree.
3. In the __Properties__ panel for __Active config__, select either __Debug|x86__, __Release|x86__, __Debug|Mixed&nbsp;Platforms__, or __Release|Mixed&nbsp;Platforms__. Note that the __Mixed&nbsp;Platforms__ options are normally not available unless you add another .NET project to your solution.
4. In the upper toolbar, directly to the right of the green arrow (&#9656;), select one of the __Emulator...__ options and click to run your application in the emulator.

<div class="image-indent" style="width:90%;">

![][images.simulator.cc-wp8-config2B]

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Creating a CoronaCards App][coronacards.wp8.createapp] _|_ [Guide Index][coronacards.wp8]

</div>
