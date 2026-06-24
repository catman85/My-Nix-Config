{ config, pkgs, inputs, ... }:

let
  freshPkg = inputs.fresh.packages.${pkgs.system}.default;
in

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
	freshPkg # rich text editor
	file # shows type of file
	fileinfo
	qjackctl
	wget
	git
	diff-so-fancy
	fastfetch
	kitty
	yarn
	cmatrix
	fastfetch
	vscode
	chezmoi
	cowsay
	metasploit
	nmap
	chromium
	oh-my-zsh
	lsd
	broot
	ruby
	mcfly
	fzf
	bat
	cowsay
	pipes
	toilet
	fortune
	cava
	rig
	lolcat
	figlet # cool terminal text
	btop
	htop
	qalculate-qt
	vlc
	kdePackages.filelight
	kdePackages.kzones
	qbittorrent
	usbutils
	blueman
	fprintd
	xsel
	ripgrep
	# support both 32-bit and 64-bit applications
	wineWowPackages.stable
	openvpn
	dig
	compose2nix
	jq #needed by openrouter ai sh
	# Custom QEMU UEFI wrapper
	(writeShellScriptBin "qemu-system-x86_64-uefi" ''
		${qemu}/bin/qemu-system-x86_64 \
		-bios ${OVMF.fd}/FV/OVMF.fd \
		"$@"
	'')
	ffmpeg-full
	trashy
	fd # alternative to find
	filezilla
	unixtools.ifconfig
	unzip # needed by broot
	flameshot
	kooha # screen recorder
  ];
}
