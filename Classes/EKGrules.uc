class EKGrules extends GameRules;

function bool PreventDeath(Pawn Killed, Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	setClientDamageType(damageType, Killed);
	return Super.PreventDeath(Killed, Killer, damageType, HitLocation);
}

function bool PreventSever(Pawn Killed, Name boneName, int Damage, class<DamageType> DamageType)
{
	setClientDamageType(damageType, Killed);
	return Super.PreventSever(Killed, boneName, Damage, DamageType);
}

function SetClientDamageType(class<DamageType> damageType, Pawn Killed)
{
	local EKGclientrules EKGCR;
	log ("Set always gib:"@damageType);
	damageType.default.bAlwaysGibs = true;
	damageType.default.GibPerterbation = 1.0;

	foreach AllActors(class'EKGclientrules', EKGCR)
	{
		if (EKGCR.owner == none) EKGCR.Destroy();
		else EKGCR.SetClientDamage(damageType, Killed);
	}
}
