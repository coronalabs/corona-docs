# Changelog
##### 2020-06-25  Vlad Shcherban
 * Adding new version

##### 2019-10-22  Vlad Shcherban
 * Thinned file

##### 2019-10-21  Vlad Shcherban
 * Updated steam version to 1.46

##### 2019-10-10  Vlad Shcherban
 * Added isDlcInstalled

##### 2017-06-05  Brent Sorrentino
 * Minor edits.

##### 2017-02-13  Brent Sorrentino
 * Remove supportedPlatforms line.

##### 2016-11-08  Brent Sorrentino
 * Make note box into alert box.

##### 2016-11-01  Brent Sorrentino
 * Minor edits.

##### 2016-08-30  Brent Sorrentino
 * Minor edits.

##### 2016-08-04  Brent Sorrentino
 * Add reference link to one Steamworks doc.

##### 2016-08-01  Joshua Quick
 * Added link to sample project in plugin documentation.

##### 2016-07-25  Joshua Quick
 * Updated documentation to state that overlays only have display issues with device skins in the Corona Simulator on Windows, not Mac.

##### 2016-07-25  Brent Sorrentino
 * Updates to overlays guide and images.

##### 2016-07-25  Joshua Quick
 * Resolved breadcrumb bar text/link issue with troubleshooting guide.

##### 2016-07-22  Joshua Quick
 * Re-worded documentation for steamworks.setAchievementProgress() function.
* Making it clear that Steam does not store amount of progress made to an acheivement.
* Steam only saves lock/unlock status only.

##### 2016-07-22  Joshua Quick
 * Mac: Modified steamworks.isLoggedOn property to not return false while in offline mode.
- It's only supposed to check if user is logged into Steam client.

##### 2016-07-22  Joshua Quick
 * Windows: Modified steamworks.isLoggedOn property to not return false while in offline mode.
- It's only supposed to check if user is logged into Steam client.

##### 2016-07-21  Joshua Quick
 * Added a Steam overlay troubleshooting guide.

##### 2016-07-20  Brent Sorrentino
 * Edits to forgotten four events.

##### 2016-07-20  Joshua Quick
 * More updates/edits/corrections made to plugin's markdown documentation.

##### 2016-07-19  Brent Sorrentino
 * Updated docs.

##### 2016-07-19  Joshua Quick
 * Fixed Mac plugin issue where Steam overlay/popups would not get rendered within the app window if Corona is not currently rendering anything.

##### 2016-07-18  Joshua Quick
 * Updated Mac plugin to support apps launched from Steam client that have not been installed by Steam
* Needed to make overlays work on Mac.

##### 2016-07-18  Joshua Quick
 * Updated Win32 plugin to support apps launched from Steam plugin that have not been installed by Steam.

##### 2016-07-13  Joshua Quick
 * - Fixed various typos, markdown errors, revised some text, and various other edits.

##### 2016-07-12  Joshua Quick
 * Deleted Readme.markdown file in repo's root directory. Its info is no longer relevant.

##### 2016-07-12  Joshua Quick
 * Built Mac version of plugin with newest changes.

##### 2016-07-12  Joshua Quick
 * - Delete all older versions of Steam plugin.
  * These versions were never released.
  * Newest plugin version has totally different API.

##### 2016-07-12  Joshua Quick
 * Merged

##### 2016-07-12  Joshua Quick
 * - Built new version of Steam plugin.
- Plugin now depends on Corona build #2872.
- Intentionally broke Mac plugin. To be resolved in upcoming commit.

##### 2016-07-12  Joshua Quick
 * Added plugin markdown documentation.

##### 2016-06-13  Vlad Shcherban
 * new Steam plugin for mac

##### 2016-06-08  josh_coronalabs
 * Added *.markdown and *.json files to the EOL extension list.

##### 2016-06-08  josh_coronalabs
 * Added mercurial EOL (End Of Line) extension support.

##### 2016-06-08  Joshua Quick
 * Removed sample projects. No longer relevant due to API change.

##### 2016-06-07  Joshua Quick
 * Major breaking plugin API change.
- No longer provided as a "gameNetwork" and "store" provider.
- Now must be loaded in Lua via require("plugin.steamworks").
- Completely changed the API.
- Updated Steam library from v1.33 to v1.36.
- Temporarily removed OS X plugin library until new one is built with current changes.

##### 2015-08-13  Stiven
 * updated plugin names

##### 2015-08-13  Stiven Deleur
 * Readme.markdown edited online with Bitbucket

##### 2015-08-13  Stiven
 * Added Steamworks Store plugin; Improved callbacks

##### 2015-08-05  Stiven Deleur
 * Readme.markdown edited online with Bitbucket

##### 2015-08-05  Stiven
 * Merge

##### 2015-08-05  Stiven
 * Added support for multiple callback listeners for a single function; Added appId option to config.lua

##### 2015-08-05  Stiven Deleur
 * Readme.markdown edited online with Bitbucket

##### 2015-07-30  Stiven Deleur
 * Readme.markdown edited online with Bitbucket

##### 2015-07-30  Stiven
 * Added readme

##### 2015-07-30  Stiven
 * Added listeners for individual functions.; gameNetwork.show() APIs; Updated with Corona test App id; added support for INT and FLOAT stats

##### 2015-07-27  Stiven
 * updated plugin name to use . instead of _
Added type checks; runs callbacks automatically; User ID is a string
Persona name; unlock time table

##### 2015-07-27  Stiven
 * Added win32 binaries

##### 2015-07-22  Stiven
 * Initial commit

