function fish_command_not_found
    comma "$argv[1]" $argv[2..-1]
    # set commands $(nix-locate --minimal --type x --type s --no-group --top-level --whole-name --at-root "/bin/$argv")

    # if not test "$commands"
    #     echo "Command couldn't be found"
    #     return
    # end
    # comma "$argv"
    # echo "Command not installed, it can be found in:"
    # for command in $commands
    #     echo "- $command"
    # end
    # __fish_default_command_not_found_handler $argv
end
