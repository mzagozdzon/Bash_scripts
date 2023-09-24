# Bash\_scripts

**1. ocr_from_folder_interactive_en_pl.sh**

This script converts image files into text-based PDFs and merges them into a single PDF that allows text searching.

This program requires the following Linux packages to work correctly:  
- libtesseract-dev  
- libtesseract4  
- tesseract-ocr  
- tesseract-ocr-eng  
- tesseract-ocr-osd  
- tesseract-ocr-pol  
- pdftk

Make sure these packages are installed on your system before running the script.

You can OCR the file types:  
*.png  
*.jpg  
*.jpeg  
*.gif  
*.bmp

**How to use:**

Get file 'ocr_from_folder_interactive_en_pl.sh' and save in a folder other than the folder with image files for OCR.  
Grant execution permissions for the file > sudo chmod +x ocr_from_folder_interactive_en_pl.sh  
Open terminal and go to the folder with files to the OCR.  
Run command > /path_to_the_ocr_from_folder_interactive_en_pl.sh (for examp. /home/user/Downloads/ocr_from_folder_interactive_en_pl.sh)  
Enjoy.


