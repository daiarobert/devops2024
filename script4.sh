#!/bin/bash

# Verifică dacă un nume de serviciu a fost furnizat ca argument
if [ -z "$1" ]; then
    echo "Te rog să furnizezi numele unui serviciu (de ex. sshd, cron, rsyslog)."
    exit 1
fi

# Atribuie numele serviciului variabilei 'service_name'
service_name=$1

# Verifică dacă serviciul rulează folosind systemctl
if systemctl is-active --quiet "$service_name"; then
    echo "Serviciul $service_name rulează."
else
    echo "Serviciul $service_name nu rulează."

    # Oferă utilizatorului opțiunea de a porni serviciul
    read -p "Dorești să pornești serviciul $service_name? (da/nu): " answer

    if [ "$answer" == "da" ]; then
        # Încearcă să pornești serviciul
        sudo systemctl start "$service_name"

        # Verifică dacă serviciul a fost pornit cu succes
        if systemctl is-active --quiet "$service_name"; then
            echo "Serviciul $service_name a fost pornit cu succes."
        else
            echo "Nu s-a reușit pornirea serviciului $service_name."
        fi
    else
        echo "Serviciul $service_name nu a fost pornit."
    fi
fi
