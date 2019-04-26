# How to setup

Run the below code to fetch and setup Dein. Replace `~/.config/nvim/` with wherever you cloned this repository.

```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/dein
rm installer.sh  # we can remove the installation script afterwards
```

Create a local.vim file with `nvimdir` set to wherever you cloned this repository, if it is not `~/.config/nvim`.

Open neovim, and install dein:

```:call dein#install()```

Go to the YouCompleteMe folder and install YouCompleteMe with your desired options (for example, the following installs with all language options available. This would require all such languages to be installed on the machine. See [https://github.com/Valloric/YouCompleteMe/blob/master/README.md] for help.). YouCompleteMe requires Python to be installed to work. See their README for help.

```
cd ~/.config/nvim/dein/repos/github.com/Valloric/YouCompleteMe
./install.py --all
```
