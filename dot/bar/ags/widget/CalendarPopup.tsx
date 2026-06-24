import { Gtk } from "ags/gtk4";
import { Accessor, createState, For, onMount } from "gnim";

interface CalendarState {
  today: Date,
  calendarTable: string[][]
}

const calendarsUpdateFuncs: Array<() => void> = [];
export const updateCalendars = () => calendarsUpdateFuncs.forEach(v => v());

export function CalendarPopup() {
  function getCalendar(): CalendarState { 
    const today = new Date(Date.now());

    const firstDay = new Date(today.getFullYear(), today.getMonth(), 1).getDay() + 1;
    const totalDays = new Date(today.getFullYear(), today.getMonth() + 1, 0).getDate();

    const calendar = [];
    let row = new Array(7).fill("  ");
    for (let day = 1; day <= firstDay + totalDays - 1; day++) {
      if ((day - 1) % 7 === 0 && day !== 1) {
        calendar.push(row);
        row = new Array(7).fill("  ");
      }

      row[(day - 1) % 7] = day < firstDay ? "  " : String(day - firstDay + 1).padEnd(2, " ");
    }

    calendar.push(row);

    return {
      today,
      calendarTable: calendar
    };
  }

  const [state, setState] = createState<CalendarState>(getCalendar());
  onMount(() => {
    const updateFunc = () => setState(getCalendar());
    calendarsUpdateFuncs.push(updateFunc);

    return () => {
      calendarsUpdateFuncs.splice(calendarsUpdateFuncs.findIndex(v => v === updateFunc), 1);
    };
  });

  return (
    <box
      class="Popup"
      orientation={ Gtk.Orientation.VERTICAL }
      spacing={ 5 }
      css="font-family: monospace;"
    >
      <box
        orientation={ Gtk.Orientation.HORIZONTAL }
        spacing={ 5 }
      >
        <label label="SN" class="bold" css="color: var(--red);" />
        <label label="MN" />
        <label label="TS" />
        <label label="WD" />
        <label label="TH" />
        <label label="FR" />
        <label label="ST" class="bold" css="color: var(--red);" />
      </box>
      <For each={ state.as(v => v.calendarTable as Iterable<string[]>) }>
      { (row: string[]) => (
        <box
          orientation={ Gtk.Orientation.HORIZONTAL }
          spacing={ 5 }
        >
        { row.map(date => (
          <label label={ date } class={ String(state().today.getDate()) === date ? "bold" : "" } />
        )) }
        </box>
      ) }
      </For>
    </box>
  );
}
