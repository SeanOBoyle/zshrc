#!/bin/bash
ZDOTDIR=~/.config/zsh
mkdir -p $ZDOTDIR
cd ~
ln -sfn ~/git/zshrc/zshenv.zsh ~/.zshenv
ln -sfn ~/git/zshrc/zshrc.zsh $ZDOTDIR/.zshrc
ln -sfn ~/git/zshrc/antidote.zsh $ZDOTDIR/.antidoterc
ln -sfn ~/git/zshrc/zfunctions $ZDOTDIR/.zfunctions
ln -sfn ~/git/zshrc/zshrc.d $ZDOTDIR/.zshrc.d
ln -sfn ~/git/zshrc/zsh_plugins.zsh $ZDOTDIR/.zsh_plugins.txt
ln -sfn ~/git/zshrc/zstyles.zsh $ZDOTDIR/.zstyles
rm -rf ~/git/antidote
git clone https://github.com/getantidote/antidote ~/git/antidote
ln -sfn ~/git/antidote $ZDOTDIR/.antidote
cd ~

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

