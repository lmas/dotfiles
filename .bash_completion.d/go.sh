#!/usr/bin/env bash
#
# Bash completion for golang.  Copyright 2015 Makoto Onuki
#
# Usage: source go.sh

_go_complete() {
  local -A _go_flags
  local _go_build_flags="-a -n -p -race -v -work -x -cclfags -compiler -gccgoflags -gcflags -installsuffix -ldflags -tags"
  local _go_test_flags="-bench -benchmem -benchtime -blockprofile -blockprofilerate -cover -covermode -coverpkg -coverprofile -cpu -cpuprofile -memprofile -memprofilerate -outputdir -parallel -run -short -timeout -v"

  local cmd="${COMP_WORDS[0]}"
  local sub="${COMP_WORDS[1]}"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"

  local cand=""
  case "$prev" in
    "go")
      cand="build clean env fix fmt generate get install list run test tool version vet"
      ;;
    *)
      case "$cur" in
        -*)
          case "$sub" in
            build)    cand="-help -o -i ${_go_build_flags}" ;;
            clean)    cand="-help -i -r -n -x ${_go_build_flags}" ;;
            env)      cand="-help " ;;
            fix)      cand="-help " ;;
            fmt)      cand="-help -n -x" ;;
            generate) cand="-help -run" ;;
            get)      cand="-help -d -f -fix -t -u ${_go_build_flags}" ;;
            install)  cand="-help ${_go_build_flags}" ;;
            list)     cand="-help -e -f -json ${_go_build_flags}" ;;
            run)      cand="-help -exec ${_go_build_flags}" ;;
            test)     cand="-help -i -c -exec -o ${_go_build_flags} ${_go_test_flags}" ;;
            tool)     cand="-help -n" ;;
            version)  cand="-help " ;;
            vet)      cand="-help -n -x" ;;
          esac
          ;;
      esac
      ;;
  esac
  if [ "x$cand" = "x" ] ; then
    COMPREPLY=($(compgen -f -- ${cur}))
  else
    COMPREPLY=($(compgen -W "$cand" -- ${cur}))
  fi
}

_godoc_complete() {
  local cur="${COMP_WORDS[COMP_CWORD]}"

  local cand=""
  case "$cur" in
    -*)
      cand="-v -q -src -tabwidth -timestamps -index -index_files -index_throttle -links -write_index -index_files -maxresults -notes -html -goroot -http -server -analysis -templates -url -zip -help"
      ;;
  esac
  if [ "x$cand" = "x" ] ; then
    COMPREPLY=($(compgen -f -- ${cur}))
  else
    COMPREPLY=($(compgen -W "$cand" -- ${cur}))
  fi
}

complete -o filenames -o bashdefault -F _go_complete go
complete -o filenames -o bashdefault -F _godoc_complete godoc
