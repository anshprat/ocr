#!/bin/bash
# apt -y install ruby pdftk pstotext tesseract-ocr tesseract-ocr-swe
 
for i in $(ls input/*5.pdf | sed 's_.*/__g'); do
	bin/pdfocr.rb -t -l swe -i input/$i -o temp/$i
	pdftotext -layout temp/$i output/$i.txt
done

