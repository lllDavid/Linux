# Aufbau des Linux-Betriebssystems
Linux, erstellt nach dem Vorbild UNIX, ist ein modernes Multitasking-
Multi-User-System:
- Multitasking bedeutet, dass mehrere Prozesse (Programme + Daten im Speicher)
  gleichzeitig ablaufen können
- Multiuser lässt mehrere Benutzer gleichzeitig am System arbeiten. Damit dies
  möglich ist, muss es entweder mehrere Terminals am Rechner/Betriebssystem
  geben (Client/Server-Architektur z.B.) oder man muss eine Möglichkeit bieten,
  sich über das Netz einloggen zu können (z.B. openssh-server).
Probleme ergeben sich dann aber bei gleichzeitigem Zugriff auf eine Datei,
Gerät, den Arbeitsspeicher, die Rechenleistung des Prozessors etc.
Dazu ist ein genügend ausgereiftes Betriebssystem notwendig!

## Systemarchitektur
Das zentrale "Bauteil" des Linux-Systems ist der Betriebssystem-Kern, auch
Kernel genannt. Er trennt die Hardware von den Anwender-Programmen; nichts
geschieht in diesen Programmen, ohne dass der Kernel davon weiß.
Die Interaktion mit der Hardware wird deshalb realisiert über sogenannte System
Calls; die Anwenderprogramme rufen also den gewünschten System Call des
Betriebssystems auf, der dann die tatsächliche Interaktion mit der Hardware
vollführt.
Bsp: Programm will Text auf dem Bildschirm ausgeben -> System Call ans System ->
System bringt den Text auf die Hardware (Bildschirm).
Damit das Betriebssystem weiß, wie es die Hardware anzusprechen hat, bedient es
sich der Treiber für das jeweilige Gerät.
![Image](linux_sysaufbau.gif)
Ursprünglich war nun der Betriebssystemkern einer "monolithischen" Philosophie
anhängig: Treiber und Funktionen wurden fest in den Kernel einkompiliert. Mit
der Zeit hat sich das gewandelt und man benutzt eine hybride Strategie zwischen
monolithischem und modularem Kern. Elementare Treiber sind weiter fest im Kern
vorhanden, während andere "bei Bedarf" geladen werden können.
Ein spezielles Anwenderprogramm ist bekanntlich die Shell, die das wesentlich
funktionsdichtere Analog zu COMMAND.COM oder CMD.EXE auf Windows darstellt.
Die Shell (bash, fish, zsh etc.) stellt eine Eingabeaufforderung zur Verfügung,
mit der sich weitere Programme und Funktionen in fortgeschrittener Weise
verwenden lassen.

# Ablauf des Systemstarts - das Init-System
Sobald der Kernel beim Systemstart geladen ist, startet er als ersten Prozess
das "Init-System". In der Vergangenheit war dies immer das sogenannte
"Init-V-System"; nun kommt aber bei den allermeisten Distributionen __systemd__
als Init-System zum Einsatz.
Systemd wird, wie üblich, durch diverse Textdateien konfiguriert, wobei systemd
selbst ein kompiliertes Programm ist (im Vgl. zum damaligen Init-V, welches aus
zahlreichen Shell-Scripts bestand.

## Systemstart
Ein typischer Systemstart läuft nun so ab:
- Bootmanager (GRUB) lädt und startet den Kernel
- Der Kernel startet den Prozess __systemd__
- Evtl. noch offene Boot-Optionen gibt der Kernel nun an systemd weiter
- systemd wertet die Konfigurationsdateien aus (in `/lib/systemd` und
  `/etc/systemd` aus, initialisiert die dort angegebenen Dienste (z.B. Netzwerk,
  Grafisches System)
- Login-Aufforderung

Systemd ist also der erste laufende Prozess, der alle anderen Dienste oder
Prozesse direkt oder indirekt (durch seine Subprozesse) startet. Umgekehrt ist
systemd natürlich auch der allerletzte laufende Prozess direkt vor dem
Herunterfahren und kümmert sich um die korrekte Beendigung aller laufenden
Prozesse.

## System-Initialisierung (vierter Punkt oben):
- Systemvariablen initialisiert (Hostname, Domainname)
- /proc-Dateisystem und andere temporäre Dateisysteme werden initialisiert
- Datum, Uhrzeit, Tastaturlayout einstellen
- `udev`-System starten, welches verschiedene Gerätedateien in `/dev`
  bereitstellt
- Dateisysteme überprüfen; Boot-Partition korrekt einbinden
- weitere Partitionen der Festplatte(n) korrekt einbinden
- Netzwerkfunktionen initialisieren.

## Grundsätzliche Steuerung von systemd:
Am Beispiel des SSH-Daemons (als root):
- `systemctl start sshd` - SSH-Daemon starten
- `systemctl stop sshd`  - SSH-Daemon stoppen
- `systemctl restart sshd` - SSH-Daemon neu starten
- `systemctl reload sshd` - Konfiguration neu einlesen
- `systemctl status sshd` - Status abrufen

- `systemctl enable sshd` - SSHD dauerhaft aktivieren
- `systemctl disable sshd` - SSHD dauerhaft deaktiveren

- `systemctl` Liste aller Prozesse, die von systemd überwacht werden

- `systemctl list-units --type=target` - listet alle "Ziel-Zustände" auf, die
  von systemd erreicht werden sollen (wie konfiguriert in den entsprechenden
  Dateien

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

## Logging (Syslog und journal)
Ausführliche Logdateien zum System-Zustand inkl. Programm-Meldungen findet man
im Verzeichnis `/var/log`. Dort schreibt der `rsyslogd` die entsprechenden
Meldungen in verschiedene "Sparten"-Dateien (z.B. auth.log für Logins, boot.log
für den Bootvorgang etc.) sowie auch in eine allgemeine `syslog`-Datei. rsyslogd
kann wie immer über seine Konfigurationsdateien gesteuert werden.
Hilfreich ist womöglich auch: `tail -f syslog`. Dabei werden die letzten Zeilen
der syslog-Datei ausgegeben und neue Meldungen werden "live" angehängt (Option
-f).

Eine zweite Log-Funktion gibt es unter systemd mit systemd-journal. Im Vergleich
zu rsyslogd ergibt sich:
- journal-Logs sind binär, brauchen wenig Speicherplatz, sind aber deswegen
  nicht so einfach anzeigbar und brauchen spezielle Tools zum Lesen.
- Das Journal ist gegen nachträgliche Änderungen geschützt; eventuelle "Spuren"
  lassen sich nicht ohne weiteres beseitigen.
- Das gesamte Journal wird an einem Ort gespeichert; Aufteilung in
  Sparten-Dateien so wie bei rsyslogd gibt es a priori nicht. Viele Tools können
  aber dann nach Unter-Kategorien filtern.
Die systemd-journal-Logdatei(en) können gelesen werden mit diversen GUI-Tools
(z.B. `gnome-logs`; dort muss man sich allerdings auf die Kategorisier- und
Suchtools des jeweiligen Programms verlassen.
Auf der Kommandozeile kann man die Logdateien mit `journalctl` abrufen;
`journalctl -b` gibt die Meldungen seit dem letzten Bootvorgang aus. Eine
ähnliche Funktion wie mit den `tail -f syslog` Live-Meldungen lässt sich
erreichen mit `journalctl -b -f`.


