#!/bin/sh

IFS=","

echo "" >/etc/ssh/authorized_keys

for k in $ALLOWED_KEYS; do
echo "$k" >> /etc/authorized_keys
done

exec "$@"
