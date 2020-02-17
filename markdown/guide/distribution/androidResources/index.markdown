
# Android Adaptive Icons

This guide discusses implementing __Android&nbsp;Adaptive&nbsp;Icons__ on Android 8 (Oreo) or later.

<div class="guides-toc">
* [Background](#background)
* [AndroidResources Folder](#androidresources)
</div>

<a id="background"></a>

With 64-bit compatible versions of Corona (2019.3492 or later), Android icons are handled in a completely different way, even for version of Android 7 and earlier.

With Android 7 and earlier, Android icons were single layer `.PNG files` that were conveniently named for simplicity and Corona would in the background process them into a way Android would find them. These icons were located in the main project folder alongside `main.lua` and as long as you named them correctly and they were the right size, you didn't have to do much more.

  

Android 8 and later provide a way to have launch icons more flexible. To give device manufacturers more flexibility, Google split the icon into two layers: a background layer and a foreground later. Then the OEM (Original Equipment Manufacturer) provides a mask to make the icons look unique in their system. One maker may provide square icons, while another rounded corners or another circular icons. Using a combination of background, foreground and mask, there can be different looks for different devices, as well as allowing cool animation effects like parallax when dragging icon or tapping on it.

<div style="display:grid;grid-gap:10px;width:80%">
<div style="grid-column:1/2">
![](https://developer.android.com/guide/practices/ui_guidelines/images/NB_Icon_Mask_Shapes_Ext_01.gif)
</div>
<div style="grid-column:2/2">
![](https://developer.android.com/guide/practices/ui_guidelines/images/NB_Icon_Mask_Shapes_Ext_02.gif)
</div>
</div>
  

For more information on this, please see [Adaptive Icons]([https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive))

<a id="androidresources"></a>

Corona has to manage icons based on Android 7 and earlier, and now Android 8 and later. Corona Lab's "Let's do this for you" no longer works. You now have to work with a folder named `AndroidResources`. This is a Corona specific folder that actually holds the icon information in an Android standard way.

Inside the AndroidResources folder will be the standard Android `res` folder. Inside that folder will be several other folders of importance:

* `res/mipmap-anydpi-v26`
* `res/mipmap-*dpi`
* `res/values`

Where `Icon-*dpi.png` will be one of `mipmap-mdpi`, `mipmap-hdpi`, `mipmap-xxxdpi`, etc. based on Android standard screen densities.

To keep your simple, Corona Labs provides example `AndroidResources` folders when you create a new project from the Welcome screen or menu, or you can copy the folder out of a Corona SampleApp. Copy the `AndoidResources` folder from one of these locations to your project in the same folder as `main.lua`. This will get you a base structure to work from.

## Android 7 and earlier

To maintain your icons on Android 7 and earlier follow these steps:

* Copy your `Icon-mdpi.png` file to `AndroidResources/res/mipmap-mdpi` and rename it to `ic_launcher.png`.
* Repeat this process for each of the Android icons (Icon-hdpi.png to `Android-Resources/res/mipmap-hdpi/ic_launcher.png`, etc.

Existing icons should be already sized and formatted for use. All you need to do is to move them into place and name them correctly.

## Android 8 and Later

This requires a little more thought and actions on your part. First, please read the [Android Adaptive Icon Guide](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive)

You may very well need to re-think your apps icon look to make Adaptive icons work for you.

### What are Adaptive Icons

Google, along with device partners wanted to give their device partners more design flexibility. For instance on Google Pixel devices, icons are now round. For other device makers, they may be more of an Apple like rounded-rectangle. Each device maker provides a mask that is overlaid on the icon to give it its shape, for instance on Pixel devices:

![Android adaptive icon layers](https://developer.android.com/guide/practices/ui_guidelines/images/NB_Icon_Layers_3D_03_ext.gif)

The background image is drawn, the foreground image is drawn on top of it and finally the shape mask is applied.

These images are larger than the icons you are used to working with. But it's important to know that the foreground icon needs to be centered, fit in the center 66% of the image, with the rest being transparency.

Your background image will typically be a solid color, or if you have a background image, you have to understand that a good portion of it will be masked out to make these circles, rounded rectangles or other shapes.

Corona's `AndroidResources` folder is setup to give you a working Adaptive Icon setup with minimal work.

This is where the `AndroidResources\res\mipmap-anydpi-v26` and `AndroidResources\res\values` folders come into play. The default setup is to provide a solid color background (no image file needed) and a series of default foreground images. The foreground images, by default are named `ic_launcher_foreground.png`. The combination of this foreground image and a solid color background work well with the mask system used.

Create a foreground image for your icon in the sizes listed below, place them in the appropriate `mipmap-*dpi` folder.

Then to change the background color, open `AndroidResources/res/values/values.xml` with your favorite text editor and change the color to a suitable background color for your icon.

### But I want my own background image

You can do this as well. First create the appropriate .PNG image in the same size as `ic_launcher_foreground.png`,, name it `ic_launcher_background.png` and copy it to the appropriate `res/mipmap-*dpi` folder along side it's foreground image.

Next, edit the `AndroidResources/res/mipmap-anydpi-v26/ic_launcher.xml` file and change the background entry from:
``````
<background android:drawable="@color/ic_launcher_background"/>
``````
to:
``````
<background android:drawable="@mipmap/ic_launcher_background"/>
``````

Afterwards, all of your Android icon resources should be inside the various folders in `AndroidResources/res/`

### Image sizes for various icon images

26 is the API Level of Android 8.0 “Oreo”.

| Folder | Icon Name | Android version | Width | Height |
|----------------|----------------------------|-----------------|-------|--------|
| mipmap-mdpi | ic_launcher.png | < 26 | 48 | 48 |
| | ic_launcher_foreground.png | >= 26 | 108 | 108 |
| | ic_launcher_background.png | >= 26 | 108 | 108 |
| mipmap-hdpi | ic_launcher.png | < 26 | 72 | 72 |
| | ic_launcher_foreground.png | >= 26 | 162 | 162 |
| | ic_launcher_background.png | >= 26 | 162 | 162 |
| mipmap-xhdpi | ic_launcher.png | < 26 | 96 | 96 |
| | ic_launcher_foreground.png | >= 26 | 216 | 216 |
| | ic_launcher_background.png | >= 26 | 216 | 216 |
| mipmap-xxhdpi | ic_launcher.png | < 26 | 144 | 144 |
| | ic_launcher_foreground.png | >= 26 | 324 | 324 |
| | ic_launcher_background.png | >= 26 | 324 | 324 |
| mipmap-xxxhdpi | ic_launcher.png | < 26 | 192 | 192 |
| | ic_launcher_foreground.png | >= 26 | 432 | 432 |
| | ic_launcher_background.png | >= 26 | 432 | 432 |

### Using different tools to create android icons

You can, if you wish us Android Studio to create an image asset, using these names and load in a 512x512 icon foreground and background and have Android Studio create the res folder for you. It however may create excessive files that are not used by Corona and may interfere with the building process. In particular, if it creates a style.xml file, for now, simply delete it.

Again, we recommend the simple process of simply copying the right sized files over top of the `AndroidResources/res` folder that we generate and use a simple color background when possible.

Android platform is extremely powerful, and Adaptive Icons are not limited to the template we provided. For example, you can also use vector images and gradients for icon layers. Don’t be afraid to experiment. Make sure you have valid Android drawable resource `ic_launcher`.
