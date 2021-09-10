export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export PAGER="nvim +Man!"
export TERMINAL="st -e tmux"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="lf"

export PATH="$(find $HOME/.local/bin/scripts -type d | tr '\n' ':')$HOME/.local/share/go/bin/:$HOME/.local/bin/:$PATH"

export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_SDK_HOME="$XDG_DATA_HOME/android/"
export ANDROID_SDK_ROOT="/opt/android-sdk/"
export BTPD_HOME="$XDG_CONFIG_HOME/btpd"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gemexport GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export IDEA_PROPERTIES="${XDG_CONFIG_HOME}"/intellij-idea/idea.properties
export IDEA_VM_OPTIONS="${XDG_CONFIG_HOME}"/intellij-idea/idea.vmoptions
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _JAVA_AWT_WM_NONREPARENTING=1
export LESSHISTFILE="-"
export MAILCAPS="$XDG_CONFIG_HOME/mailcap/mailcap"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/mbsyncrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export STATUSBAR="dwmblocks"
export TRASH="$XDG_DATA_HOME/trash"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
"
