# Dotfiles

This repository includes the `.dotfiles` for system configurations of Linux and MacOS.

## Management

The recommended way managing the `.dotfiles` of this repository is by using [GNU Stow](https://www.gnu.org/software/stow/).

```shell
stow --adopt -t ~/ CATEGORY
```

## Categories

All `.dotfiles` are grouped by their category. The current categories are:

- [alacritty](./alacritty/)
- [neovim](./neovim/)
- [shell](./shell/)
