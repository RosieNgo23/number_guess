#!/bin/bash
#number_guess

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(( $RANDOM % 1000 +1 ))
echo $NUMBER
echo -e "\nEnter your username:"
read USER_NAME

PLAYER_NAME=$($PSQL "SELECT player_name FROM players WHERE player_name = '$USER_NAME' ")

if [[ -z $PLAYER_NAME ]]
then
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."

else
  GAME_PLAYED=$($PSQL "SELECT game_played FROM players WHERE player_name = '$USER_NAME' ")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_name = '$USER_NAME' ")
  echo -e "\nWelcome back, $PLAYER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

#INSERT_GUESS_NUMBER=$($PSQL "INSERT INTO players ")
NUMBER_OF_GUESSES=1
if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
then
  echo -e "\nThat is not an integer, guess again:"
  read USER_GUESS
  NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
else
  while [[ $USER_GUESS != $NUMBER ]]
  do
    if (( $USER_GUESS > $NUMBER ))
    then
      echo -e "\nIt's lower than that, guess again:"
      read USER_GUESS
      NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
    else
      if (( $USER_GUESS < $NUMBER ))
      then
        echo -e "\nIt's higher than that, guess again:"
        read USER_GUESS
        NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
      else
        echo -e "\nYou guessed it in <number_of_guesses> tries. The secret number was $NUMBER. Nice job!"  
      fi
    fi
  done
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"  
  if [[ -z $PLAYER_NAME ]]
  then
    INSERT_GUESS_NUMBER=$($PSQL "INSERT INTO players (player_name, game_played, best_game) VALUES ( '$USER_NAME', 1 , $NUMBER_OF_GUESSES) ")
  else
    
    GAME_PLAYED=$(( $GAME_PLAYED + 1 ))
    if [[ $NUMBER_OF_GUESSES < $BEST_GAME ]]
    then
        BEST_GAME=$NUMBER_OF_GUESSES
    fi
    UPDATE_GUESS_NUMBER=$($PSQL "UPDATE players SET game_played = $GAME_PLAYED, best_game=$BEST_GAME WHERE player_name = '$PLAYER_NAME' ")

  fi
fi

