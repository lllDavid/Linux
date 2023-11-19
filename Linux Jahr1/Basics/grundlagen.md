#   Zusammenfassung Linux INFO1

## 1) Grundlagen
Bewegen im Dateisystem in der Shell (bash):
- cd (change directory); insbes: cd ~ oder einfach nur cd,
    um ins Heimatverzeichnis zu kommen
- pwd (print working directory)
- ls: Verzeichnisinhalte auflisten; insbes:
    ls -l für ausführliche zeilenweise Auflistung und
    ls -a um versteckte Dateien anzeigen zu können
    auch kombinierbar, z.B. ls -la
- cp [Datei/Verzeichnis] [Datei/Verzeichnis]: Daten kopieren
    cp -r (rekursiv): Unterverzeichnisse werden mitkopiert
- mv [Datei/Verzeichnis] [Datei/Verzeichnis]: Daten
    verschieben, auch: Dateien umbenennen
- rm (remove): Dateien löschen
    rm -r: nicht-leere Verzeichnisse rekursiv löschen
    VORSICHT!

Feststellen der angemeldeten Benutzer:
- whois
- whoami - Feststellen des eigenen Usernames

## Die bash
- Unix/Linux-Shell, andere wären z.B. zsh, sh
- Prozesse interaktiv per Eingabeaufforderung startbar
- Konfigurationsdateien: .bashrc, .bash_profile in $HOME
- Funktionen: History-Funktion (.bash_history);
    letzte  Befehle können durch "Pfeil-oben" durchgegangen werden
    Tab-Completion: Wiederholtes Drücken der Tab-Taste liefert entweder Vorschläge oder den/die ausgeschriebenen Befehl/Datei
- Aliase: Komplexe Befehle können mit Aliasen
    vereinfacht werden:
    alias apt-up='sudo apt-get update'
    alias ohne Argumente liefert die bis jetzt gesetzten Aliase zurück
    Aliase werden VOR den tatsächlichen Dateien ausgewertet
- Shell-Variablen: in der bash können Variablen definiert werden;
    einige davon sind "vorbelegt", wie z.B.
    + $HOME   : steht für das aktuelle Heimatverzeichnis des Users
    + $USER   : steht für den Usernamen
    + $OLDPWD : zuletzt aktives Verzeichnis
    + $PATH   : beinhaltet Pfade zu ausführbaren Dateien, die dann ohne Verzeichnisangabe gestartet werden können
    + $PWD    : aktuelles Verzeichnis
    + $RANDOM : liefert Zufallszahl zwischen 0 und 32767
    Anzeige von Shellvariablen:
        echo $var; echo $PATH

## Ein- und Ausgabeumleitung
Es gibt 3 Standardkanäle auf der Shell: Stdin, Stdout und Stderr
(Standard-Fehlerkanal). Ein/Ausgaben können zwischen diesen dreien umgeleitet werden
- ls -l > verzeichnisinhalt
    Ausgabe von ls nicht mehr auf dem Bildschirm, sondern in Datei
    Alte Dateien werden ohne Nachfrage überschrieben
- ls -a >> verzeichnisinhalt
    wie oben, nur wird der neue Inhalt an die bestehende Datei
    angehängt, falls vorhanden.
- find / -name '*.jpg*' 2> /dev/null
    Stdin (0), Stdout (1) und Stderr (2) können mit dieser Syntax separat umgeleitet werden. Hier: Fehlermeldungen werden nach
    /dev/null umgeleitet; /dev/null ist eine Gerätedatei, die ins "Nirwana" führt!
- ls -l | less
    Pipe-Symbol (|) leitet die Daten weiter zum nächsten Utility/Ausgabe, ist also eine Kombination aus Aus/und Eingabeumleitung
    Hier wird ls -l auf den "Screenreader" less "gepiped", um die Ausgabe komfortabler ansehen zu können
- ls | tee verzeichnisinhalt
    "Verzweigungs-Utility": tee leitet Daten weiter UND schreibt gleichzeitig in eine Datei; Vervielfachung der Ausgabe

## Ausführen von Kommandos

- befehl1; befehl2   : Ausführen von 2 Befehlen nacheinander
- befehl1 && befehl2 : Ausführen von 2 Befehlen, aber nur, 
    wenn der erste erfolgreich ausgeführt wurde (exit-code 0)
- befehl1 || befehl2 : Ausführen von "befehl2" nur, wenn "befehl1
    gescheitert ist (exit-code != 0)
- befehl1 &         : Ausführen im Hintergrund

Shell - Globbing/Parametersubstitution: spezielle Zeichen wie "*", "?", "[abc]", "a{1,2,3}" werden von bash interpretiert und haben eine spezielle Bedeutung: "*" steht für ein beliebiges Zeichen (beliebig viele), "?" für EIN beliebiges Zeichen, "[abc]" für EINES dieser Zeichen und "a{1,2,3}" für a1, a2, a3