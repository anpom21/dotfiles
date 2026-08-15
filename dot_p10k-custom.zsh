#!/usr/bin/env bash

typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION=''
typeset -g POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION='(${P9K_CONTENT})'
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    typeset -g my_git_format=$P9K_CONTENT
    return
  fi

  local branch
  local git_ref_color='%F{#F14C4C}'

  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    branch=${(V)VCS_STATUS_LOCAL_BRANCH}
    typeset -g my_git_format="%B${git_ref_color}[${branch//\%/%%}]%f%b"
  elif [[ -n $VCS_STATUS_TAG ]]; then
    local tag=${(V)VCS_STATUS_TAG}
    typeset -g my_git_format="%B${git_ref_color}[#${tag//\%/%%}]%f%b"
  else
    typeset -g my_git_format="%B${git_ref_color}[@${VCS_STATUS_COMMIT[1,8]}]%f%b"
  fi
}
functions -M my_git_formatter 2>/dev/null

typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'

