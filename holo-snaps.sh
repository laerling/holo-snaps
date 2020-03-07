# holo-snaps - Provision linux snaps with holo
# Copyright (C) 2020  lærling <laerling@posteo.de>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


#!/usr/bin/bash

action="$1"
case "$action" in

	info)
		echo "MIN_API_VERSION=3"
		echo "MAX_API_VERSION=3"
		;;

	scan)
		for file in "$HOLO_RESOURCE_DIR"/*; do
			echo "ENTITY: snap list: $file"
			echo "SOURCE: $HOLO_RESOURCE_DIR/$file"
			echo "found in: $HOLO_RESOURCE_DIR/$file"
			echo "ACTION: Install snaps from"
		done
		;;

	diff)
		snaplist="$HOLO_RESOURCE_DIR/$2"
		for snap in $(cat "$snaplist"); do
			installed=$(snap info "$snap" | grep '^installed:' \
				| sed -e 's/installed:[[:space:]]\+//;s/[[:space:]].\+//')
			stable=$(snap info "$snap" | grep '^  stable:' \
				| sed -e 's/  stable:[[:space:]]\+//;s/[[:space:]].\+//')
			echo
			echo "Snap '$snap':"
			echo "Installed:           $installed"
			echo "Stable (snap store): $stable"
		done
		;;

	apply | force-apply)
		snaplist="$HOLO_RESOURCE_DIR/$2"
		for snap in $(cat "$snaplist"); do
			snap install "$snap"
		done
		;;

esac
