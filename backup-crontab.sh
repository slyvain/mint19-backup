#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

backup_crontab()
{
    crontab -l > "${DUMPDIR}/crontab.bak"

    #replace my email address with a default value
    sed -in-place "s/^MAILTO=\(.*\)$/MAILTO=default@gmail.com/g" "${DUMPDIR}/crontab.bak"
}