# Stuff that i use

I use macOS, so all terminal/desktop apps are around this operation system.

## Autostart scripts & friends

- [remap-tilde.sh](./scripts/remap-tilde/run.sh)
- [npm-completion.sh](./scripts/npm-completion/run.sh)

## 💻 terminal

| name                                                                                                                                                  | cli                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [iterm2](https://iterm2.com/)                                                                                                                         | `brew install --cask iterm2`                                                                                |
| [oh-my-zsh](https://ohmyz.sh/)                                                                                                                        | `$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`                    |
| [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)                                                                                            | `brew install diff-so-fancy && git config --global core.pager "diff-so-fancy \| less --tabs=4 -RFX"`        |
| [bat](https://github.com/sharkdp/bat) <br/> `cat` with syntax highlighting                                                                            | `brew install bat`                                                                                          |
| [translative-shell](https://github.com/soimort/translate-shell) <br/> google translate from terminal                                                  | `./scripts/translative-shell/run.sh`                                                                        |
| [httpie](https://github.com/httpie/httpie) <br/> human-friendly CLI HTTP client                                                                       | `brew install httpie`                                                                                       |
| [mcfly](https://github.com/cantino/mcfly) <br/> waaaay better searching command history (ctrl+r)                                                      | `brew tap cantino/mcfly && brew install cantino/mcfly/mcfly && echo 'eval "$(mcfly init zsh)"' >> ~/.zshrc` |
| [nerd-font](https://www.nerdfonts.com/#home) <br/> font including non-ASCII icons, [install cheat cheat for iTerm2](https://webinstall.dev/nerdfont/) | `brew tap homebrew/cask-fonts && brew install font-Fira-Code-nerd-font`                                     |
| [exa](https://github.com/ogham/exa) <br/> modern replacement for `ls`                                                                                 | `brew install exa`                                                                                          |
|                                                                                                                                                       |                                                                                                             |

## 🖥 desktop / system

| name                                                                                                                                                                                              | cli                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| [Notion](https://www.notion.so/product)                                                                                                                                                           |                                   |
| [Rectangle](https://github.com/rxhanson/Rectangle) </br> Window management app based on Spectacle                                                                                                 | `./scripts/load-rectangle/run.sh` |
| [Tot](https://tot.rocks/) </br> Tiny notes with quake mode                                                                                                                                        |                                   |
| [Insomnia](https://insomnia.rest/) </br> Best HTTP client                                                                                                                                         | `brew install --cask insomnia`    |
| [Shortcut](https://shotcut.org/) <br/> OSS video editor                                                                                                                                           |                                   |
| [Gnupg](https://www.gnupg.org/download/) <br/> free implementation of the OpenPGP, I use it for signing commits.<br/>I've described [here whole setup](./docs/add-gpg-key-to-sign-git-commits.md) | `brew install gnupg`              |

## web

| name                                                                                                      | extras                                                                                                                                        |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| [Simplify Gmail](http://simpl.fyi/)                                                                       |                                                                                                                                               |
| [Vimium](https://vimium.github.io/)                                                                       |                                                                                                                                               |
| [My gmail filters](./assets/mailFilters.xml)                                                              | [How to import export/filters](https://sites.google.com/a/chatham.k12.nc.us/chatham-goes-google/home/gmail---exporting-and-importing-filters) |
| [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) |                                                                                                                                               |
|                                                                                                           |                                                                                                                                               |

## ⌨️ keyboard

| name                                                                                                                                              | extras                                                                                                                                                                                                                                |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [VIA](https://usevia.app/#/) for [Keychron K3 Pro](https://www.keychron.com/products/keychron-k3-pro-qmk-via-wireless-custom-mechanical-keyboard) | So far schema is not available out of the box, pls visit [Keychron page](https://www.keychron.com/products/keychron-k3-pro-qmk-via-wireless-custom-mechanical-keyboard). My config in [config folder](./configs/keychron_k3_pro.json) |
|                                                                                                                                                   |                                                                                                                                                                                                                                       |

## 📹 video/gif/images

| name                                                                                                                                                | cli                              |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| [ImageOptim](https://imageoptim.com/mac) </br> Removes bloated metadata. Saves disk space & bandwidth by compressing images without losing quality. | `brew install --cask imageoptim` |
| [gifski](https://github.com/ImageOptim/gifski)                                                                                                      | `brew install gifski`            |
| [loom](https://www.loom.com/)                                                                                                                       | `brew install --cask loom`       |
|                                                                                                                                                     |                                  |

## 📝 notes

| name                                    | cli | app store                     |
| --------------------------------------- | --- | ----------------------------- |
| [Notion](https://www.notion.so/product) |     | https://www.notion.so/product |
|                                         |     |                               |
