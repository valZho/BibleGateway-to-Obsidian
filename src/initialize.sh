#!/bin/bash

# GET TRANSLATION FOLDER
translation_folder="./locales/$ARG_LANGUAGE"

# ------------------------------------------------------------

# TRANSLATION: The title of the Bible
bible_name="$(cat "$translation_folder/name.txt") ($ARG_VERSION)"
if [ "$?" -ne "0" ]; then
  echo "Language not found!"
  exit 1
fi

# ------------------------------------------------------------

# Create and initialize the main index file
mkdir -p "$ARG_EXPORT"
index_file="$ARG_EXPORT/$bible_name.md"
if $ARG_FILE_HEADERS; then
  echo -e "# $bible_name" > "$index_file"
else
  echo -en "" > "$index_file"
fi

# Initialize the main folder name
index_folder="$ARG_EXPORT/$bible_name"

# ------------------------------------------------------------

# TRANSLATION: Full book names
declare -a book_array
i=0
while read line; do
  book_array[i]=$line
  mkdir -p "$index_folder/$line" # initialize each book folder
  ((++i))
done <"$translation_folder/books.txt"

# ------------------------------------------------------------

# TRANSLATION: Abbreviated book names
declare -a abbr_array
if [[ $ARG_SHORT_ABBR == "true" ]]; then
  ABBR_FILE="booksAbbrShort.txt"
else
  ABBR_FILE="booksAbbr.txt"
fi
i=0
while read line; do
  abbr_array[i]=$line
  ((++i))
done <"$translation_folder/$ABBR_FILE"

# ------------------------------------------------------------

# Number of chapters per book
declare -a chapter_array
chapter_array=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

# ------------------------------------------------------------

# Find the longest book title (this might change in different languages)
# to use for verbose progress bar display
title_max=0
if [[ $ARG_VERBOSE == "true" ]]; then
  for ((i=0; i<66; i++)); do
    if [[ ${#book_array[i]} -gt $title_max ]]; then
      title_max=${#book_array[i]}
    fi
  done
fi
