
# set CLASSPATH $CLASSPATH $FLUME_HOME/lib/*

if status is-interactive
  fortune
  # Commands to run in interactive sessions can go here
  set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
  source /usr/share/powerline/bindings/fish/powerline-setup.fish
  powerline-setup
  fish_vi_key_bindings
  alias "x=xclip -selection clipboard" 
  alias "cdtemp=cd $(mktemp -d)"
  alias "lg=lazygit"
  echo ""

  set BUN_INSTALL $HOME/.bun
  set PATH $BUN_INSTALL/bin $PATH
  set DOT $HOME/GitProject/dotfiles/

  # 0file() { curl -F"file=@$1" https://envs.sh ; }
  # 0pb() { curl -F"file=@-;" https://envs.sh ; }
  # 0url() { curl -F"url=$1" https://envs.sh ; }
  # 0short() { curl -F"shorten=$1" https://envs.sh ; }
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

  function realtime
      exec "ls . | entr $argv[1]"
  end

  set JAVA_HOME /usr/lib/jvm/java-21-openjdk/
  # set JRE_HOME /usr/lib/jvm/java-8-openjdk/jre/
  set HADOOP_HOME /usr/local/hadoop
  set HADOOP_INSTALL $HADOOP_HOME
  set HADOOP_MAPRED_HOME $HADOOP_HOME
  set HADOOP_COMMON_HOME $HADOOP_HOME
  set HADOOP_HDFS_HOME $HADOOP_HOME
  set HADOOP_YARN_HOME $HADOOP_HOME
  set YARN_HOME $HADOOP_HOME
  set HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
  set PATH $PATH $HADOOP_HOME/sbin $HADOOP_HOME/bin
  set PATH $PATH $JAVA_HOME/bin

  set FLUME_HOME /usr/local/flume
  set FLUME_CONF /usr/local/flume/conf/
  set PATH $PATH $FLUME_HOME/bin
end