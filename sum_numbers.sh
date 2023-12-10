#!/bin/bash

# Inicijalizacija varijable za zbroj
sum=0

# Petlja za čitanje svakog retka iz datoteke 1.txt
while IFS= read -r line; do
  # Provjera je li broj dijeljiv s 3
  if (( line % 3 == 0 )); then
    # Zbroj brojeva dijeljivih s 3
    sum=$((sum + line))
  fi
done < 1.txt

echo "Zbroj brojeva dijeljivih s 3 iz datoteke 1.txt je: $sum"
