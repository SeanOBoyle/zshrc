# Download Znap, if it's not there yet.
[[ -f ~/.zsh-snap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap/zsh-snap

source ~/.zsh-snap/zsh-snap/znap.zsh  # Start Znap

# Launch Prompt First
znap prompt sindresorhus/pure

# Completions
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting

# History
znap source ohmyzsh/ohmyzsh plugins/history
znap source ohmyzsh/ohmyzsh plugins/per-directory-history

znap source davidde/git

znap source zpm-zsh/ssh

znap source zsh-users/zsh-syntax-highlighting

# OS - Command Not Found Helper
znap source ohmyzsh/ohmyzsh plugins/command-not-found

# Common aliases
znap source ohmyzsh/ohmyzsh plugins/common-aliases

znap source marlonrichert/zcolors
znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"
