curl 'https://api.twilio.com/2010-04-01/Accounts/$apikey/Messages.json' -X POST \
--data-urlencode 'To=+$myphone' \
--data-urlencode 'From=+twiliophone' \
--data-urlencode 'Body=Hey ya' \
-u $apikey:$apivalue