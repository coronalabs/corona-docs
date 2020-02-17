# Android Studio Integration


## Editing Gradle Scripts

### Plugin Module

1. From the `Project` sidebar in Android&nbsp;Studio, open `LuaLoader.java`. You will see errors about missing libraries:

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-pluginBuild1]

</div>

2. From within the __Gradle&nbsp;Scripts__ tree, open <nobr>`build.gradle` (`Module: plugin`)</nobr>

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-pluginBuild2]

</div>

3. Between the `android` and `dependencies` blocks, add a variable defining where the `CoronaEnterprise` directory is. This variable points to the symbolic link, which points to the real `CoronaEnterprise` directory.

<div class="code-indent">

``````gradle
def coronaEnterpriseDir = "$rootDir/CoronaEnterprise"
``````

</div>

4. Replace everything inside the `dependencies` block with the following lines. These tell Android&nbsp;Studio to look for extra libraries inside CORONA_ENTERPRISE_PRODUCT and inside the `libs` directory of the `plugin` module.

<div class="code-indent">

``````gradle
compile fileTree(dir: "$coronaEnterpriseDir/Corona/android/lib/Corona/libs", include: '*.jar')
compile fileTree(dir: 'libs', include: '*.jar')
``````

</div>

5. Remove the entire `buildTypes` block.

6. To finish the plugin section of `build.gradle`, you need to add an extra task to create a `plugin.library.jar` that can later be submitted to the Corona&nbsp;Marketplace or included in another project. Add this code before the `dependencies` block:

<div class="code-indent">

``````gradle
task exportPluginJar (type: Copy, description: 'place the plugin JAR file in the outputs directory and give it a name from the AndroidManifest.xml') {
	def pluginName = new XmlSlurper().parse(file('src/main/AndroidManifest.xml')).@package.text()
	from "$buildDir/intermediates/bundles/release/"
	into "$buildDir/outputs/jar"
	include 'classes.jar'
	rename 'classes.jar', "${pluginName}.jar"

	doFirst {
		println '== exportPluginJar =='
	}
}

tasks.withType(JavaCompile) {
	compileTask -> compileTask.dependsOn('exportPluginJar')
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The defined task gets the name of the plugin from the `AndroidManifest.xml` file inside the `plugin` module and it creates the `.jar` file (`plugin.library.jar`) inside the `plugin/build/output/jar/` directory after the project has been built.

</div>
</div>

7. Click the __Sync&nbsp;Now__ button in the <nobr>upper-right</nobr> corner. Your `build.gradle` for the plugin should now look like this (and&nbsp;`LuaLoader.java` should not have import&nbsp;errors):

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-pluginBuild3]

</div>

8. At this point, you can close this `build.gradle` and proceed to the next section. You can also fix the JavaDocs and remove unused imports so Android&nbsp;Studio will stop complaining about them in `LuaLoader.java`.

<div class="code-indent">
<div class="guide-notebox" style="margin-bottom: 30px;">
<div class="notebox-title">Notes</div>

* If your plugin has additional dependencies, they should be added inside the `dependencies` block of <nobr>`build.gradle` (`Module: plugin`)</nobr>. You can also put <nobr>stand-alone</nobr> `.jar` libraries inside `plugin/libs/` or `app/libs/`.

* If your Enterprise project does not use a separate plugin module, be sure that the CORONA_ENTERPRISE_PRODUCT libraries are compiled into you main app module by adding this line to the `dependencies` block of your main app module:

    <div style="margin-top: 12px; margin-bottom: 8px;">

    `compile fileTree(dir: "$coronaEnterpriseDir/Corona/android/lib/Corona/libs", include: '*.jar')`

    </div>

* In `build.gradle` files, you must always check what versions of Android tools, Android&nbsp;APIs, and other libraries are used. Android&nbsp;SDK evolves and these version numbers will increase. Note that some plugins may require older versions of specific libraries as they might be incompatible with new ones. Thus, you should always take proper care of versions.

</div>
</div>


### App Module

1. From within the __Gradle&nbsp;Scripts__ tree, open <nobr>`build.gradle` (`Module: app`)</nobr>

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-appBuild1]

</div>

2. Remove the entire `buildTypes` block.

3. Now you must modify this script to make a healthy `.apk` on build. In the `dependencies` block, remove the `junit` line and add the following line. This tells Android&nbsp;Studio to compile the `plugin` module first and include it into the `.apk`.

<div class="code-indent">

``````gradle
compile project(':plugin')
``````

</div>
<div class="image-indent" style="width:90%;">

