class KFColorfulHUD extends Mutator;

#exec OBJ LOAD FILE=ColorfulHUD.utx

function PostBeginPlay()
{
  	local KFGameType GT;

  	GT = KFGameType(level.game);
  	if (GT != none)
  	{
		// Dirty Hack for Perk Icons - This needs to
		// so it will support ServerPerks/ScrN GameTypes too.
		GT.default.LoadedSkills[0] = class'CustomFieldMedic';
    	GT.default.LoadedSkills[1] = class'CustomSupportSpec';
    	GT.default.LoadedSkills[2] = class'CustomSharpshooter';
    	GT.default.LoadedSkills[3] = class'CustomCommando';
    	GT.default.LoadedSkills[4] = class'CustomBerserker';
    	GT.default.LoadedSkills[5] = class'CustomFirebug';
    	GT.default.LoadedSkills[6] = class'CustomDemolitions';
		GT.HUDType = string(class'ColorfulHUD');
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
    FriendlyName="Colorful HUD - v1.6"
    Description="Replaces the HUD with a beautiful Green, Dark, White Elements & Colorful Icons!; by Vel-San"

	// Mandatory Vars
    bAddToServerPackages=True
	bAlwaysRelevant=True
  	RemoteRole=ROLE_SimulatedProxy
}
