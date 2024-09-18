# Shell

My main setup for the terminal prompt and development environments.

## Prerequisites

### 1. Zsh

I use the [Z-shell](https://www.zsh.org/) in my setup.

```shell
sudo dnf install zsh
chsh -s $(which zsh)
```

### 2. Homebrew

As primary package-manager I'm using [Homebrew](https://brew.sh/).

```shell
sudo dnf groupinstall 'Development Tools'
sudo dnf install procps-ng curl file git

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

I recommended to install all needed packages before adopting the full shell setup.

```shell
xargs brew install < homebrew-packages
```

### 3. mise-en-place

For managing my development environments I'm using [mise-en-place](https://mise.jdx.dev/)

```shell
curl https://mise.run | sh
```

After the full shell adaption all predefined tools can be installed using `mise install`.

### 4. Rust

I install the [Rust-toolchain](https://www.rust-lang.org/) via it's installer script.

```shell
sudo dnf install curl dnf-plugins-core cmake gcc clang make

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### 5. Atuin

[Atuin](https://atuin.sh/) is managing my shell history. I'm using it without sync.

```shell
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

### 6. zoxide

For easier navigation I'm using [zoxide](https://github.com/ajeetdsouza/zoxide) as replacement for `cd`.

```shell
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

## Adoption

After all prerequisites are installed the full shell configuration can be adopted.

```shell
stow --adopt -t ~/ shell
```
