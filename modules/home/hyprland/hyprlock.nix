{
  username,
  host,
  ...
}:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    stylixImage
  ;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
	grace = 10;
	hide_cursor = true;
	no_fade_in = false;
      };
      background = [
        {
	  path = "/home/${username}/Pictures/Wallpapers/${stylixImage}";
	  blur_passes = 3;
	  blur_size = 8;
	}
      ];
      input-field = [
        {
          size = "320, 55";
	  outline_thickness = 2;
          dots_size = 0.2;
	  dots_spacing = 0.2;
	  dots_center = true;
	  outer_color = "rgba(ff0088aa) rgba(8800ffe) 45deg";
	  inner_color = "rgba(255, 255, 255, 0.1)";
	  font_color = "rgb(200, 200, 200)";
	  fade_on_empty = false;
	  placeholder_text = ''<i><span foreground="##ffffff99">Enter Password</span></i>'';
          hide_input = false;
          position = "0, -268";
	  capslock_color = "rgb(f9e2af)";
	  halign = "center";
	  valign = "center";
	}
      ];
    };
  };
}
