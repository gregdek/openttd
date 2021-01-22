class Scorekeeper extends AIInfo {
  function GetAuthor()      { return "gregdek"; }
  function GetName()        { return "Scorekeeper"; }
  function GetDescription() { return "A detailed scorekeeper that monitors the game and prints out scoreboard events to the log"; }
  function GetVersion()     { return 1; }
  function GetDate()        { return "2020-12-28"; }
  function CreateInstance() { return "Scorekeeper"; }
  function GetShortName()   { return "SCOR"; }
  function GetAPIVersion()  { return "1.9"; }
}

/* Tell the core we are an AI */
RegisterAI(Scorekeeper());

