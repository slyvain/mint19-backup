#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

backup_crontab()
{
    crontab -l > "${DUMPDIR}/crontab.bak"
}