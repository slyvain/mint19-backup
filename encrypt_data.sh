#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

encrypt_file()
{
    echo "Enter the passphrase for private data encryption:"
    echo "(check Keeweb if necessary)"
    read -r userinput
    if [[ -z ${userinput} ]]; then
        echo "Error: No passphrase entered! Exiting..."
        exit 1
    else
        gpg --batch --passphrase "${userinput}" -c "${0%/*}/dumps/private.bak"
    fi
}

backup_private_data()
{
    if [[ -f "${DUMPDIR}/private.bak.gpg" ]]; then
        echo "Private data file already encrypted."
        echo "Overwrite? [y-n]"
        read -r userinput
        if [[ "y" = "${userinput}" ]]; then
            rm "${DUMPDIR}/private.bak.gpg"
            encrypt_file
        elif [[ "n" != "${userinput}" ]]; then
            echo "Error: You typed '${userinput}', pay attention! Exiting..."
            exit 1
        fi
    else
        encrypt_file
    fi
}