#!/bin/zsh

mv ~/.zshrc ~/.zshrc.backup
ln -s $(pwd)/.zshrc ~/.zshrc

mv ~/.tmux.conf ~/.tmux.conf.backup
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup
ln -s $(pwd)/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup

source ~/.zshrc
