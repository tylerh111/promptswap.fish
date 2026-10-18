complete -c promptswap -f
complete -c promptswap -n __fish_use_subcommand -s h -l help -d 'Print help'
complete -c promptswap -n __fish_use_subcommand -s v -l version -d 'Print version'
complete -c promptswap -n __fish_use_subcommand -a choose -d 'Choose a prompt'
complete -c promptswap -n __fish_use_subcommand -a show -d 'Show prompts'
complete -c promptswap -n __fish_use_subcommand -a list -d 'List available prompts'
complete -c promptswap -n '__fish_seen_subcommand_from choose show' -a '(promptswap list | string sub -s 3)'
