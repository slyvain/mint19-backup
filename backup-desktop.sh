#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

backup_desktop()
{
    # General config for Cinnamon
    dconf dump /org/cinnamon/ > "${DUMPDIR}/cinnamon.bak"

    # Personnal settings for displaying the clock
    cp "${HOMEDIR}/.cinnamon/configs/calendar@cinnamon.org/11.json" "${DUMPDIR}/cinnamon-calendar.bak"

    # Personnal settings for displaying the menu button
    cp "${HOMEDIR}/.cinnamon/configs/menu@cinnamon.org/1.json" "${DUMPDIR}/cinnamon-menu.bak"

    # Some of the wallpapers I like
    tar -czf "${DUMPDIR}/wallpapers.tar.gz" --directory "${HOMEDIR}/Pictures/Wallpapers/" .
}
