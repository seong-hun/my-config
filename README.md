# My Configuration File

This configuartion has only been tested on Mac!

## Features

This configuration

- uses Pyright and [LspSaga](https://github.com/glepnir/lspsaga.nvim) to parse python files (to naviage to the definition, references, etc)
- uses Black and Isort to auto-formatting
- uses [Telescope](https://github.com/nvim-telescope/telescope.nvim) to file navigation
- uses some beautiful themes ([dashboard-nvim](https://github.com/glepnir/dashboard-nvim), [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- uses [vim-floaterm](https://github.com/voldikss/vim-floaterm) to emulate the terminal in a Neovim instance.

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
Go to `iTerm2 > Settings...` or press `<Command> + ,`.
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

### Neovim

Install [Neovim](https://neovim.io) using

```bash
brew install neovim
```

Open Neovim and type the following command to install packages with [packer.nvim](https://github.com/wbthomason/packer.nvim).

```bash
:PackerSync
```

You may close all the vim instances and reopen/rerun the above command several times until no error messages appear.

### Latex

Install MacTex from the [website](https://tug.org/mactex/mactex-download.html).

Install Skim (a PDF reader) from the [website](https://skim-app.sourceforge.io).
From the preference of SKim, `Sync > PDF-TeX Sync support`, set Preset field to `Custom`, type `nvim` in Command field, and type `--headless -c "VimtexInverseSearch %line '%file'"` in Arguments field.

## Usage

### LspSaga

Use [LspSaga](https://github.com/glepnir/lspsaga.nvim) to navigate to definitions and references.
Press `<Leader>gh`.

### Telescope

Use [Telescope](https://github.com/nvim-telescope/telescope.nvim) to search and navigate to a file.
Press `<Leader>ff`.

### Black and Isort

Writing (`:w`) a python buffer in a Neovim instance, `black` and `isort` will be automatically executed and modify the buffer without writing.

### Vimtex

Use [Vimtex](https://github.com/lervag/vimtex) to work with tex files.

Press `<Leader>ll` to auto-compile, and `<Leader>lv` to forward search.
The backward search will be performed with `<Command> + <Shift> + <LMB>`.

## [vim-floaterm](https://github.com/voldikss/vim-floaterm)

Press `<Leader>ft` to open a terminal window in a Neovim instance.
