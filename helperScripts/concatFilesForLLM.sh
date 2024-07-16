#!/bin/bash

# Run this script from the directory whose descendant files you want to concatenate.
# It will overwrite the file out.txt with the results.

rm out.txt 2> /dev/null

# Find all files in the file tree, ignoring git files and binary files.
for f in `find . -type f -not -iwholename '*/.git*' -exec grep -Iq . {} \; -print`; do
  echo "================" >> out.txt
  echo "File: $f"         >> out.txt
  echo "================" >> out.txt
  echo ""                 >> out.txt
  cat $f >> out.txt
  echo ""                 >> out.txt
done

echo "Wrote concatenated files to out.txt"
