{ pkgs, inputs }:

# Rebuilds claude-desktop-with-fhs from the k3d3/claude-desktop-linux-flake sources.
# Upstream still uses nodePackages.asar, which was removed in nixos-26.05,
# so pass the top-level asar instead. Drop this once upstream is fixed.
let
  src = inputs.claude-desktop;
  patchy-cnb = pkgs.callPackage "${src}/pkgs/patchy-cnb.nix" { };
  claude-desktop = pkgs.callPackage "${src}/pkgs/claude-desktop.nix" {
    inherit patchy-cnb;
    nodePackages = { inherit (pkgs) asar; };
  };
in
pkgs.buildFHSEnv {
  name = "claude-desktop";
  targetPkgs = pkgs: with pkgs; [
    docker
    glibc
    openssl
    nodejs
    uv
  ];
  runScript = "${claude-desktop}/bin/claude-desktop";
  extraInstallCommands = ''
    # Copy desktop file from the claude-desktop package
    mkdir -p $out/share/applications
    cp ${claude-desktop}/share/applications/claude.desktop $out/share/applications/

    # Copy icons
    mkdir -p $out/share/icons
    cp -r ${claude-desktop}/share/icons/* $out/share/icons/
  '';
}
