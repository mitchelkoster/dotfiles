# Personal .dotfiles
My personal software configuration.

To copy over configurations for the applications create the desired symlinks.

```bash
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vimrc ~/.vimrc
```

## Configuring tmux
For *tmux*, in order to be able to copy to the clipboard `xclip` needs to be installed, as well as the `tpm` package manager.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install xclip
```

Once complete initialize a tmux session and load the confighruation with `<PREFIX> + I` and reload with ` <PREFIX> + r`.
