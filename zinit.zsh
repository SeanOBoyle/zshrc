source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -Uz compinit

# OMZ Libs
zinit snippet OMZ::lib/bzr.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/compfix.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/correction.zsh
zinit snippet OMZ::lib/diagnostics.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/nvm.zsh
zinit snippet OMZ::lib/prompt_info_functions.zsh
zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
  path+=('/opt/homebrew/bin')
  export PATH
  zinit ice wait"0"
  zinit snippet OMZ::plugins/brew/brew.plugin.zsh
  zinit ice svn wait"0" lucid atinit"local ZSH=\$PWD" \
    atclone"mkdir -p plugins; cd plugins; ln -sfn ../. osx"
  zinit snippet OMZ::plugins/macos
  zinit ice wait"0"
  zinit snippet OMZ::plugins/iterm2/iterm2.plugin.zsh
elif [[ $CURRENT_OS == 'Linux' ]]; then

  if [[ $DISTRO == 'CentOS' ]]; then

  elif [[ $DISTRO == 'Ubuntu' ]]; then

  fi

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
  zinit ice wait"0"
  zinit snippet OMZ::plugins/cygwin/cygwin.plugin.zsh
fi

# OS - Command Not Found Helper
zinit ice wait"0"
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# Common aliases
zinit ice wait"0"
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# History
zinit ice wait"0"
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit ice wait"0"
zinit snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zinit ice wait"0"
zinit light zdharma-continuum/history-search-multi-word

# Git
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" nocompile'!'
zinit light tj/git-extras

# Repo (for git)
zinit ice svn; zinit snippet OMZ::plugins/repo

# Python
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit snippet OMZ::plugins/python/python.plugin.zsh
export VIRTUAL_ENV_DISABLE_PROMPT=1
if type workon &>/dev/null; then
  zinit snippet OMZ::plugins/virtualenv/virtualenv.plugin.zsh
  unset VIRTUAL_ENV_DISABLE_PROMPT
  zinit snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
fi

# Diff
zinit ice wait"0" as"program" pick"bin/git-dsf"
zinit light zdharma-continuum/zsh-diff-so-fancy

# Completions
zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Load the agkozak-zsh-prompt theme
zinit load agkozak/agkozak-zsh-prompt

# Configure the Prompt
AGKOZAK_COLORS_BRANCH_STATUS=248
AGKOZAK_BLANK_LINES=1
AGKOZAK_LEFT_PROMPT_ONLY=1
# Make the unicode prompt character red when superuser
# and reversed when in vi command mode
AGKOZAK_PROMPT_CHAR=( '%F{magenta}❯%f' '%F{red}❯%f' '%F{magenta}❮%f' )
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
AGKOZAK_USER_HOST_DISPLAY=0

