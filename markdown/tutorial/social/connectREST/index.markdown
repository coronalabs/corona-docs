
# Connecting to REST API Services

Using CORONA_CORE_PRODUCT, you can connect to various online services to get data into your app. To accomplish this, a popular option is __REST__ (or&nbsp;RESTful) APIs which are based on standard HTTP protocols and are generally easy to authenticate.


## REST Overview

Many services offer their data via REST and you can use the standard HTTP "verbs" to access that data:

* `GET` &mdash; Used to "get" (fetch) data.
* `POST`/`PUT` &mdash; Used to send data to the server.
* `DELETE` &mdash; Used to remove data (if&nbsp;permitted).

REST uses standard HTTP URLs to define the API. For instance, with Twitter, you could access the following with a `GET` request to fetch a list of a user's friends:

``````
https://api.twitter.com/1.1/friends/list.json
``````

Let's inspect this in more detail:

* Most services run their APIs over a secure protocol (`https://`) which is followed by the host name.

* Following the host name is commonly the API version&nbsp;&mdash; in this case `/1.1` indicates that this is version `1.1` of the API. This allows services to change their API definitions to add/update features or change data without breaking older apps that utilize the previous version.

* Following this is typically the category of functionality. In this example, all of Twitter's "friends" APIs are grouped under the `/friends` family.

* Finally, the specific `/list` API will fetch a list of the current user's friends, conveniently formatted in JSON which is easily compatible with CORONA_CORE_PRODUCT (alternatively,&nbsp;some services allow you to request XML data by specifying `.xml` instead of&nbsp;`.json`).


## Authentication

Most REST APIs require some form of verification or authentication, in particular if you're trying to add or update data. Authentication can occur in various ways, for example by passing the username and password as part of the domain name:

``````
https://username:password@api.yoursite.com/someapi/dosomething.json
``````

In this example, the `username:password` method is a shortcut to using a headers table. Sometimes the username and password will be referred to as the "API&nbsp;Key" and "secret" and they may need to be encoded in some fashion such as [MD5][api.library.crypto].

An alternate method is to use a __headers__ table, discussed in more detail below.


## Making API Calls

Your REST API calls are made via [network.request()][api.library.network.request]. For this API, you need to provide a URL, an HTTP "verb", a callback function to handle the completed request, and an optional table of information in which to handle headers and data passed to the server.

### Basic Request

Let's look at a simple example using basic authentication (no&nbsp;headers):

``````lua
local json = require( "json" )

local function handleResponse( event )

	if not event.isError then
		local response = json.decode( event.response )
		print( event.response )
	else
		print( "Error!" )
	end

	return
end
 
network.request( "https://username:password@api.yourservice.com/users/friends.json", "GET", handleResponse )
``````

### Headers

Alternatively, if your service can't use basic authentication as part of the URL, you need to set up __headers__:

``````lua
local json = require( "json" )
local mime = require( "mime" )

local function handleResponse( event )

	if not event.isError then
		local response = json.decode( event.response )
		print( event.response )
	else
		print( "Error!" )
	end
	
	return
end

local headers = {}
headers["Authentication"] = mime.b64("username:password")

local params = {}
params.headers = headers

network.request( "https://api.yourservice.com/users/friends.json", "GET", handleResponse, params )
``````


## Conclusion

Every service will have its own methods to call, so you need to research the specific API calls and learn what HTTP verbs are expected, as well as which parameters. Also, each service seems to implement authentication a little differently, but this tutorial should get you started on using <nobr>REST-based</nobr> APIs from various providers.
