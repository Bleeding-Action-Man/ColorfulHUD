class ColorfulHUD extends Mutator;

#exec OBJ LOAD FILE=ColorfulHUD.utx

function PostBeginPlay()
{
    local KFGameType GT;

    GT = KFGameType(level.game);
    if (GT != none)
    {
      GT.HUDType = string(class'ColorfulHUD_Base');
    }
}

simulated function TimeStampLog(coerce string s)
{
  log("["$Level.TimeSeconds$"s]" @ s, 'ColorfulHUD');
}

simulated function MutLog(string s)
{
  log(s, 'ColorfulHUD');
}

defaultproperties
{
  // Mut Vars
  GroupName="KF-ColorfulHUD"
  FriendlyName="Colorful HUD - v1.8"
  Description="Replaces the HUD with a beautiful Green, Dark, White Elements & Colorful Icons!; by Vel-San"

  // Mandatory Vars
  bAddToServerPackages=True
  bAlwaysRelevant=True
  RemoteRole=ROLE_SimulatedProxy
}
