# User paths
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications $fish_user_paths

# sets tools
set -x EDITOR nvim
set -x VISUAL emacsclient
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"
set TERM "xterm-256color"                         # Sets the terminal type
set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode

set LANG en_US.UTF-8
set export LC_MESSAGES C
set LC_ALL en_US.UTF-8

#set -x TERM alacritty
# Sets the terminal type for proper colors
set TERM "xterm-256color"
# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0
set -x FZF_DEFAULT_OPTS "--color=16,header:13,info:5,pointer:3,marker:9,spinner:1,prompt:5,fg:7,hl:14,fg+:3,hl+:9 --inline-info --tiebreak=end,length --bind=shift-tab:toggle-down,tab:toggle-up"
# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -g theme_nerd_fonts yes
# Hide welcome message
function fish_greeting
end
set VIRTUAL_ENV_DISABLE_PROMPT "1"

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

# Fzf stuff
set -x FZF_DEFAULT_OPTS --prompt="⌕ "

# Set `SDKMAN_AUTO_INIT=true` in `/etc/profile` for auto init
set -q SDKMAN_AUTO_INIT && sdkman-init
set fish_color_autosuggestion "#969896"
set fish_color_cancel -r
set fish_color_command "#0782DE"
set fish_color_comment "#f0c674"
set fish_color_cwd "#008000"
set fish_color_cwd_root red
set fish_color_end "#b294FF"
set fish_color_error "#fb4934"
set fish_color_escape "#fe8019"
set fish_color_history_current --bold
set fish_color_host "#F5AD99"
set fish_color_host_remote yellow
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_operator "#fe8019"
set fish_color_param "#0782DE"
set fish_color_quote "#b8bb26"
set fish_color_redirection "#F38666"
set fish_color_search_match bryellow background=brblack
set fish_color_selection white --bold background=brblack
set fish_color_status red
set fish_color_user brgreen
set fish_color_valid_path --underline
set fish_pager_color_completion normal
set fish_pager_color_description "#B3A07D" yellow
set fish_pager_color_prefix normal --bold underline
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_progress brwhite --background=cyan
set fish_color_search_match --background="#60AEFF"

# Colors for ls command
set -gx LSCOLORS "Cxbgdxdxbxdgeghegeacad"

switch (uname)
case Linux
    set -x OSTYPE "Linux"
case Darwin
    set -x OSTYPE "MacOS"
case FreeBSD NetBSD DragonFly
    set -x OSTYPE "FreeBSD"
case '*'
    set -x OSTYPE "unknown"
end

## ENV
# Fish 3.1+ doesn't add binaries to the path autmatically anymore
# https://github.com/fish-shell/fish-shell/issues/6594
contains /usr/local/bin $PATH
or set PATH /usr/local/bin $PATH
# On M1 Macs, homebrew installs things in /opt/homebrew
contains /opt/homebrew/bin
or set PATH /opt/homebrew/bin $PATH

#
### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/fish_git_prompt.fish
#
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'yes'

set -l cl_empress '757575'
set -l cl_gainsboro 'E0E0E0'
set -l cl_dodger_blue '297EF2'
set -l cl_gorse 'FFEB3B'
set -l cl_red_orange 'F52D2D'
set __fish_git_prompt_color_branch $cl_gorse -b $cl_empress
set __fish_git_prompt_color_dirtystate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_invalidstate $cl_red_orange -b $cl_gainsboro
set __fish_git_prompt_color_stagedstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_cleanstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_stashstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_upstream $cl_gainsboro -b $cl_empress
set __fish_git_prompt_color_untrackedfiles $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color $cl_gainsboro -b $cl_empress

set __fish_git_prompt_char_cleanstate '  '
set __fish_git_prompt_char_dirtystate '  '
set __fish_git_prompt_char_invalidstate '  '
set __fish_git_prompt_char_stagedstate '  '
set __fish_git_prompt_char_stashstate '  '
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles '  '
set __fish_git_prompt_char_upstream_ahead '  '
set __fish_git_prompt_char_upstream_behind '  '
set __fish_git_prompt_char_upstream_diverged '  '
set __fish_git_prompt_char_upstream_equal '  '
set __fish_git_prompt_char_upstream_prefix ' '

