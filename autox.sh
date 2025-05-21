#!/bin/bash

# Optional: Stelle sicher, dass oniux vorhanden ist
if ! command -v oniux &> /dev/null; then
    echo "Oniux nicht gefunden, Installation wird versucht..."
    cargo install --git https://gitlab.torproject.org/tpo/core/oniux oniux@0.4.0
fi

# Starte eine grafische Anwendung über Tor (z.B. HexChat)
oniux hexchat &

# Starte z. B. eine Shell mit Tor-Isolation im Hintergrund
# (z.B. für später verwendete CLI-Tools)
gnome-terminal -- bash -c "oniux bash"
