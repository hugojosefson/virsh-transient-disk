# @hugojosefson/virsh-transient-disk

[![Build Status](https://travis-ci.org/hugojosefson/virsh-transient-disk.svg?branch=master)](https://travis-ci.org/hugojosefson/virsh-transient-disk)
[![npm page](https://img.shields.io/npm/v/@hugojosefson/virsh-transient-disk.svg)](https://www.npmjs.com/package/@hugojosefson/virsh-transient-disk)
[![License MIT](https://img.shields.io/npm/l/@hugojosefson/virsh-transient-disk.svg)](https://tldrlegal.com/license/mit-license)
[![SemVer 2.0.0](https://img.shields.io/badge/SemVer-2.0.0-lightgrey.svg)](http://semver.org/spec/v2.0.0.html)
[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)

Converts a base VM image XML definition from `virsh(1)`, to a similar
definition with these modifications:

* Sets a new UUID.
* Sets the name as specified in CLI argument `--name`.
* Sets the disk as transient.

## Usage

No installation needed, thanks to `npx`.

```bash
virsh -c qemu:///system dumpxml dev-dispvm \
  | npx @hugojosefson/virsh-transient-disk --name new-transient \
  > new-transient.xml

virsh -c qemu:///system define new-transient.xml
```

## See also

* libvirt Domain XML format:
https://libvirt.org/formatdomain.html#elementsDisks
