# Changelog
##### 2015-09-01  Nanda Kumar
 * Revert back the NEON optimization changes

##### 2015-08-27  Nanda Kumar
 * Second pass at removing NEON optimisations from Android armv7 lib

##### 2015-08-26  Nanda Kumar
 * Deploying corona plugin without NEON optimisation

##### 2015-08-18  Nanda Kumar
 * Removed cacert.pem from data/certificates

##### 2015-08-18  Nanda Kumar
 * Support to make the plugin work with Android expansion files

##### 2015-08-18  Nanda Kumar
 * Added cacert.pem under resources/assets to test if it works with expansion files on Android

##### 2015-08-18  Jarmo Kauko
 * Reverted previous deployment

##### 2015-08-18  Nanda Kumar
 * Test Deployment to check how corona handles assets in Android expansion files

##### 2015-06-24  Jarmo Kauko
 * Build new version of the iOS plugin with limited ad providers

##### 2015-06-17  Jarmo Kauko
 * New version of the OSX plugin

##### 2015-06-17  Jarmo Kauko
 * New version of the android plugin

##### 2015-06-17  Jarmo Kauko
 * New version of the android plugin

##### 2015-06-16  Jarmo Kauko
 * Deployed android plugin with stripped google-play-services

##### 2015-06-16  Jarmo Kauko
 * Automatic deployment

##### 2015-06-16  Jarmo Kauko
 * Rebuilt android plugin

##### 2015-06-15  Jarmo Kauko
 * Reverted to older version of the plugin as AdRally uses different version of UnityAds. Added android fix on top of the previous plugin.

##### 2015-06-12  Jarmo Kauko
 * Release build deployment for android, iOS and iOS simulator

##### 2015-06-12  Jarmo Kauko
 * Automatic deployment

##### 2015-06-11  Jarmo Kauko
 * Automatic deployment

##### 2015-06-10  Jarmo Kauko
 * Rebuilt android plugin, reverted rcssdk.jar to older version.

##### 2015-06-10  Jarmo Kauko
 * Deployed debug builds for all plugins (ios, ios-sim, android, osx)

##### 2015-06-10  Jarmo Kauko
 * Added xml2 to ios and ios simulator staticLibs

##### 2015-06-10  Jarmo Kauko
 * Added xml2 to ios staticLibs

##### 2015-06-09  Jarmo Kauko
 * Rebuilt plugin using latest develop. Windows not included.

##### 2015-06-02  Jarmo Kauko
 * Added stripped version of google play services

##### 2015-05-29  Jarmo Kauko
 * Removed google-play-services.jar to test if reducing method count fixes android build

##### 2015-05-29  Jarmo Kauko
 * Reverted the experimental deployment that removed other platforms than android

##### 2015-05-28  Jarmo Kauko
 * Removed plugin for other platforms than android for testing purposes

##### 2015-05-22  Sami Enne
 * Backed out changeset: 3e1ce36656cb

##### 2015-05-07  samienne
 * Automatic deployment

##### 2015-05-07  samienne
 * Automatic deployment

##### 2015-05-06  samienne
 * Automatic deployment

##### 2015-05-06  samienne
 * Automatic deployment

##### 2015-05-06  samienne
 * Automatic deployment

##### 2015-04-29  Sami Enne
 * Reverted to older version as the newer ones were broken.

##### 2015-04-23  samienne
 * Automatic deployment

##### 2015-04-22  Jarmo Kauko
 * Updated iOS plugin to debug

##### 2015-04-20  Jarmo Kauko
 * Rebuilt plugin for iOS and iOS simulator with Fusion 1.4.35, removed duplicate symbols

##### 2015-04-20  Jarmo Kauko
 * Deployed iOS, iOS simulator and OSX plugins built with Fusion 1.4.35

##### 2015-04-20  samienne
 * Automatic deployment

##### 2015-04-20  Sami Enne
 * Deployed new win32-sim build.

##### 2015-04-20  Sami Enne
 * Reverted plugin library files as they were broken in the previous commit.

##### 2015-04-15  Jarmo Kauko
 * Fusion 1.5 build for iOS, iOS simulator and OSX

