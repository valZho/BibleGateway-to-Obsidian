#!/bin/bash

# $1 - the title of the current book
# $2 - the last chapter downloaded
# $3 - the total number of chapters
# $4 - start a new line? (otherwise overwrites previous display)

show_progress_bar()
{
  local title="$1"
  local completed=$2
  local total=$3
  local new_line=$4

  # Calculate completion percentage
  ((percentage=($completed*100)/$total))

  # Create the progress bar
  ((bar_width=$percentage/5))
  local bar=""
  while [[ ${#bar} -lt $bar_width ]]; do
    bar="${bar}▩"
  done
  while [[ ${#bar} -lt 20 ]]; do
    bar="$bar "
  done

  # Normalize book name length
  while [[ ${#title} -lt $title_max ]]; do
    title=" $title"
  done

  # Normalize chapters complete number
  if [[ ${#completed} -lt 2 ]]; then
    completed=" $completed"
  fi
  if [[ ${#completed} -lt 3 ]]; then
    completed=" $completed"
  fi


  # Normalize chapters total number
  if [[ ${#total} -lt 2 ]]; then
    total=" $total"
  fi
  if [[ ${#total} -lt 3 ]]; then
    total=" $total"
  fi

  # Create the progress bar display
  progress_bar="${TEXT_BOLD}${title} —— ${TEXT_RESET}"
  progress_bar+=" Chapter "
  progress_bar+="${TEXT_BOLD}${completed}${TEXT_RESET}"
  progress_bar+="  of "
  progress_bar+="${TEXT_BOLD}${total} —— ${TEXT_RESET}|"
  if (($percentage < 100)); then
    progress_bar+="${TEXT_GRAY}"
  fi
  progress_bar+="${bar}${TEXT_RESET}| "
  progress_bar+="${percentage}%"
  progress_bar+="${TEXT_RESET}"

  # start a new line
  if $new_line; then
    echo -en "\n$progress_bar"
  # else the next progress bar will overwrite the current one
  else
    echo -en "\r$progress_bar"
  fi
}
