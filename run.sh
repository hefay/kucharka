#!/bin/bash

# Název Docker image
IMAGE_NAME="kucharka-latex"

# 1. Kontrola, zda existuje Docker image, pokud ne, sestavíme ho
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    echo "--- Docker image '$IMAGE_NAME' nenalezen. Sestavuji... ---"
    docker build -t $IMAGE_NAME .
else
    echo "--- Docker image '$IMAGE_NAME' nalezen. ---"
fi

echo "--- Spouštím kompilaci kuchařky ---"

# 2. Spuštění kontejneru
# Mapujeme aktuální složku na /data v kontejneru
# --rm zajistí smazání kontejneru po doběhnutí (nezůstává po něm nepořádek)
docker run --rm \
    -v "$(pwd)":/data \
    $IMAGE_NAME

# 3. Finální kontrola výsledku
if [ -f "output/kucharka.pdf" ]; then
    echo "--------------------------------------------------------"
    echo "HOTOVO! PDF kuchařky najdeš ve složce: output/kucharka.pdf"
    echo "Pomocné soubory jsou uklizeny v: build/"
    echo "--------------------------------------------------------"
else
    echo "CHYBA: Kompilace se pravděpodobně nezdařila, soubor nebyl nalezen."
fi
