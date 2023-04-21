#!/bin/bash

# What folder should the files be saved to?
ARG_EXPORT="./export"

# Which language to use for the book titles, file names, etc.?
# Deutsch: de
# English: en
# Español: es
# Français: fr
ARG_LANGUAGE="en"

# Which version of the Bible do you want to download from BibleGateway.com?
# NOTE: Using the script with some versions is **clearly breaking copyright**.
# Please verify copyright compliance before selecting a different version.
ARG_VERSION="NET"

# Use shorter, 3-letter abbreviations?
# e.g., 1 Thess, 2 Thess, 1 Tim >>> 1Th, 2Th, 1Ti
ARG_SHORT_ABBR=true

# Set the words of Jesus in bold?
ARG_BOLD_WORDS=true

# Include editorial headers?
ARG_FOOTNOTES=true

# Include editorial headers?
ARG_EDITORIAL_HEADERS=true

# Include H1 headers in output?
# Obsidian already shows the file name as a header
# so adding a header can be redundant for display
ARG_FILE_HEADERS=true

# Make the inline navigation compliant with the Breadcrumbs plugin?
ARG_BREADCRUMBS_PLUGIN=false

# Add YAML breadcrumbs?
# NOTE: setting this to true will disable inline navigation
ARG_YAML_BREADCRUMBS=false

# Create an alias in the YAML front matter for each chapter title?
# NOTE: setting this to true will disable inline navigation
ARG_YAML_ALIASES=false

# Show download progress in the terminal while processing?
ARG_VERBOSE=true
