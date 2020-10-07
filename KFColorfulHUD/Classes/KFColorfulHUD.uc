class KFColorfulHUD extends Mutator;

function PostBeginPlay()
{
  	local KFGameType GT;

  	super.PostBeginPlay();
  	GT = KFGameType(level.game);
  	if (GT != none)
  	{
  	  GT.HUDType = string(class'ColorfulHUD');
  	}
}

simulated function ReplacePerkIcons()
{
	// TODO: Replace Perk Icons on StartUp
}

defaultproperties
{
	// Mut Vars
    GroupName="KF-ColorfulHUD"
    FriendlyName="Colorful HUD - v1.1"
    Description="Replaces the HUD with a beautiful Green, Dark, White Elements & Colorful Icons!; by Vel-San, WIPESPECIALIST | Tested by Kasual!nsult"

	// Mandatory Vars
    bAddToServerPackages=True
}
