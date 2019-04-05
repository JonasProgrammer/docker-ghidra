#!/bin/sh

IFS=","

echo "" >/etc/ssh/authorized_keys
chmod 600 /etc/ssh/authorized_keys

for k in $AUTHORIZED_KEYS; do
echo "$k" >> /etc/authorized_keys
done

exec "$@"
