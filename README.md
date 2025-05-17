# dotfiles

Dotfiles.

## Quick Setup

1. Clone this repo:
   ```sh
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```
2. Symlink config files:
   ```sh
   ln -sf $PWD/fish/config.fish ~/.config/fish/config.fish
   ln -sf $PWD/starship.toml ~/.config/starship.toml
   ln -sf $PWD/ghostty/config ~/.config/ghostty/config
   ln -sf $PWD/.inputrc ~/.inputrc
   ```
3. Install dependencies (macOS):
   ```sh
   brew install fish starship zellij lazygit eza fzf zoxide
   ```
4. Set fish as your default shell (optional):
   ```sh
   chsh -s /opt/homebrew/bin/fish
   ```

- [starship](https://github.com/starship/starship)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [fish-shell](https://github.com/fish-shell/fish-shell)
- [zellij](https://github.com/zellij-org/zellij)
