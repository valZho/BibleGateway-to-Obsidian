#!/bin/bash

# This will get the previous and next chapters even if they are in different books
processNavigation() {
  # INITIALIZE
  local prev_file=""
  local prev_link=""
  local prev_chapter=0
  local next_file=""
  local next_link=""
  local next_chapter=0
  local yaml="---"
  local navigation="[[$curr_name]]"

  # PREVIOUS CHAPTER ---------------------------------------------------------------
  if [[ $curr_chapter == 1 ]]; then
    if [[ $curr_book > 0 ]]; then
      prev_chapter=${chapter_array[$((curr_book - 1))]}
      prev_file="${abbr_array[$((curr_book - 1))]} $prev_chapter"
      prev_link="[[$prev_file|← ${book_array[$((curr_book - 1))]} $prev_chapter]]"
    fi
  else
    prev_chapter=$((curr_chapter - 1))
    prev_file="$curr_abbr $prev_chapter"
    prev_link="[[$prev_file|← $curr_name $prev_chapter]]"
  fi

  # NEXT CHAPTER ---------------------------------------------------------------
  if [[ $curr_chapter == ${chapter_array[curr_book]} ]]; then
    if [[ $curr_book < 65 ]]; then
      next_chapter=1
      next_file="${abbr_array[$((curr_book + 1))]} 1"
      next_link="[[$next_file|${book_array[$((curr_book + 1))]} 1 →]]"
    fi
  else
    next_chapter=$((curr_chapter + 1))
    next_file="$curr_abbr $next_chapter"
    next_link="[[$next_file|$curr_name $next_chapter →]]"
  fi

  # YAML OUTPUT ---------------------------------------------------------------
  if $ARG_YAML_BREADCRUMBS || $ARG_YAML_ALIASES; then
    if $ARG_YAML_ALIASES; then
      yaml+="\nAliases: [$curr_name $curr_chapter]"
    fi

    if $ARG_YAML_BREADCRUMBS; then
      if [[ "$prev_file" != "" ]]; then
        yaml+="\nprevious: [$prev_file]"
      fi
      yaml+="\nup: ['$curr_name']"
      if [[ "$next_file" != "" ]]; then
        yaml+="\nnext: [$next_file]"
      fi
    fi

    output="$yaml\n---\n$output"

  # INLINE OUTPUT ---------------------------------------------------------------
  else
    if $ARG_BREADCRUMBS_PLUGIN; then
      navigation="(up:: $navigation)"
      prev_link="(previous:: $prev_link)"
      next_link="(next:: $next_link)"
    fi

    if [[ "$prev_file" != "" ]]; then
      navigation="$prev_link | $navigation"
    fi
    if [[ "$next_file" != "" ]]; then
      navigation="$navigation | $next_link"
    fi

    output="$navigation\n\n***\n\n$output\n\n***\n\n$navigation"
  fi
}
