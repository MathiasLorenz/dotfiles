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

Install `zplug`, see

```sh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

Install `zsh` with paru like `paru zsh` and confirm it runs with

```sh
zsh
```

and accept installation of packages with zplug.

Changing default shell to be `zsh` is done with

```sh
chsh -s /usr/bin/zsh
```

note that you must log out of your system for the change to take effect.

### Sway

Install sway and swaylock with paru

```sh
paru sway
paru swaylock
```

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

## Installing llama.cpp with AMD GPU support

Currently not working properly

```fish
HIPCXX=/opt/rocm/llvm/bin/clang HIP_PATH=(/opt/rocm/bin/hipconfig -R) \
      cmake -S . -B build -DGGML_HIP=ON -DAMDGPU_TARGETS=gfx1100 -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath,/usr/local/lib:/opt/rocm/lib:/usr/lib" \
      && cmake --build build --config Release -- -j 16

# What has worked on desktop
# At build time it looks to pick up /usr/lib/libopenblas but it works with the linking to the nix one...
# In order to locate version of openblas/gfortran the easiest is to:
# cd /nix/store/
# fd 'libopblas.so' and fd 'gfortran.so' to find the paths
cmake -B build -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS \
      -DCMAKE_EXE_LINKER_FLAGS="-Wl,--disable-new-dtags,-rpath,/nix/store/6h1dqhbn02zsfsdi8q64bbccsahsid0y-openblas-0.3.28/lib:/nix/store/mzphlx52ym8j9z12inm716cdz5jazrzy-gfortran-14-20241116-lib/lib"
  cmake --build build --config Release -- -j$(nproc)
```
