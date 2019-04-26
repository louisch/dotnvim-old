# How to setup

Run the below code to fetch and setup Dein. Replace `~/.config/nvim/` with wherever you cloned this repository.

```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/dein
rm installer.sh  # we can remove the installation script afterwards
```

Create a local.vim file with `nvimdir` set to wherever you cloned this repository, if it is not `~/.config/nvim`.
