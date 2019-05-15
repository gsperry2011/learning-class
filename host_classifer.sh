#!/bin/bash

# The input inventory file(s)
FILES=$@

# Inventory we'll increment as we find systems
DEVELOPMENT=0
PRODUCTION=0
OTHER_ENV=0
LINUX=0
WINDOWS=0
OTHER_OS=0

for F in $FILES
do
    echo "===================="
    echo "File = $F"

    # The total contents of the inventory file
    LINES=$(cat $F)

    # For each line in the inventory file..
    for L in $LINES
    do
	# Classify by Environment
	case $L in
	    usoh4d*)
		((DEVELOPMENT++))
		;;
	    usoh4p*)
		((PRODUCTION++))
		;;
	    *)
                ((OTHER_ENV++))
		;;
	esac

	# Classify by OS type
	case $L in
	    usoh4?l*)
		((LINUX++))
		;;
	    usoh4?w*)
		((WINDOWS++))
		;;
	    *)
		((OTHER_OS++))
		;;
	esac
    done
done

echo "OS Windows $WINDOWS"
echo "OS Linux $LINUX"
echo "OS Other $OTHER_OS"
echo "Environment Production $PRODUCTION"
echo "Environment Development $DEVELOPMENT"
echo "Environment Other $OTHER_ENV"
