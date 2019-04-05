# Docker Ghidra

A dockerized version of the NSA's reverse engineering tool. Made for those, who don't want to directly run it on their systems :o)

## Usage

```bash
ACCESS_PORT=2200
KEYS="ssh-ed25519 AAAA<snip>pWvr some-key,ssh-rsa AAAA<snip>gYoc= another-key"
docker run -d --name ghidra -p ${ACCESS_PORT}:22 -e AUTHORIZED_KEYS="${KEYS}" jonasprogrammer/ghidra

# Connect (with X11 forwarding)
ssh -X -p ${ACCESS_PORT} localhost

# Connect (with copmression)
ssh -XC -p ${ACCESS_PORT} remote-hsot
```

## Variables

Variable | Function
---------+----------
`AUTHORIZED_KEYS` | Comma (`,`) separated list of ssh public keys to allow access.
