#!/bin/bash

ls | tr "a-zA-Z" "A-Za-z" | tr -d "aA"

