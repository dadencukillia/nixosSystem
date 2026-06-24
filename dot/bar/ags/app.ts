import app from "ags/gtk4/app";
import gruvbox from "./gruvbox-dark.css";
import style from "./style.scss";
import Bar from "./widget/Bar";

app.start({
  css: [ style, gruvbox ].join("\n"),
  main() {
    app.get_monitors().map(Bar);
  },
});
