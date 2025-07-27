set fish_greeting

set -gx ANDROID_SDK_ROO
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx NDK_HOME $ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)

alias add-pkg="bash ~/Code/dotfiles/scripts/add-package.bash"
alias lg="lazygit"
alias v="nvim"

starship init fish | source
