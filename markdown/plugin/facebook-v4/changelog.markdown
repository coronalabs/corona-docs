# Changelog
##### 2017-08-11  Brent Sorrentino
 * Remove pointless key from docs.

##### 2017-08-10  Brent Sorrentino
 * Updated docs based on v4a release.

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

