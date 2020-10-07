class KFColorfulHUD extends Mutator;

#exec OBJ LOAD FILE=ColorfulHUD.utx

function PostBeginPlay()
{
  	local KFGameType GT;

  	super.PostBeginPlay();
	// TODO: Check why this isn't working properly, alternate fix is manually in HUD Class.
	// SetTimer(0.1, false);
  	GT = KFGameType(level.game);
  	if (GT != none)
  	{
  	  GT.HUDType = string(class'ColorfulHUD');
  	}
}

function Timer()
{
	local KFVetSharpshooter Sharp;
	local KFVetFieldMedic Medic;
	local KFVetFirebug FireBug;
	local KFVetSupportSpec Sup;
	local KFVetDemolitions Demo;
	local KFVetBerserker Zerk;
	local KFVetCommando Mando;

	MutLog("-----|| Replacing Perk icons for all players ||-----");

	foreach DynamicActors(class'KFMod.KFVetSharpshooter', Sharp)
        {
	        Sharp.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Sharpshooter';
	        Sharp.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Sharpshooter';
        }
	foreach DynamicActors(class'KFMod.KFVetFieldMedic', Medic)
        {
	        Medic.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Medic';
	        Medic.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Medic';
        }
	foreach DynamicActors(class'KFMod.KFVetFirebug', FireBug)
        {
	        FireBug.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Firebug';
	        FireBug.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Firebug';
        }
	foreach DynamicActors(class'KFMod.KFVetSupportSpec', Sup)
        {
	        Sup.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Support';
	        Sup.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Support';
        }
	foreach DynamicActors(class'KFMod.KFVetDemolitions', Demo)
        {
	        Demo.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Demolition';
	        Demo.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Demolition';
        }
	foreach DynamicActors(class'KFMod.KFVetBerserker', Zerk)
        {
	        Zerk.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Berserk';
	        Zerk.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Berserk';
        }
	foreach DynamicActors(class'KFMod.KFVetCommando', Mando)
        {
	        Mando.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Commando';
	        Mando.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Commando';
        }

	MutLog("-----|| All Perk Icons Replaced ||-----");
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
    FriendlyName="Colorful HUD - v1.2"
    Description="Replaces the HUD with a beautiful Green, Dark, White Elements & Colorful Icons!; by Vel-San"

	// Mandatory Vars
    bAddToServerPackages=True
	bAlwaysRelevant=True
  	RemoteRole=ROLE_SimulatedProxy
}
