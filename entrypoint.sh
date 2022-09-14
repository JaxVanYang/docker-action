#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

pip install prose-lint
npm i -g write-good

files="$(find . -iname '*.md' | paste -sd ' ')"
for file in $files; do
	prose-lint "$file"
	write-good "$file"
done
