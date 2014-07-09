#!/bin/sh
#
# usage:  import-cert.sh remote.host.name [port]
#
# Use the folowin to list installed
# certutil -d sql:$HOME/.pki/nssdb -L
#
# Must install those first:
# sudo apt-get install libnss3-tools
# sudo apt-get install curl
#
REMHOST=$1
REMPORT=${2:-443}
exec 6>&1
exec > $REMHOST
echo | openssl s_client -connect ${REMHOST}:${REMPORT} 2>&1 |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "$REMHOST" -i $REMHOST 
exec 1>&6 6>&-