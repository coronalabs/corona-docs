# ResultCode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, ResultCode
> __See also__          [userProgressSave][plugin.steamworks.event.userProgressSave]
>                       [userProgressUpdate][plugin.steamworks.event.userProgressUpdate]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Unique integer identifier defined by Steam used to indicate the result of an operation.

<div class="inner-table">

	Integer ID	Description
--------------	--------------------------------------------------------------------------------
			 1	Success
			 2	Generic failure
			 3	No network connection
			 5	Password/ticket invalid
			 6	Same user logged in elsewhere
			 7	Protocol version is incorrect
			 8	Parameter is incorrect
			 9	File not found
			10	Called method is busy; action not taken
		    11	Called object was in an invalid state
		    12	Name is invalid
		    13	E-mail is invalid
		    14	Name is not unique
		    15	Access is denied
		    16	Operation timed out
		    17	Banned via Valve Anti-Cheat
		    18	Account not found
		    19	Steam ID invalid
		    20	Requested service is currently unavailable
		    21	User is not logged on
		    22	Request is pending
		    23	Encryption or decryption failed
		    24	Insufficient privilege
		    25	Limit exceeded
		    26	Access has been revoked
		    27	License or guest pass has expired
		    28	Guest pass already redeemed by account
		    29	Request is a duplicate; action has already occurred; ignored
		    30	All games in guest pass redemption request are already owned by user
		    31	IP address not found
		    32	Failed to write to the data store
		    33	Failed to acquire access lock for this operation
		    34	Logon session replaced
		    35	Connection failed
		    36	Handshake failed
		    37	I/O failure
		    38	Remote disconnect
		    39	Failed to find the shopping cart request
		    40	Blocked; user didn't allow it
		    41	Target is ignoring sender
		    42	Nothing matching the request
		    43	Account disabled
		    44	Service is not accepting content changes right now
		    45	Account value/feature isn't available
		    46	Action allowed by administrator
		    47	Version mismatch in content transmitted within Steam protocol
		    48	Current CM can't service the user making the request
		    49	Already logged in elsewhere; cached credential login has failed
		    50	Already logged in elsewhere; must wait
		    51	Long running operation was suspended
		    52	Operation canceled by user
		    53	Operation canceled due to data corruption
		    54	Operation canceled due to not enough disk space
		    55	Remote call or IPC call failed
		    56	Password could not be verified because it was unset server side
		    57	External account is not to a Steam account
		    58	PSN (PlayStation Network) ticket was invalid
		    59	External account is already linked to another account
		    60	Sync conflict between local and remote files
		    61	Illegal password
		    62	New value is the same as old value
		    63	Login denied due to 2 factor authentication failure
		    64	Cannot use old password
		    65	Login authorization code invalid
		    66	Login denied due to 2 factor authentication failure; no mail sent
		    67	Hardware not capable of IPT (Identity Protection Technology)
		    68	IPT (Identity Protection Technology) initialization error
		    69	Denied due to parental control restrictions
		    70	Facebook query returned an error
		    71	Login denied due to expired authorization code
		    72	IP login restriction failed
		    73	Account locked down
		    74	Logon denied; verification e-mail required
		    75	No matching URL
		    76	Bad response
		    77	Password re-entry required
		    78	Value is out of range
		    79	Unexpected error
		    80	Service is disabled
		    81	Invalid submission to CEG server
		    82	Device is not allowed to perform this action
		    83	Region locked
		    84	Temporary rate limit exceeded
		    85	2 factor authentication required
		    86	Attempted to access deleted item
		    87	Login failed; throttled response to possible attacker
		    88	2 factor authentication mismatch
		    89	Activation code mismatch for 2 factor authentication
		    90	Account associated with multiple partners
		    91	Data not modified
		    92	Account does not have a mobile device associated with it
		    93	Time is out of sync
		    94	SMS code failure
		    95	Account limit exceeded
		    96	Too many changes to this account
		    97	Too many changes to this phone
		    98	Cannot refund payment; must use wallet
		    99	Cannot send e-mail
		   100	Can't perform operation till payment has settled
		   101	Valid captcha required
		   102	Game server login token has been banned
		   103	Game server owner denied
		   104	Invalid item type
--------------	--------------------------------------------------------------------------------

</div>
