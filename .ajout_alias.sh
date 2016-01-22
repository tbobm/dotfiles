#!/usr/bin/env bash

echo "Under what alias?"
read alias
echo "which means ?"
read meaning
full="alias '$alias'='$meaning'"
echo $full >> ~/.bash_profile
