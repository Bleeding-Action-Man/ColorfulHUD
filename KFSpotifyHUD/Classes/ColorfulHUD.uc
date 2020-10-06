class ColorfulHUD extends HUDKillingFloor;

// Load Custom Texture Pack
#exec OBJ LOAD FILE=ColorfulHUD.utx

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
		// Blue
		HealthDigits.Tints[0].R = 0;
		HealthDigits.Tints[0].G = 0;
		HealthDigits.Tints[0].B = 255;
	}
	else if ( PawnOwner.Health < 50 )
	{
		if ( Level.TimeSeconds < SwitchDigitColorTime )
		{
			// White
			HealthDigits.Tints[0].R = 255;
			HealthDigits.Tints[0].G = 255;
			HealthDigits.Tints[0].B = 255;
		}
		else
		{
			// Teal
			HealthDigits.Tints[0].R = 60;
			HealthDigits.Tints[0].G = 179;
			HealthDigits.Tints[0].B = 113;

			if ( Level.TimeSeconds > SwitchDigitColorTime + 0.2 )
			{
				SwitchDigitColorTime = Level.TimeSeconds + 0.2;
			}
		}
	}
	else
	{
		HealthDigits.Tints[0] = default.HealthDigits.Tints[0];
    	HealthDigits.Tints[1] = HealthDigits.Tints[0];
	}



	CashDigits.Value = PawnOwnerPRI.Score;

	WelderDigits.Value = 100 * (CurAmmoPrimary / MaxAmmoPrimary);
	SyringeDigits.Value = WelderDigits.Value;

	if ( SyringeDigits.Value < 50 )
	{
		// Teal
		SyringeDigits.Tints[0].R = 60;
		SyringeDigits.Tints[0].G = 179;
		SyringeDigits.Tints[0].B = 113;

		SyringeDigits.Tints[1] = SyringeDigits.Tints[0];
	}
	else if ( SyringeDigits.Value < 100 )
	{
		// White
		SyringeDigits.Tints[0].R = 255;
		SyringeDigits.Tints[0].G = 255;
		SyringeDigits.Tints[0].B = 255;

		SyringeDigits.Tints[1] = SyringeDigits.Tints[0];
	}
	else
	{
		SyringeDigits.Tints[0].R = 255;
		SyringeDigits.Tints[0].G = 255;
		SyringeDigits.Tints[0].B = 255;

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
				// Teal
				QuickSyringeDigits.Tints[0].R = 60;
				QuickSyringeDigits.Tints[0].G = 179;
				QuickSyringeDigits.Tints[0].B = 113;

				QuickSyringeDigits.Tints[1] = QuickSyringeDigits.Tints[0];
			}
			else if ( QuickSyringeDigits.Value < 100 )
			{
				QuickSyringeDigits.Tints[0].R = 255;
				QuickSyringeDigits.Tints[0].G = 255;
				QuickSyringeDigits.Tints[0].B = 255;

				QuickSyringeDigits.Tints[1] = QuickSyringeDigits.Tints[0];
			}
			else
			{
				QuickSyringeDigits.Tints[0].R = 255;
				QuickSyringeDigits.Tints[0].G = 255;
				QuickSyringeDigits.Tints[0].B = 255;

				QuickSyringeDigits.Tints[1] = QuickSyringeDigits.Tints[0];
			}
		}
	}

	// Hints
	if ( PawnOwner.Health <= 50 )
	{
		KFPlayerController(PlayerOwner).CheckForHint(51);
	}

	Super(HudBase).UpdateHud();
}

