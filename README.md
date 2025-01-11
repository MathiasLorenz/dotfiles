# Description

Dotfiles, yay!

## Installing

To install/bootstrap system:

### Packages

Most packages are installed with nixpkgs and home-manager. The rest are usually installed with pacman/aur (paru is very nice for this and is installed with nix).

To install nix:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

To add nixpkgs unstable and install home-manager run

```sh
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

For home-manager see <https://nix-community.github.io/home-manager/>

Install stow and symlink dotfiles

```sh
sudo pacman -Syu stow
cd dotfiles
stow .
```

If there are any conflicts (i.e. `.config/home-manager/home.nix`) delete the existing ones s.t. the new ones will replace these.

Now we can install home manager packages with

```sh
home-manager build
home-manager switch
```

The above `build` is not necessary, but nice to do to ensure nothing is bonked before we apply the config with `switch`.

### Terminal

..

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
stow .
```

and voila, the config has been applied!

## Credits

[Youtube Guide](https://www.youtube.com/watch?v=y6XCebnB9gs)
