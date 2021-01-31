#!/bin/bash

read yn
if [ "$yn" != "Y" ]; then
  echo "1 no"
fi
if ! [ "$yn" = "Y" ]; then
  echo "2 no"
fi
