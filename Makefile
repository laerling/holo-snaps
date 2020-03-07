.PHONY: install uninstall

install:
	sudo install -d -m 0755 '/usr/share/holo/holo-snaps'
	sudo install -D -m 0755 holo-snaps.sh '/usr/lib/holo/holo-snaps'
	sudo install -D -m 0644 holorc '/etc/holorc.d/50-holo-snaps'

uninstall:
	sudo rm -f '/etc/holorc.d/50-holo-snaps'
	sudo rm -f '/usr/lib/holo/holo-snaps'
	sudo rm -rf '/usr/share/holo/holo-snaps'
