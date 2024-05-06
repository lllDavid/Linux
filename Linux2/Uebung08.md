# Vermischte Übungsaufgaben

## bash-Skript: Sieb des Erastothenes
Implementiere das o.g. "Sieb" zum Ermitteln der Primzahlen zwischen 1 und einer
angegebenen Zahl. Gehe dabei nach der Methode des Erastothenes vor:
- erstelle eine Zahlenfolge von 2 bis N
- gehe zur ersten Zahl und multipliziere sie mit 1,2,3,... N und entferne die
  entsprechenden Zahlen aus der Zahlenreihe
- wiederhole, bis alle Primzahlen fest stehen

## Backup-Skript
Erstelle ein Skript, welches ein Backup-Archiv (tar) aus einem vorgegebenen
Ordener erstellt. Der Dateiname soll auch Infos über das Datum/die Zeit des
Backups beinhalten

## Bonus: Backup-Skript
Lasse das Backup-Skript aus der vorherigen Aufgabe nun automatisiert mit einem
"Cronjob" o.ä. laufen. Implementiere dazu auch ggf. in einem zweiten Skript,
welches das Backup-Skript aufruft, eine "Rotation" der abgespeicherten Dateien -
also benenne die aktuelle Backup-Datei sowie die älteren um und lösche ggf.
Dateien, die älter sind als 30 Tage.

## Skript zur Einrichtung temporärer Accounts
Im Buch auf S. 344 findet sich ein Skript zur Einrichtung von temporären
Accounts. Gehe dieses durch, teste es und verstehe es!
