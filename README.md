# Lelouvincx's Neovim Configuration

## Features

Adopting the [LazyVim](https://www.lazyvim.org/) philosophy, this configuration is designed to be simple, clean, and easy to use. It is focused on providing a great experience for coding in Python, Javascript, Typescript, Java, SQL, Bash, Ruby, and more.

<details>
  <summary><b>Status Line</b></summary>
  <div>Parts include git status, diagnostics, current buffer path, class, function working on, copilot status, cursor position.</div>
  <img src="./_media/statusline.png"/>
</details>

<details>
  <summary><b>Buffer Line</b></summary>
  <div>Shows buffer list, diagnostics.</div>
  <img src="./_media/bufferline.png"/>
</details>

<details>
  <summary><b>Fuzzy Finder</b></summary>
  <div>Quickly find files with Fuzzy Finder.</div>
  <video src="https://github.com/user-attachments/assets/48978c4e-139e-44cb-bd26-9df4fa561141"></video>
  <div>Navigate between buffers, projects, history files.</div>
  <video src="https://github.com/user-attachments/assets/daefb235-8784-4637-9fdd-2d816c1314b7"></video>
</details>

<details>
  <summary><b>LSP Features</b></summary>
  <div>Code diagnostics (info, warning, error).</div>
  <img src="./_media/diagnostics.png"/>
  <div>Toggle Trouble to quick diagnostics navigation.</div>
  <video src="https://github.com/user-attachments/assets/7ce24eee-f8c0-400f-b1ae-9f016c61ba1c"></video>
  <div>Go to references.</div>
  <video src="https://github.com/user-attachments/assets/0e6a3f07-8204-45b3-a645-b0488bb72560"></video>
  <div>Code Action.</div>
  <img src="./_media/codeaction.png"></img>
  <div>Document.</div>
  <img src="./_media/document.png"></img>
  <div>LSP Progress.</div>
  <img src="./_media/lspprogress.png"></img>
  <div>Switch Python VENV.</div>
  <video src="https://github.com/user-attachments/assets/fed2b2f3-c81d-4de4-b5d6-04fe563b244f"></video>
</details>

<details>
  <summary><b>Git Blame when hover line</b></summary>
  <img src="./_media/gitblame.png"/>
</details>

<details>
  <summary><b>Rename</b></summary>
  <div>Rename all in current file.</div>
  <video src="https://github.com/user-attachments/assets/2421f330-d236-4573-803d-f135b7188f97"></video>
  <div>Rename all workspace.</div>
  <video src="https://github.com/user-attachments/assets/f53aea46-ec6d-4e4c-aeab-11bc1dbda1c0"></video>
</details>

<details>
  <summary><b>Code Autocomplete</b></summary>
  <div>Autosuggestion.</div>
  <video src="https://github.com/user-attachments/assets/140e102c-c758-436b-9dfb-b8c5a59c5d2c"></video>
  <div>Copilot help. Copilot also supports complete each word one by one.</div>
  <video src="https://github.com/user-attachments/assets/21d74e60-e32a-43bf-9950-5aa34cf1fc75"></video>
</details>

<details>
  <summary><b>Rainbow brackets</b></summary>
  <img src="./_media/rainbowbrackets.png"/>
</details>

<details>
  <summary><b>Generate annotations</b></summary>
  <video src="https://github.com/user-attachments/assets/d0e974e3-e0a2-4782-860f-45f4a09f2da4"></video>
</details>

### My personal environment

Currently I'm using Neovim as my main IDE for developing data engineering platforms and LLM applications (as hobby):

- **Laptop**: Macbook Pro 2024 M4-Pro 14-inch/Thinkbook 14
- **Keyboard**: NuPhy Air75
- **OS**: MacOS/Ubuntu 24.04 LTS
- **Terminal**: iTerm2, Alacritty
- **Neovim**: v0.10.1
- **Tmux**: 3.4
- **Font**: JetBrainsMono Nerd Font Mono
- **Theme**: Catppuccin
- **Shell**: ZSH, package managed by [zimfw](https://github.com/zimfw/zimfw), with theme [spaceship prompt](https://github.com/spaceship-prompt/spaceship-prompt)
- **Languages**: Python, Javascript, Typescript, Java, SQL, Bash, Ruby; managed by [asdf](https://asdf-vm.com/)

## Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**, recommended is JetBrainsMono Nerd Font Mono
- [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
- [lazydocker](https://github.com/jesseduffield/lazydocker) **_(optional)_**
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

To get into Neovim faster, you can set alias in your shell config file:

```bash
alias n='nvim .' # run neovim in current directory
alias nv='nvim' # run neovim with special file, e.g `nvim init.vim`
```

## Usage

Please make sure you know and understand how your configs work before continuing. Since this is just my personal working configurations, I don't provide any user support. Just look at it as a valuable references for your own configurations. If you run into any issues, you can try:

1. Google and stackoverflow the error message
2. Check your dependencies and environments
3. Report to the plugin author

If you want to experience with this dotfiles it's pretty easy to do. Firstly you should backup all your config files in one place to keep it safe. Then fork this repo and clone to your local system and play with it anyway you want.

- Resource neovim config by saving then `:so%`. Or you can relaunch it.

Many thanks for reading until here and enjoy your own dotfiles!

## Thanks to...

I want to give the special thanks to Ly Thanh Nhan, who first inspired me to use neovim as main IDE (you can visit his blog [here](https://nextlint.com/@lythanhnhan27294)). After a pretty long time working on this project I think myself has a good knowledge and experience to share you guys. Besides, [balldk](https://github.com/balldk), [craftzdog](https://github.com/craftzdog/dotfiles-public) and [drievints](https://github.com/driesvints/dotfiles) taught me a lot for completing and improving my configs.

In general, I want to give thanks to everyone who shares their dotfiles for their efforts to contribute their knowledge, mind and experience to the open-source community.

## About me

- Visit my blog: [lelouvincx](https://lelouvincx.github.io)
- Email me: [dinhminhchinh3357@gmail.com](mailto:dinhminhchinh3357@gmail.com)
