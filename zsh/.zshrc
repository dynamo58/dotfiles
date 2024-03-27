autoload -U colors && colors

# Disable CTRL-s from freezing your terminal's output.
stty stop undef

# Automatically cd into typed dir
setopt autocd

# Enable comments when working in an interactive shell.
setopt interactive_comments

# ===================================
# HISTORY CACHING
# ===================================

export HISTFILE="$HOME/.cache/history"
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=50000        # History lines stored in mememory.
export SAVEHIST=50000        # History lines stored on disk.
setopt INC_APPEND_HISTORY    # Immediately append commands to history file.
setopt HIST_IGNORE_ALL_DUPS  # Never add duplicate entries.
setopt HIST_IGNORE_SPACE     # Ignore commands that start with a space.
setopt HIST_REDUCE_BLANKS    # Remove unnecessary blank lines.

# ===================================
# PROMPT
# ===================================

PS1="\
%{$fg[red]%}\
[\
%{$fg[green]%}\
%n\
%{$fg[yellow]%}\
@\
%{$fg[magenta]%}\
%m \
%{$fg[blue]%}\
%~\
%{$fg[red]%}\
] "


# ===================================
# SHORTCUTS
# ===================================

export EDITOR="nvim"
export VISUAL="nvim"

alias ls="eza"
alias cat="bat"

alias code='vscodium'
alias reload_font_cache='fc-cache -f -v'
alias pomodoro='porsmo p c 45m 15m 15m'

# ===================================
# UTILS
# ===================================

# wrapper for yt-dlp audio extraction
# example: ytmp3 <link>
ytmp3() {
    yt-dlp --output "%(title)s.%(ext)s" -ciw --extract-audio --audio-format mp3 $1
}

# ===================================
#   PLUGINS
# ===================================

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# ===================================
#   PATH MODIFICATION
# ===================================

export PATH="$PATH:$HOME/.config/scripts"
source "$HOME/.cargo/env"

source $HOME/.config/broot/launcher/bash/br
