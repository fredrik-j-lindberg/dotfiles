## Latest path to getting started with a new computer:

1. Clone this repository so that it lives in `~/git/personal/dotfiles`

### Setting up zsh/prompt

1. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#getting-started)
1. Install homebrew
   1. Install [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#getting-started)
   1. Install [fzf (fuzzy find)](https://github.com/junegunn/fzf?tab=readme-ov-file#using-homebrew)
   1. Install [zioxide (smart cd)](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation)
1. Symlink zshrc: `ln -sf ~/git/personal/dotfiles/zsh/.zshrc ~/.zshrc` (Will override whatever you have in there currently)

### Installing relevant packages/apps:

#### Brew

1. [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#homebrew-on-macos-or-linux)
1. [Karabiner elements (keymappings)](https://github.com/pqrs-org/Karabiner-Elements?tab=readme-ov-file#download)
   1. Symlink config: `ln -sf $DOTFILES_DIR/karabiner.json ~/.config/karabiner/karabiner.json` (will overwrite)
1. [Rectangle (window manipulation)](https://github.com/rxhanson/Rectangle?tab=readme-ov-file#installation)
   1. Adjust the maximize keybind to be option + ctrl + arrow up
   1. Make sure it starts on login
1. [Tig (git tool)](https://jonas.github.io/tig/INSTALL.html)
   1. Symlink config: `ln -sf $DOTFILES_DIR/tig/.tigrc ~/.tigrc` (will overwrite)
1. [Fd (finding files)](https://github.com/sharkdp/fd?tab=readme-ov-file#on-macos)
1. [Jq (json parsing)](https://jqlang.github.io/jq/download/)
1. [Gh (github cli)](https://github.com/cli/cli?tab=readme-ov-file#installation)

#### Others

1. One of the node version managers
   - [Volta](https://docs.volta.sh/guide/getting-started)
   - nvm(<link>)
1. [VsCode (IDE)](https://code.visualstudio.com/Download)
   1. Turn on setting sync (via github account)
1. [Slack](https://slack.com/intl/en-gb/downloads/mac)
1. [Discord](https://discord.com/download)
1. [Alfred (spotlight replacement)](https://www.alfredapp.com/)
   1. Disable spotlight
   1. Set preference folder to `.../dotfiles/alfred` via their ui
1. [Arc (browser)](https://arc.net/)
   1. Download [surfingkeys](https://github.com/brookhong/Surfingkeys) and copy over the settings from `./surfingkeys/options.txt`
   1. Change keykinds
      - Clear tabs to cmd + option + w
      - Cycle through tabs with ctrl + tab (up and down)
1. [Raindrop.io (bookmarks)](https://raindrop.io/download)

### MacOS settings

- Make sure that keyboard keys can be [rapidly repeated](https://vimforvscode.com/enable-key-repeat-vim)
- Hide bottom task/action/menu bar
  - Turn on hiding (right click the bar)
  - Make it hide for a long time using [this](https://apple.stackexchange.com/a/46222) as reference
- Hide as much as possible from menu bar and make time more compact (will easily fill up with stuff)
- Reverse fn key function (Use F1-9 without pressing it)
- Enable trackpad gesture to zoom (double click with three fingers)

### Other config

- Symlink .gitconfig: `ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig` (will overwrite)
- [Setup ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  - When creating config, you can just symlink: `ln -s $DOTFILES_DIR/.ssh/config ~/.ssh/config`