simulated function DrawKFHUDTextElements(Canvas C)
{
	local float    XL, YL;
	local int      NumZombies, Min;
	local string   S;
	local vector   Pos, FixedZPos;
	local rotator  ShopDirPointerRotation;
	local float    CircleSize;
	local float    ResScale;

	if ( PlayerOwner == none || KFGRI == none || !KFGRI.bMatchHasBegun || KFPlayerController(PlayerOwner).bShopping )
	{
		return;
	}

    ResScale =  C.SizeX / 1024.0;
    CircleSize = FMin(128 * ResScale,128);
	C.FontScaleX = FMin(ResScale,1.f);
	C.FontScaleY = FMin(ResScale,1.f);

	// Countdown Text
	if( !KFGRI.bWaveInProgress )
	{
		C.SetDrawColor(255, 255, 255, 255);
		C.SetPos(C.ClipX - CircleSize, 2);
		C.DrawTile(Material'ColorfulHUD.HUD.Hud_Bio_Clock_Circle', CircleSize, CircleSize, 0, 0, 256, 256);

		if ( KFGRI.TimeToNextWave <= 5 )
		{
			// Hints
		   	if ( bIsSecondDowntime )
		   	{
				KFPlayerController(PlayerOwner).CheckForHint(40);
			}
		}

		Min = KFGRI.TimeToNextWave / 60;
		NumZombies = KFGRI.TimeToNextWave - (Min * 60);

		S = Eval((Min >= 10), string(Min), "0" $ Min) $ ":" $ Eval((NumZombies >= 10), string(NumZombies), "0" $ NumZombies);
		C.Font = LoadFont(2);
		C.Strlen(S, XL, YL);
		C.SetDrawColor(255, 255, 255, KFHUDAlpha);
		C.SetPos(C.ClipX - CircleSize/2 - (XL / 2), CircleSize/2 - YL / 2);
		C.DrawText(S, False);
	}
	else
	{
		//Hints
		if ( KFPlayerController(PlayerOwner) != none )
		{
			KFPlayerController(PlayerOwner).CheckForHint(30);

			if ( !bHint_45_TimeSet && KFGRI.WaveNumber == 1)
			{
				Hint_45_Time = Level.TimeSeconds + 5;
				bHint_45_TimeSet = true;
			}
		}

		C.SetDrawColor(255, 255, 255, 255);
		C.SetPos(C.ClipX - CircleSize, 2);
		C.DrawTile(Material'ColorfulHUD.HUD.Hud_Bio_Circle', CircleSize, CircleSize, 0, 0, 256, 256);

		S = string(KFGRI.MaxMonsters);
		C.Font = LoadFont(1);
		C.Strlen(S, XL, YL);
		C.SetDrawColor(255, 255, 255, KFHUDAlpha);
		C.SetPos(C.ClipX - CircleSize/2 - (XL / 2), CircleSize/2 - (YL / 1.5));
		C.DrawText(S);

		// Show the number of waves
		S = WaveString @ string(KFGRI.WaveNumber + 1) $ "/" $ string(KFGRI.FinalWave);
		C.Font = LoadFont(5);
		C.Strlen(S, XL, YL);
		C.SetPos(C.ClipX - CircleSize/2 - (XL / 2), CircleSize/2 + (YL / 2.5));
		C.DrawText(S);

   		//Needed for the hints showing up in the second downtime
		bIsSecondDowntime = true;
	}

	C.FontScaleX = 1;
	C.FontScaleY = 1;


	if ( KFPRI == none || KFPRI.Team == none || KFPRI.bOnlySpectator || PawnOwner == none )
	{
		return;
	}

	// Draw the shop pointer
	if ( ShopDirPointer == None )
	{
		ShopDirPointer = Spawn(Class'KFShopDirectionPointer');
		ShopDirPointer.bHidden = bHideHud;
	}

	Pos.X = C.SizeX / 18.0;
	Pos.Y = C.SizeX / 18.0;
	Pos = PlayerOwner.Player.Console.ScreenToWorld(Pos) * 10.f * (PlayerOwner.default.DefaultFOV / PlayerOwner.FovAngle) + PlayerOwner.CalcViewLocation;
	ShopDirPointer.SetLocation(Pos);

	if ( KFGRI.CurrentShop != none )
	{
		// Let's check for a real Z difference (i.e. different floor) doesn't make sense to rotate the arrow
		// only because the trader is a midget or placed slightly wrong
		if ( KFGRI.CurrentShop.Location.Z > PawnOwner.Location.Z + 50.f || KFGRI.CurrentShop.Location.Z < PawnOwner.Location.Z - 50.f )
		{
		    ShopDirPointerRotation = rotator(KFGRI.CurrentShop.Location - PawnOwner.Location);
		}
		else
		{
		    FixedZPos = KFGRI.CurrentShop.Location;
		    FixedZPos.Z = PawnOwner.Location.Z;
		    ShopDirPointerRotation = rotator(FixedZPos - PawnOwner.Location);
		}
	}
	else
	{
		ShopDirPointer.bHidden = true;
		return;
	}

   	ShopDirPointer.SetRotation(ShopDirPointerRotation);

	if ( Level.TimeSeconds > Hint_45_Time && Level.TimeSeconds < Hint_45_Time + 2 )
	{
		if ( KFPlayerController(PlayerOwner) != none )
		{
			KFPlayerController(PlayerOwner).CheckForHint(45);
		}
	}

	C.DrawActor(None, False, True); // Clear Z.
	ShopDirPointer.bHidden = false;
	C.DrawActor(ShopDirPointer, False, false);
	ShopDirPointer.bHidden = true;
	CustomDrawTraderDistance(C);
}

// Draws the distance to the trader in meters when the ShopDirPointer is active
simulated final function CustomDrawTraderDistance(Canvas C)
{
	local int       FontSize;
	local float     StrWidth, StrHeight;
	local string    TraderDistanceText;

   	if ( PawnOwner != none && KFGRI != none )
   	{
		if ( KFGRI.CurrentShop != none )
		{
		   	TraderDistanceText = TraderString$":" @ int(VSize(KFGRI.CurrentShop.Location - PawnOwner.Location) / 50) $ DistanceUnitString;
		}
		else
		{
			return;
		}

		if ( C.ClipX <= 640 )
			FontSize = 7;
		else if ( C.ClipX <= 800 )
			FontSize = 6;
		else if ( C.ClipX <= 1024 )
			FontSize = 5;
		else if ( C.ClipX <= 1280 )
			FontSize = 4;
		else
			FontSize = 3;

		C.Font = LoadFont(FontSize);
		C.SetDrawColor(255, 255, 255, 255);
		C.StrLen(TraderDistanceText, StrWidth, StrHeight);
		C.SetPos((C.SizeX / 14.0) - (StrWidth / 2.0), C.SizeX / 10.0);
		C.DrawText(TraderDistanceText);
	}
}

