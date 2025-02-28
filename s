#!/bin/bash

CONFIG_FILE="$HOME/.bashsearch_config"  # Speicherort der Konfigurationsdatei

# Funktion zur Abfrage des DATA-Ordners und zur Speicherung in einer Konfigurationsdatei
get_data_directory() {
    # Überprüfen, ob die Konfigurationsdatei existiert
    if [[ -f $CONFIG_FILE ]]; then
        # Lese den gespeicherten Ordner aus der Datei
        data_directory=$(cat "$CONFIG_FILE")
        if [[ -d $data_directory ]]; then
            echo "DATA-Ordner gefunden: $data_directory"
            return
        fi
    fi

    while true; do
        echo "Bitte geben Sie den Pfad zu Ihrem DATA-Ordner ein:"
        read data_directory

        if [[ -d $data_directory ]]; then
            echo "$data_directory" > "$CONFIG_FILE"
            echo "DATA-Ordner gespeichert: $data_directory"
            return
        else
            read -p "Der Ordner existiert nicht. Möchten Sie ihn erstellen? (j/n): " create_folder
            if [[ $create_folder == "j" ]]; then
                mkdir -p "$data_directory" && echo "Ordner $data_directory wurde erstellt."
                echo "$data_directory" > "$CONFIG_FILE"
                return
            else
                echo "Bitte versuchen Sie es erneut."
            fi
        fi
    done
}

# Funktion zur Suche nach einem Suchbegriff in Textdateien und Anzeige der Dateinamen
search_files() {
    local data_directory="$1"
    search_term=${2,,}
    file_count=1
    found_files=()

    # Durchsuche Dateinamen und Inhalt der Dateien
    while IFS= read -r -d '' file; do
        file_name=$(basename "$file")
        if [[ $(basename "$file" | tr '[:upper:]' '[:lower:]') == *"$search_term"* || $(< "$file" tr '[:upper:]' '[:lower:]') == *"$search_term"* ]]; then
            echo "$file_count. $file_name"
            found_files+=("$file")
            ((file_count++))
        fi
    done < <(find "$data_directory" -type f -print0)

    echo
    echo "Geben Sie die Nummer der Datei ein, um ihren Inhalt anzuzeigen (oder 'exit' zum Beenden):"
    read file_number

    if [[ $file_number == "exit" ]]; then
        exit 0
    fi

    if ((file_number >= 1 && file_number <= ${#found_files[@]})); then
        echo "Inhalt der ausgewählten Datei:"
        cat "${found_files[file_number - 1]}"
    else
        echo "Ungültige Dateinummer"
    fi
}

# Hauptprogramm
get_data_directory

while true; do
    echo "Geben Sie einen Suchbegriff ein (oder 'exit' zum Beenden):"
    read search_term

    if [[ $search_term == "exit" ]]; then
        exit 0
    fi

    search_files "$data_directory" "$search_term"
done

