#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

backup_plank()
{
    dconf dump /net/launchpad/plank/docks/ > "${DUMPDIR}/plank-settings.bak"
}

backup_transmission()
{
    cp "${HOMEDIR}/.config/transmission/settings.json" "${DUMPDIR}/transmission.bak" 
}

backup_apps()
{
    backup_plank
    backup_transmission
}