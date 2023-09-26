# Load colors
autoload -U colors && colors

# Disable CTRL-s from freezing your terminal's output.
stty stop undef

# Automatically cd into typed dir
setopt autocd

# Enable comments when working in an interactive shell.
setopt interactive_comments

# History settings.
export HISTFILE="$HOME/.cache/history"
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=50000        # History lines stored in mememory.
export SAVEHIST=50000        # History lines stored on disk.
setopt INC_APPEND_HISTORY    # Immediately append commands to history file.
setopt HIST_IGNORE_ALL_DUPS  # Never add duplicate entries.
setopt HIST_IGNORE_SPACE     # Ignore commands that start with a space.
setopt HIST_REDUCE_BLANKS    # Remove unnecessary blank lines.

# Completion setup
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# Include hidden files
_comp_options+=(globdots)

# eval "$(starship init zsh)"
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

#
#   Aliases & shortcuts
#

alias code='vscodium'
alias siuuuuu='yay -Syyu'
alias run_twitch_bot='cd ~/programming/twitch-bot; clear; cargo run'
alias reload_font_cache='fc-cache -f -v'
alias t='tmux new -A -s main'
alias hx='helix'
alias ssh='TERM=xterm-256color ssh'
alias pomodoro='pomotroid --disable-gpu-sandbox &!'

C="$HOME/.config"
M="/hdd/media"
P="$HOME/programming"

#
#   Functions
#

# wrapper for the `find` command
f() {
    dir=$1
    shift
    phrase=$@
    find ${dir} -name "${phrase}"
}

# clean up files
cleanup() {
    rm -rf ~/.local/share/Trash/*
    rm ~/.python_history ~/.node_repl_history
    yay -Scc
}

# a small info about resources taken up by a process (by name)
# example: sysuse firefox
sysuse() {
    ps -p $(pgrep $1) -o %cpu,%mem,cmd
}

# wrapper for yt-dlp audio extraction
# example: ytmp3 <link>
ytmp3() {
    yt-dlp --output "%(title)s.%(ext)s" -ciw --extract-audio --audio-format mp3 $1
}

# wrapper to use mpv as a music player
# example: mpv-music ./my-awesome-playlist
# source:
#     https://www.reddit.com/r/mpv/comments/kf4zdq/comment/gg6fyc4/?utm_source=share&utm_medium=web2x&context=3
#     https://www.reddit.com/r/mpv/comments/ukn0ko/mpv_shuffle_from_multiple_directories/
mpv-music() {
    mpv --input-ipc-server=/tmp/mpvsocket \
        --vo=null \
        --video=no \
        --no-video \
        --term-osd-bar \
        --no-resume-playback \
        --shuffle \
        "$@"
}

#
#   Path modifiers & sourcings
#

export PATH=/bin:/usr/bin:/usr/local/bin:${HOME}/.cargo/env:${PATH}
source ~/.config/zsh/zsh-autosuggestions.zsh
source ~/.config/zsh/fast-syntax-highlighting.plugin.zsh
source "$HOME/.cargo/env"
