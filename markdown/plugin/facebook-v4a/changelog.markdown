# Changelog
##### 2020-06-25  Vlad Shcherban
 * removing patrial bitcode

##### 2020-06-25  Vlad Shcherban
 * updating facebook plugin

##### 2020-02-07  Vlad Shcherban
 * updated  to shared libs

##### 2020-02-05  Vlad Shcherban
 * 2020.3569  release

##### 2020-01-03  Vlad Shcherban
 * Fixing build on older builds

##### 2019-11-26  Vlad Shcherban
 * Updated facebook to 5.11.2

##### 2019-11-26  Vlad Shcherban
 * updated min version

##### 2019-11-25  Vlad Shcherban
 * Updating facebook SDK to 5.9.0

##### 2019-11-25  Vlad Shcherban
 * removing jar because it has AAR already

##### 2019-11-25  Vlad Shcherban
 * adding jarlibs

##### 2019-11-24  Vlad Shcherban
 * 5.6.0 test

##### 2019-11-05  Vlad Shcherban
 * update for 9999 5.9 facebook

##### 2019-11-04  Vlad Shcherban
 * Testing 5.9 Facebook plugin

##### 2019-06-18  Vlad Shcherban
 * ignoring jniLibs

##### 2019-06-17  Vlad Shcherban
 * First attempt to make plugin with dependencies work for new build system

##### 2018-11-20  Kirill
 * Reverted parts with ShareDialog.Mode changes

##### 2018-11-20  Kirill
 * Removed possible IAP’s jars, need check

##### 2018-11-19  Kirill
 * Fixing issue

##### 2018-11-19  Kirill
 * Fixing publis_actions issue

##### 2018-11-16  Kirill
 * Facebook SDK updated to 4.38+

##### 2018-11-12  Kirill
 * Facebook SDK updated to 4.38+ (requirement from FB), testing now

##### 2018-10-02  Kirill Toporkov
 * Fixed issue with Lua.getTop got NullPointerException, also fixed issue with multiple app_id

##### 2018-10-01  Kirill Toporkov
 * Test updating facebook to 4.37, fixed getTop issue. Placed to 9999 for testing

##### 2018-07-12  Vlad Shcherban
 * removing location permissions

##### 2018-07-08  Kirill Toporkov
 * Updated facebook SDK for iOS (4.34) and Android (4.33)
No longer ‘user_friends’ permission required by default

##### 2018-06-25  Kirill Toporkov
 * Updated facebook SDK:
Android to 4.33, fixed resources conflict (9999)

##### 2018-06-21  Kirill Toporkov
 * Updated facebook SDK:
Android to 4.33
iOS and iOS-simulator to 4.34

##### 2018-05-12  Kirill Toporkov
 * Fixed issue with login after app restarts

##### 2018-03-30  Vlad Shcherban
 * Removed location permissions

##### 2018-03-29  Kirill Toporkov
 * Fixed bugs #113 & #141

##### 2018-03-17  Kirill Toporkov
 * Restored links to system framework

##### 2018-03-17  Kirill Toporkov
 * Removed links to missed framework for iOS

##### 2018-03-17  Kirill Toporkov
 * Restored cardview dependency

##### 2018-03-17  Kirill Toporkov
 * Restored appcompat dependency

##### 2018-03-17  Kirill Toporkov
 * Fixing metadata

##### 2018-03-17  Kirill Toporkov
 * Minor fixes to dependencies

##### 2018-03-17  Kirill Toporkov
 * Minor fixes to metadata and res

##### 2018-03-16  Kirill Toporkov
 * Minor fixes

##### 2018-03-16  Kirill Toporkov
 * Unused dependency

##### 2018-03-16  Kirill Toporkov
 * Facebook initProvider is from 4.31, commented block

##### 2018-03-16  Kirill Toporkov
 * Rolled back to 4.16.0 but with new plugin model and dependencies

##### 2018-03-16  Kirill Toporkov
 * Fixed accessToken issue, callback initialised issue

##### 2018-03-14  Kirill Toporkov
 * Changed plugin SDK initialisation method

##### 2018-03-14  Kirill Toporkov
 * Added missing resource files due to gradle issues

##### 2018-03-14  Kirill Toporkov
 * Completely reworked plugin resources, removed unnecessary and old links

##### 2018-03-14  Kirill Toporkov
 * Removed package.txt from unused places

##### 2018-03-13  Kirill Toporkov
 * Fixed package file in colours folder

##### 2018-03-13  Kirill Toporkov
 * Removed attrs.xml with duplicated attributes

##### 2018-03-13  Kirill Toporkov
 * Resolved resources conflict due to duplication in packages

##### 2018-03-13  Kirill Toporkov
 * Fixed package structure due to gradle built folder

##### 2018-03-13  Kirill Toporkov
 * Removed unnecessary jars

##### 2018-03-13  Kirill Toporkov
 * Updated source code of plugin and values.xml

##### 2018-03-13  Kirill Toporkov
 * Fixing manifest conflict

##### 2018-03-13  Kirill Toporkov
 * Resolved resources conflict

