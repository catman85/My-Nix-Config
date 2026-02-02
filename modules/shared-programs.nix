{ config, pkgs, ... }:

{

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # provides a compatibility layer that allows running uncompiled binaries on NixOS by making the necessary libraries available. 
  programs.nix-ld.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["jim"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs 'lm_sensors'
  environment.systemPackages = with pkgs; [
    vim
    postman
	wget
	git
	diff-so-fancy
	fastfetch
	kitty
	yarn
	cmatrix
	fastfetch
	jetbrains.webstorm
	jetbrains.pycharm
	vscode
	chezmoi
	cowsay
	nmap
	htop
	chromium
	oh-my-zsh
	lsd
	broot
	ruby
	mcfly
	fzf
	bat
	nodejs_22
	cowsay
	pipes
	toilet
	fortune
	cava
	rig
	metasploit
	lolcat
	figlet
	gtop
	qalculate-qt
	reaper
	vlc
	qemu
	quickemu
	kdePackages.filelight
	kdePackages.kzones
	qbittorrent
	usbutils
	blueman
	btop
	fprintd
	xsel
	ripgrep
	# support both 32-bit and 64-bit applications
    wineWowPackages.stable
    openvpn
    dig
    compose2nix
    jq #needed by openrouter ai sh
    tor-browser
    # Custom QEMU UEFI wrapper
    (writeShellScriptBin "qemu-system-x86_64-uefi" ''
      ${qemu}/bin/qemu-system-x86_64 \
        -bios ${OVMF.fd}/FV/OVMF.fd \
        "$@"
    '')
    python313
    python313Packages.virtualenv #tool to create isolated python environments
    python313Packages.pip # pip tool
    ffmpeg-full
    trashy
    unzip # needed by broot
    flameshot
	github-desktop
	distrobox
  ];
}
