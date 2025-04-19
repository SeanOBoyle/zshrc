#!/bin/zsh
autoload -Uz compinit
compinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Antidote Modules
source ${ZDOTDIR:-$HOME}/.antidoterc

# Source Work File
if [[ -e ~/zshrc_work/work.zsh ]]; then
    source ~/zshrc_work/work.zsh
fi
if [[ -e ~/zshrc_work/worktools.zsh ]]; then
    alias srcwrk='source ~/zshrc_work/worktools.zsh'
fi

# Source "Me" File
if [[ -e ~/zshrc_me/me.zsh ]]; then
    source ~/zshrc_me/me.zsh
    alias srcme='source ~/zshrc_me/me.zsh'
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
