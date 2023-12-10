#!/bin/bash

# Petlja koja ide od 1 do 100 s korakom 2 (samo neparne brojeve)
for ((i=1; i<=100; i+=2)); do
  # Dodaj neparan broj u datoteku, svaki broj u novi red
  echo "$i" >> 1.txt
done

echo "Uspješno zapisano u datoteku 1.txt."
