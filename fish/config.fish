set fish_greeting "hello fish"
# hello world
set -gx TERM xterm-256color
# vpn setting in terminal 
set JAVA_HOME /home/hp/.config/jdk-17.0.5
set CLASSPATH %JAVA_HOME%/lib:%JAVA_HOME%/jre/lib
set MAVEN_HOME "/opt/maven"
set JDTLS_HOME "/home/hp/.local/share/nvim/mason/packages/jdtls/"
set JDTLS_RUN_JAVA /home/hp/.config/jdk-17.0.5/bin/java
set PATH $PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin
set WORKSPACE $HOME/Workspace/ # 不设置则默认是$HOME/workspace
export PATH CLASSPATH JAVA_HOME JDTLS_HOME JDTLS_RUN_JAVA MAVEN_HOME

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
# alias ls "ls -p -G"
# alias la "ls -A"
# alias ll "ls -l"
# alias lla "ll -A"
alias g git
alias c clear
alias no neofetch
alias ra ranger
command -qv nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
#mapping
# setxkbmap -option ctrl:npcaps
/usr/bin/setxkbmap -option "ctrl:swapcaps"

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
