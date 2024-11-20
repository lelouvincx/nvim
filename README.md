# Lelouvincx's Neovim Configuration

## Features

- **LazyVim** for managing plugins
- **Lua** for configurations
- **LSP** for autocompletion, diagnostics, formatting, and more
- DAP for debugging

### My personal environments

Currently I'm using Neovim as my main IDE for developing data engineering and LLM applications (as hobby):

- OS: MacOS/Ubuntu 24.04 LTS
- Terminal: iTerm2, Alacritty
- Neovim: v0.10.1
- Font: JetBrainsMono Nerd Font Mono
- Shell: ZSH, package managed by ZimFW, with theme spaceship prompt
- Languages: Python, Javascript, Typescript, Java, SQL, Bash, Ruby; managed by [asdf](https://asdf-vm.com/)

### My gears

- **Laptop**: Macbook Pro 2024 M4 14-inch/Thinkbook 14
- **Mouse**: Logitech
- **Keyboard**: NuPhy Air75
- **Headphone**: Skullcandy Hesh ANC Noice Cancelling

## Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**, recommended is JetBrainsMono Nerd Font Mono
- [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and _undercurl_:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & Macos)_**
  - [wezterm](https://github.com/wez/wezterm) **_(Linux, Macos & Windows)_**
  - [alacritty](https://github.com/alacritty/alacritty) **_(Linux, Macos & Windows)_**
  - [iterm2](https://iterm2.com/) **_(Macos)_**

## Installation

Make a backup of your current Neovim files:

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Clone the repository:

```bash
git clone https://github.com/lelouvincx/nvim.git ~/.config/nvim
```

(Optional) Remove the `.git` directory, so you can add it to your own repository later:

```bash
rm -rf ~/.config/nvim/.git
```

Start Neovim!:

```bash
nvim
```

## Configuration

## Usage

Please make sure you know and understand how your configs work before continuing. Since this is just my personal working configurations, I don't provide any user support. Just look at it as a valuable references for your own configurations. If you run into any issues, you can try:

1. Google and stackoverflow the error message
2. Check your dependencies and environments
3. Report with the plugin author

If you want to experience with this dotfiles it's pretty easy to do. Firstly you should backup all your config files in one place to keep it safe. Then fork this repo and clone to your local system and play with it anyway you want.

- Resource neovim config by saving then `:so%`. Or you can relaunch it.

Many thanks for reading until here and enjoy your own dotfiles!

## Thanks to...

I want to give the special thanks to Ly Thanh Nhan, who first inspired me to use neovim as main IDE (you can visit his blog [here](https://nextlint.com/@lythanhnhan27294)). After a pretty long time working on this project I think myself has a good knowledge and experience to share you guys. Besides, [balldk](https://github.com/balldk), [craftzdog](https://github.com/craftzdog/dotfiles-public) and [drievints](https://github.com/driesvints/dotfiles) taught me a lot for completing and improving my configs.

In general, I want to give thanks to everyone who shares their dotfiles for their efforts to contribute their knowledge, mind and experience to the open-source community.

## About me

- Visit my blog: [lelouvincx](https://lelouvincx.github.io)
- Email me: [dinhminhchinh3357@gmail.com](mailto:dinhminhchinh3357@gmail.com)
