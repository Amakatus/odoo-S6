#!/bin/bash

apt update && apt full-upgrade

apt-get install -y sudo

sudo adduser user sudo
