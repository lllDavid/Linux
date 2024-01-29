# Prozesssteuerung und -verwaltung

## Programme im Vordergrund und Hintergrund
Programme, die aus der Konsole gestartet wurden, laufen zunächst dort im
Vordergrund und blockieren somit die Konsole bzw. weitere Eingaben.
Um die Konsole weiter benutzen zu können, kann man die Programme starten mit
`[programm] &`. Eventuelle Meldungen werden weiter auf der Konsole ausgegeben -
aber sie bleibt frei für neue Eingaben.
Nachträglich in den Hintergrund schieben kann man gestartete Programme, indem
man sie mit `STRG+Z` anhält (Anhalte-Befehl für Prozesse) und diesen,
angehaltenen Prozess dann mit `bg` in den Hintergrund schickt.
Es gibt auch den Befehl `fg`, mit dem man in den Hintergrund geschickte Befehle
wieder in den Vordergrund holen kann (Konsole dann wieder von diesem
Vordergrund-prozess blockiert!). Dazu muss man eventuell die "Job-Nummer" (nicht
identisch mit der Prozess-ID!) wissen, die der Prozess bekam, als er in den
Hintegrund geschickt wurde!

## Prozess-Ansichten
Um laufende Prozesse im System anzuzeigen, gibt es viele Hilfsmittel:
- `ps`: Ohne weitere Optionen zeigt es nur die Prozesse an, die auch in dieser
  Konsole gestartet wurden; `ps aux` zeigt alle Prozesse auf dem System an!
- `pstree`: Zeigt die Prozesse auf dem System in Baumform an
- `top`: Zeigt laufende Prozesse kontinuierlich an (upgedatet alle x Sek.) und
  bietet noch weitere Infos wie CPU/Mem-Ausschöpfung und Zusammenfassungen
- weitere, ausgefeilte Tools wie z.B. `btop`

## Prozesse beenden
Laufende Prozesse kann man auf verschiedene Arten "manuell" beenden, falls das
Programm nicht selbst sauber zu Ende läuft oder einen Fehler aufweist:
- `kill [PID]`: Sendet ein sogenanntes SIGTERM-Signal an den Prozess und beendet
  ihn damit in den meisten Fällen. Hierzu ist notwendig, die Prozess-ID (PID) zu
  wissen, die man durch `ps aux` und ähnlichem herausfinden kann.
- `xkill`: Ermöglicht es, durch einen Mausklick, grafische Programme/Fenster zu
  "killen"
- `kill -9 [PID]`: Sendet das sogenannte SIGKILL-Signal an den Prozess und
  beendet ihn __sofort__, ohne dass dem Programm irgendwelche Möglichkeiten
  bleiben, Daten zu speichern, Medien zu unmounten etc.. Sollte nur in
  Extremfällen, wenn sonst nichts hilft, verwendet werden!
- `killall [-9] [Prozessname]`: Killt namentlich benannte Prozesse (unter
  Umständen auch mehrere. Die Option "-9" sendet wiederum ein SIGKILL- anstelle
  eines SIGTERM-Signal. Nicht immer zuverlässig; eindeutige
  Prozess-Identifikation geschieht immer über die Prozess-ID.
- Falls die ganze grafische Oberfläche hängt, gibt es die Möglichkeit, auf die
  TTY-Konsolen zu wechseln. Bei einer normalen Installation wäre dies möglich
  mit STRG + ALT + FX, wobei FX für die F-Tasten von F3 bis F7 stehen (F1 und F2
  sind schon belegt durch den Login-Manager und das grafische System). Bei
  unserer Installation in VirtualBox ist diese Kombination der Host-Key
  (Standard: Rechte STRG-Taste) plus FX.
  Dort kann man sich einloggen und mit den bekannten Mitteln versuchen, den
  hängenden Prozess zu beenden.
- Falls gar nichts mehr hilft und sogar die Tastatur bzw. Maus hängt, kann man
  immer noch, bei Rechnern, die sich im Netzwerk befinden, versuchen, sich
  remote einzuloggen, z.B. per SSH. Mit entsprenden User-Rechten und den
  bekannten Tools kann man dann noch so auf Fehlersuche gehen!

## Prozesse unter anderer Identität
Vorab: Unter Ubuntu ist by default der root-Account deaktiviert (es ist kein
Passwort vergeben!) Die Administration geschieht vorwiegend mit `sudo`!

- User wecheln: `su [User]`: "switch user": Damit kann man die Identität eines
  anderen Users annehmen und damit Prozesse starten etc.. Ohne Angabe eines
  Usernamens wird "su" auf den Root-Account wechseln.
- Einzelne Prozesse als Root ausführen kann man mittels `sudo`; dazu muss aber
  die Berechtigung für den ausführenden User im System vorhanden sein!
- Systemdienste, sogenannte "Daemons" werden meist automatisch vom System
  gestartet über einen Service namens "systemd". Damit kann man auch manuell
  diese Dienste starten und beenden; siehe Buch S.439!

## Prozesse zu einer gewissen Zeit starten
- Cron-Daemon: Ermöglicht es, sogenannte Cronjobs zu erstellen. Dies kann einmal
  unter der globalen /etc/crontabs geschehen; dort muss man auch den Nutzer
  angeben, mit dem der Prozess gestartet werden soll.
  Nutzerspezifische Cronjobs kann man erstellen mittels `crontab -e` (evtl.
  vorher noch die EDITOR-Variable exportieren!), die dann unter demjenigen User
  laufen.
  Die allgemeine Syntax für diese Skripte ist:
  mm hh dom mon dow [user] Skript/Programm

  wobei dom für "day of month", mon für "Month" und dow für "day of week"
  stehen. Es können auch mehrere Zahlen z.B. bei den Minuten eingegeben werden;
  * heißt dann "immer" - an der entsprechenden Stelle.
- Eine einfachere Bedienung versprechen die Verzeichnisse __/etc/cron.hourly,
  /etc/cron.daily, /etc/cron.weekly__ und __/etc/cron.monthly__. Dort muss man
  nur ein Skript/Programm hineinkopieren (Achtung: Skript muss executable sein!)
  und dann wird es zu den gegebenen Zeiten wiederholt ausgeführt. Für diese
  Verzeichnisse ist auch der "anacron"-Daemon zuständig, der sicherstellt, dass
  bei abgeschaltetem PC etc. trotzdem diese Skripte regelmäßig ausgeführt
  werden.
- Der eigentliche, integrierte, zeitgesteuerte Prozessdienst wird mittlerweile
  von __systemd__ und seiner __systemd-timer__ - funktion übernommen. Dazu muss
  für jeden Prozess eine ".timer" und eine ".service" - Datei angelegt werden
  mit diversen, fein steuerbaren Optionen. Dies ist nachzulesen im Buch S.446ff.
  Oft reichen aber immer noch die Möglichkeiten des Cron-Daemons aus!

