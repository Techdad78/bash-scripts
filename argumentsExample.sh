#!/bin/bash
#
## Example of getopts command line arguments
#

# Define the arguments 
# ./script.sh -a <arg> -b <arg> -c
# a expects an arguemnt and is defined as a:
# b expects an argument, defined by b:
# c expects no argument
# h displays help
# getots use : after the flag as a marker to expect a value in ${OPTARG}

# Create a function to display how to use the script
# Help Function

function Help
{
   # Display Help
   echo "This is an example help description"
   echo
   echo "Syntax:./argumentsExample.sh [-h|a|b|c]"
   echo "options:"
   echo "h     Print this Help."
   echo "a     Argument 1"
   echo "b     Argument 2"
   echo "c     Flag/Option"
   echo
}

if [ $# -eq 0 ]; then
	Help
	exit 1
fi

while getopts ":ha:b:c" flag
do
	case "${flag}" in
		a)	# Define argument 1
			arg1="${OPTARG}"
			;;
		b)	# Define argument 2	
			arg2="${OPTARG}"
			;;
		c)	# Set Flag
			arg3="Flag Set"
			;;
		h)	# Display Help
			Help
			exit 0
			;;
		:)	# Check that all required arguments have been provided
			echo "Error : -${OPTARG} requires an argument"
			exit 1
			;;
		\?) 	# Invalid option
         		echo "Error: Invalid option"
			Help
         		exit 1
			;;
	esac
done

echo "Script was executed with the following arguments/flags : ./argumentsExample.sh -a ${arg1} -b ${arg2} ${arg3}"

exit 0