##### 2018-03-13  Kirill Toporkov
 * Updated Facebook SDK to 4.31 with resources

##### 2018-03-07  Kirill Toporkov
 * Fixed issue with autoLogin

##### 2018-03-03  Kirill Toporkov
 * Fixed `com_facebook_login_fragment_progress_bar` issue when building for android

##### 2018-02-19  Kirill Toporkov
 * New facebook SDK for iOS

##### 2018-02-19  Kirill Toporkov
 * Updated Facebook SDK up to 4.30 for 2100.9999 repo

##### 2018-02-16  Kirill Toporkov
 * Added getSDKVersion method for simulator

##### 2018-02-16  Kirill Toporkov
 * Added getSDKVersion method for android, placed to 2100.9999

##### 2018-02-16  Kirill Toporkov
 * Resolved resources conflict

##### 2018-02-16  Kirill Toporkov
 * Updated resources structure, metadata.lua and jar itself for 2100.9999

##### 2018-02-16  Kirill Toporkov
 * Fixed activity not found error when calls ShowDialog for “friends” and “places”

##### 2018-02-14  Kirill Toporkov
 * Fixed typo for user package name in metadata.lua

##### 2018-02-14  Kirill Toporkov
 * Added missing permission to metadata (CardView-v7)

##### 2018-02-14  Kirill Toporkov
 * Facebook updated to 4.30.0 with resources, needs to test

##### 2018-02-12  Kirill Toporkov
 * Updated new v4a plugin jar (removed deprecated methods)

##### 2018-02-12  Kirill Toporkov
 * Added 2100.9999 repo for testing new mechanics

##### 2017-08-14  Perry Clarke
 * Turned off debug logging in Android plugin

##### 2017-08-11  Brent Sorrentino
 * Remove pointless key from docs.

##### 2017-08-10  Brent Sorrentino
 * Updated docs.

##### 2017-08-09  Perry Clarke
 * Fixed sample code booboo

##### 2017-08-09  Perry Clarke
 * Adding missing link

##### 2017-08-09  Perry Clarke
 * Updated docs

##### 2017-08-09  Perry Clarke
 * Maintenance

First checkin of v4a which adds facebook.init(listener) and fixes ANRs on Android

##### 2017-06-19  Brent Sorrentino
 * Remove Enterprise instance.

##### 2017-06-06  Brent Sorrentino
 * Minor edits.

##### 2017-06-06  Brent Sorrentino
 * Minor edits.

##### 2017-04-24  Brent Sorrentino
 * Minor edits.

##### 2017-04-24  Brent Sorrentino
 * Minor edits.

##### 2017-04-07  Brent Sorrentino
 * Minor edit.

##### 2017-03-28  Brent Sorrentino
 * Minor edits.

##### 2017-02-06  Brent Sorrentino
 * Docs maintenance.

##### 2016-12-07  Ajay McCaleb
 * Facebook-v4: API implementations in the Corona Simulator stub now return values matching the return types advertised in the documentation.

Reviewed by: Sergey

##### 2016-11-16  Ajay McCaleb
 * Android: Adding missing Bolts library jars to binaries package.

##### 2016-11-07  Ajay McCaleb
 * facebook.showDialog(): Added a note that sharing photos requries a Facebook App to be installed.

##### 2016-11-03  Alexander McCaleb
 * setFBConnectListener.markdown edited online with Bitbucket

Added valueInTable() function to permissions example as the accessToken's grantedPermissions Table is treated as an array, i.e. the permissions in it are values, not keys.

##### 2016-11-03  Alexander McCaleb
 * login.markdown edited online with Bitbucket

Added valueInTable() function to permissions example as the accessToken's grantedPermissions Table is treated as an array, i.e. the permissions in it are values, not keys.

##### 2016-10-28  Alexander McCaleb
 * index.markdown edited online with Bitbucket

- Listed more static libraries to link following last minute packaging changes of the iOS version of the Facebook-v4 plugin.

- Removed reference to Facebook SDKs distributed with Corona Enterprise as we no longer do this.

##### 2016-10-28  Alexander McCaleb
 * showDialog.markdown edited online with Bitbucket.

- Corrected the key used to share photos.

##### 2016-10-27  Ajay McCaleb
 * Facebook-v4: Out of beta binaries and project updates.

##### 2016-10-28  Lerg
 * Repacked Facebook libs to exclude framework dependencies.

##### 2016-10-28  Lerg
 * Bolts.

##### 2016-10-27  Ajay McCaleb
 * Fix syntax error from last commit.

##### 2016-10-27  Ajay McCaleb
 * iOS: Iteration on test binaries.

##### 2016-10-27  Brent Sorrentino
 * More updates to Facebook docs.

##### 2016-10-27  Ajay McCaleb
 * Test binaries fixes.

- Android: Adding Android Support v7 Appcompat dependency.
- iOS: Rebuilt binaries with Xcode 8.0, not 8.1 GM.

##### 2016-10-27  Ajay McCaleb
 * Facebook-v4 out of beta test binaries.

##### 2016-10-27  Brent Sorrentino
 * Facebook v4 docs updates.

