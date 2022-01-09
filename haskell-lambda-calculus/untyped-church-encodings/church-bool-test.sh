#!/bin/bash

# Simulates a ghci session using the ChurchBool module
MODULE="ChurchBool"
EXPRESSIONS=(
  "boolUnchurch (boolChurch True)"
  "boolUnchurch (boolChurch False)"
  "boolUnchurch (neg (boolChurch False))"
  "boolUnchurch (neg (boolChurch True))"
  "boolUnchurch (conj (boolChurch False) (boolChurch False))"
  "boolUnchurch (conj (boolChurch False) (boolChurch True))"
  "boolUnchurch (conj (boolChurch True) (boolChurch False))"
  "boolUnchurch (conj (boolChurch True) (boolChurch True))"
  "boolUnchurch (disj (boolChurch False) (boolChurch False))"
  "boolUnchurch (disj (boolChurch False) (boolChurch True))"
  "boolUnchurch (disj (boolChurch True) (boolChurch False))"
  "boolUnchurch (disj (boolChurch True) (boolChurch True))"
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
