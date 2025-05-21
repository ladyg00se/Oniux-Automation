#!/bin/bash

# Pfad zur Programmliste
PROGRAM_LIST="/programs/list.txt"

# Sicherstellen, dass oniux installiert ist
if ! command -v oniux &> /dev/null; then
    echo "Error: Oniux not found. Please ensure it is installed on your system."
    exit 1
fi

# Prüfen, ob die Programmliste existiert
if [ ! -f "$PROGRAM_LIST" ]; then
    echo "Error: Program list not found at $PROGRAM_LIST"
    exit 1
fi

# Programme aus Liste starten
while IFS= read -r line || [ -n "$line" ]; do
    # Leere Zeilen oder Kommentare überspringen
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
    echo "Starting with Oniux: $line"
    oniux $line &
done < "$PROGRAM_LIST"
