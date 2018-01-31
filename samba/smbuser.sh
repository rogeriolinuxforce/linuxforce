#!/bin/bash

LISTA="$(getent passwd | awk -F: '$3 >= 1000 {print $1}' | grep -v nobody)"

for user in $LISTA
    do
        samba-tool user add $user 123Mudar --home-drive=H: --script-path=logon.vbs --home-directory=\\\\fileserver\\$user --profile-path=\\\\fileserver\\profiles\\$user
done
