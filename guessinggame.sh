#!/bin/bash
# File: guessinggame.sh

function guess { # Function guess
  local response=$1
  local filecount=$(ls -al | grep '^-' | wc -l) # List regular files only, directories not included
  if [[ $response -gt $filecount ]] # If statement
  then
    echo 'Your guess was too high. Please try again.'
    return 1 # Returns true
  elif [[ $response -lt $filecount ]]
  then
    echo 'Your guess was too low. Please try again.'
    return 1 # Returns true
  else
    echo "Congratulations! You got it right. There are $filecount files in the current directory."
    return 0 # Returns false
  fi
}

declare response

bool=1 # Flag variable: 1 = true (runs while loop), and 0 = false (exits while loop)
while [[ $bool -eq 1 ]] # While loop
do
  echo 'How many files are there in the current directory?'
  read -p "What's your guess? (Enter a number): " response
  if [[ $response =~ ^[0-9]$ ]] || [[ $response =~ ^[1-9][0-9]+$ ]]
  then
    guess $response # Calls function guess
    bool=$? # Gets the returned value of function guess
  else
    echo 'Invalid input. Please enter a number.'
  fi
done
