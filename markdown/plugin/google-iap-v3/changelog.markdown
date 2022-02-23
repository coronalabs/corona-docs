# Changelog
##### 2018-05-08  Vlad Svoka
 * removing empty lib entry

##### 2018-05-08  Vlad Svoka
 * removing empty lib entry

##### 2017-09-11  Brent Sorrentino
 * Integrate daily build doc notes.

##### 2017-08-22  Brent Sorrentino
 * Remove Windows Phone, Ouya, and GameStick references.

##### 2017-07-31  Brent Sorrentino
 * Minor edit.

##### 2017-07-20  Brent Sorrentino
 * Correct event properties which are actually returned (engineer miscommunication here).

##### 2017-07-19  Brent Sorrentino
 * Restore "lost" storeTransaction docs.

##### 2017-07-19  Perry Clarke
 * Make Google IAP store.init() asynchronous so it will work reliably on slower networks

Reviewed by Vlad, Rob, Brent et al

##### 2017-06-05  Vlad Shcherban
 * re-adding empty shells for iOS plugins... To make lifes easier.

##### 2017-06-05  Brent Sorrentino
 * Minor edits.

##### 2017-05-02  Brent Sorrentino
 * Minor edit.

##### 2017-02-13  Brent Sorrentino
 * Remove supportedPlatforms line.

##### 2016-08-30  Brent Sorrentino
 * Minor doc edit.

##### 2016-08-29  Ajay McCaleb
 * Google IAP v3: Remove iOS stubs as this plugin is Android only.

##### 2016-06-21  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2016-04-26  Brent Sorrentino
 * Overhaul of awful Google IAP docs.

##### 2016-03-29  Brent Sorrentino
 * migration.markdown deleted online with Bitbucket

##### 2016-03-29  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2016-03-03  Brent Sorrentino
 * target.markdown edited online with Bitbucket

##### 2016-02-24  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-12-03  Ajay McCaleb
 * Google IAP v3: Binary update and substate update.

##### 2015-11-28  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-11-24  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-11-24  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * target.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * loadProducts.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * isActive.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * consumePurchase.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * canMakePurchases.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * canLoadProducts.markdown edited online with Bitbucket

##### 2015-10-24  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-09-25  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-09-25  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-09-25  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-08-10  Ajay McCaleb
 * Error handling on store.restore() in the event of the query to Google's helper classes throwing an IabException; casenum 42164.

Reviewed by: Josh.

##### 2015-06-19  ajay
 * Google IAP v3: Fixes Casenum 39101 and other improvements

 * Updated binaries
 * Modified store.init() so it won't try to modify the LuaState in a callback that might be run on the main thread, preventing a deadlock.
 * Handled an edge case that could cause store.init() to hang indefinitely.
 * Some project repo cleanup.

Reviewed by: Josh

##### 2015-05-13  ajay
 * Google IAP v3: Doc updates

* Added a note about Google IAP v2 being deprecated and removed to homepage.
* Noted that store.availableStores was removed from this plugin.

##### 2015-04-08  ajay
 * New binary for GoogleIAPV3 that allows for static response testing.

##### 2015-02-27  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-02-18  Danny Chan
 * Merge

##### 2015-02-18  Danny Chan
 * Update google iap v3 so that it handles product lists of > 20 skus.

##### 2015-02-18  Brent Sorrentino
 * target.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * restore.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * purchase.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * migration.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * loadProducts.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * isActive.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * init.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * finishTransaction.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * consumePurchase.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * canMakePurchases.markdown edited online with Bitbucket

##### 2015-02-18  Brent Sorrentino
 * canLoadProducts.markdown edited online with Bitbucket

##### 2015-02-10  Danny Chan
 * Fix an issue where trying to buy an item thats already owned will return back the wrong error.

##### 2015-01-09  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2014-12-16  Danny Chan
 * Update google iap to possibly avoid an anr error

##### 2014-12-01  Danny Chan
 * Fix some potential issues in google iap v3

##### 2014-12-01  Danny Chan
 * Fix null pointer error in google iap v3

##### 2014-11-07  Danny Chan
 * Add docs for google iap v3 store.target

##### 2014-11-07  Danny Chan
 * Add store.target to google iap v3

##### 2014-10-27  Danny Chan
 * Allow async google iap calls

##### 2014-10-27  Danny Chan
 * Get rid of locking issues

##### 2014-10-21  Danny Chan
 * Add a listener for google iap v3 purchases

##### 2014-10-09  Danny Chan
 * Return priceAmountMicros, priceCurrencyCode, and the original json from store.loadProducts from google-iap-v3

##### 2014-09-10  Danny Chan
 * google-iap-v3 add a receipt field to the transaction call back.  The field has the same information as originalJson

##### 2014-09-03  Brent Sorrentino
 * Minor doc edits.

##### 2014-08-27  Brent Sorrentino
 * Doc updates (index only).

##### 2014-08-25  Brent Sorrentino
 * Updates to Google IAP v3 docs.

##### 2014-03-03  Danny Chan
 * Update docs

##### 2014-02-20  Danny Chan
 * Google IAP v3 Don't crash when init hasn't been called.

##### 2014-02-20  Danny Chan
 * Update

##### 2014-02-05  Danny Chan
 * Fix a possible null pointer exception with google iap v3

##### 2014-01-10  Danny Chan
 * Update google iap jar with latest changes

##### 2014-01-07  Danny Chan
 * Update google iap so that if theres an error with loading products/purchsing products/consuming prodcuts it will return the error back to the lua side

##### 2014-01-06  Danny Chan
 * Store transaction error should still be in the transaction field

##### 2014-01-03  Danny Chan
 * Update google iap v3 so that not having passing a subscription to loadProducts still behaves correctly.  Also the transaction call back now has error messages.

##### 2014-01-02  Danny Chan
 * google-iap.init correctly gets the listener index

##### 2014-01-02  Danny Chan
 * Block google iap's init method so that it behaves like the store module

##### 2013-12-05  Danny Chan
 * Update docs

##### 2013-12-05  Danny Chan
 * Add ignore files for google iap

##### 2013-11-27  Danny Chan
 * Google iap v3 jar file didn't include some classes.

##### 2013-11-27  Danny Chan
 * Update docs

##### 2013-11-27  Danny Chan
 * Add in simulator stubs for google iap

##### 2013-11-26  Danny Chan
 * Update google-iap-v3 docs

##### 2013-11-26  Danny Chan
 * Update google-iap-v3 docs

##### 2013-11-26  Danny Chan
 * Update docs for google-iap-v3

##### 2013-11-26  Danny Chan
 * Add google iap v3 docs and update docs directory

##### 2013-11-26  Danny Chan
 * Initial commit

