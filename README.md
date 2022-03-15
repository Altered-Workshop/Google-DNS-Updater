# Google-DNS-Updater
Bash script to update Google's Dynamic DNS records and send an email when done.

If Google provides your domain name, you can use this script to update the DNS record.
Check out Google's documentation on setting up dynamic DNS here: https://support.google.com/domains/answer/6147083.

My script leverages the Google provided API to update the DNS record. It can be run one off in the command line or as a cron job.
At this time, it requires <a herf="https://mailutils.org"> maillutils </a> to be correctly configured on your system. The script send an email upon completion/change of the IP.txt file.  

After cloning the repository, you will need to set the configuration file.
