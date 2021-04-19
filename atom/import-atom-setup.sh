#!/bin/bash

# This assumes that Atom is already installed.

# === install packages ===

apm install --packages-file apm_list.txt


# === copy configurations ===

# create ~/.atom if it does not already exist
mkdir -p ~/.atom

# just to be safe, make copies of existing configs
mkdir tmp
cp ~/.atom/*.* tmp/

# copy the config files only, but not the subfolders like compile-cache
cp dot-atom/*.* ~/.atom/

