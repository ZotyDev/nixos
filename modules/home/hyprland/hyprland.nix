{
  lib,
  pkgs,
  host,
  desktopCompositor ? "hyprland",
  ...
}:
with lib;
let 
  inherit (import ../../../hosts/${host}/variables.nix)
    keyboardLayout
    keyboardVariant
    secondaryKeyboardLayout
    secondaryKeyboardVariant
  ;
  enabled = desktopCompositor == "hyprland";
in
mkIf enabled {
  home.packages = with pkgs; [
    swww
    wl-clipboard
    hyprpolkitagent
    hyprland-qtutils
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      input = {
        kb_layout = "${keyboardLayout},${secondaryKeyboardLayout}";
        kb_variant = "${keyboardVariant},${secondaryKeyboardVariant}";
        kb_options = [
          "grp:win_space_toggle"
        ];
        numlock_by_default = false;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
	        scroll_factor = 0.8;
        };
      };

      gestures = {
        workspace_swipe_distance = 500;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
      };

      general = {
        "$modifier" = "SUPER";
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        resize_on_border = true;
        "col.active_border" = "rgba(ff0088aa) rgba(8800ffee) 45deg";
        "col.inactive_border" = "rgba(1a1a1aee)";
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vfr = true;
        vrr = 2;

        enable_anr_dialog = true;
        anr_missed_pings = 15;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          ignore_opacity = false;
          new_optimizations = true;
          vibrancy = 0.1696;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      ecosystem = {
        no_donation_nag = true;
        no_update_news = false;
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2;
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
      };
 
      render = {
        direct_scanout = 0;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };
      
      xwayland = {
        force_zero_scaling = true;
      }; 
    }; 

    extraConfig = "
      monitor=,preferred,auto,auto
    ";
  }; 
}
