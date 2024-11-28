#!/bin/bash

cd ~/Documents/code/pool-league
git submodule add https://github.com/mozrin/dynamic-makefiles.git dynamic-makefiles ./
git submodule update --init --recursive