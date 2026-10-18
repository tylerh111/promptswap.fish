# Apply the theme whenever `themeswap choose` is run in any shell.
function __themeswap_apply --on-variable themeswap_current
    set -q themeswap_current[1]; or return
    fish_config theme choose $themeswap_current
end

# Themes are applied as global variables, so new shells need to apply it too.
status is-interactive; and __themeswap_apply

function _themeswap_uninstall --on-event themeswap_uninstall
    set -e -U themeswap_current
    functions -e __themeswap_apply _themeswap_uninstall
end