![][images.enterprise.as-appBuild2]

</div>

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you have a plugin module, compile it into your app with <nobr>`compile project(':plugin')`</nobr>. Otherwise, ensure that Corona's Java binaries are included in your app module via the following (we'll&nbsp;define `$coronaEnterpriseAndroidLibDir` in the next&nbsp;step).

`compile fileTree(dir: "$coronaEnterpriseAndroidLibDir/libs", include: '*.jar')`

</div>
</div>

4. Now add the following variable definitions before the `android` block. The first two extract the application name and `.apk` filenames from the `AndroidManifest.xml` file, while the last six define the locations of various project and CORONA_ENTERPRISE_PRODUCT directories needed to build the project correctly.

<div class="code-indent">

``````gradle
// Application name variables
def appName = new XmlSlurper().parse(file('src/main/AndroidManifest.xml')).@package.text()
def apkName = appName.toString().split('\\.').last()

// Paths used throughout the build process
def coronaEnterpriseDir = "$rootDir/CoronaEnterprise"
def assetsDir = "$projectDir/src/main/assets"
def jniLibsDir = "$projectDir/src/main/jniLibs"
def coronaEnterpriseMacBinDir = "$coronaEnterpriseDir/Corona/mac/bin"
def coronaEnterpriseSharedDir = "$coronaEnterpriseDir/Corona/shared"
def coronaEnterpriseAndroidLibDir = "$coronaEnterpriseDir/Corona/android/lib/Corona"
``````

</div>
<div class="image-indent" style="width:90%;">

![][images.enterprise.as-appBuild3]

</div>

5. Now, before the `dependencies` block, we begin adding all of the crucial tasks for building the `.apk`. First, add the `cleanAssets` task below.

<div class="code-indent">

``````gradle
task cleanAssets(type: Delete, description: 'remove Corona assets and libcorona.so') {
    delete "$assetsDir"
    delete "$jniLibsDir"

    doFirst {
        println "== cleanAssets =="
    }

    doLast {
        new File("$assetsDir").mkdirs()
    }
}
``````

</div>

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

The `cleanAssets` task cleans up the files that are created during execution of the tasks which follow. This needs to be executed every time so that updates to your lua project can be picked up and resigning of the app can occur.

</div>
</div>

6. With the ability to clean the Corona-specific portions of the project, now add the `compileLua` task below.

<div class="code-indent">

``````gradle
task compileLua(type: Exec, description: 'compile Lua source code') {
    executable = "$coronaEnterpriseMacBinDir/lua"
    workingDir = "$coronaEnterpriseMacBinDir"
    args = [
            '-e',
            "package.path='$coronaEnterpriseSharedDir/bin/?.lua;$coronaEnterpriseSharedDir/bin/?/init.lua;'..package.path",
            "$coronaEnterpriseSharedDir/bin/Compile.lua",
            'mac',
            "$coronaEnterpriseDir"
    ]

    environment = [
            LUA_CPATH                   : "$coronaEnterpriseMacBinDir/?.so",
            TARGET_PLATFORM             : 'android',
            PROJECT_DIR                 : "$rootDir",
            CORONA_COPY_PNG_PRESERVE    : '--preserve',
            CONFIGURATION               : 'release',
            CORONA_ASSETS_DIR           : "[RELATIVE_PATH_TO_CORONA_PROJECT]",  // Default is: "$rootDir/../Corona"
            CORONA_TARGET_RESOURCES_DIR : "$assetsDir",
            CORONA_TARGET_EXECUTABLE_DIR: "$assetsDir"
    ]

    dependsOn 'cleanAssets'

    doFirst {
        println '== compileLua =='
    }
}
``````

</div>

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

The `compileLua` task compiles your Lua source code from the `Corona` directory into bytecode stored inside the `resources.car` file. It also places all other assets from that directory into the `app/src/main/assets/` directory so they get bundled into the `.apk`.

</div>
</div>

7. Now that the script can compile your Lua code, add the two copy tasks below.

<div class="code-indent">

``````gradle
task copyCoronaResources(type: Copy, description: 'include resources') {
    from fileTree(dir: "$coronaEnterpriseAndroidLibDir/res", include: '**/*')
    into "$projectDir/src/main/res"

    dependsOn 'compileLua'

    doFirst {
        println '== copyCoronaResources =='
    }
}

task copyCoronaNativeLibs(type: Copy, description: 'include precompiled libraries') {
    from fileTree(dir: "$coronaEnterpriseAndroidLibDir/libs", include: '**/*.so')
    into "$jniLibsDir"

    dependsOn 'copyCoronaResources'

    doFirst {
        println '== copyCoronaNativeLibs =='
    }
}
``````

