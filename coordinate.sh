#!/bin/bash
for i in $(cat output/*.pdf.txt | sed '/\. /d'| sed -r 's/([A-ZÅÄÖa-zåäö]+|[A-ZÅÄÖa-zåäö]+ [A-ZÅÄÖa-zåäö]+|[A-ZÅÄÖa-zåäö]+ [A-ZÅÄÖa-zåäö]+ [A-ZÅÄÖa-zåäö]+|[A-ZÅÄÖa-zåäö]+ [A-ZÅÄÖa-zåäö]+ [A-ZÅÄÖa-zåäö]+ [A-ZÅÄÖa-zåäö]+),/\n\1;/g' | egrep -v '^ +$' | grep -v '^$' | sed -r '/[0-9]+\s*tr/d'| sed -r 's/\s{2,900}/;/g' | sed -r 's/[0-9] [0-9]/;/g' | sed -r 's/\.//g' | sed 's/; /;/g'  | sed -r 's/(;[A-ZÅÄÖa-zåäö]+) /\1;/' | head -100 | awk -F';'  '{print $3}' | grep ' ' | sed -r '/,.*/d'| sed -r 's/\s/+/g'); do 
  curl 'http://maps.google.com/maps/api/geocode/json?address='$i'&sensor=false';
done #| grep ZERO | wc -l
