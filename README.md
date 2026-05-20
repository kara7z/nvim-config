# Neovim Config

This is a personal [LazyVim](https://lazyvim.github.io/) setup with a few workflow tweaks:

- `F2` toggles the Snacks explorer
- `F8` toggles a reusable bottom terminal
- `Ctrl-z` and `Ctrl-y` provide undo/redo shortcuts similar to GUI editors
- Blade, Vue, TypeScript, Tailwind, ESLint, and Prettier support are enabled

Useful checks:

```sh
stylua . # if stylua is installed on your PATH
XDG_STATE_HOME=/tmp/nvim-state XDG_CACHE_HOME=/tmp/nvim-cache nvim --headless "+qa"
```
