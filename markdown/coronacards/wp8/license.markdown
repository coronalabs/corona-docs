# CoronaCards — Windows&nbsp;Phone&nbsp;8

## CoronaCards Licensing

CoronaCards for Windows&nbsp;Phone&nbsp;8 can be used on an __unlimited trial basis__, but all projects will be watermarked with __TRIAL__ and a message will be logged to Visual&nbsp;Studio's __Output__ panel.

To purchase a license, please do so via the [CoronaCards&nbsp;pricing](https://coronacards.com/pricing/) page.


## Applying a License

Once you have [purchased](https://coronacards.com/pricing/) a CoronaCards license, please follow these steps:

1. Download a new license file (`license.ccdata`) by clicking the __Get&nbsp;License__ button on the right side of your Corona [Account&nbsp;Info](https://developer.coronalabs.com/user) page.
2. Place this file in the root of your CoronaCards project folder, alongside `main.lua`.
3. Open your CoronaCards Windows Phone project in Visual Studio.
4. View the __Solution Explorer__ panel in Visual Studio.
5. Expand the project's __Assets__ &rarr; __Corona__ tree.
6. Open __Windows Explorer__ and browse to where the `license.ccdata` file is located.
7. Drag and drop this `license.ccdata` file under the __Assets__ &rarr; __Corona__ folder in Visual Studio's __Solution&nbsp;Explorer__ panel.

![][images.simulator.cc-wp8-license]


## CoronaCards Daily Builds

As a CoronaCards licensee, you gain access to the latest CoronaCards Daily Builds. You can access Daily Builds via our general [Corona&nbsp;Daily&nbsp;Builds](http://developer.coronalabs.com/downloads/daily-builds/) page. On this page, you will see tabs for all products for which you hold a license.


## Troubleshooting

### Unauthorized Platform

If you see an error message on screen stating that "The provided license file does not authorize this software to run on this platform...", it means that the `license.ccdata` file which was added to the project is not authorized for Windows&nbsp;Phone&nbsp;8. Most likely, the license was authorized for a different CoronaCards platform like iOS or Android. If you see this message, you'll need to purchase and/or acquire a new `license.ccdata` file via Corona&nbsp;Labs [support](mailto:support@coronalabs.com). Once acquired, delete the old `license.ccdata` file from Visual Studio and replace it with the new license file as outlined above.

![][images.simulator.cc-wp8-unauthplatform]

### Unauthorized Version

If you see an error message on screen stating "Your license is not authorized to use the current version of Corona that you are running. Your license is only authorized to run older builds...", it means that the `license.ccdata` file cannot authorize the version of CoronaCards that you're using. When you purchase a license, it's valid for the current version of CoronaCards and all versions released one year beyond the license date. While you can build with the current version beyond that point, you will not be able to build using a version of CoronaCards released later than one year past the license date unless you purchase a new `license.ccdata` file via Corona&nbsp;Labs [support](mailto:support@coronalabs.com).

![][images.simulator.cc-wp8-unauthversion]
