# Methoden und Kommandos zur Hardwareüberwachung

## Programme zur Hardwareerkennung
- uname : Anzeigen von Kernel-Daten; u.a. Kernel-Version. uname -a liefert alle
  möglichen Daten.
- lspci : Anzeigen von PCI-Devices
- lsblk : Anzeigen von Block-Devices; Festplatten, Laufwerke (auch virtuell),
  Partitionen
- lscpu : Infos zur CPU - Architektur, Kerne usw.
- lshw : Allgemeine Hardware inkl. Input-Devices (Tastatur, Maus etc.)
- lsusb : Listing von USB-Devices
- (sudo) dmesg : liefert Kernelmeldungen; sehr "speziell", kann aber nützlich
  sein, um z.B. USB-Device-Namen herauszufinden.

## Das Proc Filesystem
Das Proc-Filesystem wird vom Kernel zur Verfügung gestellt und liefert
(aktuelle) Hardware-Information über den Rechner in Datei-Format. Dies wird vom
Kernel als eigenes Dateisystem behandelt (procfs). Zu finden sind diese
Informationen im "Verzeichnis" /proc.
Dort befinden sich neben einigen Dateien, die Übersichts-Information über das
System enthalten (z.B. /proc/cpuinfo, /proc/meminfo) auch viele nummerierte
Verzeichnisse, dessen Nummern den Prozess-IDs einzelner Prozesse entsprechen. In
diesen Verzeichnissen können dann Informationen über denjenigen Prozess
abgefragt werden.
Die Daten darin sind meist sehr kryptisch und technisch; Informationen zu den im
Proc-FS enthaltenen Daten lassen sich gewinnen z.B. über `man 5 proc` (Kategorie
5 explizit angegeben bei der Suche nach Proc-Dokumentation).

