

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

[[ "$(uname -s)" = "Darwin" ]] && export JAVA_HOME=$(/usr/libexec/java_home | head -n1)

export ANDROID_HOME=$HOME/Android/Sdk
export EDITOR=vim
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
