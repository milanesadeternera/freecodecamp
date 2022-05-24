echo "$($PSQL "select count(*) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games full join teams on games.winner_id = teams.team_id where year = 2018 and round like 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select name from teams left join games on teams.team_id = games.winner_id or teams.team_id =games.opponent_id where year = 2014 and round like 'Eighth-Final' order by name asc")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select name from games left join teams on games.winner_id = teams.team_id group by name order by name asc")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select year, name from games full join teams on games.winner_id = teams.team_id where round like 'Final' order by year asc")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%'")"

