class KFSpotifyHUD extends Mutator;

function postBeginPlay()
{
  local KFGameType GT;

  super.postBeginPlay();

  GT = KFGameType(level.game);

  if (GT != none)
  {
    GT.hudType = string(class'SpotifyHUD');
  }
}

defaultproperties
{
	// Mut Vars
    GroupName="KF-SpotifyHUD"
    FriendlyName="Spotify HUD"
    Description="Replaces the HUD with a beautiful, simple: Green, Dark & White HUD; by Vel-San"

	// Mandatory Vars
    bAddToServerPackages=True
}
