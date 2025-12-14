{ pkgs, ... }:
pkgs.writeShellScriptBin "record" ''
  PIDFILE="/tmp/wf-recorder.pid"
  
  if [ -f "$PIDFILE" ]; then
    # Stops recording
    kill -INT $(cat "$PIDFILE")
    rm "$PIDFILE"
    ${pkgs.libnotify}/bin/notify-send "Recording stopped"
  else
    # Starts recording
    FILENAME="$HOME/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4"
    ${pkgs.wf-recorder}/bin/wf-recorder -g "$(${pkgs.slurp}/bin/slurp)" -f "$FILENAME" &
    echo $! > "$PIDFILE"
    ${pkgs.libnotify}/bin/notify-send "Recording started"
  fi
''