function DrawDoorBar(Canvas C, float XCentre, float YCentre, float BarPercentage, byte BarAlpha)
{
	local float TextWidth, TextHeight;
	local string IntegrityText;

	IntegrityText = int(FClamp(BarPercentage,0.f,1.f) * 100) $ "%";

	if ( !bLightHud )
	{
		C.SetDrawColor(255, 255, 255, 112);
		C.Style = ERenderStyle.STY_Alpha;
		C.SetPos(XCentre - ((DoorWelderBG.USize * 1.18) / 2) , YCentre - ((DoorWelderBG.VSize * 0.9) / 2));
		C.DrawTileScaled(DoorWelderBG, 1.18, 0.9);
	}

	C.SetDrawColor(255, 255, 255, 255);

	C.Font = LoadSmallFontStatic(4);
	C.StrLen(IntegrityText, TextWidth, TextHeight);
	C.SetDrawColor(255, 255, 255, 255);
	C.SetPos(XCentre + 5 , YCentre - (TextHeight / 2.4));
	C.DrawTextClipped(IntegrityText);

	C.SetPos((XCentre - 5) - 64, YCentre - 24);
	C.Style = ERenderStyle.STY_Alpha;
	C.DrawTile(DoorWelderIcon, 64, 48, 0, 0, 256, 192);
}

simulated function DrawWeaponName(Canvas C)
{
	local string CurWeaponName;
	local float XL,YL;

	if (  PawnOwner == None || PawnOwner.Weapon == None )
	{
		return;
	}

	CurWeaponName = PawnOwner.Weapon.GetHumanReadableName();
	C.Font  = GetFontSizeIndex(C, -1);
	C.SetDrawColor(255, 255, 255, KFHUDAlpha);
	C.Strlen(CurWeaponName, XL, YL);

	// Diet Hud needs to move the weapon name a little bit or it looks weird
	if ( !bLightHud )
	{
		C.SetPos((C.ClipX * 0.983) - XL, C.ClipY * 0.91);
	}
	else
	{
		C.SetPos((C.ClipX * 0.97) - XL, C.ClipY * 0.90);
	}

	C.DrawText(CurWeaponName);
}

defaultproperties
{
	// Health
	HealthBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.015,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
	HealthIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Medical_Cross',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.16,DrawPivot=DP_UpperLeft,PosX=0.021,PosY=0.947,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	HealthDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.0425,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Armor
	ArmorBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.085,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
	ArmorIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Shield',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.09,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	ArmorDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.115,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Weight
	WeightBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=256,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.155,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
	WeightIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Weight',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.16,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	WeightDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.195,PosY=0.946,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Grenade
	GrenadeBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.915,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	GrenadeIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Grenade',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.93,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	GrenadeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.96,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Clips(All Weapons except Welder and Syringe)
	ClipsBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	ClipsDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.88,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Secondary Clips(All Weapons except Welder and Syringe)
	SecondaryClipsBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	SecondaryClipsDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
  	SecondaryClipsIcon=(WidgetTexture=Texture'KillingFloor2HUD.HUD.Hud_M79',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.22,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.943,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))

	// All Other Weapons
	ClipsIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Ammo_Clip',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.22,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.943,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))

	// Bullets(All Weapons except LAW, Crossbow, Shotgun, Boomstick, Winchester, Welder and Syringe)
	BulletsInClipBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.775,PosY=0.935,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	BulletsInClipIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Bullets',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.781,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	BulletsInClipDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.807,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Flashlight(9mm and Shotgun)
	FlashlightBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	FlashlightIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flashlight',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.31,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.938,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	FlashlightOffIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flashlight_Off',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.31,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.938,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	FlashlightDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Welder only
	WelderBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	WelderIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Lightning_Bolt',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	WelderDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.875,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Syringe only
	SyringeBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	SyringeIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	SyringeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.875,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Medic Gun only
	MedicGunBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	MedicGunIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=.7075,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	MedicGunDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Temp Syringe Display
	QuickSyringeBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.47,PosY=0.935,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	QuickSyringeIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.2,DrawPivot=DP_UpperLeft,PosX=0.475,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	QuickSyringeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.50,PosY=0.95,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

	// Cash
	CashIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Pound_Symbol',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.3,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.86,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
	CashDigits=(RenderStyle=STY_Alpha,TextureScale=0.50,DrawPivot=DP_UpperLeft,PosX=0.882,PosY=0.867,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}
