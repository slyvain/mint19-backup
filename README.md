# Linux Mint 19 Backup

Backup my personnal settings in Linux Mint 19 in case I need to set up a new machine.
This script has been built with my [Mint 19 Post Install](https://github.com/slyvain/mint19-post-install) script in mind.

### Disclaimer:
This script suits **my needs** but probably not yours.
You are free to use it and modify it but know that you run this script at your own risk! 

## Running the script
The script should be executed as the current logged-in user (no sudo):
```shell
./mint19-backup.sh
```

## What it does
It backups the following settings:
* Crontab
* Cinnamon Desktop
* My favorite wallpapers
* App configs (Plank and Transmission)

It also encrypts some private data I need for my `Mint 19 Post Install` script.
For this, the script will ask for a passphrase. You can skip that part by removing the two following lines in the `mint19-backup.sh` file.
```shell
source "${0%/*}/encrypt_data.sh"
backup_private_data
```