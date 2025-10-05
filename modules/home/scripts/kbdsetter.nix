{
  pkgs,
  ...
}:
pkgs.writeShellScriptBin "kbdsetter" ''
  KEYBOARD_INFO=$(hyprctl devices -j | jq -r '
    .keyboards[]
    | select(.main == true)
  ')
  ACTIVE_LAYOUT=$(echo $KEYBOARD_INFO | jq -r '
    .active_keymap
  ')

  if [ "$ACTIVE_LAYOUT" == "English (US)" ]; then
    hyprctl switchxkblayout current next
  elif [ "$ACTIVE_LAYOUT" == "Portuguese (Brazil)" ]; then
    hyprctl switchxkblayout current prev
  fi

  ACTIVE_LAYOUT=$(hyprctl devices -j | jq -r '
    .keyboards[]
    | select(.main == true)
    | .active_keymap
  ')

  notify-send -e "Keyboard Layout" "$ACTIVE_LAYOUT"
''
