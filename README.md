# virsh-transient-disk

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
