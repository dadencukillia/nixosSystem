{ ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true; 
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
}
