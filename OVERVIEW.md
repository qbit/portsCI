portsCI
=======

### Overview ###

portsCI is a set of tools built for CI style testing on the OpenBSD ports tree.

The portsCI system should receive notifications of updated ports
(@OpenBSD_ports on twitter?), queue a build for said update, and report the
status of a full dpb using that port as the plist option (-P for dpb).

All packages should be purged and the ports tree should be updated prior to
running the update.

Must be built using in-base tools. Perl?

### Queue ###

The queue should be persistant, meaning a reboot to the system will allow
building to be resumed once back up.

Once a build completes without failure remove it from queue.

Building should not resume unless a port has been modified.
