#!/usr/bin/env bash
# Bash completion for Spring
# Installation: source this file locally in a terminal or from
# ~/.bashrc or put it in /etc/bash_completions.d (Debian) or in
# /usr/local/etc/bash_completion.d on a Mac with Homebrew

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

function _spring()
{

  local cur prev
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ ${prev} == "binstub" && ${cur} == -* ]] ; then
    local long_opts="--all --remove"
    COMPREPLY=( $(compgen -W "${long_opts}" -- ${cur}) )
    return
  fi

  if [[ ${prev} == "rake" ]]; then
      _rakecomplete
      return
  fi

  COMPREPLY=( $(compgen -W "binstub help status stop server rails rake" -- ${cur}) )
  return

}

complete -F _spring spring
