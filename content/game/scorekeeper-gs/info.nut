class ScorekeeperGS extends GSInfo {
  function GetAuthor()      { return "gregdek"; }
  function GetName()        { return "ScorekeeperGS"; }
  function GetDescription() { return "A detailed scorekeeper that monitors the game and prints out scoreboard events to the log"; }
  function GetVersion()     { return 1; }
  function GetDate()        { return "2021-02-02"; }
  function CreateInstance() { return "ScorekeeperGS"; }
  function GetShortName()   { return "SCOR"; }
  function GetAPIVersion()  { return "1.10"; }
  function GetSettings()    {  }
}

/* Tell the core we are a GS */
RegisterGS(ScorekeeperGS());