##### 2016-08-18  Ajay McCaleb
 * Make SDK updated to 4.10.1 only available to builds 2828 and greater as this update also included Android 6 permission-related changes.

##### 2016-05-17  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * setFBConnectListener.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * publishInstall.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * logout.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * login.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * getCurrentAccessToken.markdown edited online with Bitbucket

##### 2016-05-17  Brent Sorrentino
 * getCurrentAccessToken.markdown edited online with Bitbucket

##### 2016-03-25  Danny Glover
 * Update plugins to latest Facebook SDK source code

- FBv4 now builds against the Facebook (Github) source code for iOS and Android.

##### 2016-01-25  Ajay McCaleb
 * Fixing typo in example; Casenum 44532.

##### 2015-12-29  Ajay McCaleb
 * iOS: Updated binaries with fix to com.facebook error 123.

##### 2015-11-11  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-11-11  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-11-11  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2015-11-11  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2015-11-11  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2015-11-11  Brent Sorrentino
 * getCurrentAccessToken.markdown edited online with Bitbucket

##### 2015-11-10  Ajay McCaleb
 * Updates Binaries that include recent Game Request and Open Graph changes.

##### 2015-11-09  Ajay McCaleb
 * Adding more generated files and pieces of documentation that shouldn't be public yet to .hgignore.

##### 2015-11-09  Ajay McCaleb
 * Docs: Updates pertaining to Game Request Dialog parameters and using Open Graph objects.

##### 2015-10-03  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-10-03  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-09-01  Ajay McCaleb
 * Docs: Changes for blog post on iOS beta.

* Added some anchor tags to link to the correct spots in the blog post.
* Added a couple more known issues that have come up in Fogbugz cases and from Tapps's testing.

##### 2015-08-26  Ajay McCaleb
 * iOS: Fixing "to" parameter to facebook.showDialog("request", {}).

* Includes correction to docs about this.

##### 2015-08-24  Vlad Shcherban
 * new fuse docs

##### 2015-08-20  Ajay McCaleb
 * Updated iOS binaries that compile with iOS 8.4 and iOS 9 beta.

##### 2015-08-18  Ajay McCaleb
 * Binaries for iOS beta.

* Includes binaries for the iOS simulator.
* Includes updated Android binaries with new features and behavior consistencies with iOS.
* Includes update to Facebook SDK 4.5.0 on Android and 4.5.1 on iOS.
* Includes updates to Mac and Windows Simulator stubs.

##### 2015-08-18  Ajay McCaleb
 * Replaced the old and confusing "apprequests" action for facebook.showDialog() with "requests". Code already treated "requests" and "apprequests" the same.

##### 2015-08-19  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-08-19  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2015-08-19  Brent Sorrentino
 * migration.markdown edited online with Bitbucket

##### 2015-08-18  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-08-18  Ajay McCaleb
 * Fixed a typo in plist settings.

##### 2015-08-18  Ajay McCaleb
 * Another iteration on docs for iOS beta and Android updates.

* Includes more detailed setup instructions for both Corona SDK and Corona Enterprise.
* Some link and format updates.
* Includes some additional resources for facebook.request().
* Some tweaks to sample code.

##### 2015-08-13  Ajay McCaleb
 * Fixing plugin name in JSON metadata so simulator stub will download correctly. Casenum 42241.

##### 2015-08-06  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-08-06  Brent Sorrentino
 * migration.markdown edited online with Bitbucket

##### 2015-08-05  Ajay McCaleb
 * Adding a note about usage with Corona Enterprise on iOS. Fixing examples to use getCurrentAccessToken() vs currentAccessToken.

##### 2015-08-06  Brent Sorrentino
 * getCurrentAccessToken.markdown edited online with Bitbucket

##### 2015-08-05  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-08-05  Brent Sorrentino
 * changelog.markdown edited online with Bitbucket

##### 2015-08-05  Brent Sorrentino
 * login.markdown edited online with Bitbucket

##### 2015-08-05  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-08-05  Ajay McCaleb
 * Doc updates to coincide with iOS beta and Android updates.

##### 2015-08-03  Alexander McCaleb
 * index.markdown edited online with Bitbucket

##### 2015-08-03  Alexander McCaleb
 * Added note about what minimal daily build is needed for this plugin.
Changed support link to the Facebook-v4 beta forum.

##### 2015-07-28  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * setFBConnectListener.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * publishInstall.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * migration.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * login.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-07-28  Brent Sorrentino
 * currentAccessToken.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * showDialog.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * setFBConnectListener.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * request.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * publishInstall.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * logout.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * login.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * isActive.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * currentAccessToken.markdown edited online with Bitbucket

##### 2015-07-25  Brent Sorrentino
 * accessDenied.markdown edited online with Bitbucket

##### 2015-07-21  ajay
 * Facebook-v4: Removing pages for unfinished APIs. Fixes to index.markdown.

##### 2015-07-21  ajay
 * Binaries and sample for Android beta 1.0.

##### 2015-07-21  ajay
 * Adding first draft of docs.

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

