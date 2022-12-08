# My Configuration File

## Installation

In the home directory, backup `.config` if it exists.

```bash
mv .config .config.bak
```

Download the repository.

```bash
git clone https://github.com/seong-hun/my-config.git .config
```

### Node.js and Pyright

Download Node.js from the [website](https://nodejs.org/en/).

Install [Pyright](https://github.com/microsoft/pyright) using

```bash
sudo node install -g pyright
```

### Homebrew Packages

Install [Homebrew](https://brew.sh/index_ko) using

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Update the Homebrew.

```bash
brew update
```

Install [efm-langserver](https://github.com/mattn/efm-langserver) using

```bash
brew install efm-langserver
```

Install a font (I prefer the Hack Nerd Font).

```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

Change the font setting from the preference of iTerm2.
Go to `iTerm2 > Settings...` or press `command + ,`.
Go to `Profiles > Text > Font` and change the font to `Hack Nerd Font`.

### Black and Isort

In a prefered environment (e.g., a conda env), install the following packages.

```bash
pip install black isort
```

or in a conda env,

```bash
conda install black isort
```

### NeoVim

Install [Neovim](https://neovim.io) using

```bash
brew install neovim
```

Open NeoVim and type the following command to install packages with [packer.nvim](https://github.com/wbthomason/packer.nvim).

```bash
:PackerSync
```

You may close all the vim instances and reopen/rerun the above command several times until no error messages appear.

## Usage

### LspSaga

Use [LspSaga](https://github.com/glepnir/lspsaga.nvim) to navigate to definitions and references.
Press `<Leader>gh`.

### Telescope

Use [Telescope](https://github.com/nvim-telescope/telescope.nvim) to search and navigate to a file.
Press `<Leader>ff`.

### Black and Isort

Writing (`:w`) a python buffer in a NeoVim instance, `black` and `isort` will be automatically executed and modify the buffer without writing.
