#!/bin/bash

# Test bash script

greet() {
  local name="$1"
  echo "Hello, $name!"
}

add() {
  local a="$1"
  local b="$2"
  echo $((a + b))
}

greet "Bash"
result=$(add 2 3)
echo "2 + 3 = $result"
