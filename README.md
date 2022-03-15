# Google-DNS-Updater

## Use
Bash script to update Google's Dynamic DNS records and send an email when done.
If Google provides your domain name, you can use this script to update the DNS record.
Check out Google's documentation on setting up dynamic DNS here: https://support.google.com/domains/answer/6147083.

## How it works
My script leverages the Google provided API to update the DNS record. It can be run one off in the command line or as a cron job.
At this time, it requires mailutils (https://mailutils.org) to be correctly configured on your system. The script send an email upon completion/change of the IP.txt file.  

This is my first github repository and first share of my code with the world. Please be kind but feedback and forks are always welcome. 
If for some reason, you found this rather useful, a do enjoy a cold beer or hot coffee: [![coffee](https://www.buymeacoffee.com/assets/img/custom_images/black_img.png)](https://www.buymeacoffee.com/alteredworkshop)

## Setup
After cloning the repository, you will need to set the configuration file. Navigate to where you clone the repository and make the following modifcations:

* Rename the example_config.sh to config.sh

```shell
mv example_config.sh config.sh
  ```
* Open the config file and replace the curly brackets {} and anything in between with your system specific values.
```shell
nano config.sh
```
``` shell
# Google DNS/Domain Hosting
Google_DNS_User="{DDNS USER NAME}" #Google provided username for DDNS
Google_DNS_Pass="{DDNS PASSWORD}" #Google provided password for DDNS
Google_Domain="{DOMAIN NAME}" #Domain name

#Email
eMail="{eMail Address}"

#Path to "Last IP.txt"
IPtxtPath="{PATH TO}/IP.txt"
```

With the configuration complete, run the script with
```shell
bash GoogleDNSUpdate.sh
```
Or place the script in a cron job.

## Plans for improvment
* Set email & command line alerts as optional
* Improve managment of IP.txt
