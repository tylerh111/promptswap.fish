# promptswap:
#   * `promptswap choose <name>` chooses a prompt (persisted).
#   * `promptswap show [<name>]` show a prompt.
#   * `promptswap list` lists available prompts.
#
# Custom prompts live in ~/.config/fish/prompts/<name>.fish and MAY define
# `fish_prompt` and/or `fish_right_prompt`. Custom prompts take precedence
# over builtin prompts.

function promptswap --description 'Swap fish prompts'

    set -l cmd $argv[1]
    set -l dir $__fish_config_dir/prompts

    switch "$cmd"
        case -v --version
            echo "promptswap v0.1"
        case "" -h --help
            echo "usage: promptswap choose <prompt>     Choose a prompt"
            echo "       promptswap show [<prompt>]     Show a prompt"
            echo "       promptswap list                List available prompts"
            echo "       promptswap -v|--version        Print version"
            echo "       promptswap -h|--help           Print help"

        case choose
            set -l name $argv[2]
            if test -f $dir/$name.fish
                functions -e fish_prompt fish_right_prompt
                source $dir/$name.fish
            else if contains -- $name (fish_config prompt list)
                fish_config prompt choose $name
            else
                echo "promptswap: no such prompt '$name'" >&2
                return 1
            end
            set -U __promptswap_current $name

        case show
            echo "TODO"

        case list
            for name in (path basename -E $dir/*.fish; fish_config prompt list | sort -u)
                if test "$name" = "$__promptswap_current"
                    echo "* $name"
                else
                    echo "  $name"
                end
            end

    end
end

if status is-interactive; and set -q __promptswap_current
    promptswap choose $__promptswap_current
end
