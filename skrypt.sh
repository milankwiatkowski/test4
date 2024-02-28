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
            echo " "
	    echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"
	    ;;
        "Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności")
            read -p "Podaj nazwę pliku: " plik
            if [ -f "$plik" ]; then
                cat $plik | rev
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"            
else
                echo "Podany argument '$plik' nie jest plikiem."
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"            
fi
            ;;
        "Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem")
            read -p "Podaj ścieżkę: " sciezka
            if [ -e "$sciezka" ]; then
                if [ -d "$sciezka" ]; then
                    echo "Podana ścieżka '$sciezka' jest katalogiem."
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"                
elif [ -f "$sciezka" ]; then
                    echo "Podana ścieżka '$sciezka' jest plikiem."
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"                
else
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"                
    echo "Podana ścieżka '$sciezka' jest innym rodzajem pliku."
                fi
            else
                
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"echo "Podana ścieżka '$sciezka' nie istnieje."
            fi
            ;;
        "Zliczenie liczby plików i katalogów")
            liczba_plikow=$(find . -maxdepth 1 -type f | wc -l)
            liczba_katalogow=$(find . -maxdepth 1 -type d | wc -l)
            echo "Liczba plików: $liczba_plikow"
            echo "Liczba katalogów: $liczba_katalogow"
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"            
;;
        "Wyjście")
            break
            ;;
        *) 
            echo "Nieprawidłowa opcja"
echo "1)Obliczenie sumy liczb od 1 do N"
echo "2)Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności"
echo "3)Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem"
echo "4)Zliczenie liczby plików i katalogów"
echo "5)Wyjscie"
            ;;
    esac
done
