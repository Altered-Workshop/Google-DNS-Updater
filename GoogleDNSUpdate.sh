#!/bin/bash
# Script to update Google domain service with Dynamic IP

source config.sh #Import configuration
 
# Define working variables
currentIP=$(curl -s -k https://domains.google.com/checkip) # Import current WAN IP address from Google
lastIPtxt=$IPtxtPath #Path to "IP.txt" file to store current WAN IP address

if ! test -f "$lastIPtxt"
then
    touch "$lastIPtxt"
    echo "empty" > "$lastIPtxt"
fi
lastIP=$(<$lastIPtxt) # Import txt file holding last known WAN IP address

if [ $currentIP != $lastIP ] # Compare IP addresses
then  # Only run script if the last IP address and current IP are different
    echo "$currentIP" > "$lastIPtxt" # Write the current WAN IP to the txt file
# Update Google DNS Record
    URL="https://${Google_DNS_User}:${Google_DNS_Pass}@domains.google.com/nic/update?hostname=${Google_Domain}" #Google API call
    echo "IP.txt updated from $lastIP to $currentIP" | mail -s "IP Updated" $eMail # Send email with txt/IP update
    echo "IP.txt updated from $lastIP to $currentIP" # Print results if ran in terminal
    curl -s $URL
    echo
else
    echo "Update Not Needed"
fi
