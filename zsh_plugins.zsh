#!/bin/zsh
#
# .zsh_plugins.txt - antidote plugins file
#

# All of the OMZ Lib Plugins
ohmyzsh/ohmyzsh path:lib

# Completions
mattmc3/ez-compinit
zsh-users/zsh-completions kind:fpath path:src
aloxaf/fzf-tab  # Remove if you don't use fzf

# Completion styles
belak/zsh-utils path:completion/functions kind:autoload post:compstyle_zshzoo_setup

# Keybindings
belak/zsh-utils path:editor

# History
belak/zsh-utils path:history

# Per Directory History
ohmyzsh/ohmyzsh path:plugins/per-directory-history

# Prompt
romkatv/powerlevel10k

# Utilities
zshzoo/macos conditional:is-macos
belak/zsh-utils path:utility
romkatv/zsh-bench kind:path
ohmyzsh/ohmyzsh path:plugins/extract
so-fancy/diff-so-fancy

# Other Fish-like features
zdharma-continuum/fast-syntax-highlighting  # Syntax highlighting
zsh-users/zsh-autosuggestions               # Auto-suggestions
zsh-users/zsh-history-substring-search      # Up/Down to search history
