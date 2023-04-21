#!/bin/bash

# . settings.sh
# . src/initialize.sh
# . src/process-navigation.sh

# output="Love is a lady"

# prev_file=""
# prev_link=""
# next_file=""
# next_link=""

# curr_book=0
# curr_chapter=1
# curr_name=${book_array[$curr_book]}
# curr_abbr=${abbr_array[$curr_book]}
# processNavigation
# echo $output

# output="Love is a lady"
# curr_book=65
# curr_chapter=22
# curr_name=${book_array[$curr_book]}
# curr_abbr=${abbr_array[$curr_book]}
# processNavigation
# echo $output

# output="Love is a lady"
# curr_book=33
# curr_chapter=5
# curr_name=${book_array[$curr_book]}
# curr_abbr=${abbr_array[$curr_book]}
# processNavigation
# echo $output

curr_abbreviation="Jud"
curr_chapter=1

output="# Jude (New English Translation) ## Salutation ###### 1 From Jude,[^a] a slave[^b] of Jesus Christ and brother of James,[^cz]"

output=$(echo $output | sed "s/\[\^\([a-z]*\)\]/[[\1]]/gp")

echo $output



  # if [[ "$next_file" != "" ]]; then
  #   echo $next_file
  # else
  #   echo 'nope'
  # fi


