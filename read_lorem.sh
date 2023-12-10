#!/bin/bash

# URL adresa web stranice
url="https://support.microsoft.com/hr-hr/topic/opis-teksta-lorem-ipsum-dolor-sit-amet-koji-se-prikazuje-u-sustavu-pomoći-programa-word-bf3b0a9e-8f6b-c2ab-edd9-41c1f9aa2ea0"

# Preuzmi sadržaj web stranice
wget -q -O - "$url" | \
  # Filtriraj riječ "lorem" bez obzira na veličinu slova
  grep -o -i "lorem" | \
  # Broji linije (pojavljivanja riječi)
  awk '{print length}' | \
  # Zbroji rezultate
  awk '{s+=$1} END {printf "Riječ lorem se pojavljuje: %d puta\n", s}'
