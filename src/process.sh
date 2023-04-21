#!/bin/bash

. src/process-chapters.sh
. src/process-download.sh
. src/process-navigation.sh
. src/process-footnotes.sh

echo ""
echo $HEAVY_DIVIDER
echo "  ${TEXT_BOLD}Downloading $ARG_VERSION Bible ...${TEXT_RESET}"
if $ARG_VERBOSE; then
  echo -n $LIGHT_DIVIDER
fi

# -----------------------------------------------
# LOOP: every book of the Bible
for ((curr_book=0; curr_book<66; curr_book++)); do
  curr_name=${book_array[curr_book]}
  total_chapters=${chapter_array[curr_book]}

  overview_output="### [[$bible_name]]\n\nChapters: "

  # Add footnotes?
  if $ARG_FOOTNOTES; then
    footnotes_file="$ARG_EXPORT/$bible_name/$curr_name/$curr_name Footnotes.md"
    echo -en "" > "$footnotes_file"
  fi

  # Add titles?
  if $ARG_FILE_HEADERS; then
    overview_output="# $curr_name\n\n$overview_output"
    echo -e "# $curr_name Footnotes\n" >> "$footnotes_file"
  fi

  # Add book to main index file
  echo -en "\n* $curr_name:" >> "$index_file"

  if $ARG_VERBOSE; then
    show_progress_bar "$curr_name" 0 $total_chapters true
  fi

  # -----------------------------------------------
  # LOOP: every chapter of the Bible
  for ((curr_chapter=1; curr_chapter<=total_chapters; curr_chapter++)); do
    processChapter

    # Update progress in terminal
    if $ARG_VERBOSE; then
      show_progress_bar "$curr_name" $curr_chapter $total_chapters false
    fi
  done
  # END CHAPTER LOOP
  # -----------------------------------------------

  # Create an overview file for each book of the Bible:
  echo -e $overview_output > "$ARG_EXPORT/$bible_name/$curr_name/$curr_name.md"

done
# END BOOK LOOP
# -----------------------------------------------

if $ARG_VERBOSE; then
  echo ""
  echo $LIGHT_DIVIDER
fi

. src/process-cleanup.sh

echo "${TEXT_BOLD}${TEXT_GREEN}  DOWNLOAD COMPLETE!${TEXT_RESET}"
echo $HEAVY_DIVIDER
echo ""
