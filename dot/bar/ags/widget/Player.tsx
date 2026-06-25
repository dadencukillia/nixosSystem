import { Gdk } from "ags/gtk4";
import AstalMpris from "gi://AstalMpris?version=0.1";
import Pango from "gi://Pango?version=1.0";
import { createBinding, With } from "gnim";

interface Props {
  onAudioUpdate?: (somePlayers: boolean) => void
}

export function Player({
  onAudioUpdate = () => {}
}: Props) {
  const mpris = AstalMpris.get_default();
  const players = createBinding(mpris, "players").as(player => {
    return player.filter(p =>  p.title !== "").at(0);
  });
  players.subscribe(() => {
    onAudioUpdate(players() ? true : false);
  });

  return (
    <With value={ players }>
    { player => player && (
      <button
        hexpand={ false } vexpand={ false }
        class="musicplayer"
        cursor={ Gdk.Cursor.new_from_name("pointer", null) }
        onClicked={ () => {
          if (player.playbackStatus === AstalMpris.PlaybackStatus.PLAYING) {
            player.pause();
          } else {
            player.play();
          }
        } }
      >
        <box spacing={ 10 }>
          <label label={ createBinding(player, "playbackStatus").as(p => p === AstalMpris.PlaybackStatus.PLAYING ? "" : "") } />
          <label 
            class="name"
            hexpand={ false }
            maxWidthChars={ 50 }
            ellipsize={ Pango.EllipsizeMode.END }
            label={ createBinding(player, "title") }
          />
        </box>
      </button>
    ) }
    </With>
  );
}
