# Description

Dotfiles, yay!

## Nix

Most packages are installed with nix and home-manager. The rest are usually installed with pacman/aur (paru is very nice for this and is installed with nix).

To install nix:
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

To add nixpkgs unstable and install home-manager run
```
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

For home-manager see https://nix-community.github.io/home-manager/

Then things can be installed with

```
nix-channel --update
home-manager switch
```

There is also a go-task for the above.

## Requirements

You need `git` and `stow` installed

## Installation

Check out the repo in your `$HOME` directory

```sh
$ git clone git@github.com/MathiasLorenz/dotfiles.git
cd dotfiles
```

Then use GNU `stow` to create symlinks

```sh
$ stow .
```

and voila, the config has been applied!


## Credits

[Youtube Guide](https://www.youtube.com/watch?v=y6XCebnB9gs)
