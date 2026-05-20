# Neovim Config

Welcome to my personal LazyVim configuration! This setup provides a fast, robust foundation with custom workflow tweaks designed to make transitioning from traditional GUI editors easier.

## Features & Keybindings

Here are the custom shortcuts added to this configuration:

| Key(s) | Action |
| :--- | :--- |
| `<F2>` | Toggles the **Snacks explorer** (file tree) |
| `<F8>` | Toggles a **reusable bottom terminal** |
| `Ctrl-z` | **Undo** (similar to GUI editors) |
| `Ctrl-y` | **Redo** (similar to GUI editors) |
| `Ctrl-a` | **Select all** text |

**Language Support Included:** Blade, Vue, TypeScript, Tailwind, ESLint, and Prettier.

## Prerequisites

Before installing, please ensure you have the following dependencies installed on your system:
1. **Git**: Required to download and manage plugins.
2. **A Nerd Font**: Required for displaying file icons correctly in the editor.
3. **A C Compiler** (e.g., `gcc` or `clang`): Required by `nvim-treesitter` for code syntax highlighting.
4. **Ripgrep**: Required for searching text across multiple files.

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

## Getting Started

When you launch Neovim for the first time, wait for the Lazy plugin manager to finish downloading everything.
1. Press `q` to close the plugin manager window once it finishes.
2. Type `:checkhealth` and press `Enter` to ensure your environment is set up correctly and verify no dependencies are missing.

## Useful Checks (for advanced users)

```sh
stylua . # if stylua is installed on your PATH
XDG_STATE_HOME=/tmp/nvim-state XDG_CACHE_HOME=/tmp/nvim-cache nvim --headless "+qa"
```
