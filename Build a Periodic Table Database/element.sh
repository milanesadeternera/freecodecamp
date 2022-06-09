#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $# != 1 ]]
then
	echo "Please provide an element as an argument."
else
	#is a number?
	if [[ ! $1 =~ ^[0-9]+$ ]]
	then
		#get atomic number
		ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name = '$1' or symbol = '$1'")
	else
		ATOMIC_NUMBER=$1
	fi
	#get data
	INFO=$($PSQL "select name, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol from properties join elements using(atomic_number) join types using(type_id) where atomic_number = $ATOMIC_NUMBER")
	if [[ -z $INFO ]]
	then
		echo "I could not find that element in the database."
	else
		echo "$INFO" | while read NAME BAR TYPE BAR MASS BAR MELTING BAR BOILING BAR SYMBOL
		do
			echo -e "The element with atomic number $(echo $ATOMIC_NUMBER | sed -r 's/^ *| *$//g') is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
		done
	fi
fi
