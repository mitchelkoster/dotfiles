# Personal .dotfiles
My personal software configuration.

To copy over configurations for the applications create the desired symlinks.

```bash
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vimrc ~/.vimrc

ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/.keybindings.zsh ~/.keybindings.zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

## Configuring tmux
For *tmux*, in order to be able to copy to the clipboard `xclip` needs to be installed, as well as the `tpm` package manager.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install xclip
```

Once complete initialize a tmux session and load the confighruation with `<PREFIX> + I` and reload with ` <PREFIX> + r`.

## Configuring zsh
For *zsh* in order to function `zsh` as well as `git` needs to be installed. The `fzf` program is included for *fuzzy searching* of history/files.

```bash
sudo apt install fzf zsh git
chsh -s $(which zsh)
```
