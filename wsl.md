1. get file from: https://github.com/nix-community/NixOS-WSL/releases/download/2411.6.0/nixos.wsl
2. wsl --install --from-file .../nixos.wsl (above file) --name NixOS
3. `wsl -d NixOS --cd ~ -- sudo nix-channel --update`
4. `wsl -d NixOS --cd ~ -- sudo nixos-rebuild switch`

5. https://nix-community.github.io/NixOS-WSL/how-to/change-username.html
5.1. `wsl -d NixOS_test --cd ~ -- sudoedit /etc/nixos/configuration.nix`  # change wsl.defaultUser
(5.1. `wsl -d NixOS --cd ~ -- sudo sed -ie 's/wsl\.defaultUser = "nixos"/wsl.defaultUser = "$user"/' /etc/nixos/configuration.nix`)
5.2. `wsl -d NixOS --cd ~ -- sudo nixos-rebuild boot`
5.3. `wsl -t NixOS`
5.4. `wsl -d NixOS --user root exit`
5.5. `wsl -t NixOS`

6. `wsl -d NixOS --cd ~`
6.1. `mkdir -p ~/.config`
6.2. `nix run nixpkgs#git --extra-experimental-features "nix-command flakes" -- clone --recurse-submodules https://github.com/alphs/dots ~/.config/dots`
6.3. change user to same as in step 5. in `~/.config/dots/flake.nix`
6.4. change defaultUser to same as in step 5. in `~/.config/dots/nix/hosts/wsl.nix`
6.5. `sudo nixos-rebuild test --flake ~/.config/dots#wsl`
6.6. Done, can rerun with `sudo nixos-rebuild switch --flake ~/.config/dots#wsl` to save

