# Server Setup

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Peanut Labs, server
> __See also__          [peanutlabs.*][plugin.peanutlabs]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Peanut Labs requires that you integrate their <nobr>server-side</nobr> callback and store the data from the callback in a database on your server. You can then retrieve the data from the app to verify if a user earned a reward.

The [examples](#examples) below are just a guideline to getting started. There are numerous ways to implement this functionality and naturally we can't list them all. Please see the Peanut Labs [server callback documentation](http://peanut-labs.github.io/publisher-doc/) for further information.


<a id="examples"></a>

## Examples

##### PHP Callback

``````php
<?php

$db = new mysqli('localhost', 'YOURDATABASEUSER', 'YOURDATABASEUSERPASSWORD', 'YOURDATABASE');
if (!$db) {
	// Can't connect to the database
	echo( 0 );
}

define("TABLE_NAME", "peanutlabs"); // Database table name (change for your needs)

define("APPLICATION_KEY", 'Your_Application_Key'); // Your Peanut Labs application key
define("TRANSACTION_KEY", 'Your_Transaction_Key'); // Your Peanut Labs transaction key
define("PUBLISHER_ID", "Your_App_ID");  // Your Peanut Labs app ID

$transactionHash = $_GET['txnHash'];
$oidHash = $_GET['oidHash'];

$cmd = $_GET['cmd'];
$endUserId = $_GET['endUserId']; // 'sample_user_id';
$status = $_GET['status']; // Transaction status
$surveyId = $_GET['offerInvitationId']; // Survey ID
$currencyAmount = $_GET['currencyAmt'];
$transactionId = $_GET['transactionId'];
$publisherCut = $_GET['amt'];

$myTransactionHash = md5($transactionId . TRANSACTION_KEY);
$myOidHash = md5($surveyId . APPLICATION_KEY);

if ($myTransactionHash == $transactionHash) {
	// Transaction hash is valid
} else {
	// Invalid transaction hash
	//echo( "invalid transation hash - " . $myTransactionHash . " " . $transactionHash );
	echo( 0 );
	exit;
}

if ($myOidHash == $oidHash) {
	// OID hash is valid
} else {
	// Invalid OID hash
	//echo( "invalid OID hash" );
	echo( 0 );
	exit;
}

// Update DB with $publisherCut
// Escape the strings to prevent SQL injection attacks
$kEndUserId = $db->real_escape_string($endUserId);
$kStatus = $db->real_escape_string($status);
$kSurveyId = $db->real_escape_string($surveyId);
$kCurrencyAmount = (int)$db->real_escape_string($currencyAmount);
$kTransactionId = $db->real_escape_string($transactionId);
$kPublisherCut = (float)$db->real_escape_string($publisherCut);

// Set the values to insert into the database
$now = time();
$query = $db->prepare("INSERT INTO " . TABLE_NAME . " (userId, status, surveyId, currencyAmount, transactionId, publisherCut, timestamp) VALUES ( ?, ?, ?, ?, ?, ?, ?);" );
$query->bind_param("sssisd", $kEndUserId, $kStatus, $kSurveyId, $kCurrencyAmount, $kTransactionId, $kPublisherCut, $now);

// Execute the query
$result = $query->execute();
if(!$result) {
	//echo( "DB query failed" );
	echo(0);
	exit;
}

echo(1);
?>
``````

##### PHP Get Result

``````php
<?php

$db = new mysqli('localhost', 'YOURDATABASEUSER', 'YOURDATABASEUSERPASSWORD', 'YOURDATABASE');
if (!$db) {
	// Can't connect to the DB
	trigger_error( "Cannot connect to the DB" );
}

define("TABLE_NAME", "peanutlabs"); // Database table name (change for your needs)

define("APPLICATION_KEY", 'Your_Application_Key'); // Your Peanut Labs application key
define("TRANSACTION_KEY", 'Your_Transaction_Key'); // Your Peanut Labs transaction key
define("PUBLISHER_ID", "Your_App_ID");  // Your Peanut Labs app ID

// Get the user ID passed to the GET call, for example "http://yoursite.com/getUser.php?userId=User_Id_Here"
$kEndUserId = $db->real_escape_string( $_GET['userId'] );

// Create an array to hold the rows
$rows = array();

// Get the SQL column
$queryString = "SELECT * FROM peanutlabs WHERE userId = '" . $kEndUserId . "' ORDER BY timestamp DESC LIMIT 1";

$result = $db->query( $queryString );
if ($result) {
	// Fetch associative array
	$i = 1;
	while ($row = $result->fetch_assoc()) {
	    $rows[$i++] = $row;
	}
	$result->free();
	// Close connection
	$db->close();
	// Return the data
	echo json_encode($rows);		
} else {
	trigger_error('Query failed: ' . $queryString . ' Error: ' . $db->error, E_USER_ERROR);
}
?>
``````

##### SQL

``````sql
CREATE TABLE IF NOT EXISTS `peanutlabs` (
	`id` mediumint(9) NOT NULL AUTO_INCREMENT,
	`userId` text COLLATE utf8_unicode_ci NOT NULL,
	`status` char(1) COLLATE utf8_unicode_ci NOT NULL,
	`surveyId` text COLLATE utf8_unicode_ci NOT NULL,
	`currencyAmount` int(11) NOT NULL,
	`transactionId` text COLLATE utf8_unicode_ci NOT NULL,
	`publisherCut` float NOT NULL,
	`timestamp` int(11) NOT NULL,
	UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;
``````
