# shell_configs
My personal Linux shell configurations for Bash, vim and other shell utilities. 

Enable all the Vim plugins with :PluginInstall.




# Required plugins and fonts
* Powerline fonts.
* Vundle


```bash
sudo apt install vim-gui-common
sudo apt install vim-runtime
sudo apt install vim
```


```bash
git clone https://github.com/powerline/fonts.git --depth=1
fonts/./install.sh
rm -rf ~/fonts
```


```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/rafi/awesome-vim-colorschemes.git ~/awesome-vim-colorschemes
mkdir ~/.vim/colors/
cp ~/awesome-vim-colorschemes/colors/* ~/.vim/colors/
rm -rf ~/awesome-vim-colorschemes/
```


## Enabling the Vin plugins
* Inside Vim's *Normal mode* typpe: *:PluginInstall*