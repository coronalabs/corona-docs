# native.showPopup() &mdash; Address Book

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [native.*][plugin.CoronaProvider_native_popup_addressbook]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, address, contacts
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the operating system's default popup window to access a user's address book and contacts.


## Syntax

	native.showPopup( name, params )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Address Book plugin, use `"addressbook"`.

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties for the popup. This table requires the `option` parameter with a value of either `"pickContact"`, `"viewContact"`, `"newContact"`, or `"unknownContact"`. Depending on this value, additional options apply — see the next section for details.

<div class="code-indent">

``````lua
native.showPopup( "addressbook",
	{
		option = "pickContact",  --"pickContact", "viewContact", "newContact", or `"unknownContact"
		--additional options (see below)
	}
)
``````

</div>


## Options Reference

Valid properties in the `params` table depend upon the value specified for `option`.

### getPermission

Gets the permission state of your access to the users contacts. If a permission request has not been issued before, then a permission popup will be shown to request permission to the users contacts. One of the following strings are returned upon calling this function, describing the contact access permission state.

* `"authorized"`: User authorized access to their contacts.
* `"denied"`: User denied access to their contacts.
* `"restricted"`: Access to the users contact is restricted due to parental settings.
* `"requestPermission"`: A permission popup is shown to request access to the users contacts. If a permission request was previously denied, this popup cannot be shown again due to iOS limitations. The only way the user can grant access to your app from this point is to enable your app under Settings > Privacy > Contacts > Select your app. Note: After the function returns, you can call `native.showPopup("addressbook", {option = "getPermission"})` to check if the user authorized or denied your request

### pickContact

The following additional properties apply if `params.option` is set to `"pickContact"`:

##### hideDetails
_[Boolean][api.type.Boolean]._ If set to `true`, the address book will be dismissed upon selecting a contact.

##### performDefaultAction
_[Boolean][api.type.Boolean]._ If set to `true`, tapping/touching a contact's phone number or email will perform the default system action, for example call the contact or show the compose email UI.

##### filter
_[Table][api.type.Table]._ Table of string values indicating the items to show within the detail view section for a contact. For example, `filter = { "phone", "email", "birthday" }`. The&nbsp;following values are supported:

* `"phone"`
* `"email"`
* `"address"`
* `"birthday"`
* `"relatedNames"`
* `"socialProfiles"`
* `"instantMessagingProfiles"`

##### listener
_[Function][api.type.Function]._ Listener function to be called when the popup is dismissed. This function is passed an `event` table which contains the following properties:

* `event.name` ([string][api.type.String]) &mdash; Value of `"contact"`.
* `event.type` ([string][api.type.String]) &mdash; Value of either `"pickContact"`, `"viewContact"`, `"newContact"`, or `"unknownContact"`, depending on the popup shown.
* `event.data` ([table][api.type.Table]) &mdash; Table containing data for the selected contact. See [Contact&nbsp;Data](#contactData) below for a list of available data.


### viewContact

The following additional properties apply if `params.option` is set to `"viewContact"`:

##### performDefaultAction
_[Boolean][api.type.Boolean]._ If set to `true`, tapping/touching a contact's phone number or email will perform the default system action, for example call the contact or show the compose email UI.

##### isEditable
_[Boolean][api.type.Boolean]._ If set to `true`, the user can edit the person's information.

##### name
_[String][api.type.String]._ The name of the contact you wish to view.

##### filter
_[Table][api.type.Table]._ Table of string values indicating the items to show within the detail view section for a contact. For example, `filter = { "phone", "email", "birthday" }`. The&nbsp;following values are supported:

* `"phone"`
* `"email"`
* `"address"`
* `"birthday"`
* `"relatedNames"`
* `"socialProfiles"`
* `"instantMessagingProfiles"`

##### listener
_[Function][api.type.Function]._ Listener function to be called when the popup is dismissed. This function is passed an `event` table which contains the following properties:

* `event.name` ([string][api.type.String]) &mdash; Value of `"contact"`.
* `event.type` ([string][api.type.String]) &mdash; Value of either `"pickContact"`, `"viewContact"`, `"newContact"`, or `"unknownContact"`, depending on the popup shown.
* `event.data` ([table][api.type.Table]) &mdash; Table containing data for the selected contact. See [Contact&nbsp;Data](#contactData) below for a list of available data.


### newContact

The following additional properties apply if `params.option` is set to `"newContact"`:

##### data
_[Table][api.type.Table]._ Table containing key/value pairs to pre-fill a new contact's details with. Supported keys include:

* `firstName`, `middleName`, `lastName`
* `organization`, `jobTitle`, `birthday`
* `phoneticFirstName`, `phoneticMiddleName`, `phoneticLastName`
* `prefix`, `suffix`, `nickname`
* `phoneIphone`, `phoneMobile`, `phoneMain`, `phoneHome`, `phoneWork`
* `faxHome`, `faxWork`, `faxOther`, `pager`
* `homeEmail`, `workEmail`
* `homePageUrl`, `workUrl`, `homeUrl`
* `father`, `mother`, `parent`, `brother`, `sister`, `child`
* `friend`, `spouse`, `partner`, `assistant`, `manager`
* `homeStreet`, `homeCity`, `homeState`, `homeZip`, `homeCountry`
* `workStreet`, `workCity`, `workState`, `workZip`, `workCountry`
* `socialFacebook`, `socialTwitter`, `socialFlickr`, `socialLinkedIn`, `socialMyspace`, `socialSinaWeibo`, `socialGameCenter`
* `instantMessagingAim`, `instantMessagingFacebook`, `instantMessagingGaduGadu`, `instantMessagingGoogleTalk`, `instantMessagingICQ`, `instantMessagingJabber`, `instantMessagingMSN`, `instantMessagingQQ`, `instantMessagingSkype`, `instantMessagingYahoo`

##### listener
_[Function][api.type.Function]._ Listener function to be called when the popup is dismissed. This function is passed an `event` table which contains the following properties:

* `event.name` ([string][api.type.String]) &mdash; Value of `"contact"`.
* `event.type` ([string][api.type.String]) &mdash; Value of either `"pickContact"`, `"viewContact"`, `"newContact"`, or `"unknownContact"`, depending on the popup shown.
* `event.data` ([table][api.type.Table]) &mdash; Table containing data for the selected contact. See [Contact&nbsp;Data](#contactData) below for a list of available data.


### unknownContact

The following additional properties apply if `params.option` is set to `"unknownContact"`:

##### performDefaultAction
_[Boolean][api.type.Boolean]._ If set to `true`, tapping/touching a contact's phone number or email will perform the default system action, for example call the contact or show the compose email UI.

##### allowsActions
_[Boolean][api.type.Boolean]._ This specifies whether buttons appear to let the user perform actions such as sharing the contact, initiating a call, or sending a text message.

##### allowsAdding
_[Boolean][api.type.Boolean]._ If set to `true`, the __Add&nbsp;to&nbsp;Existing&nbsp;Contact__ or __Create&nbsp;New&nbsp;Contact__ buttons will be available on the contacts overview screen.

##### alternateName
_[String][api.type.String]._ Alternate name to display instead of the contact's first and last name.

##### message
_[String][api.type.String]._ This string is displayed below `alternateName`.

##### data
_[Table][api.type.Table]._ Table containing key/value pairs to pre-fill an unknown contact's details with. Supported keys include:

* `firstName`, `middleName`, `lastName`
* `organization`, `jobTitle`, `birthday`
* `phoneticFirstName`, `phoneticMiddleName`, `phoneticLastName`
* `prefix`, `suffix`, `nickname`
* `phoneIphone`, `phoneMobile`, `phoneMain`, `phoneHome`, `phoneWork`
* `faxHome`, `faxWork`, `faxOther`, `pager`
* `homeEmail`, `workEmail`
* `homePageUrl`, `workUrl`, `homeUrl`
* `father`, `mother`, `parent`, `brother`, `sister`, `child`
* `friend`, `spouse`, `partner`, `assistant`, `manager`
* `homeStreet`, `homeCity`, `homeState`, `homeZip`, `homeCountry`
* `workStreet`, `workCity`, `workState`, `workZip`, `workCountry`
* `socialFacebook`, `socialTwitter`, `socialFlickr`, `socialLinkedIn`, `socialMyspace`, `socialSinaWeibo`, `socialGameCenter`
* `instantMessagingAim`, `instantMessagingFacebook`, `instantMessagingGaduGadu`, `instantMessagingGoogleTalk`, `instantMessagingICQ`, `instantMessagingJabber`, `instantMessagingMSN`, `instantMessagingQQ`, `instantMessagingSkype`, `instantMessagingYahoo`

##### listener
_[Function][api.type.Function]._ Listener function to be called when the popup is dismissed. This function is passed an `event` table which contains the following properties:

* `event.name` ([string][api.type.String]) &mdash; Value of `"contact"`.
* `event.type` ([string][api.type.String]) &mdash; Value of either `"pickContact"`, `"viewContact"`, `"newContact"`, or `"unknownContact"`, depending on the popup shown.
* `event.data` ([table][api.type.Table]) &mdash; Table containing data for the selected contact. See [Contact&nbsp;Data](#contactData) below for a list of available data.


<a id="contactData"></a>

## Contact Data

The following data is available in the `event` table of the listener function when the popup is dismissed:

* `firstName` ([string][api.type.String])
* `middleName` ([string][api.type.String])
* `lastName` ([string][api.type.String])

* `organization` ([string][api.type.String])
* `jobTitle` ([string][api.type.String])
* `department` ([string][api.type.String])

* `birthday` ([string][api.type.String])
* `anniversary` ([string][api.type.String])
* `otherDate1` ([string][api.type.String]) &mdash; this key is incremented for each "other" entry, for example `otherDate2`

* `phoneticFirstName` ([string][api.type.String])
* `phoneticMiddleName` ([string][api.type.String])
* `phoneticLastName` ([string][api.type.String])

* `prefix` ([string][api.type.String])
* `suffix` ([string][api.type.String])
* `nickName` ([string][api.type.String])

* `phoneIphone` ([string][api.type.String])
* `phoneMobile` ([string][api.type.String])
* `phoneMain` ([string][api.type.String])
* `phoneHome` ([string][api.type.String])
* `phoneWork` ([string][api.type.String])
* `phoneOther1` ([string][api.type.String]) &mdash; this key is incremented for each "other" entry, for example `phoneOther2`

* `picture` ([table][api.type.Table]) &mdash; contains keys `filename` ([string][api.type.String]) and `baseDir` ([userdata][api.type.Userdata])

* `faxHome` ([string][api.type.String])
* `faxWork` ([string][api.type.String])
* `faxOther` ([string][api.type.String])
* `pager` ([string][api.type.String])

* `homeEmail` ([string][api.type.String])
* `workEmail` ([string][api.type.String])
* `otherEmail1` ([string][api.type.String]) &mdash; this key is incremented for each "other" entry, for example `otherEmail2`

* `homePageUrl` ([string][api.type.String])
* `homeUrl` ([string][api.type.String])
* `workUrl` ([string][api.type.String])
* `otherUrl1` ([string][api.type.String]) — this key is incremented for each "other" entry, for example `otherUrl2`

* `father` ([string][api.type.String])
* `mother` ([string][api.type.String])
* `parent` ([string][api.type.String])
* `brother` ([string][api.type.String])
* `sister` ([string][api.type.String])
* `child` ([string][api.type.String])

* `friend` ([string][api.type.String])
* `spouse` ([string][api.type.String])
* `partner` ([string][api.type.String])
* `assistant` ([string][api.type.String])
* `manager` ([string][api.type.String])

* `homeStreet` ([string][api.type.String])
* `homeCity` ([string][api.type.String])
* `homeState` ([string][api.type.String])
* `homeZip` ([string][api.type.String])
* `homeCountry` ([string][api.type.String])

* `workStreet` ([string][api.type.String])
* `workCity` ([string][api.type.String])
* `workState` ([string][api.type.String])
* `workZip` ([string][api.type.String])
* `workCountry` ([string][api.type.String])

* `otherStreet1` ([string][api.type.String]) — this key is incremented for each "other" entry, for example `otherStreet2`
* `otherCity1` ([string][api.type.String]) — this key is incremented for each "other" entry, for example `otherCity2`
* `otherState1` ([string][api.type.String]) — this key is incremented for each "other" entry, for example `otherState2`
* `otherZip1` ([string][api.type.String]) — this key is incremented for each "other" entry, for example `otherZip2`
* `otherCountry1` ([string][api.type.String]) — this key is incremented for each "other" entry, for example `otherCountry2`

* `Facebook` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `gamecenter` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `linkedin` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `GoogleTalk` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `sinaweibo` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `AIM` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `GaduGadu` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `Skype` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `Jabber` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `flickr` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `myspace` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `twitter` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `MSN` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `ICQ` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `facebook` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `QQ` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services
* `Yahoo` ([table][api.type.Table]) — contains `username` ([string][api.type.String]) and `url` ([string][api.type.String]) for certain services


## Example

``````lua
local function onPopupDismiss( event )
	print( "event.name:", event.name )
	print( "event.type:", event.type )

	-- event.data is either a table or nil depending on the option chosen
	print ( "event.data:", event.data )

	-- if there is 'event.data', print its key/value pairs
	if ( event.data ) then
		print( "event.data: {" )

		for k,v in pairs( event.data ) do
			print( k, ":", v )
		end

		print( "}" )
	end
end

local pickContactOptions =
{
	option = "pickContact",
	hideDetails = true,
	performDefaultAction = true,
	filter = { "phone", "email", "birthday" },
	listener = onPopupDismiss
}
native.showPopup( "addressbook", pickContactOptions )
``````
