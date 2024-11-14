## Latest path to getting started with a new computer:

### Initial steps

1. Create a ~/git and a ~/git/personal folder.
   - Save the git folder to the finder favorites for easy access
1. Install git (`git -v` should show if you have it and guide you through installing it if not)
1. Clone this repository\* so that it lives in `~/git/personal/dotfiles`
1. Symlink .gitconfig: `ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig` (will overwrite)
1. Install [Bitwarden](https://bitwarden.com/download/)

`*` Clone with http unless you have setup SSH already, see the `Other config` section if you wish to do so first

### Setting up zsh/prompt

1. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#getting-started)
1. Install [homebrew](https://brew.sh/)
   1. Install [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#getting-started)
   1. Install [fzf (fuzzy find)](https://github.com/junegunn/fzf?tab=readme-ov-file#using-homebrew)
   1. Install [zioxide (smart cd)](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation)
   1. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew)
1. Symlink zshrc: `ln -sf ~/git/personal/dotfiles/zsh/.zshrc ~/.zshrc` (Will override whatever you have in there currently)

### Installing relevant packages/apps:

#### Brew

1. [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#homebrew-on-macos-or-linux)
1. [Karabiner elements (keymappings)](https://github.com/pqrs-org/Karabiner-Elements?tab=readme-ov-file#download)
   1. Symlink config: `ln -sf $DOTFILES_DIR/karabiner.json ~/.config/karabiner/karabiner.json` (will overwrite)
   1. Enable and configure mulit-touch extension (Under "Misc" settings)
1. [Rectangle (window manipulation)](https://github.com/rxhanson/Rectangle?tab=readme-ov-file#installation)
   1. Adjust the `Maximize` keybind to be option + ctrl + arrow up (might need to disable the current one with the same keys first)
   1. Make sure it starts on login
   1. Hide menu bar icon
1. [Tig (git tool)](https://jonas.github.io/tig/INSTALL.html)
   1. Symlink config: `ln -sf $DOTFILES_DIR/tig/.tigrc ~/.tigrc` (will overwrite)
1. [Fd (finding files)](https://github.com/sharkdp/fd?tab=readme-ov-file#on-macos)
1. [Jq (json parsing)](https://jqlang.github.io/jq/download/)
1. [Gh (github cli)](https://github.com/cli/cli?tab=readme-ov-file#installation)

#### Others

1. One of the node version managers
   - [Volta](https://docs.volta.sh/guide/getting-started)
   - [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
1. [VsCode (IDE)](https://code.visualstudio.com/Download)
   1. Turn on setting sync (via github account)
   1. Enable `code` command (via cmp+shift+p and searching for "install code")
1. [Slack](https://slack.com/intl/en-gb/downloads/mac)
1. [Discord](https://discord.com/download)
1. [Alfred (spotlight replacement)](https://www.alfredapp.com/)
   1. Enable powerpack via lifetime license stored in Bitwarden
   1. [Disable spotlight](https://www.google.com/search?q=disable+spotlight+macos&oq=disable+spotlight+macos&sourceid=chrome&ie=UTF-8)
   1. Set preference folder to `.../dotfiles/alfred` via their ui ("Advanced")
   1. Some settings are saved per computer, so tweak the hotkey in the alfred ui which will create the local preferences folder and then copy over the contents of the previous local folder (`.../dotfiles/alfred/Alfred.alfredpreferences/preferences/local/<id>/<content_to_copy>`)
1. [Arc (browser)](https://arc.net/)
   1. Download [surfingkeys](https://github.com/brookhong/Surfingkeys) and copy over the settings from `./surfingkeys/options.txt`
   1. Change keykinds
      - Clear tabs to cmd + option + w
1. [Raindrop.io (bookmarks)](https://raindrop.io/download)
1. [Spotify](https://www.spotify.com/se/download/mac/) spotify

### MacOS settings

- Keyboard setup:
  - Make sure that key inputs can be [repeated](https://vimforvscode.com/enable-key-repeat-vim)
  - (In the same guide you'll find how to increase the key repeat rate and delay)
  - Reverse fn key function (Use F1-9 without pressing it). See latest update of [this](https://apple.stackexchange.com/a/66889) answer
- Trackpad setup:
  - Enable zoom gesture (double tap with three fingers). `Accessibility / Zoom / Use trackpad gesture to zoom`
  - Disable two finger swipe back/forward in browsers. `Trackpad / More Gestures / Swipe between pages`
  - Disable trackpad look up & date detectors. `Trackpad / Point & Click / Look up & date detectors`
- Main (bottom) task/action/menu bar
  - Remove what you don't need in it
  - Turn on hiding (right click the bar)
  - Make it hide for a long time using [this](https://apple.stackexchange.com/a/46222) as reference. E.g. `defaults write com.apple.dock autohide-delay -float 5; killall Dock` for 5 seconds seconds
- Top menu bar:
  - Hide as many icons as possible as possible (will easily fill up with stuff)
  - Make time more compact

### Other config

- [Setup ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  - When creating config, you can just symlink: `ln -s $DOTFILES_DIR/.ssh/config ~/.ssh/config`
