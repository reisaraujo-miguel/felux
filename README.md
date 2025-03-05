# Lavender Linux

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/2503a44c1105456483517f793af75ee7)](https://app.codacy.com/gh/reisaraujo-miguel/felux/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

[![Felux](https://github.com/reisaraujo-miguel/felux/actions/workflows/build-image-main.yml/badge.svg)](https://github.com/reisaraujo-miguel/felux/actions/workflows/build-image-main.yml) [![Felux Devel](https://github.com/reisaraujo-miguel/felux/actions/workflows/build-image-devel.yml/badge.svg)](https://github.com/reisaraujo-miguel/felux/actions/workflows/build-image-devel.yml)

Lavender linux is an Fedora Silverblue image based on Bluefin.
It is meant to be an *almost* pure gnome experience for developers. Some modifications worth noting are:
- purple accent by default (branding choice because of the name)
- dark theme by default
- default enabled extensions: Caffeine, SearchLight, Tailscale QS and GSConnect
- Ghostty as terminal (just becasuse Ptyxis doesn't support ligatures yet)
- MoreWaita icon theme by default

## Developer focused
Some modifications are made to help your journey as a dev.

### ZSH Interactive Shell
We use zsh as the default interactive shell for every terminal instance, which means that, along with the beautifull catppuccin starship theme, you also get syntax highlighting and autocompletion to your terminal prompt.

### Neovim as the Defaut Terminal Text Editor
Nano is great, but if you need to do extensive work, you'll need a better editor. That's why neovim comes preinstalled and set as the defaul't editor.

### Git-Delta as the Default Git Pager
get nice looking and syntax highlighted git diff's

## Terminal Goodies
Do your terminal looks a little bland? We have the solution

### Catpuccin Themes Everywhere
both our zsh theme and the ghostty terminal are configured the use the beautiful catppuccin theme by default, you can also add it to your neovim config with the [nvim catppuccin theme](https://github.com/catppuccin/nvim) plugin.

### Icons on the Terminal
We use eza as our default ls replacement, which means that when you list files you'll also get pretty little icons shown along with the files names

### Cat, Pager and Man Pages Syntax Highliting
We have Bat installed and configured as a replacement for `cat` and the system and man pagers. Which means that when you cat a file, pass a file to less or open up a man page, you get a beutifully syntaxhighlited view of you text.

## Devs Also Game
We bring with our system some packages from Bazzite, which are meant to make your experience with gaming on the system better.

The additional packages are:
- steam devices (needed by flatpak Steam for gamepad support)
- scx-scheds
- patched gamescope
- vulkan-tools
- latencyflex-vulkan-layer
- gnome-randr-rust and wlr-randr

We also set `vm.max_map_count` to `2147483642` by default
