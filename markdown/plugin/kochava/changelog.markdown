# Changelog
##### 2019-07-12  Vlad Svoka
 * ads identifier id return

##### 2019-06-30  Vlad Shcherban
 * Replacing admop with app id

##### 2019-06-30  Vlad Shcherban
 * Replacing admop with app id

##### 2018-11-06  Pavel Karpov
 * Updated iOS/tvOS to 3.8.0; updated Android to 3.5.0; Added network aar for android; fixed deprecation on iOS

##### 2018-07-26  Pavel Karpov
 * Fix for getversion docs

##### 2018-05-16  Pavel Karpov
 * Upped sdk ios 3.5.0 / android 3.4.0; gdpr update; gradle update

##### 2018-04-27  Pavel Karpov
 * Upped kochava ios/tvos to 3.4.1

##### 2018-02-13  Pavel Karpov
 * Upped android sdk to 3.3.1

##### 2018-02-12  Pavel Karpov
 * Upped ios & tvos sdk to 3.4.0; added getVersion(); updated docs accordingly

##### 2017-12-19  Pavel Karpov
 * Fixed iOS crash on init; updated android 3.3.0

##### 2017-12-19  Pavel Karpov
 * test 9999

##### 2017-11-07  Pavel
 * Updated ios/tvos 3.3.0; updated android 3.2.0

##### 2017-11-07  Pavel
 * test android 9999

##### 2017-11-07  Pavel
 * test tvos 9999 x2

##### 2017-11-07  Pavel
 * test tvos 9999

##### 2017-11-07  Pavel
 * final iphone test 9999

##### 2017-11-06  Pavel
 * Testing iphone 9999 x4

##### 2017-11-06  Pavel
 * Testing iphone 9999 x3

##### 2017-11-06  Pavel
 * Testing iphone 9999 x2

##### 2017-11-06  Pavel
 * Testing iphone 9999

##### 2017-08-09  Ingemar Bergmark
 * Android SDK 3.1.0

##### 2017-08-02  Ingemar Bergmark
 * Fixed referral manifest entry

##### 2017-07-25  Ingemar Bergmark
 * Android SDK 3.0.0
Consolidated standard and custom event functions to one logEvent() function

##### 2017-07-24  Brent Sorrentino
 * Minor updates (request by Ingemar).

##### 2017-07-13  Vlad Shcherban
 * Fixing plugin metadata

##### 2017-07-05  Brent Sorrentino
 * Minor update.

##### 2017-07-04  Ingemar Bergmark
 * tvOS/iOS SDK 3.1.5
Changed standard event score type from Double to String

##### 2017-06-29  Brent Sorrentino
 * Doc updates.

##### 2017-06-27  Ingemar Bergmark
 * iOS: Validate attribution data to prevent JSON errors

##### 2017-06-22  Ingemar Bergmark
 * Android: Fix potential NPE in setIdentityLink
iOS: Fix crash in attribution data callback when JSON data is malformed

##### 2017-06-02  Ingemar Bergmark
 * Android: Fix NullPointerException if user exits app before all events have been received

##### 2017-05-02  Brent Sorrentino
 * Minor edit.

##### 2017-04-17  Ingemar Bergmark
 * iOS / tvOS SDK 3.1.4 update

##### 2017-04-01  Ingemar Bergmark
 * iOS Kochava SDK 3.1.3 update

##### 2017-03-16  Ingemar Bergmark
 * Android SDK 070303
Android API level 25
iOS target iOS 8

##### 2017-03-14  Brent Sorrentino
 * Minor edit.

##### 2017-02-13  Brent Sorrentino
 * Minor doc edits (request by Ingemar).

##### 2017-02-13  Ingemar Bergmark
 * iOS SDK 3.1.2 / tvOS SDK 3.1.2 / Android SDK 170127

##### 2017-02-06  Ingemar Bergmark
 * use ads instead of base to allow builds for Amazon to run

##### 2017-01-16  Ingemar Bergmark
 * Removed 'network/NetworkRequest.java.orig' from plugin jar

##### 2017-01-10  Ingemar Bergmark
 * Updated Android SDK
Removed currency option from init()
Removed logSpatialEvent

##### 2017-01-09  Brent Sorrentino
 * Updates based on new SDK (request by Ingemar).

##### 2016-12-13  Ajay McCaleb
 * Activate Android Plugin Dependencies for plugins maintained by Corona starting with build 2016.3005. 28 plugins affected.

##### 2016-11-17  Brent Sorrentino
 * Minor edit (request by Ingemar).

##### 2016-11-07  Brent Sorrentino
 * Change appId to appGUID, and other changes for recent plugin version.

##### 2016-11-06  Ingemar Bergmark
 * Renamed appId to appGUID in init() as per Kochava's request

##### 2016-10-24  Ingemar Bergmark
 * Added support for Standard Events

##### 2016-10-11  Ingemar Bergmark
 * Android Plugin Dependencies

##### 2016-08-18  Ingemar Bergmark
 * Docs: added 'currency' to sample payload table in logEvent()

##### 2016-08-05  Ingemar Bergmark
 * Updated sample app

##### 2016-08-04  Ingemar Bergmark
 * iOS: Updated SDK

##### 2016-07-14  Ingemar Bergmark
 * Docs: Removed section about "android.permission.GET_ACCOUNTS" permission as per Google policy update

##### 2016-07-14  Ingemar Bergmark
 * Android: Updated SDK (Google policy change. No email collection)

##### 2016-07-07  Brent Sorrentino
 * Updates for IAP handling in events.

##### 2016-07-05  Brent Sorrentino
 * Update support point email.

##### 2016-07-01  Ingemar Bergmark
 * Updated docs. Allow Xcode simulator builds

##### 2016-06-29  Ingemar Bergmark
 * updated version extension formatting (for Kochava's internal plugin tracking)

##### 2016-06-29  Ingemar Bergmark
 * updated logEvent() to reflect new functionality for Android

##### 2016-06-28  Ingemar Bergmark
 * Android support for Store receipts

##### 2016-06-24  Brent Sorrentino
 * Update docs to reflect "attribution" being the purpose of this plugin.

##### 2016-06-24  Ingemar Bergmark
 * improved iOS receipt handling

##### 2016-06-22  Brent Sorrentino
 * Initial docs commit.

##### 2016-06-12  Ingemar Bergmark
 * Fix logEvent() crash (proper NULL handling)

##### 2016-06-11  Ingemar Bergmark
 * added sample app

##### 2016-06-10  Ingemar Bergmark
 * included Corona beacon

##### 2016-06-10  Ingemar Bergmark
 * Updated iOS Kochava SDK

##### 2016-05-26  Ingemar Bergmark
 * added receipt handling

##### 2016-05-26  Ingemar Bergmark
 * initial binaries

##### 2016-05-23  Michael Wallar
 * Initial repository state.

