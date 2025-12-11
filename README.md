# Cách phục hồi môi trường trên máy/WSL mới

```
git clone <REPO> ~/dotfiles
cd ~/dotfiles
stow zsh
stow git
stow nvim
```

# Cách lưu dotfiles

## Step 1: Move files

### zsh

```
mkdir -p ~/dotfiles/zsh
mv ~/.zshrc ~/dotfiles/zsh/.zshrc
mv ~/.p10k.zsh ~/dotfiles/zsh/.p10k.zsh
```

### neovim / lazyvim

```
mkdir -p ~/dotfiles/nvim/.config
mv ~/.config/nvim ~/dotfiles/nvim/.config/nvim
```

## Step 2: Create Symlink

```
cd ~/dotfiles
```

```
stow zsh
stow git
stow nvim
```
