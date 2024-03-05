#!/bin/bash

mkdir "done" || true
for pdf in *.pdf; do
  name=${pdf%.*}
  mtime=$(date -R -r "$pdf")

  echo "Extracting $name"
  rm -rf tmp || true
  mkdir tmp || true

  pdfimages -all "$pdf" tmp/page
  pdfimages -list "$pdf" | grep smask | column -t | awk '{print $2}' | xargs -I '{}' printf "%03d\n" '{}' | xargs -I '{}' find tmp -name page-{}.* -delete
  pdfimages -list "$pdf" | column -t | awk '{print $2 ":" $4 "x"}' | grep ":[0-9]x" | cut -d ":" -f1 | xargs -I '{}' printf "%03d\n" '{}' | xargs -I '{}' find tmp -name page-{}.* -delete
  ./pingo.exe -sb -strip tmp

  num=1
  for f in tmp/*; do
    touch -a -m -d "$mtime" "$f"

    fn=$(printf "%03d.%s" $num "${f#*.}")
    mv -i -- "$f" "tmp/$fn"

    ((num++))
  done

  rm "$name.cbz" || true
  zip -r -j "$name.cbz" tmp
  touch -a -m -d "$mtime" "$name.cbz"
  rm -rf tmp || true
  mv "$pdf" "done"
done
