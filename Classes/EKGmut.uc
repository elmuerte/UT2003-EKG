// Engine-killing gibs

class EKGmut extends Mutator;

var config int GibCountCalf;
var config int GibCountForearm;
var config int GibCountHead;
var config int GibCountTorso;
var config int GibCountUpperArm;

function PostBeginPlay()
{
	local GameRules G;
	
	Super.PostBeginPlay();
	G = spawn(class'EKGrules');
	if ( Level.Game.GameRulesModifiers == None ) Level.Game.GameRulesModifiers = G;
	else Level.Game.GameRulesModifiers.AddGameRules(G);
}

function ModifyPlayer(Pawn Other)
{
	local EKGclientrules EKGCR;
	Super.ModifyPlayer(Other);

	if (xPawn(Other) != none)
	{
		xPawn(Other).GibCountCalf = GibCountCalf;
    xPawn(Other).GibCountForearm = GibCountForearm;
    xPawn(Other).GibCountHead = GibCountHead;
    xPawn(Other).GibCountTorso = GibCountTorso;
    xPawn(Other).GibCountUpperArm = GibCountUpperArm;

		if (PlayerController(Other.Controller) == none) return;
		foreach AllActors(class'EKGclientrules', EKGCR)
		{
			if (EKGCR.owner == Other.Controller) return;
		}
		Log("Spawn EKGclientrules for"@Other.Controller);
		spawn(class'EKGclientrules', Other.Controller);
	}
}

defaultproperties
{
	FriendlyName="EKG"
  Description="Engine-killing gibs"

	GibCountCalf=40
	GibCountForearm=20
	GibCountHead=20
	GibCountTorso=20
	GibCountUpperArm=20
}
