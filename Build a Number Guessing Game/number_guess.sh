#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN(){
	echo "Enter your username:"
	read USERNAME
	if [[ ! -z $USERNAME ]]
	then
		#query username
		USER_ID=$($PSQL "select user_id from users where name = '$USERNAME'")
		if [[ -z $USER_ID ]]
		then
			#Creo el usuario
			INSERT=$($PSQL "insert into users(name) values('$USERNAME')")
			if [[ $INSERT == "INSERT 0 1" ]]
			then
				USER_ID=$($PSQL "select user_id from users where name = '$USERNAME'")
				echo -e "Welcome, $USERNAME! It looks like this is your first time here."
			fi
		else
			GAMES=$($PSQL "select count(user_id) from games where user_id = $USER_ID")
			BEST_SCORE=$($PSQL "select min(guesses) from games where user_id = $USER_ID")
			echo -e "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST_SCORE guesses."
		fi
	#Game code
	NUMBER=$(( $RANDOM %1000 + 1 ))
	echo "Guess the secret number between 1 and 1000:"
	WIN=false
	TRY=1
	while [ $WIN = false ]
	do
		read GUESS
		if [[ ! $GUESS =~ ^[0-9]+$ ]]
		then
			echo "That is not an integer, guess again:"
		else
			if [[ $GUESS -lt $NUMBER ]]
			then
				echo "It's higher than that, guess again:"
				TRY=$((TRY+1))
			elif [[ $GUESS -gt $NUMBER ]]
			then
				echo "It's lower than that, guess again:"
				TRY=$((TRY+1))
			elif [[ $GUESS == $NUMBER ]]
			then
				INSERT=$($PSQL "insert into games(user_id, guesses) values($USER_ID, $TRY)")
				echo -e "You guessed it in $TRY tries. The secret number was $NUMBER. Nice job!"
				WIN=true
			fi
		fi
	done
	fi
}

MAIN

