Dotfiles
====

Highly opinionated Debian/Ubuntu & OS X system configuration.

Use case:

Engineer uses Ubuntu as workstation at home and Macbook on the go.
It's hard to keep both environments in sync in terms of data and configuration.

I will try to make most scripts configurable but it's probably best to fork this repo and adjust to your own use case.

Why?
==

The simple answer is: Why not?
There are several methods that solves the dotfiles problem. I like to experiment and implement my own ideas.
Major advantage of my method over all existing ones is the fact your dotfiles are really separated from your home directory. The install script only creates symlinks to source files in this repository. Not copies. This design was deliberate so that we can always track changes made to them and thus synchronize them to other systems.
Where possible we use existing configurations from others because why re-invent the wheel of creating awesome configs for tools we love?

Setup
==

```
git clone --recursive https://github.com/xiwenc/dotfiles.git ~/some/location/dotfiles
~/some/location/dotfiles/install.sh
```

It will probably ask your password a few times [TODO]. This is needed to install packages on system level and making user changes.
At the end of the installation it will print the files that have been backed up if any.

Modules
==

- vim [DONE]
- zsh [DONE]
- tmux [DONE]
- i3 [TODO]
- unison [TODO]
- multi-monitor [TODO]
- git [TODO]

