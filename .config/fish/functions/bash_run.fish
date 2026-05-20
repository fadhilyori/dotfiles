function bash_run --description "Run bash-syntax command(s) from fish"
  # If arguments are provided, run them as a single bash command
  if test (count $argv) -gt 0
    bash -c (string join ' ' $argv)
    return $status
  end

  # If there are no arguments but there is stdin (pipe/redirect), read from stdin
  if not isatty stdin
    bash -s
    return $status
  end

  # If called without arguments and without pipe — display usage
  echo "Usage:"
  echo "  bash_run 'command'"                        # single command
  echo "  bash_run 'cmd1 && cmd2'"                   # chained
  echo "  echo 'echo hello' | bash_run"              # from stdin/pipe
  echo "  bash_run < script.sh"                      # from file redirect
  return 1
end