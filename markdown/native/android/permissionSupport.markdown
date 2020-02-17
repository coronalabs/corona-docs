# Android Runtime Permission Support

This guide explains how to add support for Android Runtime Permissions in apps/plugins built with CORONA_NATIVE_PRODUCT.

<div class="guides-toc">

* [About Android Runtime Permissions](#about)
* [Targeting Android 6.0](#android-6-0)
* [Declaring Permissions](#declaring)
* [Extended Permission APIs](#extended)
* [Checking for Permissions](#checking)
* [Permission States](#states)
* [Requesting Permissions](#requesting)
* [Complete Example](#complete-example)

</div>


<a id="about"></a>

## About Android Runtime Permissions

When an Android application runs on a device, the operating system provides only limited access to resources. Before your application (or&nbsp;plugin) can make use of restricted resources, you must declare your intent to use them. This is done by editing your `AndroidManifest.xml` or by specifying the permissions in `metadata.lua`. See [Declaring Permissions](#declaring-permissions) for more information.

For apps running on __Android&nbsp;5.1__ or lower, the `AndroidManifest.xml` file is the sole decider for what permissions are allowed, since the user approves of them when installing the app.

For apps running on __Android&nbsp;6.0__ or newer, the app can't reliably assume that it has access to [dangerous permissions](http://developer.android.com/guide/topics/security/permissions.html#permission-groups).

Permissions __not__ defined in the [dangerous permissions](http://developer.android.com/guide/topics/security/permissions.html#permission-groups) table do not need to be handled at runtime, but they still need to be [declared](#declaring-permissions). Essentially, this means that an app/plugin can't always assume that it has the required permissions, so it must gracefully handle the user's rights. This guide covers how you can check for the state of permissions, request permissions, and handle the results.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Recap</div>

* If the device is running __Android 5.1__ or lower, permissions are granted on app install. No runtime checks need to be performed.

* If the device is running __Android 6.0__ or newer, [dangerous permissions](http://developer.android.com/guide/topics/security/permissions.html#permission-groups) are requested at runtime. This requires that both the developer and the end user consider whether the permission should be granted.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The Corona [Camera](https://github.com/coronalabs/samples-coronasdk/blob/master/Media/Camera/main.lua) sample exhibits how `media.hasSource( media.Camera )` has been modified to report more information back to the user and how your project should take that information into account.

</div>




<a id="android-6-0"></a>

## Targeting Android 6.0

To begin supporting and testing runtime permissions, you must first target Android&nbsp;6.0. Simply change a number to `23` in a few places within the project ([API Level 23](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#ApiLevels) corresponds with Android&nbsp;6.0).

1. `AndroidManifest.xml` &mdash; Change `android:targetSdkVersion="xx"` to `android:targetSdkVersion="23"`. This will allow you to test your changes in the local project.

2. `project.properties` &mdash;  Change <nobr>`target=Google Inc.:Google APIs:xx`</nobr> to <nobr>`target=Google Inc.:Google APIs:23`</nobr>. Like above, this is for testing your changes.

3. `project.plugin.properties` &mdash; For <nobr>natively-developed</nobr> plugins, change the line `target=android-xx` to `target=android-23`. This change will affect the plugin itself.




<a id="declaring"></a>

## Declaring Permissions

Once it has been determined which permissions the app/plugin requires, declaration is handled as follows:

* If you are developing a native plugin, you must declare permissions within `metadata.lua`. This ensures that the permissions are automatically imported for CORONA_CORE_PRODUCT users.

    For example, if the `android.permission.SEND_SMS` permission is required, the `usesPermissions` table must contain it like this:

<div class="code-indent">

``````lua
local metadata =
{
	plugin =
	{
		manifest =
		{
			usesPermissions =
			{
				"android.permission.SEND_SMS",
			},
		},
	},
}
return metadata
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

In addition, for CORONA_NATIVE_PRODUCT developers, you should communicate that these permissions must be explicitly added to their `AndroidManifest.xml` file <nobr>(see next point)</nobr>. 

</div>
</div>

* CORONA_NATIVE_PRODUCT users must add permissions to `AndroidManifest.xml` explicitly.

    For example, if the `android.permission.SEND_SMS` permission is required, the `AndroidManifest.xml` must contain it like this:

<div class="code-indent">

``````xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.snazzyapp">

	<uses-permission android:name="android.permission.SEND_SMS"/>

</manifest>
``````

</div>




<a id="extended"></a>

## Extended Permission APIs

Supporting runtime permissions in Corona is very similar to supporting them in native Android apps. This guide is intended as a supplement to Google's [Requesting Permissions at Run Time](http://developer.android.com/training/permissions/requesting.html) guide and follows along in parallel with it.

In Corona, we have provided an interface for developers to handle their permission requests without having to worry about API Levels or [permission leak](https://www.owasp.org/images/c/ca/ASDC12-An_InDepth_Introduction_to_the_Android_Permissions_Modeland_How_to_Secure_MultiComponent_Applications.pdf#page=11).

The majority of the functionality you'll need comes from our `com.ansca.corona.permissions.PermissionsServices` class. This provides several APIs intended to bridge Google's permission handling with the <nobr>cross-platform</nobr> manner that Corona handles permissions. It also provides <nobr>easy-to-use</nobr> APIs for gathering information about the state of the `AndroidManifest.xml` file, as well as the state of various permissions.

See [Checking for Permissions](#permission-checking) and [Requesting Permissions](#permission-requesting) below for details.




<a id="checking"></a>

## Checking for Permissions

This can be done via Google's [context.checkSelfPermission()](http://developer.android.com/reference/android/content/Context.html#checkSelfPermission%28java.lang.String%29) API, however it's only available in API Level 23, it doesn't protect against [permission leak](https://www.owasp.org/images/c/ca/ASDC12-An_InDepth_Introduction_to_the_Android_Permissions_Modeland_How_to_Secure_MultiComponent_Applications.pdf#page=11), and it ignores instances when a permission is not listed in `AndroidManifest.xml`. Instead, we recommend checking for permissions using Corona's `PermissionsServices.getPermissionStateFor()`<!-- (TODO: LINK) --> API. This provides the state of a permission on all supported Android versions and can also determine if the desired permission is missing from `AndroidManifest.xml`.

``````java
// Determine the PermissionState for the our ability to send SMS messages.
PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
PermissionState sendSMSState = permissionsServices.getPermissionStateFor(PermissionsServices.Permission.SEND_SMS);
``````

Here, we use a `PermissionsServices` instance to query the state of the `SEND.SMS` permission. If we get `PermissionState.GRANTED` back, we know that we're able to continue to call code which requires this permission.




<a id="states"></a>

## Permission States

`PermissionsServices.getPermissionStateFor()` returns a `PermissionState` enum with one of the following values. It's important that your app/plugin can handle each one of these possible permission states without crashing or getting into a bad state.

### PermissionState.GRANTED

This permission has been granted by the user. Corresponds to Google's `android.content.pm.PackageManager.PERMISSION_GRANTED`. When a permission is in this state, you're permitted to do whatever necessary that requires the permission.

### PermissionState.MISSING

This permission isn't listed in the app's `AndroidManifest.xml` file. If a permission is in this state, one of the following scenarios may apply:

* For native plugins, `metadata.lua` may not have specified the permission as being required.
* The permission was intentionally omitted because because it shouldn't be used.

The context in which you handle `PermissionState.MISSING` depends on whether the specific permission is mandatory for core functionality or whether it's merely associated with a <nobr>non-critical</nobr> feature. For example, a QR&nbsp;scanner plugin absolutely requires the `Camera` permission to function and, if the `Camera` permission state is `PermissionState.MISSING`, you should alert the developer that they must add this to their `AndroidManifest.xml` file. Corona's `PermissionsServices.showMissingFromManifestAlert()` API makes this easy:

``````java
// Display a "missing from manifest" alert
PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
permissionsServices.showPermissionMissingFromManifestAlert(PermissionsServices.Permission.CAMERA, "The <Super Cool QR Scanner Plugin> requires access to the device's camera(s)!");
``````

### PermissionState.DENIED

This permission has either been explicitly denied, or has not yet been requested. Corresponds to Google's `android.content.pm.PackageManager.PERMISSION_DENIED`.

If a permission is in this state, it means that the permission is specified in the project's `AndroidManifest.xml` file, but the Android&nbsp;OS has denied the app access to it. At this point, you should check whether the user still wants requests for the permission via `PermissionsServices.shouldNeverAskAgain()` <!-- TODO: LINK -->. Assuming the user still wants requests for this permission, the app should now [request access](#permission-requesting) to the denied permission.

``````java
// Request permission to use external storage
PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
if (!permissionsServices.shouldNeverAskAgain(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE)) {
	// Request Write External Storage permission. We cover how to do this in the section below
}
``````

When everything is put together, the code to check for a permission state and handle all possible outcomes will typically contain this template:

``````java
// Only do our dangerous work if we have permission to use external storage
PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
PermissionState writeExternalStoragePermissionState = permissionsServices.getPermissionStateFor(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE);
switch(writeExternalStoragePermissionState) {
	case MISSING:
		// The Corona developer forgot or refused to add the permission to the AndroidManifest.xml
		break;
	case DENIED:
		// Check PermissionsServices.shouldNeverAskAgain() and try to request permission
		break;
	default:
		// Permission is granted; continue as usual
		doDangerousWork();
}
``````




<a id="requesting"></a>

## Requesting Permissions

Now that you know how to determine the state of a permission, you'll need to request required permissions using `permissionsServices.requestPermissions()`. Read further to learn about `PermissionsSettings` and `OnRequestPermissionsHandler`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Calling `PermissionsServices.requestPermissions()` is asynchronous and it will temporarily suspend the user's application while presenting the permission UI to the user. The response will be on the main UI thread, not on the Lua thread. Be sure to use a `CoronaRuntimeTaskDispatcher` if necessary.

</div>

### Using Permissions Settings

A `PermissionsSettings` object is used to define the permissions you want to request. For example, you can request a single permission:

``````java
// Define that we will request permission to write to external storage
PermissionsSettings settings = new PermissionsSettings(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE);

PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
permissionsServices.requestPermissions(settings, MyOnRequestPermissionsHandler);
``````

Or, you can request multiple permissions:

``````java
// Define that we will request permission to write to external storage and access the camera
PermissionsSettings settings = new PermissionsSettings(new String[] {PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE, PermissionsServices.Permission.CAMERA});

PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
permissionsServices.requestPermissions(settings, MyOnRequestPermissionsHandler);
``````

In both of these examples, `MyOnRequestPermissionsHandler` is an implementation of the `OnRequestPermissionsHandler`. Learn more about this in the next section.

### Request Permissions Handler

As `PermissionsServices.requestPermissions()` is asynchronous, a callback is required to indicate when the user has finished denying or granting the requested permissions. This is done through the `CoronaActivity.OnRequestPermissionsResultHandler` interface. When the user is finished, the `onHandleRequestPermissionsResult` method from this interface will be called.

Here is a basic implementation:

``````java
private class MyRequestPermissionsResultHandler implements CoronaActivity.OnRequestPermissionsResultHandler {
	@Override
	public void onHandleRequestPermissionsResult(CoronaActivity activity, int requestCode, String[] permissions, int[] grantResults) {
		// Clean up and unregister our request (you should always do this)
		PermissionsSettings permissionsSettings = activity.unregisterRequestPermissionsResultHandler(this);
		if (permissionsSettings != null) {
			permissionsSettings.markAsServiced();
		}

		// Use PermissionServices to ensure that we have permission to write to external storage
		PermissionsServices permissionsServices = new PermissionsServices(activity);
		if (permissionsServices.getPermissionStateFor(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE) == PermissionState.GRANTED) {
			// Handle the case where our permission was granted
		} else {
			// Handle the case where our permissions were not granted
		}
	}
}
``````

You can then use the `OnRequestPermissionsResultHandler` as follows:

``````java
PermissionsSettings settings = new PermissionsSettings(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE);
MyRequestPermissionsResultHandler handler = new MyRequestPermissionsResultHandler()

PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
permissionsServices.requestPermissions(settings, handler);
``````




<a id="complete-example"></a>

## Complete Example

Putting this together, we can write a class that implements `CoronaActivity.OnRequestPermissionsResultHandler` and handles permissions for us. The implementation may look like this:

``````java
private class MyFileIOFunctionRequestPermissionsResultHandler implements CoronaActivity.OnRequestPermissionsResultHandler {
	public void handleRun() {
		// Check for WRITE_EXTERNAL_STORAGE permission
		PermissionsServices permissionsServices = new PermissionsServices(CoronaEnvironment.getApplicationContext());
		PermissionState writeExternalStoragePermissionState = permissionsServices.getPermissionStateFor(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE);
		switch(writeExternalStoragePermissionState) {
			case MISSING:
				// The Corona developer didn't add the permission to the AndroidManifest.xml
				// As it is required for our app to function, we'll error out here
				// If the permission were not critical, we could work around it here
				permissionsServices.showPermissionMissingFromManifestAlert(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE, "My plugin requires access to the device's storage!");
				break;
			case DENIED:
				if (!permissionsServices.shouldNeverAskAgain(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE)) {
					// Create our Permissions Settings to compare against in the handler
					PermissionsSettings settings = new PermissionsSettings(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE);

					// Request Write External Storage permission
					permissionsServices.requestPermissions(settings, this);
				}
				break;
			default:
				// Permission is granted!
				run();
		}
	}

	@Override
	public void onHandleRequestPermissionsResult(CoronaActivity activity, int requestCode, String[] permissions, int[] grantResults) {
		// Clean up and unregister our request (you should always do this)
		PermissionsSettings permissionsSettings = activity.unregisterRequestPermissionsResultHandler(this);
		if (permissionsSettings != null) {
			permissionsSettings.markAsServiced();
		}

		// Check for WRITE_EXTERNAL_STORAGE permission
		PermissionsServices permissionsServices = new PermissionsServices(activity);
		if (permissionsServices.getPermissionStateFor(PermissionsServices.Permission.WRITE_EXTERNAL_STORAGE) == PermissionState.GRANTED) {
			run();
		} else {
			// We were denied permission
		}
	}

	public void run() {
		// We are sure we have the required permissions; write to storage!
	}
``````

We'd move our dangerous code into the `run()` function above. The exposed Lua function may then look like this:

``````java
private class MyFileIOFunction implements NamedJavaFunction {
	@Override
	public String getName() {
		// e.g. "myPlugin.doSomethingWithExternalStorage()"
		return "doSomethingWithExternalStorage";
	}

	@Override
	public int invoke(LuaState L) {
		// NOTE: RequestPermissionsResultHandlers are NOT guaranteed to be synchronous. Here we have two different behaviors:
		// 1) If the permission is already granted, or we are on Android version < 6.0, we return immediately on the lua
		//    thread with no interruption
		// 2) If the permission needs the user to approve it (Android 6.0+), we wait and handle the request later; this must
		//    be dispatched to run on the lua thread, not the main or UI thread
		// Be sure to use a CoronaRuntimeTask if needed!
		MyFileIOFunctionRequestPermissionsResultHandler resultHandler = new MyFileIOFunctionRequestPermissionsResultHandler(L);
		resultHandler.handleRun();
		return 0;
	}
}
``````

It's important to note that the `OnRequestPermissionsResultHandler` is __not__ guaranteed to be synchronous. Checking the code above, we see that there are two different ways to call `run()`:

1. We already have the permission granted (perhaps because we're not on Android&nbsp;6.0+ and we simply defined the permission in `AndroidManifest.xml`). In this case, we call `run()` from the Lua thread, synchronously.

2. The app does not have permission, so we request permission. This causes the app to suspend, displaying a UI prompting the user to accept or deny the permission request. The result of this interaction is sent to `OnRequestPermissionsResultHandler.onHandleRequestPermissionsResult()` on the main UI thread. A `CoronaRuntimeTaskDispatcher` should be used to ensure that we interact with Lua at the proper time (see&nbsp;below).

``````java
private void run() {
	// This function can be called from either the main thread, or the Lua thread; safely dispatch it
	// Note that we'll need to store the lua state we want to dispatch to elsewhere
	final CoronaRuntimeTaskDispatcher dispatcher = new CoronaRuntimeTaskDispatcher(fLuaState);
	dispatcher.send( new CoronaRuntimeTask() {
			@Override
			public void executeUsing(CoronaRuntime runtime) {
				LuaState L = runtime.getLuaState();

				// ...
			}
		} );
``````
