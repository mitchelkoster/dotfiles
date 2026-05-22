# Personal .dotfiles
My personal software configuration.

## Installing the Tools
If you want to install the full setup, some dependencies will be required.

```bash
sudo apt install stow \
   zsh \
   vim \
   neovim \
   tmux \
   xclip \
   git \
   fzf \
   make \
   gcc \
   ripgrep \
   unzip \
   lsd
```

Some tools will have to be installed outside of the package manager.

```bash
# Install Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

> **Note:** [Zinit](https://github.com/zdharma-continuum/zinit) (ZSH plugin manager) will install itself automatically the first time you open a shell.

## Restore Configuration Files
To copy over configurations for the applications, create the desired symlinks.

```bash
stow tmux
stow vim
stow neovim
stow zsh
stow alacritty
```

You'll also have to switch the shell to ZSH.

```bash
chsh -s $(which zsh)
```

## Notes
### Tmux
For *tmux*, in order to copy to the clipboard `xclip` needs to be installed, as well as the `tpm` package manager.

Once complete, initialize a tmux session and load the configuration with `<PREFIX> + I` and reload with `<PREFIX> + r`.

**Note:** If you ever need to reset the path of a session use:

```bash
:attach-session -t . -c '#{pane_current_path}'
```

### Zsh
For *zsh* to function, `zsh` and `git` need to be installed. The `fzf` program is included for fuzzy searching of history and files.

> If you are running into issues, download the [latest version](https://github.com/junegunn/fzf) of fzf.

### Neovim
For *neovim* to function, some other libraries need to be installed.

> This configuration is based on [LazyVim](https://www.lazyvim.org/) and uses [neovim](https://github.com/neovim/neovim).
