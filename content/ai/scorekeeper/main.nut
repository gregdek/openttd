class Scorekeeper extends AIController 
{
  function Start();
}

function Scorekeeper::Start()
{
  AICompany.SetName("Scorekeeper");
  while (true) {
    // we just walk through every 50 ticks and log some info
    // what tick are we at?
    AILog.Info("[score][tick]" + this.GetTick());
    // what is the date?
    local NowDate = AIDate.GetCurrentDate()
    local NowYear = AIDate.GetYear(NowDate)
    local NowMonth = AIDate.GetMonth(NowDate)
    local NowDay = AIDate.GetDayOfMonth(NowDate)
    local NowTimestamp = NowYear + "-" + NowMonth + "-" + NowDay
    AILog.Info("[score][date]" + NowTimestamp)
    // what companies exist?
    // AILog.Info("[score] Company 0: " + AICompany.GetName(0))
    // AILog.Info("[score] Company 1: " + AICompany.GetName(1))
    // AILog.Info("[score] Company 2: " + AICompany.GetName(2))
    // AILog.Info("[score] Company 3: " + AICompany.GetName(3))
    // AILog.Info("[score] Company 4: " + AICompany.GetName(4))
    // AILog.Info("[score] Resolve 0: " + AICompany.ResolveCompanyID(0))
    // AILog.Info("[score] Resolve 1: " + AICompany.ResolveCompanyID(1))
    // AILog.Info("[score] Resolve 2: " + AICompany.ResolveCompanyID(2))
    // AILog.Info("[score] Resolve 3: " + AICompany.ResolveCompanyID(3))
    // AILog.Info("[score] Resolve 4: " + AICompany.ResolveCompanyID(4))
    // for each valid company that doesn't resolve to -1, get
    // CURRENT PLAYER INFO
    local CL = 1  // Skip the scorekeeper, who should always be player 0
    while (AICompany.ResolveCompanyID(CL)>-1)
    {
        AILog.Info("[score][_cash]["+CL+"]"+AICompany.GetBankBalance(CL))
        AILog.Info("[score][_qval]["+CL+"]"+AICompany.GetQuarterlyCompanyValue(CL,0))
        CL=CL+1
    }
    // CURRENT TOWN INFO
    // How to get and work with AITownList? 
    //   https://wiki.openttd.org/en/Development/Script/Lists
    // How many towns? AITown.GetTownCount()
    // Is a town valid? AITown.IsValidTown(townid)
    // AITown.GetName(townid)
    // AITown.GetPopulation(townid)
    // AITown.GetHouseCount(townid)
    // AITown.GetGrowthRate(townid)
    // See you in 50 ticks!
    this.Sleep(50);
  }
}
