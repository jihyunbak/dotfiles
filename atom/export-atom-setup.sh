#!/bin/bash

# update the list of installed Atom packages
apm list --installed --bare > apm_list.txt

# update config files
cp ~/.atom/*.* dot-atom/

