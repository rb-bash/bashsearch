#!/bin/bash

# Funktion zur Suche nach einem Suchbegriff in Textdateien und Anzeige der Dateinamen
search_files() {
    search_term=${1,,}  # Konvertiert den Suchbegriff in Kleinbuchstaben
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
    done < <(find /home/robert/Documents/syncWORK/workprogrammes/bashsearch/DATA/ -type f -print0)

    echo
    echo "Enter the file number to view its content (or 'exit' to quit):"
    read file_number

    if [[ $file_number == "exit" ]]; then
        exit 0
    fi

    if ((file_number >= 1 && file_number <= ${#found_files[@]})); then
        echo "Content of selected file:"
        cat "${found_files[file_number - 1]}"
    else
        echo "Invalid file number"
    fi
}

# Hauptprogramm
while true; do
    echo "Enter search term (or 'exit' to quit):"
    read search_term

    if [[ $search_term == "exit" ]]; then
        exit 0
    fi

    search_files "$search_term"
done