#
### PROMPT
#

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

set -gx VISUAL emacsclient
set -gx ALTERNATE_EDITOR vi

if not set --query ARE_FORMAT_VARS_INITIALIZED
    echo 'Setting format_* variables for text formatting'
    set -Ux ARE_FORMAT_VARS_INITIALIZED
    set -Ux format_normal (tput sgr0)
    set -Ux format_bold (tput bold)
    set -Ux format_italic (tput sitm)
    set -Ux format_underline (tput smul)
    set -Ux format_color_black (tput setaf 1)
    set -Ux format_color_red (tput setaf 1)
    set -Ux format_color_green (tput setaf 2)
    set -Ux format_color_yellow (tput setaf 3)
    set -Ux format_color_blue (tput setaf 4)
    set -Ux format_color_magenta (tput setaf 5)
    set -Ux format_color_cyan (tput setaf 6)
    set -Ux format_color_white (tput setaf 7)

    set -Ux format_blink (tput blink)
end


# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 2
set -U __done_notification_urgency_level low



## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish
## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


if not status --is-interactive
  exit
end

# Aliases
if [ -f $HOME/.config/aliasrc ]
    source $HOME/.config/aliasrc
end

if [ -f /usr/share/resources/ramallahos-shell-config/aliasrc ]
    source /usr/share/resources/ramallahos-shell-config/aliasrc
end


if [ -f $HOME/.config/fish/conf.d/abbreviations.fish ]
    source $HOME/.config/fish/conf.d/abbreviations.fish
end

if [ -f $HOME/.config/fish/conf.d/settings.fish ]
    source $HOME/.config/fish/conf.d/settings.fish
end

if status --is-login
    set -gx PATH $PATH ~/.bin
end

if status --is-login
    set -gx PATH $PATH ~/.local/bin
end

if command -sq fzf && type -q fzf_configure_bindings
  fzf_configure_bindings --directory=\ct
end

if not set -q -g fish_user_abbreviations
  set -gx fish_user_abbreviations
end

if test tree >/dev/null
    function l1;  tree --dirsfirst -ChFL 1 $argv; end
    function l2;  tree --dirsfirst -ChFL 2 $argv; end
    function l3;  tree --dirsfirst -ChFL 3 $argv; end
    function ll1; tree --dirsfirst -ChFupDaL 1 $argv; end
    function ll2; tree --dirsfirst -ChFupDaL 2 $argv; end
    function ll3; tree --dirsfirst -ChFupDaL 3 $argv; end
end

if type -q direnv
    eval (direnv hook fish)
end

### FUNCTIONS ###
# Fish command history
function history
    builtin history --show-time='%F %T ' | sort
end

# Make a backup file
function backup --argument filename
    cp $filename $filename.bak
end

# recently installed packages
function ripp --argument length -d "List the last n (100) packages installed"
    if test -z $length
        set length 100
    end
    expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n $length | nl
end

