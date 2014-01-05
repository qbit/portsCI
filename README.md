portsCI
=======

Continuous integration for the OpenBSD ports system

### Goal ###

Portable daemon with minimal requirements (runs on OpenBSD base) that
monitors the OpenBSD ports system for changes then builds said changes.

### Planned Features ###

* Automated reporting of errors.
* Re-queueing of errored ports - only rebuild once updated.
* Status page with pretty info!
