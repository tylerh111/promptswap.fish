# Reload the prompt whenever `promptswap choose` is run in any shell.
function __promptswap_reload --on-variable promptswap_current
    for func in fish_prompt fish_right_prompt
        set -l file $__fish_config_dir/functions/$func.fish
        test -f $file; and source $file
    end
end

function _promptswap_uninstall --on-event promptswap_uninstall
    # The generated prompt files are left in place, they're the user's prompt now.
    set -e -U promptswap_current
    functions -e __promptswap_reload _promptswap_uninstall
end
