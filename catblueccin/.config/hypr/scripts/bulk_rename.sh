#!/bin/bash

for file in *; do
  mv "$file" "${file// /_}";
done

for file in *; do
  mv -v "$file" "`echo $file | tr '[A-Z]' '[a-z]'`";
done
