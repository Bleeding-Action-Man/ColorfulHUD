class SpotifyHUD extends HUDKillingFloor;

// Load Custom Texture Pack
// #exec OBJ LOAD FILE=SpotifyHUD.utx

simulated function UpdateHud()
{
	local float MaxGren, CurGren;
	local KFHumanPawn KFHPawn;
	local Syringe S;

	if( PawnOwner == none )
	{
		super.UpdateHud();
		return;
	}

	KFHPawn = KFHumanPawn(PawnOwner);

	CalculateAmmo();

	if ( KFHPawn != none )
	{
		FlashlightDigits.Value = 100 * (float(KFHPawn.TorchBatteryLife) / float(KFHPawn.default.TorchBatteryLife));
	}

	if ( KFWeapon(PawnOwner.Weapon) != none )
	{
		BulletsInClipDigits.Value = KFWeapon(PawnOwner.Weapon).MagAmmoRemaining;

		if ( BulletsInClipDigits.Value < 0 )
		{
			BulletsInClipDigits.Value = 0;
		}
	}

	ClipsDigits.Value = CurClipsPrimary;
	SecondaryClipsDigits.Value = CurClipsSecondary;

	if ( LAW(PawnOwner.Weapon) != none || Crossbow(PawnOwner.Weapon) != none
        || M79GrenadeLauncher(PawnOwner.Weapon) != none || PipeBombExplosive(PawnOwner.Weapon) != none
        || HuskGun(PawnOwner.Weapon) != none || CrossBuzzSaw(PawnOwner.Weapon) != none
        || SPGrenadeLauncher(PawnOwner.Weapon) != none  )
	{
		ClipsDigits.Value = KFWeapon(PawnOwner.Weapon).AmmoAmount(0);
	}

	if ( PlayerGrenade == none )
	{
		FindPlayerGrenade();
	}

	if ( PlayerGrenade != none )
	{
		PlayerGrenade.GetAmmoCount(MaxGren, CurGren);
		GrenadeDigits.Value = CurGren;
	}
	else
	{
		GrenadeDigits.Value = 0;
	}

 	HealthDigits.Value = PawnOwner.Health;
	ArmorDigits.Value = xPawn(PawnOwner).ShieldStrength;

	// "Poison" the health meter
	if ( VomitHudTimer > Level.TimeSeconds )
	{
		HealthDigits.Tints[0].R = 196;
		HealthDigits.Tints[0].G = 206;
		HealthDigits.Tints[0].B = 0;

		HealthDigits.Tints[1].R = 196;
		HealthDigits.Tints[1].G = 206;
		HealthDigits.Tints[1].B = 0;
	}
	else if ( PawnOwner.Health < 50 )
	{
		if ( Level.TimeSeconds < SwitchDigitColorTime )
		{
			HealthDigits.Tints[0].R = 255;
			HealthDigits.Tints[0].G = 255;
			HealthDigits.Tints[0].B = 255;

			HealthDigits.Tints[1].R = 255;
			HealthDigits.Tints[1].G = 255;
			HealthDigits.Tints[1].B = 255;
		}
		else
		{
			HealthDigits.Tints[0].R = 60;
			HealthDigits.Tints[0].G = 179;
			HealthDigits.Tints[0].B = 113;

			HealthDigits.Tints[1].R = 60;
			HealthDigits.Tints[1].G = 179;
			HealthDigits.Tints[1].B = 113;

			if ( Level.TimeSeconds > SwitchDigitColorTime + 0.2 )
			{
				SwitchDigitColorTime = Level.TimeSeconds + 0.2;
			}
		}
	}
	else
	{
		HealthDigits.Tints[0].R = 255;
		HealthDigits.Tints[0].G = 255;
		HealthDigits.Tints[0].B = 255;

		HealthDigits.Tints[1].R = 255;
		HealthDigits.Tints[1].G = 255;
		HealthDigits.Tints[1].B = 255;
	}



	CashDigits.Value = PawnOwnerPRI.Score;

	WelderDigits.Value = 100 * (CurAmmoPrimary / MaxAmmoPrimary);
	SyringeDigits.Value = WelderDigits.Value;

	if ( SyringeDigits.Value < 50 )
	{
		SyringeDigits.Tints[0].R = 128;
		SyringeDigits.Tints[0].G = 128;
		SyringeDigits.Tints[0].B = 128;

		SyringeDigits.Tints[1] = SyringeDigits.Tints[0];
	}
	else if ( SyringeDigits.Value < 100 )
	{
		SyringeDigits.Tints[0].R = 192;
		SyringeDigits.Tints[0].G = 96;
		SyringeDigits.Tints[0].B = 96;

		SyringeDigits.Tints[1] = SyringeDigits.Tints[0];
	}
	else
	{
		SyringeDigits.Tints[0].R = 255;
		SyringeDigits.Tints[0].G = 64;
		SyringeDigits.Tints[0].B = 64;

		SyringeDigits.Tints[1] = SyringeDigits.Tints[0];
	}

	if ( bDisplayQuickSyringe  )
	{
		S = Syringe(PawnOwner.FindInventoryType(class'Syringe'));
		if ( S != none )
		{
			QuickSyringeDigits.Value = S.ChargeBar() * 100;

			if ( QuickSyringeDigits.Value < 50 )
			{
				QuickSyringeDigits.Tints[0].R = 128;
				QuickSyringeDigits.Tints[0].G = 128;
				QuickSyringeDigits.Tints[0].B = 128;

				QuickSyringeDigits.Tints[1] = QuickSyringeDigits.Tints[0];
			}
			else if ( QuickSyringeDigits.Value < 100 )
			{
				QuickSyringeDigits.Tints[0].R = 192;
				QuickSyringeDigits.Tints[0].G = 96;
				QuickSyringeDigits.Tints[0].B = 96;

				QuickSyringeDigits.Tints[1] = QuickSyringeDigits.Tints[0];
			}
			else
			{
				QuickSyringeDigits.Tints[0].R = 255;
				QuickSyringeDigits.Tints[0].G = 64;
				QuickSyringeDigits.Tints[0].B = 64;

				QuickSyringeDigits.Tints[1] = QuickSyringeDigits.Tints[0];
			}
		}
	}

	// Hints
	if ( PawnOwner.Health <= 50 )
	{
		KFPlayerController(PlayerOwner).CheckForHint(51);
	}

	Super.UpdateHud();
}

