#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly HOMEDIR=$( getent passwd "$(logname)" | cut -d: -f6 )
readonly DUMPDIR="${0%/*}/dumps"

main()
{
    shopt -s nullglob
    local confScriptList=( ${0%/*}/backup-*.sh )

    # Run all config scripts
    for script in "${confScriptList[@]}"; do
        source "$script"
        config=$( sed -e 's/.*backup-\(.*\).sh/\1/' <<< "${script}" )
        
        backup_"${config}"
    done
}

# Make sure the script is not ran by root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run as root"
    exit 1
else
    main "$@"
fi

exit 0