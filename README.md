# Promptswap.fish

Promptswap is a simple tool that allows users to swap between different fish shell prompts including built-in and custom prompts.
Custom prompts are defined in `~/.config/fish/prompts` and MUST define either `fish_prompt` or `fish_right_prompt`.

```bash
promptswap choose <prompt>    # choose a prompt
promptswap show   [<prompt>]  # show a prompt (WIP)
promptswap list               # list available prompts
```
