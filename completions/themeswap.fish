complete -c themeswap -f
complete -c themeswap -n __fish_use_subcommand -s h -l help -d 'Print help'
complete -c themeswap -n __fish_use_subcommand -s v -l version -d 'Print version'
complete -c themeswap -n __fish_use_subcommand -a choose -d 'Choose a theme'
complete -c themeswap -n __fish_use_subcommand -a show -d 'Show themes'
complete -c themeswap -n __fish_use_subcommand -a list -d 'List available themes'
complete -c themeswap -n '__fish_seen_subcommand_from choose show' -a '(themeswap list | string sub -s 3)'
