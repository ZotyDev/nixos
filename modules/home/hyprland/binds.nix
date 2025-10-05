{
  host,
  ...
}:
let
  inherit (import ../../../hosts/${host}/variables.nix)
  defaultBrowser
  defaultTerminal
  ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$modifier,Return,exec,${defaultTerminal}"
      "$modifier,B,exec,${defaultBrowser}"
      "$modifier,K,exec,list-keybinds"
      "$modifier,R,exec,rofi-launcher"
      "$modifier ALT,W,exec,wallsetter"
      
      "$modifier,F,togglefloating"

      "$modifier,1,workspace,1"
      "$modifier,2,workspace,2"
      "$modifier,3,workspace,3"
      "$modifier,4,workspace,4"
      "$modifier,5,workspace,5"
      "$modifier,6,workspace,6"
      "$modifier,7,workspace,7"
      "$modifier,8,workspace,8"
      "$modifier,9,workspace,9"
      "$modifier,0,workspace,10"
      "$modifier SHIFT,1,movetoworkspace,1"
      "$modifier SHIFT,2,movetoworkspace,2"
      "$modifier SHIFT,3,movetoworkspace,3"
      "$modifier SHIFT,4,movetoworkspace,4"
      "$modifier SHIFT,5,movetoworkspace,5"
      "$modifier SHIFT,6,movetoworkspace,6"
      "$modifier SHIFT,7,movetoworkspace,7"
      "$modifier SHIFT,8,movetoworkspace,8"
      "$modifier SHIFT,9,movetoworkspace,9"
      "$modifier SHIFT,0,movetoworkspace,10"
    ];

    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}
