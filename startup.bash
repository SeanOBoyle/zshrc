#!/bin/bash
cd ~
ln -sfn ~/git/zshrc ~/zshrc
ln -sfn ~/git/zshrc/zshrc.zsh ~/.zshrc
rm -rf ~/.zi
mkdir ~/.zi
git clone https://github.com/z-shell/zi.git ~/.zi/bin
cd ~

# setup git-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# launch new zsh
zsh

