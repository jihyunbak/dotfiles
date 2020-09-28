#!/bin/bash

# append these lines to ~/.bash_profile
# to customize my shell while keeping .bash_profile clean.
{
    echo "" 
    echo "# include custom alises and settings"
    echo "if [ -f ~/.bash_aliases ]; then"
    echo "    . ~/.bash_aliases"
    echo "fi"
    echo ""
} >> ~/.bash_profile

