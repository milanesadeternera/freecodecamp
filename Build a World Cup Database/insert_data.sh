#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "truncate teams, games"

#year,round,winner,opponent,winner_goals,opponent_goals
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [ $YEAR != "year" ]; then
    #busco winner_id
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    if [[ -z $WINNER_ID ]]; then
      #no existe equipo. lo creo
      INSERT_R=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $INSERT_R == "INSERT 0 1" ]]; then
        WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
      fi
    fi 

    #busco opponent_id
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]; then
      #no existe equipo. lo creo
      INSERT_R=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $INSERT_R == "INSERT 0 1" ]]; then
        OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
      fi
    fi     

    #INSERTO RESULTADO DE MATCH
    INSERT_R=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
    fi
done