defaultproperties
{
  // Numbers(kinda like fonts)
	DigitsSmall=(DigitTexture=Texture'KillingFloorHUD.Generic.HUD',TextureCoords[0]=(X1=8,Y1=6,X2=36,Y2=38),TextureCoords[1]=(X1=50,Y1=6,X2=68,Y2=38),TextureCoords[2]=(X1=83,Y1=6,X2=113,Y2=38),TextureCoords[3]=(X1=129,Y1=6,X2=157,Y2=38),TextureCoords[4]=(X1=169,Y1=6,X2=197,Y2=38),TextureCoords[5]=(X1=206,Y1=6,X2=235,Y2=38),TextureCoords[6]=(X1=241,Y1=6,X2=269,Y2=38),TextureCoords[7]=(X1=285,Y1=6,X2=315,Y2=38),TextureCoords[8]=(X1=318,Y1=6,X2=348,Y2=38),TextureCoords[9]=(X1=357,Y1=6,X2=388,Y2=38),TextureCoords[10]=(X1=390,Y1=6,X2=428,Y2=38))
	DigitsBig=(DigitTexture=Texture'KillingFloorHUD.Generic.HUD',TextureCoords[0]=(X1=8,Y1=6,X2=36,Y2=38),TextureCoords[1]=(X1=50,Y1=6,X2=68,Y2=38),TextureCoords[2]=(X1=83,Y1=6,X2=113,Y2=38),TextureCoords[3]=(X1=129,Y1=6,X2=157,Y2=38),TextureCoords[4]=(X1=169,Y1=6,X2=197,Y2=38),TextureCoords[5]=(X1=206,Y1=6,X2=235,Y2=38),TextureCoords[6]=(X1=241,Y1=6,X2=269,Y2=38),TextureCoords[7]=(X1=285,Y1=6,X2=315,Y2=38),TextureCoords[8]=(X1=318,Y1=6,X2=348,Y2=38),TextureCoords[9]=(X1=357,Y1=6,X2=388,Y2=38),TextureCoords[10]=(X1=390,Y1=6,X2=428,Y2=38))

	// Health
	HealthBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.015,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
	HealthIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Medical_Cross',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.16,DrawPivot=DP_UpperLeft,PosX=0.021,PosY=0.947,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	HealthDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.0425,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Armor
	ArmorBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.085,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
	ArmorIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Shield',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.09,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	ArmorDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.115,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Weight
	WeightBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=256,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.155,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
	WeightIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Weight',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.16,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	WeightDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.195,PosY=0.946,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Grenade
	GrenadeBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.915,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	GrenadeIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Grenade',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.93,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	GrenadeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.96,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Clips(All Weapons except Welder and Syringe)
	ClipsBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	ClipsDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.88,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Secondary Clips(All Weapons except Welder and Syringe)
	SecondaryClipsBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	SecondaryClipsDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
  SecondaryClipsIcon=(WidgetTexture=Texture'KillingFloor2HUD.HUD.Hud_M79',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.22,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.943,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))

	// Bullets(All Weapons except LAW, Crossbow, Shotgun, Boomstick, Winchester, Welder and Syringe)
	BulletsInClipBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.775,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	BulletsInClipIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Bullets',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.781,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	BulletsInClipDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.807,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Flashlight(9mm and Shotgun)
	FlashlightBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	FlashlightIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Flashlight',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.31,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.938,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	FlashlightOffIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Flashlight_Off',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.31,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.938,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	FlashlightDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Welder only
	WelderBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	WelderIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Lightning_Bolt',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	WelderDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.875,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Syringe only
	SyringeBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	SyringeIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	SyringeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.875,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Medic Gun only
	MedicGunBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	MedicGunIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=.7075,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	MedicGunDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Temp Syringe Display
	QuickSyringeDisplayTime=5.0
	QuickSyringeFadeInTime=1.0
	QuickSyringeFadeOutTime=0.5
	QuickSyringeBG=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.47,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	QuickSyringeIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.475,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	QuickSyringeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.50,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Cash
	CashIcon=(WidgetTexture=Texture'KillingFloorHUD.HUD.Hud_Pound_Symbol',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.3,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.86,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	CashDigits=(RenderStyle=STY_Alpha,TextureScale=0.50,DrawPivot=DP_UpperLeft,PosX=0.882,PosY=0.867,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}
