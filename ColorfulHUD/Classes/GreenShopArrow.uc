class GreenShopArrow extends KFShopDirectionPointer;

#exec OBJ LOAD FILE=GreenShopArrow.usx

defaultproperties
{
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'GreenShopArrow.Trader.TraderArrow'
	bHidden=True
	bStasis=True
	DrawScale=0.25
}