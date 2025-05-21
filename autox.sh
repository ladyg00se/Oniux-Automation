#!/bin/bash

# Absoluter Pfad zu Oniux
ONIUX="/home/kali/.cargo/bin/oniux"
PROGRAM_LIST="/programs/list.txt"

# Prüfen, ob Oniux vorhanden ist
if [ ! -x "$ONIUX" ]; then
    echo "Error: Oniux not found at $ONIUX"
    exit 1
fi

# Prüfen, ob die Programmliste existiert
if [ ! -f "$PROGRAM_LIST" ]; then
    echo "Error: Program list not found at $PROGRAM_LIST"
    exit 1
fi

# Programme aus der Liste torifizieren starten
while IFS= read -r line || [ -n "$line" ]; do
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
    echo "Starting with Oniux: $line"
    "$ONIUX" $line &
done < "$PROGRAM_LIST"
