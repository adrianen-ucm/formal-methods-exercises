#!/bin/bash

# Simulates a ghci session using the ChurchNum module
MODULE="ChurchNum"
EXPRESSIONS=(
  "numUnchurch (numChurch 0)"
  "numUnchurch (numChurch 1)"
  "numUnchurch (numChurch 2)"
  "numUnchurch (numChurch 42)"
  "numUnchurch (add (numChurch 42) (numChurch 2))"
  "numUnchurch (mul (numChurch 42) (numChurch 2))"
  "numUnchurch (pow (numChurch 42) (numChurch 2))"
)

ghci < <(
  echo ":l ${MODULE}"
  for EXP in "${EXPRESSIONS[@]}"
  do
    echo "putStrLn \"$EXP\""
    echo "$EXP"
  done
  echo ":q"
)
