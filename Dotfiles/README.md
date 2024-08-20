Migrating to new system:

- Make sure to download the git dependency:
```shell
    sudo pacman -S git github-cli
```

- Authenticate with GitHub-CLI:
```shell
    gh auth login
```

- Commit the following alias to .bashrc or .zshrc:
```shell
    alias config="/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME"
```

- Avoid recursion issues with source repo:
```shell
    echo "Dotfiles" >> .gitignore
```

- Clone bare repo into $HOME/Dotfiles:
```shell
    git clone --bare https://github.com/MisterKartoffel/dotfiles.git $HOME/Dotfiles
```

- Remove any conflicting dotfiles.

- Check out content from bare repo to $HOME:
```shell
    config checkout
```

- Set showUntractedFiles to no:
```shell
    config config --local status.showUntractedFiles no
```
