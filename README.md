# Neovim Config

This is a personal [LazyVim](https://lazyvim.github.io/) setup with a few workflow tweaks:

- `F2` toggles the Snacks explorer
- `F8` toggles a reusable bottom terminal
- `Ctrl-z` and `Ctrl-y` provide undo/redo shortcuts similar to GUI editors
- Blade, Vue, TypeScript, Tailwind, ESLint, and Prettier support are enabled

## Installation

1. Make sure you have [Neovim](https://neovim.io/) (>= 0.10.0) installed.
   - **macOS (Homebrew):** `brew install neovim`
   - **Ubuntu/Debian:** `sudo add-apt-repository ppa:neovim-ppa/unstable && sudo apt update && sudo apt install neovim`
   - **Arch Linux:** `sudo pacman -S neovim`
   - **Windows (Winget):** `winget install Neovim.Neovim`
   - **Other platforms:** See the [Neovim Installation Guide](https://github.com/neovim/neovim/blob/master/INSTALL.md).
2. Back up your existing Neovim configuration (if any):
   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   mv ~/.local/state/nvim ~/.local/state/nvim.bak
   mv ~/.cache/nvim ~/.cache/nvim.bak
   ```
3. Clone this repository into your Neovim configuration directory:
   ```sh
   git clone https://github.com/kara7z/nvim-config.git ~/.config/nvim
   ```
4. Start Neovim! LazyVim will automatically download and install plugins on the first run.
   ```sh
   nvim
   ```

Useful checks:

```sh
stylua . # if stylua is installed on your PATH
XDG_STATE_HOME=/tmp/nvim-state XDG_CACHE_HOME=/tmp/nvim-cache nvim --headless "+qa"
```
