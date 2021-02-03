class ScorekeeperGS extends GSController 
{
  constructor()
  {
  }
}

function ScorekeeperGS::Start()
{
  GSController.Sleep(1);
  while (true) {
    // we just walk through every 100 ticks and log some info
    GSLog.Info("[score][tick]" + this.GetTick());
    GSController.Sleep(100);
  }
}

function ScorekeeperGS::Save()
{
    return {};
}

function ScorekeeperGS::Load(version, tbl)
{
}
