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

function safe_source
    if test -f $argv[1]
        bass source $argv[1]
    end
end

safe_source ~/.profile
safe_source ~/.aliases

safe_source $HOME/.cargo/env
safe_source $HOME/.rye/env

# bass source ~/.profile
# bass source ~/.aliases

if status is-interactive
  # Commands to run in interactive sessions can go here
end
