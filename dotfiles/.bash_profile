# This is ~/.bash_profile on JHB macs.
# 
# This file should contain settings that are macOS or machine specific;
# all custom aliases are stored in .bash_custom and being sourced here
# so that they can be easily copied to a remote machine's .bash_profile. 


# keep everthing in a custom file
if [ -f ~/.bash_custom ]; then
	. ~/.bash_custom
fi


# ===============================
# set paths (machine dependent)
# ===============================

# === ruby / gem ===

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# after ruby installation
export PATH="/usr/local/opt/ruby/bin:$PATH"


# === python ===

# manually adding path for python
# (following warning at package installation)
export PATH="/Users/jhb/Library/Python/3.7/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# make the `conda` command available, but not activate it
source ~/anaconda3/etc/profile.d/conda.sh

