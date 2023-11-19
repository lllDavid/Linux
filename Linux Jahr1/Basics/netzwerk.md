# Tools und Befehle zum Netzwerk

## Netzwerkstatus
- hostname -I: Ermittelt die IP-Addressen, unter denen der Rechner nach außen
  erreichbar ist
- ip link: Zeigt die Netzwerkschnittstellen an
- ip addr [show devicename]: Zeigt die IPs pro Netzwerkschnittstelle an
- ping [-c N] [addresse/domainname]: "Pingt" die Addresse an; sendet
  Netzwerkpakete aus und überprüft die Antwortzeit des Servers
- ip route: Zeigt den Gateway-Server des lokalen Netzwerkes an
- traceroute [--resolve-hostnames][addresse/domainname]: Versucht,
  Netzwerkpakete auf ihrem Weg durchs Internet zu verfolgen

## Arbeiten auf anderen Rechnern
- /etc/hosts : Lokales "Namensverzeichnis" für Hosts im Netzwerk. Dort kann man
  IPs mit Hostnamen versehen, wenn dies nicht schon am Router etc. passiert ist.
  Die Datei wird als "letzte Möglichkeit" ausgelesen, um einen Hostnamen zu
  übersetzen!
- ssh user@host: Einloggen per SSH (Secure Shell Protocol) auf einem anderen
  Rechner. openssh-server muss auf Host installiert sein; user muss auf Host
  angelegt sein (mit Passwort)
- ssh user@host _befehl_: Ausführen (wieder über SSH) eines einzelnen Befehls
  auf dem entfernten Rechner
- ssh -X user@host: Ausführen grafischer Programme auf entferntem Rechner
  "sollte" möglich sein - nachdem einige Variablen gesetzt und Einstellungen
  getätigt wurden...
- scp [user@host:]datei(en) [user@host:] datei(en): (secure) Kopieren von
  Dateien zwischen Hosts. Username und Host müssen nur auf den entfernten
  Rechnern angegeben werden. Ansonsten analog zu **cp**!
- Beim ersten Login per SSH muss ein sog. "Fingerprint" generiert werden, der
  die sicher verschlüsselte Verbindung garantiert. Dabei kann es z.B. nach
  Neuinstallationen zu großen Warnmeldungen kommen!
- Passwortloses einloggen: Wechseln ins (eigene) lokale .ssh - Verzeichnis;
  dort Ausführen von `ssh-keygen -t rsa` (Passphrase wird meist leer gelassen):
  dann Kopieren des öffentlichen Schlüssels auf Host: `ssh-copy-id -i my_key.pub
  user@host`. Anschließend sollte Einloggen per SSH auf dem Host ohne Passwort
  funktionieren!
- SSH-Tunnels: Anlage mit z.B. `ssh -L 3307:localhost:3306 user@Host`. 3306 ist
  der Port, auf dem MySQL läuft (als Beispiel). User können dann mit dem
  entfernten MySQL-Server über den Tunnel über Port 3307 kommunizieren:
  `mysql -u user -P 3307 -h 127.0.0.1 -p`
- SSH-Filesystem: Über `sshfs user@host Quelle Ziel` lässt sich ein/viele ganze
  Verzeichnisse ins eigene Dateisystem 'einhängen'. Die Quellverzeichnisse sind
  (weitgehend, bis auf user-rechte) so benutzbar wie das eigene Dateisystem.
  Das Einhängen sollte in einem leeren Verzeichnis stattfinden, da sonst die
  vorherigen Dateien nicht mehr erreichbar sind!
  'Aushängen/Unmounten' kann man dieses Filesystem dann wiederum mit dem
  Linux-Standard-Unmount-Befehl: `umount Quelle|Ziel`, wobei die Angabe des
  Zieles meist viel einfacher ist!

## Download-Tools

Zum Download oder auch Upload einzelner Dateien eignen sich die Utilities
**wget** und **curl**. Curl ist auch in der Lage, sich auf FTP-Servern
einzuloggen (genaueres zu FTP im Buch seite 479).



