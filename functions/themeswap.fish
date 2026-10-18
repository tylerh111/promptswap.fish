# themeswap:
#   * `themeswap choose <name>` chooses a theme (persisted).
#   * `themeswap show [<name>...]` shows themes.
#   * `themeswap list` lists available themes.
#
# Themes are the ones known to `fish_config theme`, i.e. builtin themes and
# `<name>.theme` files in ~/.config/fish/themes.
#
# Choosing a theme sets the universal variable `themeswap_current`, which
# applies the theme in every running shell (see conf.d/themeswap.fish).

function themeswap --description 'Swap fish themes'
    set -l cmd $argv[1]
    set -e argv[1]

    switch "$cmd"
        case -v --version
            echo "themeswap v0.2"

        case "" -h --help
            echo "usage: themeswap choose <theme>      Choose a theme"
            echo "       themeswap show  [<theme>...]  Show themes (default: all)"
            echo "       themeswap list                List available themes"
            echo "       themeswap -v|--version        Print version"
            echo "       themeswap -h|--help           Print help"

        case choose
            if test (count $argv) -ne 1
                echo "usage: themeswap choose <theme>" >&2
                return 1
            end
            set -l name $argv[1]
            if not contains -- $name (__themeswap_names)
                echo "themeswap: no such theme '$name'" >&2
                return 1
            end

            # Applies the theme in every running shell (see conf.d/themeswap.fish).
            set -U themeswap_current $name

        case show
            for name in $argv
                if not contains -- $name (__themeswap_names)
                    echo "themeswap: no such theme '$name'" >&2
                    return 1
                end
            end
            fish_config theme show $argv

        case list
            for name in (__themeswap_names)
                if test "$name" = "$themeswap_current"
                    echo "* $name"
                else
                    echo "  $name"
                end
            end

        case '*'
            echo "themeswap: unknown command '$cmd'" >&2
            return 1
    end
end

function __themeswap_names
    fish_config theme list | sort -u
end
