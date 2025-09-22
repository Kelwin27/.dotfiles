{ pkgs, ... }:
{
  home.packages = with pkgs; [
    webcord-vencord
    #(webcord-vencord.override {
    # extraArgs = [
    #   "--proxy-server=http://localhost:8881"
    # ];
    #})
  ];
}
