#!/bin/bash

# Set the appropriate flags for the 'bg2md_mod' script
bg2md_flags="-clr"
if $ARG_BOLD_WORDS; then
  bg2md_flags+="b"
fi
if [ ! $ARG_EDITORIAL_HEADERS ]; then
  bg2md_flags+="e"
fi
if [ ! $ARG_FOOTNOTES ]; then
  bg2md_flags+="f"
fi

processDownload() {
  # Download the content
  output=$(ruby bg2md.rb $bg2md_flags -v "$ARG_VERSION" "'$curr_name' $curr_chapter")

  # TODO: I don't think this does anything
  # Delete unwanted headers from chapter content
  # output=$(echo $output | sed 's/^(.*?)v1/v1/')

  # Process footnotes if they are turned on
  if $ARG_FOOTNOTES; then
    processFootnotes
  fi
}
