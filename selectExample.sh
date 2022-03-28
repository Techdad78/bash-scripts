#!/bin/bash
#
## Example of Select
#

PS3="Please Select an Option : "
select option in "Option 1" "Option 2" "Option 3" "Quit"; do
  case $option in
    "Option 1")   echo "You Selected Option 1"
                  ;;
    "Option 2")   echo "You Selected Option 2"
                  ;;
    "Option 3")   echo "You Selected Option 3"
                  ;;
    Quit)         echo "Goodbye"
                  exit 0
                  ;;
  esac
done

exit 0
