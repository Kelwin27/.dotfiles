
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

# Catppuccin Macchiato palette (hex colors need a truecolor terminal, Ghostty has it)
#   rosewater #f4dbd6  flamingo #f0c6c6  pink     #f5bde6  mauve    #c6a0f6
#   red       #ed8796  maroon   #ee99a0  peach    #f5a97f  yellow   #eed49f
#   green     #a6da95  teal     #8bd5ca  sky      #91d7e3  sapphire #7dc4e4
#   blue      #8aadf4  lavender #b7bdf8  text     #cad3f5  subtext1 #b8c0e0
#   subtext0  #a5adcb  overlay2 #939ab7  overlay1 #8087a2  overlay0 #6e738d
#   surface2  #5b6078  surface1 #494d64  surface0 #363a4f  base     #24273a
#   mantle    #1e2030  crust    #181926
#
# Rule used everywhere: pastel plate -> dark text (base/crust),
#                       dark plate (surface0) -> pastel text.

() {
  emulate -L zsh -o extended_glob

  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir                     # current directory
    vcs                     # git status
    newline                 # \n
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    direnv                  # direnv status (https://direnv.net/)
    asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
    virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
    anaconda                # conda environment (https://conda.io/)
    pyenv                   # python environment (https://github.com/pyenv/pyenv)
    goenv                   # go environment (https://github.com/syndbg/goenv)
    luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
    toolbox                 # toolbox name (https://github.com/containers/toolbox)
    context                 # user@hostname
    ranger                  # ranger shell (https://github.com/ranger/ranger)
    nnn                     # nnn shell (https://github.com/jarun/nnn)
    lf                      # lf shell (https://github.com/gokcehan/lf)
    xplr                    # xplr shell (https://github.com/sayanarijit/xplr)
    vim_shell               # vim shell indicator (:sh)
    midnight_commander      # midnight commander shell (https://midnight-commander.org/)
    nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
    chezmoi_shell           # chezmoi shell (https://www.chezmoi.io/)
    vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
    timewarrior             # timewarrior tracking status (https://timewarrior.net/)
    taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
    per_directory_history   # Oh My Zsh per-directory-history local/global indicator
    time                    # current time
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=none

  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # Frame around the prompt: overlay0, lambda: peach
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{#6e738d}┌─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%F{#6e738d}├─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{#6e738d}└─ %F{#f5a97f}λ'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND='#5b6078'
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'

  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='#cad3f5'

  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND='#a6da95'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND='#ed8796'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

  # Directory: blue plate, dark text
  typeset -g POWERLEVEL9K_DIR_BACKGROUND='#8aadf4'
  typeset -g POWERLEVEL9K_DIR_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#363a4f'
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#181926'
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-versions
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=first
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=25
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3


  typeset -g POWERLEVEL9K_DIR_CLASSES=()


  # Git: green = clean/untracked, yellow = modified, red = conflicts
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#a6da95'
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#eed49f'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#a6da95'
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='#ed8796'
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND='#5b6078'
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND='#cad3f5'

  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=

  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  function my_git_formatter() {
    emulate -L zsh

    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    # All plates here are pastel, so text is dark.
    local       meta='%F{#494d64}' # surface1: separators (# @ :), slightly dimmer
    local      clean='%F{#181926}' # crust
    local   modified='%F{#181926}' # crust
    local  untracked='%F{#181926}' # crust
    local conflicted='%F{#181926}' # crust (plate turns red on conflicts)

    local res

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
      (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
      res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
    fi

    if [[ -n $VCS_STATUS_TAG
          && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
        ]]; then
      local tag=${(V)VCS_STATUS_TAG}
      (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
      res+="${meta}#${clean}${tag//\%/%%}"
    fi

    [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
      res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
    fi

    if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
      res+=" ${modified}wip"
    fi

    if (( VCS_STATUS_COMMITS_AHEAD || VCS_STATUS_COMMITS_BEHIND )); then
      (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
      (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
      (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    elif [[ -n $VCS_STATUS_REMOTE_BRANCH ]]; then
    fi

    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=

  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

  # Status: OK = green on dark plate, error = dark on red plate
  typeset -g POWERLEVEL9K_STATUS_OK=true
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND='#a6da95'
  typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND='#a6da95'
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#181926'
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND='#ed8796'

  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND='#181926'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND='#ed8796'

  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND='#181926'
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND='#ed8796'

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='#f5a97f'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='#8bd5ca'
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='#363a4f'
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false

  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND='#eed49f'
  typeset -g POWERLEVEL9K_DIRENV_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_RANGER_FOREGROUND='#eed49f'
  typeset -g POWERLEVEL9K_RANGER_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_NNN_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_NNN_BACKGROUND='#8bd5ca'

  typeset -g POWERLEVEL9K_LF_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_LF_BACKGROUND='#8bd5ca'

  typeset -g POWERLEVEL9K_XPLR_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_XPLR_BACKGROUND='#8bd5ca'

  typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND='#a6da95'

  typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND='#eed49f'
  typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND='#7dc4e4'


  typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION=

  typeset -g POWERLEVEL9K_NIX_SHELL_VISUAL_IDENTIFIER_EXPANSION=' '

  typeset -g POWERLEVEL9K_CHEZMOI_SHELL_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_CHEZMOI_SHELL_BACKGROUND='#8aadf4'

  typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
  typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='#a6da95'
  typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
  typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND='#8aadf4'
  typeset -g POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
  typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND='#eed49f'
  typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=
  typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='#8087a2'

  typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_BACKGROUND='#c6a0f6'
  typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_BACKGROUND='#f5a97f'



  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='#ed8796'
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='#363a4f'
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND='#eed49f'
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND='#363a4f'
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND='#eed49f'
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=


  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND='#b7bdf8'
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  typeset -g POWERLEVEL9K_PYENV_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_PYENV_BACKGROUND='#b7bdf8'
  typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}'


  typeset -g POWERLEVEL9K_GOENV_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_GOENV_BACKGROUND='#b7bdf8'
  typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND='#8bd5ca'
  typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_LUAENV_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_LUAENV_BACKGROUND='#b7bdf8'
  typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
      '*'         OTHER)
  typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND='#c6a0f6'
  typeset -g POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND='#c6a0f6'
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_BACKGROUND='#363a4f'

  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_SHOW_ON_COMMAND='terraform|tf'

  typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_TOOLBOX_BACKGROUND='#f5a97f'
  typeset -g POWERLEVEL9K_TOOLBOX_CONTENT_EXPANSION='${P9K_TOOLBOX_NAME:#fedora-toolbox-*}'

  # Time: light-grey text on dark plate (was dark-grey on grey before)
  typeset -g POWERLEVEL9K_TIME_FOREGROUND='#a5adcb'
  typeset -g POWERLEVEL9K_TIME_BACKGROUND='#363a4f'
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
  typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=

  function prompt_example() {
    p10k segment -b '#ed8796' -f '#24273a' -i '⭐' -t 'hello, %n'
  }

  function instant_prompt_example() {
    prompt_example
  }

  typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND='#24273a'
  typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND='#ed8796'

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
