{ config, pkgs, apple-emoji, ... }:

{
  home = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono # monotype font for code (terminal, vscode etc)

      # fonts set for desktop (bar, browsers, apps etc)
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      # emojis
      pkgs.apple-emoji-nix
    ];
  };

  fonts.fontconfig.defaultFonts = {
    emoji = [ "Apple Color Emoji" ];
    serif = [ "Noto Serif" "Noto Serif CJK SC" "Noto Serif CJK JP" "Noto Serif CJK KR" ];
    sansSerif = [ "Noto Sans" "Noto Serif CJK SC" "Noto Serif CJK JP" "Noto Serif CJK KR" ];
    monospace = [ "Noto Sans Mono" ];
  };
}
