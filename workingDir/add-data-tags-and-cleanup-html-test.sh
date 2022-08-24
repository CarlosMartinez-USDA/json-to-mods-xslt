#correct-invalid-chars.sh
##1. adds data tag to the beginning of JSON file
#2. corrects invalid use of ampersand
#3. adds forwardslash to the end of 'br' tag to make it valid
#4. changes all opening invalid html entities containing 1-3 characters into valid (e.g., <i> becomes &lt;i&gt;)
#5. changes all closing invalid html entities containing 1-3 into valid (e.g., </em> becomes &lt;em;/i&gt;)
#6. echos data tag at end of JSON file 
#7. creates a log of all files written to then closes

for file in *.json; do 
  sed -i '1i <data>' "$file" && #1
  sed -i 's/\&[^amp;|^apos;|^quot;|^lt;|^gt;]/\&amp;/gi' "$file"  && #2
  sed -i 's/\<br\>/\br\//g' "$file" && #3
  sed -i 's/<\(\d\)/\&lt;\1;/g'"$file" && #4
  sed -i 's/<\(.\{1\,3\}\)>/\&lt;\1\&gt;/g' "$file" &&#5
  #sed -i 's/<\(.\)>/\&lt;\1\&gt;/g' "$file" &&#
  #sed -i 's/<\(..\)>/\&lt;\1\&gt;/g' "$file" && #
  #sed -i 's/<\(...\)>/\&lt;\1\&gt;/g' "$file" && #
  sed -i 's/<\/\(.\)>/\&lt;\/\1\&gt;/g' "$file" && #6
  sed -i 's/<\/\(..\)>/\&lt;\/\1\&gt;/g' "$file" && #7
  sed -i 's/<\/\(...\)>/\&lt;\/\1\&gt;/g' "$file" && #8
  echo '</data>' >> "$file" && #9
  ls "$file" >> html_clean_up.txt #10 
done 