#!/bin/bash

processFootnotes() {
  # Extract footnotes from file
  local footnotes=$(echo $output | sed "s/.*### Footnotes \(.*\)/\1/g")
  output=$(echo $output | sed "s/### Footnotes.*//")

  # Reformat the footnote references to Obsidian-compatible references
  output=$(echo $output | sed "s/\[\^\([a-z]*\)\]/\\\[[[$curr_name Footnotes#$curr_chapter\1|\1]]\\\] /g")
  footnotes=$(echo $footnotes | sed "s/\[\^\([a-z]*\)\]: /\n\n###### $curr_chapter\1\n/g")

  # Add the footnotes to the footnotes file
  footnotes="### Chapter $curr_chapter$footnotes\n\n"
  echo -en "$footnotes" >> "$footnotes_file"
}
