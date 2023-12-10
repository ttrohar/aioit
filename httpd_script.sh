#!/bin/bash

# Provjeri je li httpd instaliran
if ! command -v httpd &> /dev/null; then
    echo "Instalacija httpd..."
    # Instaliraj httpd
    sudo yum install httpd -y  # Koristi sudo apt-get install httpd za distribucije temeljene na Debianu
else
    echo "httpd je već instaliran. Nadogradnja na zadnju verziju..."
    # Nadogradi httpd
    sudo yum update httpd -y  # Koristi sudo apt-get update && sudo apt-get upgrade -y za distribucije temeljene na Debianu
fi

# Promijeni port na 81 u konfiguracijskoj datoteci
sudo sed -i 's/^Listen 80/Listen 81/' /etc/httpd/conf/httpd.conf

# Provjeri je li port promijenjen i restartaj httpd ako je potrebno
if sudo apachectl configtest; then
    sudo systemctl restart httpd
    echo "Port je promijenjen na 81, httpd je restartan."
else
    echo "Pogreška pri promjeni porta. Molim provjerite konfiguracijsku datoteku."
fi
