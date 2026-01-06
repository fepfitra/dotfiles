
# set CLASSPATH $CLASSPATH $FLUME_HOME/lib/*
set fish_greeting
if status is-interactive
end

# fortune
# echo -e "\n"
# echo "scale=100; 4*a(1)" | bc -l

source /opt/google-cloud-cli/path.fish.inc

set PATH /home/fep/.local/bin $PATH
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:
pyenv init - fish | source


set BUN_INSTALL $HOME/.bun
set PATH $BUN_INSTALL/bin $PATH
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end
set DOT ~/.config/yolk

set ANDROID_HOME $HOME/android-sdk
set ANDROID_NDK_HOME $HOME/android-sdk/ndk/26.3.11579264/
set AARCH64_LINUX_ANDROID_OPENSSL_LIB_DIR
set OPENSSL_LIB_DIR
set AARCH64_LINUX_ANDROID_OPENSSL_INCLUDE_DIR
set PATH $PATH $ANDROID_HOME/platform-tools
# set JAVA_HOME /usr/lib/jvm/java-17-openjdk

set PATH "$PATH" "$HOME/.pub-cache/bin"




#powerline-setup
fish_vi_key_bindings
starship init fish | source
zoxide init fish | source
alias "x=xclip -selection clipboard"
alias "cdtemp=cd $(mktemp -d)"
alias "lg=lazygit"
alias "asu=sudo"
alias "bismillah=sudo"
alias 'lazypodman=DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'
alias 'lp=lazypodman'
alias "siuu=yay -Syu"
alias nd="nvapp nvim-devaslife"
alias n1="nvapp nvim-v1"
alias "cddot=cd $DOT"
alias ls="exa --git --git-repos"
alias rm="trash"
alias ff="fastfetch"
echo ""

function ccd
    cd (fd -t d . $HOME | fzf)
end

function cd
    # builtin z $argv
    z $argv
    tmux rename-window (basename (pwd))
end

function 0file
    curl -F"file=@$argv[1]" https://envs.sh
end

function 0pb
    curl -F"file=@-" https://envs.sh
end

function 0url
    curl -F"url=$argv[1]" https://envs.sh
end

function 0short
    curl -F"shorten=$argv[1]" https://envs.sh
end

function 0realtime
    exec "ls . | entr $argv[1]"
end

function 0qrterm
    qrencode -t ANSI $argv[1]
end

set JAVA_HOME /usr/lib/jvm/java-8-openjdk/
set HADOOP_HOME ~/hadoop/
set HADOOP_INSTALL $HADOOP_HOME
set HADOOP_MAPRED_HOME $HADOOP_HOME
set HADOOP_COMMON_HOME $HADOOP_HOME
set HADOOP_HDFS_HOME $HADOOP_HOME
set HADOOP_YARN_HOME $HADOOP_HOME
set HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
set PATH $PATH $HADOOP_HOME/sbin:$HADOOP_HOME/bin
set HADOOP_OPTS "-Djava.library.path=$HADOOP_HOME/lib/native"

#set JRE_HOME /usr/lib/jvm/java-8-openjdk/jre/
# set HADOOP_HOME /usr/local/hadoop

#set BIG_DATA_HOME ~/GitProject/big-data-starter/
#set HADOOP_HOME $BIG_DATA_HOME/hadoop-3.2.1
#set HADOOP_INSTALL $HADOOP_HOME
#set HADOOP_MAPRED_HOME $HADOOP_HOME
#set HADOOP_COMMON_HOME $HADOOP_HOME
#set HADOOP_HDFS_HOME $HADOOP_HOME
#set HADOOP_YARN_HOME $HADOOP_HOME
#set YARN_HOME $HADOOP_HOME
#set HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
#set PATH $PATH $HADOOP_HOME/sbin $HADOOP_HOME/bin
#set PATH $PATH $JAVA_HOME/bin

# set FLUME_HOME /usr/local/flume
# set FLUME_CONF /usr/local/flume/conf/
# set PATH $PATH $FLUME_HOME/bin
# set CLASSPATH $CLASSPATH $FLUME_HOME/lib/*
#
# set ZOOKEEPER_HOME /usr/local/zookeeper
# set PATH $PATH $ZOOKEEPER_HOME/bin

#set FLUME_HOME $BIG_DATA_HOME/apache-flume-1.6.0-bin
#set FLUME_CONF $FLUME_HOME/conf
