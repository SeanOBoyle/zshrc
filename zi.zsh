source ~/.zi/bin/zi.zsh
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
autoload -Uz compinit

# OMZ Libs
zi snippet OMZ::lib/bzr.zsh
zi snippet OMZ::lib/clipboard.zsh
zi snippet OMZ::lib/compfix.zsh
zi snippet OMZ::lib/completion.zsh
zi snippet OMZ::lib/correction.zsh
zi snippet OMZ::lib/diagnostics.zsh
zi snippet OMZ::lib/directories.zsh
zi snippet OMZ::lib/functions.zsh
zi snippet OMZ::lib/git.zsh
zi snippet OMZ::lib/grep.zsh
zi snippet OMZ::lib/history.zsh
zi snippet OMZ::lib/key-bindings.zsh
zi snippet OMZ::lib/misc.zsh
zi snippet OMZ::lib/nvm.zsh
zi snippet OMZ::lib/prompt_info_functions.zsh
zi snippet OMZ::lib/spectrum.zsh
zi snippet OMZ::lib/termsupport.zsh
zi snippet OMZ::lib/theme-and-appearance.zsh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
  path+=('/opt/homebrew/bin')
  export PATH
  zi ice wait"0"
  zi snippet OMZ::plugins/brew/brew.plugin.zsh
  zi ice wait"0"
  zi snippet OMZ::plugins/iterm2/iterm2.plugin.zsh
elif [[ $CURRENT_OS == 'Linux' ]]; then

  if [[ $DISTRO == 'CentOS' ]]; then

  elif [[ $DISTRO == 'Ubuntu' ]]; then

  fi

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
  zi ice wait"0"
  zi snippet OMZ::plugins/cygwin/cygwin.plugin.zsh
fi

# OS - Command Not Found Helper
zi ice wait"0"
zi snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# Common aliases
zi ice wait"0"
zi snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# History
zi ice wait"0"
zi snippet OMZ::plugins/history/history.plugin.zsh
zi ice wait"0"
zi snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zi ice wait"0"
zi load z-shell/H-S-MW

# Git
zi snippet OMZ::plugins/git/git.plugin.zsh
zi ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile'!'
zi light tj/git-extras

# Python
zi snippet OMZ::plugins/pip/pip.plugin.zsh
zi snippet OMZ::plugins/python/python.plugin.zsh
export VIRTUAL_ENV_DISABLE_PROMPT=1
if type workon &>/dev/null; then
  zi snippet OMZ::plugins/virtualenv/virtualenv.plugin.zsh
  unset VIRTUAL_ENV_DISABLE_PROMPT
  zi snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
fi

# Diff
zi ice wait"0" as"program" pick"bin/git-dsf"
zi light z-shell/zsh-diff-so-fancy

# Completions
zi light-mode for \
  z-shell/z-a-meta-plugins @annexes @zsh-users+fast

zi ice wait"0" atinit"zpcompinit; zpcdreplay"
zi light z-shell/fast-syntax-highlighting

zi ice wait"0" atload"_zsh_autosuggest_start"
zi light zsh-users/zsh-autosuggestions

# Load the agkozak-zsh-prompt theme
zi load agkozak/agkozak-zsh-prompt

# Configure the Prompt
AGKOZAK_COLORS_BRANCH_STATUS=248
AGKOZAK_BLANK_LINES=1
AGKOZAK_LEFT_PROMPT_ONLY=1
# Make the unicode prompt character red when superuser
# and reversed when in vi command mode
AGKOZAK_PROMPT_CHAR=( '%F{magenta}❯%f' '%F{red}❯%f' '%F{magenta}❮%f' )
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
AGKOZAK_USER_HOST_DISPLAY=0

