# Initialize zoxide for smarter directory navigation
if command -v zoxide >/dev/null 2>&1
  zoxide init fish | source

  # Override cd to use zoxide's z function
  function cd
    z $argv
  end
end
