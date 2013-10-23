#!/bin/bash

prg=$0

function plotHelp() {
	echo "Backup-Utils v1.0 by Kilian Luetkemeyer"
	echo "Syntax:"
	echo "$prg -h"
	echo "$prg --help"
	echo "$prg BACKUP|RESTORE targetDevice imageFile"
	if test $# -gt 0 && test $1 -gt 0; then
		echo "This program is designed to create and restore an image file for a specific device.";
	fi
}

if test "$#" -eq "1"; then
	case "$1" in
		"-h"|"--help")
			plotHelp 1
			exit 0
	esac
fi

if test "$#" -ne "3"; then
	echo "ERROR: Invalid argument count!" 1>&2
	plotHelp 0 1>&2
	exit 1
fi

op="$1"
target="$2"
image="$3"

case "$op" in
	"BACKUP")
		dd if="$target" | gzip > "$image"
		;;
		
	"RESTORE")
		gunzip -c "$image" | dd of="$target"
		;;
		
	*)
		echo "Invalid operation!" 1>&2
		plotHelp 0 1>&2
		exit 1
		;;
esac

exit 0