function gl
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv | fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` --bind "ctrl-m:execute: echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R'"
end

function ex --description "Extract bundled & compressed files"
    if test -f "$argv[1]"
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z $argv[1]
            case '*.deb'
                ar $argv[1]
            case '*.tar.xz'
                tar xf $argv[1]
            case '*.tar.zst'
                tar xf $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via ex"
        end
   else
       echo "'$argv[1]' is not a valid file"
   end
end

# reload fish config
function reload
    exec fish
    set -l config (status -f)
    echo "reloading: $config"
end

function less
    command less -R $argv
end

function cd
    builtin cd $argv; and ls
end

function personal
    cp -rf /personal/ ~
    cp -rf /personal/.* ~
end

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### SPARK ###
set -g spark_version 1.0.0
complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"
function spark -d "sparkline generator"
    if isatty
        switch "$argv"
            case {,-}-v{ersion,}
                echo "spark version $spark_version"
            case {,-}-h{elp,}
                echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
                echo "examples:"
                echo "       spark 1 2 3 4"
                echo "       seq 100 | sort -R | spark"
                echo "       awk \\\$0=length spark.fish | spark"
            case \*
                echo $argv | spark $argv
        end
        return
    end

    command awk -v FS="[[:space:],]*" -v argv="$argv" '
        BEGIN {
            min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
            max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
        }
        {
            for (i = j = 1; i <= NF; i++) {
                if ($i ~ /^--/) continue
                if ($i !~ /^-?[0-9]/) data[count + j++] = ""
                else {
                    v = data[count + j++] = int($i)
                    if (max == "" && min == "") max = min = v
                    if (max < v) max = v
                    if (min > v ) min = v
                }
            }
            count += j - 1
        }
        END {
            n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
            scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
            for (i = 1; i <= count; i++)
                out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
            print out
        }
    '
end
### END OF SPARK ###

# Spark functions
function letters
    cat $argv | awk -vFS='' '{for(i=1;i<=NF;i++){ if($i~/[a-zA-Z]/) { w[tolower($i)]++} } }END{for(i in w) print i,w[i]}' | sort | cut -c 3- | spark | lolcat
    printf  '%s\n' 'abcdefghijklmnopqrstuvwxyz'  ' ' | lolcat
end

function commits
    git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

function random-name --description "Random name for registration on random websites. How about Helen Lovick? Roger Rice?"
  curl www.pseudorandom.name
end

function random-alias --description "Docker-like alias generator: `thirsty_mahavira`, `boring_heisenberg`. Don't know how to name file/project/branch/file? Use this!"
  curl -s https://frightanic.com/goodies_content/docker-names.php | tee /dev/tty | xclip -sel clip; and echo -e "\ncopied to clipboard"
end

function random-email --description "Random email for registration on random websites. Generate random email in one of Mailinator subdomains and provide link to check it. Useful when <http://bugmenot.com/> is not available."
  set domain (echo -e \
"notmailinator.com
veryrealemail.com
chammy.info
tradermail.info
mailinater.com
suremail.info
reconmail.com" | shuf -n1)
  set name (curl -s www.pseudorandom.name | string replace ' ' '')
  set email $name@$domain
  printf "$email" | tee /dev/tty | xclip -sel clip
  echo -e "\ncopied to clipboard\nhttps://www.mailinator.com/v3/index.jsp?zone=public&query=$name#/#inboxpane"
end

function random-password --description "Generate random password" --argument-names 'length'
  test -n "$length"; or set length 13
  head /dev/urandom | tr -dc "[:alnum:]~!#\$%^&*-+=?./|" | head -c $length | tee /dev/tty | xclip -sel clip; and echo -e "\ncopied to clipboard"
end

function weather --description "Show weather"
  resize -s $LINES 125
  curl wttr.in/$argv
end

function xsh --description "Prepend this to command to explain its syntax i.e. `xsh iptables -vnL --line-numbers`"
  w3m -o confirm_qq=false "http://explainshell.com/explain?cmd=$argv"
  # replace w3m to any browser like chrome
end

function transfer --description "Upload file to transfer.sh"
  curl --progress-bar --upload-file $argv https://transfer.sh/(basename $argv)
end

function syn --description "Find synonyms for word"
  test -e ~/git/stuff/keys/bighugelabs || echo "Get API key at https://words.bighugelabs.com/account/getkey and put in "(status --current-filename)
  curl http://words.bighugelabs.com/api/2/(cat ~/git/stuff/keys/bighugelabs)/$argv/
end

function emoji --description "Search emoji by name"
  curl -s -X GET https://www.emojidex.com/api/v1/search/emoji -d code_cont=$argv | jq -r '.emoji | .[] | .moji | select(. != null)' | tr '\n' ' '
end

function waitweb --description 'Wait until web resource is available. Useful when you are waiting for internet to get back, or Spring to start' --argument-names 'url'
  set -q url || set url 'google.com'
  printf "Waiting for the $url"
  while not curl --output /dev/null --silent --head --fail "$url"
    printf '.'
    sleep 1
  end
  printf "\n$url is online!"
  notify-send -u critical "$url is online!"
end

function virustotal --description "Check file hash by virustotal.com"
  test -e ~/git/stuff/keys/virustotal || echo "Get API key at https://www.virustotal.com/gui/my-apikey and put in "(status --current-filename)
  curl -sL --request GET \
  --url https://www.virustotal.com/api/v3/files/(sha256sum $argv | cut -f 1 -d " ") \
  --header "x-apikey: "(cat ~/git/stuff/keys/virustotal) \
  | jq ".data .attributes .last_analysis_stats, .data .attributes .tags, .data .attributes .total_votes"
end

function fish_user_key_bindings --description "Key bindings. Go to functions definition for description. Use `fish_key_reader`. [Docs](https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_key_bindings.fish)"
#  * Clear input on `Ctrl`+`U`
    bind \cu 'commandline "";'

    if type -q fzf # Use fzf if installed
      bind \cr fzf-history-widget
      bind \cf search
      bind \ce scd
      bind \e\cf search-contents
    else # Use poor man completion (as up arrow, without search-as-you-type)
      echo "⚠ fzf is not installed. To greatly improve Ctrl+R, Ctrl+E, Ctrl+Alt+F and Ctrl+F type `update-fzf`"
      bind \cr history-search-backward
    end

#  * Exit on `Esc` if single command mode enabled
#    - See <https://github.com/dmi3/fish/blob/master/singlecmd.fish>
    if [ "$SINGLE_COMMAND" = "true" ]
      bind \e 'exit 0'
    end

#  * Convinient directory navigation using `Alt+Ctrl` + `→` `←` `↑`
#    - History back/forward/go to parent dir
#    - You can use Fish as file manager!
#    - Comes handy when you start typing command, then realize wrong dir
    bind \e\[1\;7D "prevd; echo; commandline -f repaint;"
    bind \e\[1\;7C "nextd; echo; commandline -f repaint;"
    bind \e\[1\;7A "cd ..; echo; commandline -f repaint;"
    bind \e\[1\;7B "prevd; echo; commandline -f repaint;"

    math (echo $version | tr -d .)"<231" > /dev/null; and echo "⚠ Please upgrade Fish shell to at least 2.3.0 https://fishshell.com/#platform_tabs"

#  * Send terminate on `Ctrl`+`Shift`+`C` to free `Ctrl`+`C` for copy (in terminal settings). See <https://developer.run/36>
    stty intr \^C
end

#  * Prints directory and currently running command in tab title ↓
#    - <img src="https://developer.run/pic/fish_title.png"/>
function fish_title --description "Prints directory and currently running command in tab title. `user@host` in prompt when connected via ssh."
  set -q SSH_CLIENT || set -q SSH_TTY && echo -n "🖧$USER@"(hostname)" "
  if [ "$_" != "fish" ]; echo "➤ $_ "; end
  echo 🖿 (basename (pwd))
end

function show_exit_code --description "Show exit code on command failure" --on-event fish_postexec
    set -l last_status $status
    set -g CMD_START_TIME (date)
    if [ $last_status -ne 0 -a $argv != "" ]
      echo (set_color F92672)"✖ $last_status"
    end
    # Exit after first command
    # See <https://github.com/dmi3/fish/blob/master/singlecmd.fish>
    if [ "$SINGLE_COMMAND" = "true" ]
      if [ $last_status -ne 0 ]
        read -P "Command failed ↑"
      else
        sleep 0.3
      end
      exit 0
    end
end

function what-did-just-happened --description "Show start time, and duration of last executed command"
  echo "Started: $CMD_START_TIME"
  echo "Duration: $CMD_DURATIONms"
end

function save_dir --description "If command was executed if directory, save dir to Ctrl+E history for quick access." --on-event fish_postexec
    test "$last_pwd"!="$PWD";
      and string match -q -r "(^\$|ls|cd|pwd|ll|echo|man)" $argv;
      or echo "$PWD" >> ~/.local/share/fish/fish_dir_history

    set -g last_pwd "$PWD"
end

#  * `Ctrl`+`R` show fzf (fuzzy) history search where you can:
#    - Super advanched analog or `Ctrl`+`R` in Bash
#    - Execute previos command
#    - Edit command before execution
#    - Delete history entry (very useful for no longer actual commands)
#    - <img src="https://developer.run/pic/fish_history.png"/>
function fzf-history-widget --description "Ctrl+R for history"
    history merge; history | fzf -q (commandline) -e +m --tiebreak=index --sort \
      --preview-window 'up:50%:wrap:hidden' \
      --preview 'echo {}' \
      --bind "left:execute(printf ' commandline %q' {})+cancel+cancel" \
      --bind "right:execute(printf ' commandline %q' {})+cancel+cancel" \
      --bind "del:execute(printf ' history delete %q' {})+cancel+cancel" \
      --bind "ctrl-x:execute(printf {} | xclip -sel clip)+cancel+cancel" \
      --bind "ctrl-a:toggle-preview" \
      --bind "ctrl-e:execute(echo ' eval scd')+cancel+cancel" \
      --header "[⏎] run; [←] edit; [del] delete; [ctrl]+[x] copy; [ctrl]+[a] show full;"\
      | read -l -d \0 result # -d is needed to avoid using space (history ignore) as delimeter
    and commandline $result
    and commandline -f repaint
    and commandline -f execute
end

function search --description "`CTRL`+`F` Fuzzy recursive search files by name in current directory & append selection to current command"
  if [ $argv == ""]
    find $PWD 2>/dev/null | fzf -q "'" \
      --bind "ctrl-f:execute(echo -e \" search-contents\n\")+cancel+cancel" | read -l result; and commandline -a $result
  else
    find $PWD -iname $argv 2>/dev/null  | fzf
  end
end

function search-contents --description "`ALT`+`CTRL`+`F` search (fuzzy) file by contents"
  if type -q ag
    ag --nobreak --no-numbers --noheading --max-count 100000 . 2>/dev/null \
        | fzf \
          -q "'" \
          --header 'Searching file contents' \
          --preview-window 'up:3:wrap' \
          --preview 'echo {} | cut -d ":" -f2' \
        | string split ':' | head -n 1 | read -l result
    and commandline $result
    and commandline -f repaint
  else
    echo "⚠ to speed up search install ag"
    grep -I -H -n -v --line-buffered --color=never -r -e '^$' . | fzf | string split ":" | head -n 1 | read -l result
    and commandline $result
    and commandline -f repaint
  end
end

function scd --description "`Ctrl`+`E` to access most frequently visited directories."
    cat ~/.local/share/fish/fish_dir_history | freq | fzf \
    -q "'" -e +m \
    --tiebreak=index \
    --bind "ctrl-r:abort" \
    --sort \
       | cut -c9- | read -l result
    and cd $result
    and commandline -f repaint
    and ls
end

function freq --description "Line frequency in piped input. See <https://gist.github.com/rsvp/1859875>"
  cat 1>| sort -f | uniq -c | sort -k 1nr -k 2f
end

function git-revert-file --description "Revert single file in git"
  git reset HEAD $argv; git checkout $argv
end

function git-wat --description "Show 5 latest commits"
  git log --pretty="format:%Cgreen%<(17,trunc)%an%Creset%s" --abbrev-commit  HEAD~5..HEAD
end

function git-recent-branches --description "Show recentbranches"
  git branch --sort=-committerdate
end

function git-pr --description "Create PR on Github"
  set from   (git config --get remote.origin.url | string match --regex "\:(.*)/" | tail -1)
  set to     (git config --get remote.oss.url | string match --regex "\:(.*)\.git" | tail -1)
  set branch (git rev-parse --abbrev-ref HEAD)

  xdg-open "https://github.com/$to/compare/master...$from:$branch?expand=1"
end

function src --description 'Open/edit source of script or function located in $PATH' --wraps which
  switch (functions --details $argv)
    case '-'
      gedit (grep -rwI "alias $argv" ~/.config/fish/* | string split ":" | head -n 1)
    case 'n/a'
      gedit (which $argv)
    case '*'
      gedit (functions --details $argv)
  end
end

function td --description "Add to ~/todo.md list"
  echo -e "\n- [ ] $argv" >> ~/todo.md
end


function lll --description "Scroll ll if theres more files that fit on screen"
  ls -l $argv --color=always | less -R -X -F
end

function mkcd --description "Create and cd to directory"
  mkdir $argv
  and cd $argv
end

function mounta --description "Mount archive"
  /usr/lib/gvfs/gvfsd-archive file=$argv 2>/dev/null &
  sleep 1
  cd $XDG_RUNTIME_DIR/gvfs
  cd (ls -p | grep / | tail -1) # cd last created dir
end

function umounta --description "Unmount all mounted archive (and gvfs locations)"
  gvfs-mount --unmount $XDG_RUNTIME_DIR/gvfs/*
end

function color --description "Print color"
  echo (set_color (string trim -c '#' "$argv"))"████████████████████████████████████████████████████████████████████████████████████"
end

function reset_windows --description  "Reset all windows size and bring it to main monitor. Useful if DE messes up in multiple monitor configuration"
  for f in (wmctrl -l | cut -d' ' -f 1)
    wmctrl -i -r $f -e 0,0,0,800,600
    wmctrl -i -a $f
  end
end

#  * Prepend `sudo` to `nano` command if file is not editable by current user
#    - Warn if file does no exist
function nano
  if not test -e "$argv"
    read -p "echo 'File $argv does not exist. Ctrl+C to cancel'" -l confirm
    touch "$argv" 2>/dev/null
  end

  if test -w "$argv"
    /bin/nano -mui $argv
  else
    echo "Editing $argv requires root permission"
    sudo /bin/nano -mui $argv
  end
end

function run --description "Make file executable, then run it"
  chmod +x "$argv"
  eval "./$argv"
end

function launch --description "Launch GUI program - hide output and don't close when terminal closes"
  eval "$argv >/dev/null 2>&1 &" & disown
end

function open --description "Open file by default application in new process"
  env XDG_CURRENT_DESKTOP=X-Generic xdg-open $argv >/dev/null 2>&1 & disown
end

function be --description "Exec command in bash. Useful when copy-pasting commands with imcompatible syntax to fish "
  bash -c "$argv"
end

function pm --description "Math using Python"
  python -c "print($argv)"
end

function subl --description "Starts Sublime Text. Additionally supports piping (i.e. `ls | subl`) and urls (i.e. `subl http://jenkins/logs`)"
  if [ (expr substr "$argv[1]" 1 4) = "http" ]
    curl $argv[1] | subl
  else if not tty >/dev/null
    set FILENAME (tempfile)
    cat >"$FILENAME"
    /opt/sublime_text/sublime_text "$FILENAME" "$argv"
  else
    /opt/sublime_text/sublime_text "$argv"
  end
end

function qr --description "Prints QR. E.g. super useful when you need to transfer private key to the phone without intermediaries `cat ~/.ssh/topsecret.pem | qr`"
  if [ "$argv" = "" ]
    qrencode --background=00000000 --foreground=FFFFFF -o - | kitty +kitten icat
  else
    printf "$argv" | qrencode --background=00000000 --foreground=FFFFFF -o - | kitty +kitten icat
  end
end

if status --is-interactive && type -q neofetch
   colorscript random
end




