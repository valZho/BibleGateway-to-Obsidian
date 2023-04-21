#!/bin/bash

displaySetting () {
  if $1; then
    echo "   [${TEXT_GREEN}●${TEXT_RESET}] ${TEXT_GREEN}$2${TEXT_RESET}"
  else
    echo "   [ ] ${TEXT_GRAY}$2${TEXT_RESET}"
  fi
}

echo ""
echo $HEAVY_DIVIDER
echo -n "  ${TEXT_BOLD}PROCESSING:"
echo -n "${TEXT_RESET}"
echo -n "  Language: ${TEXT_GREEN}${ARG_LANGUAGE}"
echo -n "${TEXT_RESET}"
echo -n "  Version: ${TEXT_GREEN}${ARG_VERSION}"
echo -n "${TEXT_RESET}"
echo ""
echo -n "  ${TEXT_BOLD}EXPORTING TO:"
echo -n "${TEXT_RESET}"
echo -n "  ${TEXT_GREEN}${ARG_EXPORT}"
echo -n "${TEXT_RESET}"
echo ""
echo -n "  ${TEXT_BOLD}SETTINGS:"
echo -n "${TEXT_RESET}"
echo ""

displaySetting $ARG_VERBOSE "Show Download Progress"
displaySetting $ARG_SHORT_ABBR "Use Short Book Abbreviations"
displaySetting $ARG_BOLD_WORDS "Words of Jesus in Bold"
displaySetting $ARG_HEADERS "Add Editorial Headers"
displaySetting $ARG_BREADCRUMBS "Add Breadcrumbs to Files"
displaySetting $ARG_YAML_BREADCRUMBS "Add YAML Breadcrumbs"
displaySetting $ARG_YAML_ALIASES "Add YAML Aliases"

echo $LIGHT_DIVIDER
echo "  ${TEXT_BOLD}PROCEED WITH THESE SETTINGS?${TEXT_RESET}"
echo "  To change settings, edit ${TEXT_CYAN}settings.sh${TEXT_RESET} file."
echo $LIGHT_DIVIDER
echo "  ${TEXT_YELLOW}⚠️  By proceeding, you confirm that you have checked and"
echo "  understand the copyright/license conditions for the"
echo "  $ARG_VERSION version of the Bible and wish to continue"
echo "  downloading it in its entirety.${TEXT_RESET}"
echo $LIGHT_DIVIDER
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) exit;;
  esac
done
echo $HEAVY_DIVIDER
