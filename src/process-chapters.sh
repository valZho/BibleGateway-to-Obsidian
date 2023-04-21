#!/bin/bash

processChapter () {
  curr_abbr=${abbr_array[curr_book]}

  # Set the name of this chapter's file and add to index files
  curr_file="$curr_abbr $curr_chapter"
  index_link=" [[$curr_file|$curr_chapter]]"
  overview_output+="$index_link"
  echo -en "$index_link" >> "$index_file"

  # Download the chapter contents
  # SETS: output
  processDownload

  # Add navigation to the output
  # UPDATES: output
  processNavigation

  # Add titles?
  if $ARG_FILE_HEADERS; then
    output="# $curr_name $curr_chapter\n\n$output"
  fi

  # Save the output to the chapter file
  echo -e $output > "$ARG_EXPORT/$bible_name/$curr_name/$curr_file.md"
}
