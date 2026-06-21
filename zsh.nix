{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "darkblood";
      plugins = [ "git" "sudo" "docker" ];
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
