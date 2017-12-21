# Docker Quagga
This solves a problem no one has. No one reasonable, at least.

The goal of this is to set up advertising for the IP in an iBGP environment, enabling
the Docker host to advertise an IP to iBGP neighbors. It's not intended to modify the
host's routing tables, nor present itself as a gateway. It's purely to join the BGP
fabric.

## This is a work in progress.
While it does bring up `zebra` and `bgpd` daemons, it does not currently do much else.
