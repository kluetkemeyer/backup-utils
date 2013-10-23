backup-utils
============

Einfaches Linux-Tool (basierend auf dd und g[un]zip) zum schnellen 
generieren und wiederherstellen von einfachen Backups.

Syntax:
backup-utils.sh -h|--help
	Zeigt die Hilfe an
	
backup-utils BACKUP targetDevice imageFile
	Erstellt ein Abbild von targetDevice und legt dieses unter imageFile 
	ab.
	
backup-utils RESTPORE targetDevice imageFile
	Stellt das Abbild imageFile wieder her und schreibt dieses auf 
	targetDevice.
	
targetDevice kann hierbei sowohl eine Datei sein, die gesichert werden 
soll, also auch ein Laufwerk oder eine Partition (z.B. /dev/sda). Das
Abbild imageFile muss natürlich in jedem Fall eine Datei sein (bei
BACKUP wird diese erstellt, sofern sie zuvor nicht vorhanden ist).

Das Programm braucht natürlich Lese- bzw. Schreibzugriff auf die
jeweiligen Dateien/Laufwerke/Partitionen.


Beispiel
========
Backup erstellen von Partition 1 auf Laufwerk sdc
	
	sudo ./backup-utils BACKUP /dev/sdc1 /tmp/backup.img.gz
	
Backup wiederherstellen
	
	sudo ./backup-utils RESTORE /tmp/backup.img.gz /dev/sdc1
	
	 
