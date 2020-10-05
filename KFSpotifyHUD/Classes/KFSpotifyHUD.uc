class KFSpotifyHUD extends Mutator;

function PostBeginPlay()
{
  	local KFGameType GT;

  	super.PostBeginPlay();
  	GT = KFGameType(level.game);
  	if (GT != none)
  	{
  	  GT.HUDType = string(class'SpotifyHUD');
  	}
}

defaultproperties
{
	// Mut Vars
    GroupName="KF-SpotifyHUD"
    FriendlyName="Spotify HUD - v1.0"
    Description="Replaces the HUD with a beautiful, simple: Green, Dark & White HUD; by Vel-San"

	// Mandatory Vars
    bAddToServerPackages=True
}
