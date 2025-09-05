# Personal .dotfiles
My personal software configuration.

## Instaling the Tools
If you want to install the full setup, some dependencies will be required.

```bash
# Install dependencies
sudo apt install stow \
   zsh \ 
   vim \ 
   nvim \ 
   zsh \ 
   xclip \ 
   git \ 
   fzf \
   make \
   gcc \
   ripgrep \
   unzip
```

Some tools will have to (likely) be installed outside of the package manager.

```bash
# Install Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Restore Configuration Files
To copy over configurations for the applications create the desired symlinks.

```bash
stow tmux
stow vim
stow nvim
stow zsh
```

You'll also have to switch the shell to ZSH

```bash
chsh -s $(which zsh)
```

## Notes:
### Tmux
For *tmux*, in order to be able to copy to the clipboard `xclip` needs to be installed, as well as the `tpm` package manager.

> If you are running into issues download the [latest version](https://github.com/tmux/tmux) of tmux.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Once complete initialize a tmux session and load the confighruation with `<PREFIX> + I` and reload with ` <PREFIX> + r`.

**Note:** If you ever need to reset the path to a session use:

```bash
:attach-session -t . -c '#{pane_current_path}'
```

## Zsh
For *zsh* in order to function `zsh` as well as `git` needs to be installed. The `fzf` program is included for *fuzzy searching* of history/files.

> If you are running into issues download the [latest version](https://github.com/junegunn/fzf) of fzf.

```bash
sudo apt install fzf zsh git
chsh -s $(which zsh)
```

## Neovim
For *neovim* in order to function some other libraries need to be installed.

> This configuration is based on [kickstart](https://github.com/nvim-lua/kickstart.nvim) and uses [neovim](https://github.com/neovim/neovim). 

