#!/bin/bash
if [[ $1 =~ '-a' ]]; then
date +'%T'
elif [[ $1 =~ '-b' ]]; then
ls
elif [[ $1 =~ '-c' ]]; then
echo $USER
elif [[ $1 =~ '-d' ]]; then
mkdir $2
elif [[ $1 =~ '-e' ]]; then
rm $2
elif [[ $1 =~ '-f' ]]; then
cat $2 | head -n 10
elif [[ $1 =~ '-g' ]]; then
cat $2 | tail -n 10
elif [[ $1 =~ '-i' ]]; then
count=0
for file in *; do
if [ -f "$file" ]; then
((count++))
fi
done
echo $count
elif [[ $1 =~ '-j' ]]; then
ls | grep -E ".txt"
fi
wybor=("Obliczenie sumy liczb od 1 do N" "Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności" "Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem" "Zliczenie liczby plików i katalogów" "Wyjście")

# Ustawienie PS3
PS3="Wybierz jedną z opcji: "

# Menu wyboru
select opt in "${wybor[@]}"
do
    case $opt in
        "Obliczenie sumy liczb od 1 do N")
            read -p "Podaj liczbę N: " N
            suma=0
            for ((i=1; i<=N; i++)); do
                ((suma+=i))
            done
            echo "Suma liczb od 1 do $N wynosi: $suma"
            ;;
        "Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności")
            read -p "Podaj nazwę pliku: " plik
            if [ -f "$plik" ]; then
                tac "$plik"
            else
                echo "Podany argument '$plik' nie jest plikiem."
            fi
            ;;
        "Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem")
            read -p "Podaj ścieżkę: " sciezka
            if [ -e "$sciezka" ]; then
                if [ -d "$sciezka" ]; then
                    echo "Podana ścieżka '$sciezka' jest katalogiem."
                elif [ -f "$sciezka" ]; then
                    echo "Podana ścieżka '$sciezka' jest plikiem."
                else
                    echo "Podana ścieżka '$sciezka' jest innym rodzajem pliku."
                fi
            else
                echo "Podana ścieżka '$sciezka' nie istnieje."
            fi
            ;;
        "Zliczenie liczby plików i katalogów")
            liczba_plikow=$(find . -maxdepth 1 -type f | wc -l)
            liczba_katalogow=$(find . -maxdepth 1 -type d | wc -l)
            echo "Liczba plików: $liczba_plikow"
            echo "Liczba katalogów: $liczba_katalogow"
            ;;
        "Wyjście")
            break
            ;;
        *) 
            echo "Nieprawidłowa opcja"
            ;;
    esac
done
