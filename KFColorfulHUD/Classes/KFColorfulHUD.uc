class KFColorfulHUD extends Mutator;

#exec OBJ LOAD FILE=ColorfulHUD.utx

function PostBeginPlay()
{
  	local KFGameType GT;

  	super.PostBeginPlay();
	ReplacePerkIcons();
  	GT = KFGameType(level.game);
  	if (GT != none)
  	{
  	  GT.HUDType = string(class'ColorfulHUD');
  	}
}

simulated function ReplacePerkIcons()
{
	// Normal Icons (Red), if player is lvl < 6
	class'KFVetSharpshooter'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Sharpshooter';
	class'KFVetFieldMedic'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Medic';
	class'KFVetFirebug'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Firebug';
	class'KFVetSupportSpec'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Support';
	class'KFVetDemolitions'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Demolition';
	class'KFVetBerserker'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Berserk';
	class'KFVetCommando'.default.OnHUDIcon = Texture'ColorfulHUD.Perks.Perk_Commando';

	// Max Icons (Gold), if player is lvl 6
	class'KFVetSharpshooter'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Sharpshooter';
	class'KFVetFieldMedic'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Medic';
	class'KFVetFirebug'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Firebug';
	class'KFVetSupportSpec'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Support';
	class'KFVetDemolitions'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Demolition';
	class'KFVetBerserker'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Berserk';
	class'KFVetCommando'.default.OnHUDGoldIcon = Texture'ColorfulHUD.Perks.Perk_Commando';
}

defaultproperties
{
	// Mut Vars
    GroupName="KF-ColorfulHUD"
    FriendlyName="Colorful HUD - v1.1"
    Description="Replaces the HUD with a beautiful Green, Dark, White Elements & Colorful Icons!; by Vel-San"

	// Mandatory Vars
    bAddToServerPackages=True
}
