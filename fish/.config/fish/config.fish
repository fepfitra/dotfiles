
# set CLASSPATH $CLASSPATH $FLUME_HOME/lib/*

if status is-interactive
end

fortune
# Commands to run in interactive sessions can go here
set fish_function_path $fish_function_path /usr/share/powerline/bindings/fish
source /usr/share/powerline/bindings/fish/powerline-setup.fish
source /opt/google-cloud-cli/path.fish.inc

set PATH /home/fep/.local/bin $PATH

set BUN_INSTALL $HOME/.bun
set PATH $BUN_INSTALL/bin $PATH
source "$HOME/.cargo/env.fish"
set DOT $HOME/GitProject/dotfiles/


powerline-setup
fish_vi_key_bindings
alias "x=xclip -selection clipboard"
alias "cdtemp=cd $(mktemp -d)"
alias "lg=lazygit"
alias "asu=sudo"
alias "bismillah=sudo"
alias 'lazypodman=DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'
alias 'lp=lazypodman'
alias "siuu=yay -Syu"
alias nd="nvapp nvim-devaslife"
alias "cddot=cd $DOT"
alias ls="exa"
echo ""

# 0file() { curl -F"file=@$1" https://envs.sh ; }
# 0pb() { curl -F"file=@-;" https://envs.sh ; }
# 0url() { curl -F"url=$1" https://envs.sh ; }
# 0short() { curl -F"shorten=$1" https://envs.sh ; }
#
function cd
    builtin cd $argv
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
set JRE_HOME /usr/lib/jvm/java-8-openjdk/jre/
# set HADOOP_HOME /usr/local/hadoop

set BIG_DATA_HOME ~/GitProject/big-data-starter/
set HADOOP_HOME $BIG_DATA_HOME/hadoop-3.2.1
set HADOOP_INSTALL $HADOOP_HOME
set HADOOP_MAPRED_HOME $HADOOP_HOME
set HADOOP_COMMON_HOME $HADOOP_HOME
set HADOOP_HDFS_HOME $HADOOP_HOME
set HADOOP_YARN_HOME $HADOOP_HOME
set YARN_HOME $HADOOP_HOME
set HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
set PATH $PATH $HADOOP_HOME/sbin $HADOOP_HOME/bin
set PATH $PATH $JAVA_HOME/bin

# set FLUME_HOME /usr/local/flume
# set FLUME_CONF /usr/local/flume/conf/
# set PATH $PATH $FLUME_HOME/bin
# set CLASSPATH $CLASSPATH $FLUME_HOME/lib/*
#
# set ZOOKEEPER_HOME /usr/local/zookeeper
# set PATH $PATH $ZOOKEEPER_HOME/bin

set FLUME_HOME $BIG_DATA_HOME/apache-flume-1.6.0-bin
set FLUME_CONF $FLUME_HOME/conf


complete -c dvm -n __fish_use_subcommand -s h -l help -d 'Print help'
complete -c dvm -n __fish_use_subcommand -s V -l version -d 'Print version'
complete -c dvm -n __fish_use_subcommand -f -a install -d 'Install the latest <type> of discord'
complete -c dvm -n __fish_use_subcommand -f -a install-open-asar -d 'Install openasar for <type> of discord'
complete -c dvm -n __fish_use_subcommand -f -a update -d 'Update to the latest <type> of discord'
complete -c dvm -n __fish_use_subcommand -f -a remove -d 'Remove the installed <type> of discord'
complete -c dvm -n __fish_use_subcommand -f -a list -d 'Show all installed versions'
complete -c dvm -n __fish_use_subcommand -f -a completions -d 'Get shell completions'
complete -c dvm -n __fish_use_subcommand -f -a run -d 'Run discord with specific options'
complete -c dvm -n __fish_use_subcommand -f -a help -d 'Print this message or the help of the given subcommand(s)'
complete -c dvm -n "__fish_seen_subcommand_from install" -s v -l verbose
complete -c dvm -n "__fish_seen_subcommand_from install" -s o -l open-asar
complete -c dvm -n "__fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from install-open-asar" -s v -l verbose
complete -c dvm -n "__fish_seen_subcommand_from install-open-asar" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from update" -s v -l verbose
complete -c dvm -n "__fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from remove" -s v -l verbose
complete -c dvm -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from list" -s v -l verbose
complete -c dvm -n "__fish_seen_subcommand_from list" -s c -l check
complete -c dvm -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from run" -s v -l verbose
complete -c dvm -n "__fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a install -d 'Install the latest <type> of discord'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a install-open-asar -d 'Install openasar for <type> of discord'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a update -d 'Update to the latest <type> of discord'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a remove -d 'Remove the installed <type> of discord'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a list -d 'Show all installed versions'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a completions -d 'Get shell completions'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a run -d 'Run discord with specific options'
complete -c dvm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from install-open-asar; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help" -f -a help -d 'Print this message or the help of the given subcommand(s)'
