# Initialize starship prompt (if available)
if command -v starship >/dev/null 2>&1
  starship init fish | source
end
