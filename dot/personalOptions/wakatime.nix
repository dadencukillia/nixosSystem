{ ... }:

let
  wakatimeKey = builtins.replaceStrings ["\n"] [""] (builtins.readFile ./secrets/wakatime-key);
  wakatimeUrl = builtins.replaceStrings ["\n"] [""] (builtins.readFile ./secrets/wakatime-url);
in
{
  home.file.".wakatime.cfg".text = ''
    [settings]
    debug = false
    api_key = ${ wakatimeKey }
    api_url = ${ wakatimeUrl }
    hidefilenames = false
    ignore =
        COMMIT_EDITMSG$
        PULLREQ_EDITMSG$
        MERGE_MSG$
        TAG_EDITMSG$
  '';
}
