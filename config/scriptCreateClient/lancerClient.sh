#!/bin/bash

cd $1

docker compose down

docker compose run -d