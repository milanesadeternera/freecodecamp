#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo "Welcome to My Salon, how can I help you?"
  fi
  
  #list services
  SERVICES=$($PSQL "select service_id, name from services")
  echo "$SERVICES" | while read SERVICE_ID bar NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done

  #ask for service
  read SERVICE_ID_SELECTED

  #is number?
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else

    CHECK_SERVICE_ID=$($PSQL "select * from services where service_id = $SERVICE_ID_SELECTED")

    if [[ -z $CHECK_SERVICE_ID ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
      else

      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'" | sed -r 's/^ *| *$//g' )
      if [[ -z $CUSTOMER_NAME ]]
      then
        #Creo el usuario
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      CUSTOMER_ID_Q=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
      CUSTOMER_ID=$(echo $CUSTOMER_ID_Q |sed -r 's/^ *| *$//g' )
      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
      read SERVICE_TIME

      INSERT_SERVICE_TIME=$($PSQL "insert into appointments(customer_id, service_id, time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
    
      echo -e "I have put you down for a cut at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
  fi
}
MAIN_MENU
