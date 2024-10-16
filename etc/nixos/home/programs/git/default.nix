{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "daniel";
    userEmail = "daniel@nopestack.dev";
    aliases = {
      ci = "commit";
      co = "checkout";
      st = "status";
      fea = "fetch --all";
      unstage = "reset HEAD --";
      undo = "reset --soft HEAD";
    };
    extraConfig = ''
      [init]
      defaultBranch = main
    '';

  };
}