##### 2015-04-14  samienne
 * Rebuilt android plugin without Fusion modifications.

##### 2015-04-10  samienne
 * Built new iOS library files with the new build system.

##### 2015-04-09  samienne
 * Remove Info.plist from simulator as it is causing resource conflicts.

##### 2015-04-09  samienne
 * Added Accounts and AdSupport frameworks

##### 2015-04-09  Jarmo Kauko
 * Removed Info.plist as it conflicts with app resources

##### 2015-04-08  Jarmo Kauko
 * Updated ios simulator build, third party frameworks are statically linked to plugin

##### 2015-04-08  Jarmo Kauko
 * Merged changes

##### 2015-04-08  Jarmo Kauko
 * Removed redistributed frameworks

##### 2015-04-08  Jarmo Kauko
 * Updated iphone plugin, now statically linked against third party frameworks

##### 2015-04-08  samienne
 * Added iAd and Social frameworks for iOS build.

##### 2015-04-02  samienne
 * Revert framework names back

##### 2015-04-02  samienne
 * Trying to use relative path with redistributed frameworks

##### 2015-04-02  Jarmo Kauko
 * Fixed typos in metadata.lua

##### 2015-04-02  Jarmo Kauko
 * Removed renamed iphone lib librcssdk.a

##### 2015-04-01  samienne
 * Try renaming the ios library.

##### 2015-04-01  samienne
 * Built new jar packages

##### 2015-04-01  samienne
 * Trying debug build

##### 2015-03-31  samienne
 * Combined res folders from modules/CloudServicesNativeSDK/

##### 2015-03-31  samienne
 * Test build to use cacert.pem from assets root folder

##### 2015-03-31  Jarmo Kauko
 * Updated windows plugin, added resources

##### 2015-03-31  samienne
 * Added plugin binary for android

##### 2015-03-30  Jarmo Kauko
 * Moved redistributed frameworks out from the resources folder

##### 2015-03-27  Jarmo Kauko
 * Added permissions and app child elements to android plugin

##### 2015-03-27  Jarmo Kauko
 * Use lib prefix for iOS static libraries, add libs to metadata.lua

##### 2015-03-26  Jarmo Kauko
 * Combined instructions from Readme.markdown in the hatch repository.

##### 2015-03-19  samienne
 * Mac-sim distributable build

##### 2015-03-19  samienne
 * Android distributable build

##### 2015-03-19  Jarmo Kauko
 * Removed placeholder documentation

##### 2015-03-19  Jarmo Kauko
 * Removed placeholder documentation, added publisher contact, fixed plugin name case

##### 2015-03-19  Jarmo Kauko
 * Merge android plugin changes

##### 2015-03-19  Jarmo Kauko
 * Added redistributed frameworks, updated iOS plugin libraries

##### 2015-03-18  samienne
 * Android plugin and resources

##### 2015-03-12  samienne
 * Add initial version of plugin binaries

##### 2015-03-12  Jarmo Kauko
 * First version of the rcssdk plugin

##### 2014-11-21  Albert Yale
 * Check architectures of plugins

##### 2014-11-20  Albert Yale
 * 64b

##### 2013-07-18  Perry Clarke
 * Added checks for __Availability__ in docs and unexpected architectures in fat binaries.

Bumped version to 1.1

##### 2013-07-12  Perry Clarke
 * Added script to sanity check plugin submissions.

##### 2013-07-12  Perry Clarke
 * Added Corona QA checklist

##### 2013-05-03  walter
 * Add missing line for Availability in index.markdown

##### 2013-05-01  walter
 * Fix: plugins/ folder needs a VERSION/ subdir

##### 2013-04-22  walter
 * Clean up/clarify replacement strings

##### 2013-04-18  walter
 * Add missing info on per-plugin metadata.lua files for device

##### 2013-04-18  walter
 * Fix typo

##### 2013-04-18  walter
 * Clarification

##### 2013-04-18  walter
 * Update readme for metadata.json

##### 2013-04-18  walter
 * Add metadata.json file

##### 2013-04-18  walter
 * Inital checkin

