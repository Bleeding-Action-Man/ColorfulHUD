class ColorfulHUD extends HUDKillingFloor;

// Load Custom Texture Pack
#exec OBJ LOAD FILE=ColorfulHUD.utx

var() NumericWidget WeightDigitsMax;
var() SpriteWidget WeightDivider;
var() color Teal;

simulated function SetHUDAlpha()
{
  HealthBG.Tints[0].A = KFHUDAlpha;
  HealthBG.Tints[1].A = KFHUDAlpha;
  HealthIcon.Tints[0].A = KFHUDAlpha;
  HealthIcon.Tints[1].A = KFHUDAlpha;
  HealthDigits.Tints[0].A = KFHUDAlpha;
  HealthDigits.Tints[1].A = KFHUDAlpha;

  ArmorBG.Tints[0].A = KFHUDAlpha;
  ArmorBG.Tints[1].A = KFHUDAlpha;
  ArmorIcon.Tints[0].A = KFHUDAlpha;
  ArmorIcon.Tints[1].A = KFHUDAlpha;
  ArmorDigits.Tints[0].A = KFHUDAlpha;
  ArmorDigits.Tints[1].A = KFHUDAlpha;

  WeightBG.Tints[0].A = KFHUDAlpha;
  WeightBG.Tints[1].A = KFHUDAlpha;
  WeightIcon.Tints[0].A = KFHUDAlpha;
  WeightIcon.Tints[1].A = KFHUDAlpha;
  WeightDigits.Tints[0].A = KFHUDAlpha;
  WeightDigits.Tints[1].A = KFHUDAlpha;
  WeightDigitsMax.Tints[0].A = KFHUDAlpha;
  WeightDigitsMax.Tints[1].A = KFHUDAlpha;
  WeightDivider.Tints[0].A = KFHUDAlpha;
  WeightDivider.Tints[1].A = KFHUDAlpha;

  GrenadeBG.Tints[0].A = KFHUDAlpha;
  GrenadeBG.Tints[1].A = KFHUDAlpha;
  GrenadeIcon.Tints[0].A = KFHUDAlpha;
  GrenadeIcon.Tints[1].A = KFHUDAlpha;
  GrenadeDigits.Tints[0].A = KFHUDAlpha;
  GrenadeDigits.Tints[1].A = KFHUDAlpha;

  ClipsBG.Tints[0].A = KFHUDAlpha;
  ClipsBG.Tints[1].A = KFHUDAlpha;
  ClipsIcon.Tints[0].A = KFHUDAlpha;
  ClipsIcon.Tints[1].A = KFHUDAlpha;
  ClipsDigits.Tints[0].A = KFHUDAlpha;
  ClipsDigits.Tints[1].A = KFHUDAlpha;

  SecondaryClipsBG.Tints[0].A = KFHUDAlpha;
  SecondaryClipsBG.Tints[1].A = KFHUDAlpha;
  SecondaryClipsIcon.Tints[0].A = KFHUDAlpha;
  SecondaryClipsIcon.Tints[1].A = KFHUDAlpha;
  SecondaryClipsDigits.Tints[0].A = KFHUDAlpha;
  SecondaryClipsDigits.Tints[1].A = KFHUDAlpha;

  BulletsInClipBG.Tints[0].A = KFHUDAlpha;
  BulletsInClipBG.Tints[1].A = KFHUDAlpha;
  BulletsInClipIcon.Tints[0].A = KFHUDAlpha;
  BulletsInClipIcon.Tints[1].A = KFHUDAlpha;
  BulletsInClipDigits.Tints[0].A = KFHUDAlpha;
  BulletsInClipDigits.Tints[1].A = KFHUDAlpha;

  M79Icon.Tints[0].A = KFHUDAlpha;
  M79Icon.Tints[1].A = KFHUDAlpha;
  HuskAmmoIcon.Tints[0].A = KFHUDAlpha;
  HuskAmmoIcon.Tints[1].A = KFHUDAlpha;
  PipeBombIcon.Tints[0].A = KFHUDAlpha;
  PipeBombIcon.Tints[1].A = KFHUDAlpha;
  LawRocketIcon.Tints[0].A = KFHUDAlpha;
  LawRocketIcon.Tints[1].A = KFHUDAlpha;
  ArrowheadIcon.Tints[0].A = KFHUDAlpha;
  ArrowheadIcon.Tints[1].A = KFHUDAlpha;
  SawAmmoIcon.Tints[0].A = KFHUDAlpha;
  SawAmmoIcon.Tints[1].A = KFHUDAlpha;
  SingleBulletIcon.Tints[0].A = KFHUDAlpha;
  SingleBulletIcon.Tints[1].A = KFHUDAlpha;
  FlameIcon.Tints[0].A = KFHUDAlpha;
  FlameIcon.Tints[1].A = KFHUDAlpha;
  FlameTankIcon.Tints[0].A = KFHUDAlpha;
  FlameTankIcon.Tints[1].A = KFHUDAlpha;
  ZEDAmmoIcon.Tints[0].A = KFHUDAlpha;
  ZEDAmmoIcon.Tints[1].A = KFHUDAlpha;

  FlashlightBG.Tints[0].A = KFHUDAlpha;
  FlashlightBG.Tints[1].A = KFHUDAlpha;
  FlashlightIcon.Tints[0].A = KFHUDAlpha;
  FlashlightIcon.Tints[1].A = KFHUDAlpha;
  FlashlightOffIcon.Tints[0].A = KFHUDAlpha;
  FlashlightOffIcon.Tints[1].A = KFHUDAlpha;
  FlashlightDigits.Tints[0].A = KFHUDAlpha;
  FlashlightDigits.Tints[1].A = KFHUDAlpha;

  WelderBG.Tints[0].A = KFHUDAlpha;
  WelderBG.Tints[1].A = KFHUDAlpha;
  WelderIcon.Tints[0].A = KFHUDAlpha;
  WelderIcon.Tints[1].A = KFHUDAlpha;
  WelderDigits.Tints[0].A = KFHUDAlpha;
  WelderDigits.Tints[1].A = KFHUDAlpha;

  SyringeBG.Tints[0].A = KFHUDAlpha;
  SyringeBG.Tints[1].A = KFHUDAlpha;
  SyringeIcon.Tints[0].A = KFHUDAlpha;
  SyringeIcon.Tints[1].A = KFHUDAlpha;
  SyringeDigits.Tints[0].A = KFHUDAlpha;
  SyringeDigits.Tints[1].A = KFHUDAlpha;

  MedicGunBG.Tints[0].A = KFHUDAlpha;
  MedicGunBG.Tints[1].A = KFHUDAlpha;
  MedicGunIcon.Tints[0].A = KFHUDAlpha;
  MedicGunIcon.Tints[1].A = KFHUDAlpha;
  MedicGunDigits.Tints[0].A = KFHUDAlpha;
  MedicGunDigits.Tints[1].A = KFHUDAlpha;

  QuickSyringeBG.Tints[0].A = KFHUDAlpha;
  QuickSyringeBG.Tints[1].A = KFHUDAlpha;
  QuickSyringeIcon.Tints[0].A = KFHUDAlpha;
  QuickSyringeIcon.Tints[1].A = KFHUDAlpha;
  QuickSyringeDigits.Tints[0].A = KFHUDAlpha;
  QuickSyringeDigits.Tints[1].A = KFHUDAlpha;

  CashIcon.Tints[0].A = KFHUDAlpha;
  CashIcon.Tints[1].A = KFHUDAlpha;
  CashDigits.Tints[0].A = KFHUDAlpha;
  CashDigits.Tints[1].A = KFHUDAlpha;
}

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

  // Draw the Custom Green Trader Arrow
  if ( ShopDirPointer == None )
  {
    ShopDirPointer = Spawn(Class'GreenShopArrow');
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

simulated function DrawHudPassA (Canvas C)
{
  local KFHumanPawn KFHPawn;
  local Material TempMaterial, TempStarMaterial;
  local int i, TempLevel;
  local float TempX, TempY, TempSize;

  KFHPawn = KFHumanPawn(PawnOwner);

  DrawDoorHealthBars(C);

  // Always LightHUD
  if ( !bLightHud )
  {
    DrawSpriteWidget(C, HealthBG);
  }

  DrawSpriteWidget(C, HealthIcon);
  DrawNumericWidget(C, HealthDigits, DigitsSmall);

  // Always LightHUD
  if ( !bLightHud )
  {
    DrawSpriteWidget(C, ArmorBG);
  }

  DrawSpriteWidget(C, ArmorIcon);
  DrawNumericWidget(C, ArmorDigits, DigitsSmall);

  if ( KFHPawn != none )
  {
    C.SetPos(C.ClipX * WeightBG.PosX, C.ClipY * WeightBG.PosY);

    // Always LightHUD
    if ( !bLightHud )
    {
      // C.DrawTile(WeightBG.WidgetTexture, WeightBG.WidgetTexture.MaterialUSize() * WeightBG.TextureScale * 1.5 * HudCanvasScale * ResScaleX * HudScale, WeightBG.WidgetTexture.MaterialVSize() * WeightBG.TextureScale * HudCanvasScale * ResScaleY * HudScale, 0, 0, WeightBG.WidgetTexture.MaterialUSize(), WeightBG.WidgetTexture.MaterialVSize());
      // Custom WeightBG
      DrawSpriteWidget(C, WeightBG);
    }

    DrawSpriteWidget(C, WeightIcon);
    // Custom Weight Text, using the new Custom Font!
    WeightDigits.Value = int(KFHPawn.CurrentWeight);
    WeightDigitsMax.Value = int(KFHPawn.MaxCarryWeight);
    DrawNumericWidget(C, WeightDigits, DigitsSmall);
    DrawNumericWidget(C, WeightDigitsMax, DigitsSmall);
    DrawSpriteWidget(C, WeightDivider);
  }

  // Always LightHUD
  if ( !bLightHud )
  {
    DrawSpriteWidget(C, GrenadeBG);
  }

  DrawSpriteWidget(C, GrenadeIcon);
  DrawNumericWidget(C, GrenadeDigits, DigitsSmall);

  if ( PawnOwner != none && PawnOwner.Weapon != none )
  {
    if ( Syringe(PawnOwner.Weapon) != none )
    {
      // Always LightHUD
      if ( !bLightHud )
      {
        DrawSpriteWidget(C, SyringeBG);
      }

      DrawSpriteWidget(C, SyringeIcon);
      DrawNumericWidget(C, SyringeDigits, DigitsSmall);
    }
    else
    {
      // Always LightHUD
      if ( !bLightHud )
      {
        DrawSpriteWidget(C, QuickSyringeBG);
      }

      DrawSpriteWidget(C, QuickSyringeIcon);
      DrawNumericWidget(C, QuickSyringeDigits, DigitsSmall);

      if ( MP7MMedicGun(PawnOwner.Weapon) != none || MP5MMedicGun(PawnOwner.Weapon) != none || M7A3MMedicGun(PawnOwner.Weapon) != none  )
      if ( MP7MMedicGun(PawnOwner.Weapon) != none || MP5MMedicGun(PawnOwner.Weapon) != none
        || M7A3MMedicGun(PawnOwner.Weapon) != none || KrissMMedicGun(PawnOwner.Weapon) != none )
      if ( MP7MMedicGun(PawnOwner.Weapon) != none || MP5MMedicGun(PawnOwner.Weapon) != none )
      {
        if( MP7MMedicGun(PawnOwner.Weapon) != none )
        {
          MedicGunDigits.Value = MP7MMedicGun(PawnOwner.Weapon).ChargeBar() * 100;
        }
        else if( M7A3MMedicGun(PawnOwner.Weapon) != none )
        {
          MedicGunDigits.Value = M7A3MMedicGun(PawnOwner.Weapon).ChargeBar() * 100;
        }
        else if( MP5MMedicGun(PawnOwner.Weapon) != none )
        {
          MedicGunDigits.Value = MP5MMedicGun(PawnOwner.Weapon).ChargeBar() * 100;
        }
        else
        {
          MedicGunDigits.Value = KrissMMedicGun(PawnOwner.Weapon).ChargeBar() * 100;
        }

        if ( MedicGunDigits.Value < 50 )
        {
          MedicGunDigits.Tints[0].R = 60;
          MedicGunDigits.Tints[0].G = 179;
          MedicGunDigits.Tints[0].B = 113;

          MedicGunDigits.Tints[1] = SyringeDigits.Tints[0];
        }
        else if ( MedicGunDigits.Value < 100 )
        {
          MedicGunDigits.Tints[0].R = 255;
          MedicGunDigits.Tints[0].G = 255;
          MedicGunDigits.Tints[0].B = 255;

          MedicGunDigits.Tints[1] = SyringeDigits.Tints[0];
        }
        else
        {
          MedicGunDigits.Tints[0].R = 255;
          MedicGunDigits.Tints[0].G = 255;
          MedicGunDigits.Tints[0].B = 255;

          MedicGunDigits.Tints[1] = MedicGunDigits.Tints[0];
        }

        // Always LightHUD
        if ( !bLightHud )
        {
          DrawSpriteWidget(C, MedicGunBG);
        }

        DrawSpriteWidget(C, MedicGunIcon);
        DrawNumericWidget(C, MedicGunDigits, DigitsSmall);
      }

      if ( Welder(PawnOwner.Weapon) != none )
      {
        // Always LightHUD
        if ( !bLightHud )
        {
          DrawSpriteWidget(C, WelderBG);
        }

        DrawSpriteWidget(C, WelderIcon);
        DrawNumericWidget(C, WelderDigits, DigitsSmall);
      }
      else if ( PawnOwner.Weapon.GetAmmoClass(0) != none )
      {
        // Always LightHUD
        if ( !bLightHud )
        {
          DrawSpriteWidget(C, ClipsBG);
        }

        if ( HuskGun(PawnOwner.Weapon) != none )
        {
          ClipsDigits.PosX = 0.873;
          DrawNumericWidget(C, ClipsDigits, DigitsSmall);
          ClipsDigits.PosX = default.ClipsDigits.PosX;
        }
        else
        {
          DrawNumericWidget(C, ClipsDigits, DigitsSmall);
        }

        if ( LAW(PawnOwner.Weapon) != none )
        {
          DrawSpriteWidget(C, LawRocketIcon);
        }
        else if ( Crossbow(PawnOwner.Weapon) != none )
        {
          DrawSpriteWidget(C, ArrowheadIcon);
        }
        else if ( CrossBuzzSaw(PawnOwner.Weapon) != none )
        {
          DrawSpriteWidget(C, SawAmmoIcon);
        }
        else if ( PipeBombExplosive(PawnOwner.Weapon) != none )
        {
          DrawSpriteWidget(C, PipeBombIcon);
        }
        else if ( M79GrenadeLauncher(PawnOwner.Weapon) != none || SPGrenadeLauncher(PawnOwner.Weapon) != none )
        {
          DrawSpriteWidget(C, M79Icon);
        }
        else if ( HuskGun(PawnOwner.Weapon) != none )
        {
          DrawSpriteWidget(C, HuskAmmoIcon);
        }
        else
        {
          // Always LightHUD
          if ( !bLightHud )
          {
            DrawSpriteWidget(C, BulletsInClipBG);
          }

          DrawNumericWidget(C, BulletsInClipDigits, DigitsSmall);

          if ( Flamethrower(PawnOwner.Weapon) != none )
          {
            DrawSpriteWidget(C, FlameIcon);
            DrawSpriteWidget(C, FlameTankIcon);
          }
          else if ( Shotgun(PawnOwner.Weapon) != none || BoomStick(PawnOwner.Weapon) != none || Winchester(PawnOwner.Weapon) != none
            || BenelliShotgun(PawnOwner.Weapon) != none )
          {
            DrawSpriteWidget(C, SingleBulletIcon);
            DrawSpriteWidget(C, BulletsInClipIcon);
          }
          else if ( ZEDGun(PawnOwner.Weapon) != none )
          {
            DrawSpriteWidget(C, ClipsIcon);
            DrawSpriteWidget(C, ZedAmmoIcon);
          }
          else
          {
            DrawSpriteWidget(C, ClipsIcon);
            DrawSpriteWidget(C, BulletsInClipIcon);
          }
        }

        if ( KFWeapon(PawnOwner.Weapon) != none && KFWeapon(PawnOwner.Weapon).bTorchEnabled )
        {
          // Always LightHUD
          if ( !bLightHud )
          {
            DrawSpriteWidget(C, FlashlightBG);
          }

          DrawNumericWidget(C, FlashlightDigits, DigitsSmall);

          if ( KFWeapon(PawnOwner.Weapon).FlashLight != none && KFWeapon(PawnOwner.Weapon).FlashLight.bHasLight )
          {
            DrawSpriteWidget(C, FlashlightIcon);
          }
          else
          {
            DrawSpriteWidget(C, FlashlightOffIcon);
          }
        }
      }

      // Secondary ammo
      if ( KFWeapon(PawnOwner.Weapon) != none && KFWeapon(PawnOwner.Weapon).bHasSecondaryAmmo )
      {
        // Always LightHUD
        if ( !bLightHud )
        {
          DrawSpriteWidget(C, SecondaryClipsBG);
        }

        DrawNumericWidget(C, SecondaryClipsDigits, DigitsSmall);
        DrawSpriteWidget(C, SecondaryClipsIcon);
      }
    }
  }

  if ( KFPRI != none && KFPRI.ClientVeteranSkill != none )
  {
    KFPRI.ClientVeteranSkill.Static.SpecialHUDInfo(KFPRI, C);
  }

  if ( KFGameReplicationInfo(PlayerOwner.GameReplicationInfo) == none || KFGameReplicationInfo(PlayerOwner.GameReplicationInfo).bHUDShowCash )
  {
    DrawSpriteWidget(C, CashIcon);
    DrawNumericWidget(C, CashDigits, DigitsBig);
  }

  if ( KFPRI != none && KFPRI.ClientVeteranSkill != none && KFPRI.ClientVeteranSkill.default.OnHUDIcon != none )
  {
    if ( KFPRI.ClientVeteranSkillLevel > 5 )
    {
      TempMaterial = KFPRI.ClientVeteranSkill.default.OnHUDGoldIcon;
      TempStarMaterial = VetStarGoldMaterial;
      TempLevel = KFPRI.ClientVeteranSkillLevel - 5;
      C.SetDrawColor(255, 255, 255, 192);
    }
    else
    {
      TempMaterial = KFPRI.ClientVeteranSkill.default.OnHUDIcon;
      TempStarMaterial = VetStarMaterial;
      TempLevel = KFPRI.ClientVeteranSkillLevel;
    }

    TempSize = FMin((36 * VeterancyMatScaleFactor * 1.4) * (float(C.SizeX) / 1024.f),36 * VeterancyMatScaleFactor * 1.4) ;
    VetStarSize = FMin(default.VetStarSize * (float(C.SizeX) / 1024.f),default.VetStarSize);
    TempX = C.ClipX * 0.007;
    TempY = C.ClipY * 0.93 - TempSize;

    C.SetPos(TempX, TempY);
    C.DrawTile(TempMaterial, TempSize, TempSize, 0, 0, TempMaterial.MaterialUSize(), TempMaterial.MaterialVSize());

    TempX += (TempSize - VetStarSize);
    TempY += (TempSize - (2.0 * VetStarSize));

    for ( i = 0; i < TempLevel; i++ )
    {
      C.SetPos(TempX + 20, TempY);
      C.DrawTile(TempStarMaterial, VetStarSize, VetStarSize, 0, 0, TempStarMaterial.MaterialUSize(), TempStarMaterial.MaterialVSize());

      TempY -= VetStarSize;
    }
  }

  if ( Level.TimeSeconds - LastVoiceGainTime < 0.333 )
  {
    if ( !bUsingVOIP && PlayerOwner != None && PlayerOwner.ActiveRoom != None &&
       PlayerOwner.ActiveRoom.GetTitle() == "Team" )
    {
      bUsingVOIP = true;
      PlayerOwner.NotifySpeakingInTeamChannel();
    }

    DisplayVoiceGain(C);
  }
  else
  {
    bUsingVOIP = false;
  }

  if ( bDisplayInventory || bInventoryFadingOut )
  {
    DrawInventory(C);
  }
}

defaultproperties
{

  // Colors
  Teal = (R=60,G=179,B=113,A=255)

  // Numbers(kinda like fonts)
  DigitsSmall=(DigitTexture=Texture'ColorfulHUD.TextElements.Hud_numbers',TextureCoords[0]=(X1=8,Y1=6,X2=36,Y2=38),TextureCoords[1]=(X1=50,Y1=6,X2=68,Y2=38),TextureCoords[2]=(X1=83,Y1=6,X2=113,Y2=38),TextureCoords[3]=(X1=129,Y1=6,X2=157,Y2=38),TextureCoords[4]=(X1=169,Y1=6,X2=197,Y2=38),TextureCoords[5]=(X1=206,Y1=6,X2=235,Y2=38),TextureCoords[6]=(X1=241,Y1=6,X2=269,Y2=38),TextureCoords[7]=(X1=285,Y1=6,X2=315,Y2=38),TextureCoords[8]=(X1=318,Y1=6,X2=348,Y2=38),TextureCoords[9]=(X1=357,Y1=6,X2=388,Y2=38),TextureCoords[10]=(X1=390,Y1=6,X2=428,Y2=38))
  DigitsBig=(DigitTexture=Texture'ColorfulHUD.TextElements.Hud_numbers',TextureCoords[0]=(X1=8,Y1=6,X2=36,Y2=38),TextureCoords[1]=(X1=50,Y1=6,X2=68,Y2=38),TextureCoords[2]=(X1=83,Y1=6,X2=113,Y2=38),TextureCoords[3]=(X1=129,Y1=6,X2=157,Y2=38),TextureCoords[4]=(X1=169,Y1=6,X2=197,Y2=38),TextureCoords[5]=(X1=206,Y1=6,X2=235,Y2=38),TextureCoords[6]=(X1=241,Y1=6,X2=269,Y2=38),TextureCoords[7]=(X1=285,Y1=6,X2=315,Y2=38),TextureCoords[8]=(X1=318,Y1=6,X2=348,Y2=38),TextureCoords[9]=(X1=357,Y1=6,X2=388,Y2=38),TextureCoords[10]=(X1=390,Y1=6,X2=428,Y2=38))

  // Health
  HealthBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.0179,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
  HealthIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Medical_Cross',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.021,PosY=0.947,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  HealthDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.053,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Armor
  ArmorBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.0879,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
  ArmorIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Shield',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.09,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  ArmorDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.122,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Weight
  WeightBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.1579,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=128),Tints[1]=(B=255,G=255,R=255,A=128))
  WeightIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Weight',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.16,PosY=0.944,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  WeightDivider=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Weight_Divider',RenderStyle=STY_Alpha,TextureCoords=(X2=32,Y2=32),TextureScale=0.32,DrawPivot=DP_UpperLeft,PosX=0.196,PosY=0.956,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  WeightDigits=(RenderStyle=STY_Alpha,TextureScale=0.24,DrawPivot=DP_UpperLeft,PosX=0.195,PosY=0.948,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
  WeightDigitsMax=(RenderStyle=STY_Alpha,TextureScale=0.24,DrawPivot=DP_UpperLeft,PosX=0.195,PosY=0.969,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Grenade
  GrenadeBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.915,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  GrenadeIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Grenade',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.93,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  GrenadeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.96,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Clips(All Weapons except Welder and Syringe)
  ClipsBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  ClipsDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.88,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Secondary Clips(All Weapons except Welder and Syringe)
  SecondaryClipsBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  SecondaryClipsDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SecondaryClipsIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_M79',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.704,PosY=0.943,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))

  // Per Weapon Icons:
  // PipeBomb
  PipeBombIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Pipebomb',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.85,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // M79
  M79Icon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_M79',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // HuskAmmoIcon
  HuskAmmoIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flame',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.848,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // LAW
  LawRocketIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Law_Rocket',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // Crossbow
  ArrowheadIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Arrowhead',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // Cross buzzsaw
  SawAmmoIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Sawblade',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // Shotgun, Boomstick, and Winchester
  SingleBulletIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Single_Bullet',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // Flamethrower
  FlameIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flame',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.781,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  FlameTankIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flame_Tank',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.853,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // Zed Gun
  ZEDAmmoIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.ZED_Hud_Bolt',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.781,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  // All Other Weapons
  ClipsIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Ammo_Clip',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.850,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))

  // Bullets(All Weapons except LAW, Crossbow, Shotgun, Boomstick, Winchester, Welder and Syringe)
  BulletsInClipBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.775,PosY=0.941,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  BulletsInClipIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Bullets',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.25,DrawPivot=DP_UpperLeft,PosX=0.779,PosY=0.945,ScaleMode=SM_Right,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  BulletsInClipDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.807,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Flashlight(9mm and Shotgun)
  FlashlightBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.941,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  FlashlightIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flashlight',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.701,PosY=0.943,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  FlashlightOffIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Flashlight_Off',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.701,PosY=0.943,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  FlashlightDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Welder only
  WelderBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.941,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  WelderIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Lightning_Bolt',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.847,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  WelderDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.875,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Syringe only
  SyringeBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.845,PosY=0.941,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  SyringeIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=0.847,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  SyringeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.875,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Medic Gun only
  MedicGunBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.705,PosY=0.941,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  MedicGunIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.28,DrawPivot=DP_UpperLeft,PosX=.7072,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  MedicGunDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.731,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Temp Syringe Display
  QuickSyringeBG=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Box_128x64',RenderStyle=STY_Alpha,TextureCoords=(X2=128,Y2=64),TextureScale=0.35,DrawPivot=DP_UpperLeft,PosX=0.467,PosY=0.941,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  QuickSyringeIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Syringe',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.29,DrawPivot=DP_UpperLeft,PosX=0.469,PosY=0.945,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  QuickSyringeDigits=(RenderStyle=STY_Alpha,TextureScale=0.30,DrawPivot=DP_UpperLeft,PosX=0.50,PosY=0.956,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Cash
  CashIcon=(WidgetTexture=Texture'ColorfulHUD.HUD.Hud_Pound_Symbol',RenderStyle=STY_Alpha,TextureCoords=(X2=64,Y2=64),TextureScale=0.38,DrawPivot=DP_UpperLeft,PosX=0.837,PosY=0.86,Scale=1.000000,Tints[0]=(B=255,G=255,R=255,A=255),Tints[1]=(B=255,G=255,R=255,A=255))
  CashDigits=(RenderStyle=STY_Alpha,TextureScale=0.50,DrawPivot=DP_UpperLeft,PosX=0.882,PosY=0.867,Tints[0]=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))

  // Veterancy Stars
  VetStarMaterial=Material'ColorfulHUD.HUD.Hud_Perk_Star'
  VetStarGoldMaterial=Material'ColorfulHUD.HUD.Hud_Perk_Star_Gold'

  // Inventory
  InventoryBackgroundTexture=Texture'ColorfulHUD.HUD.HUD_Rectangel_W_Stroke'
  SelectedInventoryBackgroundTexture=Texture'ColorfulHUD.HUD.HUD_Rectangel_selected'

  // Door Welding
  DoorWelderBG=Texture'ColorfulHUD.HUD.Hud_Box_128x64';

}
