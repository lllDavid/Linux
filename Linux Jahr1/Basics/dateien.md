# Zusammenfassung Linux INFO1 zweiter Teil

## 1) Verschiedenes
- mkdir: Erstellen von Verzeichnissen
- rmdir: Löschen von (leeren!) Verzeichnissen; nicht-leere Verzeichnisse
  können mit "rm -r" gelöscht werden!

- df: "Disk Free": Ermittlung des freien Platzes auf den Festplatten; df -h
  zeigt den Platz in "vernünftigen" Einheiten an!
- du: "Disk Usage": Größe der Dateien im ausgewählten Verzeichnis; du -h
  zeigt wiederum "vernünftige" Einheiten.

## 2) Versteckte Dateien und Verzeichnisse

Versteckte Dateien und Verzeichnisse werden in Linux/UNIX immer mit einem
vorangestellten Punkt "." gekennzeichnet. Diese Dateien werden bei einem
normalen "ls" nicht angezeigt! Trotzdem anzeigen lassen kann man sie sich
durch "ls -a".
Bei Ausführen des obigen Befehls bemerkt man zwei "Default"-Verzeichnisse,
die sich in jedem Unterverzeichnis befinden:
- Das "." - Verzeichnis steht für das aktuelle Verzeichnis, welches
  verwendet werden kann z.B. beim Ausführen von Skripten (Beispiel:
  `./skript.sh`) oder beim Verschieben/Kopieren ins aktuelle Verzeichnis
  (Beispiel: `cp ~/bin/stuff .`
- Das ".." - Verzeichnis steht für das nächsthöhere Verzeichnis im
  Verzeichnisbaum. Damit kann man schnell "zurück" wechseln; z.B. `cd ..`

## 3) Sonderformen von Dateien

- Links: Unterscheidung zwischen Hard- und Softlinks: Ein Hardlink kann
  angelegt werden mit `ln datei neuedatei`. Dabei wird für ein und denselben
  Speicherplatz auf der Festplatte ein neuer Name vergeben, so dass eine
  "Datei" über zwei oder mehrere Dateinamen erreichbar ist.
  Softlinks werden angelegt mit `ln -s datei neuedatei`; diese Version
  entspricht eher den Windows-Verknüpfungen - es ist also wirklich nur ein
  Verweis auf die eigentliche Datei
  Links werden gekennzeichnet durch ein "l" am Anfang des ersten Blocks bei
  `ls -l`.

## 4) Datei -und MIME-Typen

Dateien werden erkannt, soweit praktikabel, durch ihre Datei-Endungen (z.B.
`.pdf` -> PDF-Datei). Unter Linux sind aber Datei-Endungen nicht Pflicht und
es werden im Folgenden noch weitere Tools zur Datei-Erkennung genannt. Die
Datei-Typen werden meistens in einer MIME-Typen-Datenbank festgehalten; diese
ist von Distribution zu Distribution aber unterschiedlich!

Tools zur Datei-Erkennung:
- file: Versucht, anhand von Endung, Bit/Byte-Signatur etc. die Art der Datei zu
  ermitteln
- which: Sucht nach einem Kommando und liefert den genauen Ort desselben.
- whereis: Sucht in den $PATH - Verzeichnissen
- locate: Schnelle Suche nach Dateien; greift auf einen Index zurück, der
  regelmäßig mit `updatedb` aktualisert werden muss. Nicht mehr überall by
  default installiert!
- find: Umfangreiches Dateisuch-Tool; schon vorher besprochen
- grep: Tool zum Untersuchen von Text **in** Dateien

## 5) Neue Benutzer, Gruppen, Zugriffsrechte

- useradd [user]: legt neuen Benutzer an. Muss mit Option -m benutzt werden,
  um auch ein Home-Verzeichnis anzulegen
- passwd [user]: Ändert/erstellt das Passwort des aktuellen/angegebenen
  Users (nur root!)
- groupadd [Gruppe]: legt eine neue Benutzergruppe an. Eingetragen in
  /etc/groups
- usermod -a -G [Gruppe] [user]: fügt User der Gruppe hinzu
- groups [user]: Liste aller Gruppen, in der sich der User befindet
- getent group [Gruppe]: Liste aller Benutzer der entsprechenden Gruppe

- Zugriffsrechte: Nach dem ersten Bit (ID-Bit) stehen die nächsten 3x3 Bits
  einer Datei bei der Ausgabe von `ls -l` für:
  - Rechte für den Benutzer selbst (rwx - Lese/Schreib/Ausführrechte)
  - Rechte für Angehörige derselben Gruppe
  - Rechte für alle anderen ("others)
- Für Verzeichnisse gilt:
  - x steht für "Wer darf ins Verz. wechseln"?
  - r steht für "Liste der Dateien ermitteln"
  - rx: Dateiinfos lesbar
  - wx: Neue Dateien anlegbar, Dateien löschbar

- Setuid-bit: Bit im ersten Rechte-Triplet von Dateien, das gesetzt werden
  kann, um z.B. Programme *immer* unter ihrem Eigentümer-Login zu starten.
  Bsp.: rws für das User-Triplet bedeutet: rwx + dieses gesetzte Setuid-Bit.
  rwS bedeutet: rw- + Setuid-Bit.
- Setgid-bit: Bit im *zweiten* Rechte-Triplet von Dateien, dass, äquivalent
  zum setuid-Bit, z.B. Programme *immer* unter der Gruppe ihres Eigentümers
  gestartet werden. Bsp: -rwxrws für gesetztes x-Bit in der Gruppe oder
  -rwxrwS für ein ungesetztes Gruppen-x.
  Weitere Funktion: Wenn ein Setgid-Bit für ein Verzeichnis gesetzt ist, wird
  die Gruppe aller neu erstellten Dateien darin auch die Gruppe des
  Verzeichnisses sein. Dies ist praktisch, um z.B. bei Gruppenarbeit nicht
  immer die Gruppe ändern zu müssen.
- Sticky-bit: wird im letzten Triplet z.B. bei Verzeichnissen gesetzt (z.B.
  drwxrwxrwt), um bei "offenen" Verzeichnissen (z.B. Temp-Verzeichnisse) zu
  fordern, dass nur der Eigentümer einer Datei diese auch wieder löschen darf.
  (Theoretisch) gibt es wieder die Unterscheidung "t" oder "T" für gesetztes
  bzw. nicht gesetztes darunterliegendes "x"-Others-Bit.

- Neu angelegte Dateien bekommen die Default-Rechte, die die sogenannte
  **umask** vorgibt. Der Wert, der mit **umask** gespeichert werden kann, wird
  von 666 (bzw. 777 für Verzeichnisse) abgezogen, um die Default-Rechte, mit
  denen neu angelegte Dateien ausgestattet sind, zu erhalten. Die Einstellung
  erfolgt meist in */etc/bashrc* oder in */etc/profile*.

## Linux-Dateistruktur