</div>

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The `copyCoronaResources` task takes Android resource files from CORONA_ENTERPRISE_PRODUCT (widgets&nbsp;and image sheets for&nbsp;example) and copies them to the `app/src/main/res/` directory so they also end up inside the `.apk`.

* The `copyCoronaNativeLibs` task takes `.so` libraries from CORONA_ENTERPRISE_PRODUCT and copies them into the project's `app/src/main/jniLibs` directory. Unlike Ant build where `.jar` and `.so` files would sit in the same root `libs` directory, Android Studio expects `.so` files in the `app/src/main/jniLibs` directory for inclusion inside the `.apk`.

</div>
</div>

8. Since all the Corona assets and libraries are in place, now we add a task to sign the build defined below.

<div class="code-indent">

``````gradle
task certifyBuild(type: Exec, description: 'certify libcorona.so with resource.car hash and developerkey.cert') {
    executable = "$coronaEnterpriseMacBinDir/CoronaBuilder.app/Contents/MacOS/CoronaBuilder"
    workingDir = "$coronaEnterpriseMacBinDir"
    args = [
            'app_sign',
            'sign',
            "$coronaEnterpriseSharedDir/resource/developerkey.cert",
            "$assetsDir/resource.car",
            "$jniLibsDir/armeabi-v7a/libcorona.so",
            'little'
    ]

    dependsOn 'copyCoronaNativeLibs'

    doFirst {
        println '== certifyBuild =='
    }
}
``````

</div>

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

The `certifyBuild` task digitally signs `libcorona.so` <nobr>(inside `app/src/main/jniLibs`)</nobr> with a fingerprint generated from the `resources.car` file. Without this task, the Corona application will fail to start on the device and yield a message about not being able to find/load `main.lua`.

</div>
</div>

9. To kick off all the tasks we've added, we need to make them all dependent on the standard Android build process. This is done by adding a `dependsOn` to the standard pre-build tasks shown below.

<div class="code-indent">

``````gradle
tasks.preBuild.dependsOn('certifyBuild')
``````

</div>

<!---

Once completed, your <nobr>`build.gradle` (`Module: app`)</nobr> should look like this.

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-appBuild4]

![][images.enterprise.as-appBuild5]

![][images.enterprise.as-appBuild6]

</div>

-->

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

You will notice that all tasks are executed in order defined by a `dependsOn` directive. You also tell Android&nbsp;Studio that its first task (`preBuild`) should also depend on them with this line:

<div style="margin-top: 12px; margin-bottom: 8px;">

`tasks.preBuild.dependsOn('certifyBuild')`

</div>

If you update CORONA_ENTERPRISE_PRODUCT, these tasks will pick up the most recent files the next time you build the project, making the update process painless.

</div>
</div>

10. For release builds, place your keystore file into the `[PATH_TO_PROJECT_TEMPLATE]/App/android/` directory and add the following `signingConfigs` block inside the `android` block, directly before the `defaultConfig` block. If you need assistance on creating a keystore, please see the [Signing and Building &mdash; Android][guide.distribution.androidBuild] guide.

<div class="code-indent">

``````gradle
signingConfigs {
	release {
		storeFile file("$rootDir/apptemplate.keystore")
		storePassword 'apptemplate'
		keyAlias 'apptemplate'
		keyPassword 'apptemplate'
	}
}
``````

</div>

11. Within the `android` block, replace the `applicationId` value in the `defaultConfig` block with `"$appName"`. Additionally, add this line at the bottom of the `defaultConfig` block:

<div class="code-indent">

``````gradle
signingConfig signingConfigs.release
``````

</div>

12. Finally, for the `.apk` file to be properly named, add this code at the end of the `android` block, directly following the `defaultConfig` block:

<div class="code-indent">

``````gradle
applicationVariants.all { variant ->
	variant.outputs.each { output ->
		output.outputFile = file(output.outputFile.getPath().replace('/app-', "/${apkName}-"))
	}
}
``````

</div>
<div class="image-indent" style="width:90%;">

![][images.enterprise.as-appBuild7]

</div>

13. Click the __Sync&nbsp;Now__ button in the <nobr>upper-right</nobr> corner. Once this finishes and there are no errors to resolve, you can close this `build.gradle`.


##

<div class="walkthrough-nav">

__&lang;__ [Setup and Configuration][native.android.androidStudio.setup] _|_ [Editing the Manifest][native.android.androidStudio.manifest] __&rang;__

</div>
