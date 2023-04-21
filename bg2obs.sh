#!/bin/bash
#----------------------------------------------------------------------------------
# This script runs Jonathan clark's bg2md.rb ruby script and formats the output
# to be useful in Obsidian.
# Find the script here: https://github.com/jgclark/BibleGateway-to-Markdown
#
# It needs to be run in the same directory as the 'bg2md.rb' script and will output
# one .md file for each chapter, organising them in folders corresponding to the book.
#----------------------------------------------------------------------------------


############################################################################################
# FOR TRANSLATORS
############################################################################################
# Copy the ./locales/en folder into the same folder, and rename it with the
# appropriate language code. Then translate each of the text files inside the
# new folder. Do NOT rename the text files, or your translations will break.
############################################################################################

# Import settings, styles, and functions
. settings.sh
. src/styles.sh
. src/progress-bar.sh

# Show the confirmation before proceeding
. src/confirmation.sh

# Initialize localization, book/chapter lists, and output files
. src/initialize.sh

# Process download
. src/process.sh
