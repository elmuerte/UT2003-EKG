class EKGclientrules extends Info;

replication
{
	reliable if (Role == ROLE_Authority)
		SetClientDamage;
}

var int GibCountCalf;
var int GibCountForearm;
var int GibCountHead;
var int GibCountTorso;
var int GibCountUpperArm;

simulated function SetClientDamage(class<DamageType> damageType, Pawn Killed)
{
	log("Set client always gib:"@damageType);

	if (xPawn(Killed) != none)
	{
		xPawn(Killed).GibCountCalf = GibCountCalf;
    xPawn(Killed).GibCountForearm = GibCountForearm;
    xPawn(Killed).GibCountHead = GibCountHead;
    xPawn(Killed).GibCountTorso = GibCountTorso;
    xPawn(Killed).GibCountUpperArm = GibCountUpperArm;
	}

	damageType.default.bAlwaysGibs = true;
	damageType.default.GibPerterbation = 1.0;
}

defaultproperties
{
	bAlwaysRelevant=true
	RemoteRole=ROLE_SimulatedProxy
	//RemoteRole=ROLE_AutonomousProxy

	GibCountCalf=40
	GibCountForearm=20
	GibCountHead=20
	GibCountTorso=20
	GibCountUpperArm=20
}