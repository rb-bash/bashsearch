bashsearch

bashsearch ist ein praktisches Tool, das es dir ermöglicht, in einem bestimmten Ordner, dem DATA-Ordner, nach Anleitungen oder Befehlen in .txt-Dateien zu suchen. So findest du schnell die Informationen, die du benötigst.

1. Repository klonen

Zuerst musst du das Repository klonen. Führe dazu den folgenden Befehl in deinem Terminal aus:

      

`git clone https://github.com/rb-bash/bashsearch.git` 

    

2. In das bashsearch-Verzeichnis navigieren

Nach dem Klonen des Repositories wechsle in das bashsearch-Verzeichnis:

      

`cd bashsearch`

    

3. sinstall.sh ausführbar machen

Um das Installationsskript ausführbar zu machen, führe den folgenden Befehl aus:

      

`chmod +x sinstall.sh`

    

4. Skript ausführen

Nun kannst du das Skript sinstall.sh ausführen:

      

`./sinstall.sh`

und danach `s` ausführen    

Das Skript wird dich auffordern, den Speicherort für deinen DATA-Ordner festzulegen. Es wird empfohlen, den DATA-Ordner im Home-Verzeichnis zu erstellen, um die erforderlichen Berechtigungen sicherzustellen. zB `/home/user/DATA`  (also DATA immer dazuschreiben)

5. Den DATA-Ordner an einen anderen Ort verschieben

Wenn du den DATA-Ordner an einem anderen Speicherort erstellen möchtest, musst du die Konfiguration löschen. Gehe dafür in dein Home-Verzeichnis und lösche die entsprechende Bash-Konfigurationsdatei:

      

`rm ~/.bashsearch_config`

    

Führe danach das Skript sinstall.sh erneut aus:

      

`./sinstall.sh`

    

6. s sporadisch verwenden

Das Skript s wird nun im PATH verfügbar sein. Du kannst es von überall ausführen, indem du einfach s in dein Terminal eingibst:

      

`s`

    

7. Daten hinzufügen

Du kannst nun deine Anleitungen und Befehle in .txt-Dateien im DATA-Ordner speichern. Das Tool sucht durch diese Dateien und hilft dir dabei, die gewünschten Informationen schnell zu finden.
Nutzung

Nach der Installation und der Erstellung des DATA-Ordners kannst du das Skript jederzeit aufrufen, um nach den benötigten Informationen zu suchen. Folge den Anweisungen im Terminal, um die Suchbegriffe einzugeben.
