#!/bin/bash

# Author: Marek Zagożdżon

# This script converts image files into text-based PDFs and merges them into a single PDF that allows text searching.
# This program requires the following Linux packages to work correctly:
# - libtesseract-dev
# - libtesseract4
# - tesseract-ocr
# - tesseract-ocr-eng
# - tesseract-ocr-osd
# - tesseract-ocr-pol
# - pdftk
# Make sure these packages are installed on your system before running the script.  
# 
# After save this file on your system add +x [ sudo chmod +x filename.sh ]
# Execute command: ./filename.sh 
# 
# Prośba o wybór języka / Language choice
echo "Choose a language / Wybierz język:"
echo "1. English"
echo "2. Polski"
read -p "Select option / wybierz opcję (1 or 2): " language

# Sprawdzenie wyboru języka i dostosowanie komunikatów
case $language in
  1)
    # Kod w języku angielskim
    echo "You selected English."
    
    echo -e "\n#################################################################################################################################"
    echo -e "# This script converts image files into text-based PDFs and merges them into a single PDF that allows text searching.           #"
    echo -e "#                                                                                                                               #"
    # Display information about required packages
    echo "# This program requires the following Linux packages to work correctly:                                                         #"
    echo "#   - libtesseract-dev                                                                                                          #"
    echo "#   - libtesseract4                                                                                                             #"
    echo "#   - tesseract-ocr                                                                                                             #"
    echo "#   - tesseract-ocr-eng                                                                                                         #"
    echo "#   - tesseract-ocr-osd                                                                                                         #"
    echo "#   - tesseract-ocr-pol                                                                                                         #"
    echo "#   - pdftk                                                                                                                     #"
    echo "# Make sure these packages are installed on your system before running the script.                                              #"
    echo -e "#################################################################################################################################\n"
    
    # Ask the user for their choice
    read -p "Choose an option (1 or 2):
1. Provide the full path to the folder containing image files for OCR processing.
2. Execute the program in the current folder (the folder with image files for OCR).
Choice: " option
    
    case $option in
        1)
            # Ask the user for the path to the folder containing image files for OCR processing
            read -p "Enter the path to the folder with image files: " input_folder

            # Check if the specified path exists and is a directory
            if [ ! -d "$input_folder" ]; then
                echo "The specified path does not exist or is not a directory."
                exit 1
            fi
            ;;
        2)
            # Use the current folder as the folder with image files for OCR
            input_folder=$(pwd)
            ;;
        *)
            echo "Invalid option."
            exit 1
            ;;
    esac

    # Default temporary folder
    output_pdf_dir="$input_folder/pdftemp"
    mkdir -p "$output_pdf_dir"

    # Initialize a counter
    count=0

    # Processing images
    for image in "$input_folder"/*.png "$input_folder"/*.jpg "$input_folder"/*.jpeg "$input_folder"/*.gif "$input_folder"/*.bmp; do
        if [ -f "$image" ]; then
            count=$((count + 1))
            base=$(basename "$image")
            tesseract "$image" "$output_pdf_dir/${base%.*}" pdf -l eng+pol >/dev/null 2>&1 # Disable error output
            echo -ne "Processed $count file(s)\r" # Update the counter in real-time
        fi
    done

    total="$count"

    # Merge PDF files into a single PDF
    pdftk "$output_pdf_dir"/*.pdf cat output "$input_folder/output_ocr_file.pdf"

    # Remove the temporary pdftemp folder
    rm -rf "$output_pdf_dir"

    echo -e "Processing completed.\nThe resulting PDF file 'output_ocr_file.pdf' cotains $total page(s) \nThe output PDF file is located in the folder: $input_folder\nCompleted."
    ;;
  2)
    # Kod w języku polskim
    echo "Wybrałeś język polski."
    
    echo -e "\n#################################################################################################################################"
    echo -e "# Ten skrypt przetwarza pliki obrazu na pliki PDF z tekstem i łączy je w jeden plik PDF, który umożliwia przeszukiwanie tekstu. #"
    echo -e "#                                                                                                                               #"
    # Wyświetl informację o wymaganych pakietach
    echo "# Do prawidłowego działania tego programu wymagane są następujące pakiety systemu Linux:                                        #" 
    echo "#   - libtesseract-dev                                                                                                          #"
    echo "#   - libtesseract4                                                                                                             #"
    echo "#   - tesseract-ocr                                                                                                             #"
    echo "#   - tesseract-ocr-eng                                                                                                         #"
    echo "#   - tesseract-ocr-osd                                                                                                         #"
    echo "#   - tesseract-ocr-pol                                                                                                         #"
    echo "#   - pdftk                                                                                                                     #"
    echo "# Upewnij się, że te pakiety są zainstalowane w systemie przed uruchomieniem skryptu.                                           #"
    echo -e "#################################################################################################################################\n"
    
    # Zapytaj użytkownika o wybór opcji
    read -p "Wybierz opcję (1 lub 2):
1. Podaj pełną ścieżkę do folderu z plikami obrazów do przetworzenia OCR.
2. Wykonaj program w aktualnym folderze w którym się znajduję (to jest folder z plikami obrazów do OCR).
Wybór: " option
    
    case $option in
        1)
            # Zapytaj użytkownika o ścieżkę do folderu z plikami obrazów do przetworzenia OCR
            read -p "Podaj ścieżkę do folderu z plikami obrazów: " input_folder

            # Sprawdź, czy podana ścieżka istnieje
            if [ ! -d "$input_folder" ]; then
                echo "Podana ścieżka nie istnieje lub nie jest folderem."
                exit 1
            fi
            ;;
        2)
            # Użyj aktualnego folderu jako folderu z plikami obrazów
            input_folder=$(pwd)
            ;;
        *)
            echo "Nieprawidłowy wybór opcji."
            exit 1
            ;;
    esac

    # Domyślny folder tymczasowy
    output_pdf_dir="$input_folder/pdftemp"
    mkdir -p "$output_pdf_dir"

    # Zainicjuj licznik
    count=0

    # Przetwarzanie obrazów
    for image in "$input_folder"/*.png "$input_folder"/*.jpg "$input_folder"/*.jpeg "$input_folder"/*.gif "$input_folder"/*.bmp; do
        if [ -f "$image" ]; then
            count=$((count + 1))
            base=$(basename "$image")
            tesseract "$image" "$output_pdf_dir/${base%.*}" pdf -l eng+pol >/dev/null 2>&1 # Wyłącz wyjście błędów
            echo -ne "Przetworzono $count plików/ki\r" # Aktualizuj licznik na bieżąco
        fi
    done

    total="$count"

    # Połącz pliki PDF w jeden plik PDF
    pdftk "$output_pdf_dir"/*.pdf cat output "$input_folder/output_ocr_file.pdf"

    # Usuń tymczasowy folder pdftemp
    rm -rf "$output_pdf_dir"

    echo -e "Zakończono przetwarzanie plików.\nWynikowy plik PDF 'output_ocr_file.pdf' zawiera $total stron/y \nPlik 'output_ocr_file.pdf' znajduje się w folderze: $input_folder\nZakończono."
    ;;
  *)
    echo "Nieprawidłowy wybór języka. Zamykanie programu."
    exit 1
    ;;
esac
