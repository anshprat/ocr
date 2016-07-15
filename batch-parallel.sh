#!/bin/bash

mkdir -p split
mkdir -p temp
mkdir -p output

NCORES=4
parallel -j $NCORES pdfseparate {} split/{/.}-%d.pdf ::: input/*.pdf
parallel -j $NCORES bin/pdfocr.rb -t -l swe -i {} -o temp/{/}  ::: split/*.pdf
parallel -j $NCORES pdftotext -layout {} output/{/.}.txt ::: temp/*.pdf
