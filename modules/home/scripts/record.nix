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
    AUDIO_DEVICE="$(${pkgs.pipewire}/bin/pactl get-default-sink).monitor"
    ${pkgs.wf-recorder}/bin/wf-recorder \
      -g "$(${pkgs.slurp}/bin/slurp)" \
      -f "$FILENAME" \
      --audio="$AUDIO_DEVICE" \
      &
    echo $! > "$PIDFILE"
    ${pkgs.libnotify}/bin/notify-send "Recording started"
  fi
''