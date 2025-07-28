# work around since starship can insert a newline before the prompt
function starship_transient_prompt_func
    tput cuu1
    starship module character
end

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"

starship init fish | source

enable_transience
