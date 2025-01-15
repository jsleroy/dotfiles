starship init fish | source

if not functions -q fundle;
  eval (curl -sfL https://git.io/fundle-install);
end

fundle plugin "edc/bass"
fundle plugin "oh-my-fish/plugin-foreign-env"

fundle install

alias ls="exa --icons"
alias ll="exa --icons -F -H -l --group-directories-first"
alias lla="exa --icons -F -H -l -a --group-directories-first"

fenv source ~/.profile

if status is-interactive
  # Commands to run in interactive sessions can go here
end
