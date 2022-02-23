# att.status

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[String][api.type.String]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			Ads, Monetization, Apple, App Tracking Transparency
> __Platforms__			iOS, tvOS
> --------------------- ------------------------------------------------------------------------------------------

Returns current tracking status. Possible values are:

- `authorized` - the value returned if the user authorizes access to app-related data that can be used for tracking the user or the device.
- `denied` - the value returned if the user denies authorization to access app-related data that can be used for tracking the user or the device.
- `restricted` - the value returned if authorization to access app-related data that can be used for tracking the user or the device is restricted.
- `notDetermined` - the value returned if a user has not yet received an authorization request to authorize access to app-related data that can be used for tracking the user or the device.
- `unavailable` - the value returned if iOS version is less than 14.0.

```
print(att.status)
```