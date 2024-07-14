function canFeather()
	return (has("addFeather_on") and has("item_feather"))
end

function canPassYellow()
	return (canFeather() or has("switch_yellow") or has("coloredFences_off"))
end

function canPassGreen()
	return (canFeather() or has("switch_green") or has("coloredFences_off"))
end

function canPassRed()
	return (canFeather() or has("switch_red") or has("coloredFences_off"))
end

function canPassBlue()
	return (canFeather() or has("switch_blue") or has("coloredFences_off"))
end

function canFakeItemBox()
	return (has("item_fakeItemBox"))
end

function hasNot(item)
	return not has(item)
end

function canEnterLuigiRaceway()
	return (
		has("cup_mushroom") and has("cup1_LuigiRaceway") or
		has("cup_flower") and has("cup2_LuigiRaceway") or
		has("cup_star") and has("cup3_LuigiRaceway") or
		has("cup_special") and has("cup4_LuigiRaceway")
	)
end

function canEnterMooMooFarm()
	return (
		has("cup_mushroom") and has("cup1_MooMooFarm") or
		has("cup_flower") and has("cup2_MooMooFarm") or
		has("cup_star") and has("cup3_MooMooFarm") or
		has("cup_special") and has("cup4_MooMooFarm")
	)
end

function canEnterKoopaTroopaBeach()
	return (
		has("cup_mushroom") and has("cup1_KoopaTroopaBeach") or
		has("cup_flower") and has("cup2_KoopaTroopaBeach") or
		has("cup_star") and has("cup3_KoopaTroopaBeach") or
		has("cup_special") and has("cup4_KoopaTroopaBeach")
	)
end

function canEnterKalimariDesert()
	return (
		has("cup_mushroom") and has("cup1_KalimariDesert") or
		has("cup_flower") and has("cup2_KalimariDesert") or
		has("cup_star") and has("cup3_KalimariDesert") or
		has("cup_special") and has("cup4_KalimariDesert")
	)
end

function canEnterToadsTurnpike()
	return (
		has("cup_mushroom") and has("cup1_ToadsTurnpike") or
		has("cup_flower") and has("cup2_ToadsTurnpike") or
		has("cup_star") and has("cup3_ToadsTurnpike") or
		has("cup_special") and has("cup4_ToadsTurnpike")
	)
end

function canEnterFrappeSnowland()
	return (
		has("cup_mushroom") and has("cup1_FrappeSnowland") or
		has("cup_flower") and has("cup2_FrappeSnowland") or
		has("cup_star") and has("cup3_FrappeSnowland") or
		has("cup_special") and has("cup4_FrappeSnowland")
	)
end

function canEnterChocoMountain()
	return (
		has("cup_mushroom") and has("cup1_ChocoMountain") or
		has("cup_flower") and has("cup2_ChocoMountain") or
		has("cup_star") and has("cup3_ChocoMountain") or
		has("cup_special") and has("cup4_ChocoMountain")
	)
end

function canEnterMarioRaceway()
	return (
		has("cup_mushroom") and has("cup1_MarioRaceway") or
		has("cup_flower") and has("cup2_MarioRaceway") or
		has("cup_star") and has("cup3_MarioRaceway") or
		has("cup_special") and has("cup4_MarioRaceway")
	)
end

function canEnterWarioStadium()
	return (
		has("cup_mushroom") and has("cup1_WarioStadium") or
		has("cup_flower") and has("cup2_WarioStadium") or
		has("cup_star") and has("cup3_WarioStadium") or
		has("cup_special") and has("cup4_WarioStadium")
	)
end

function canEnterSherbetLand()
	return (
		has("cup_mushroom") and has("cup1_SherbetLand") or
		has("cup_flower") and has("cup2_SherbetLand") or
		has("cup_star") and has("cup3_SherbetLand") or
		has("cup_special") and has("cup4_SherbetLand")
	)
end

function canEnterRoyalRaceway()
	return (
		has("cup_mushroom") and has("cup1_RoyalRaceway") or
		has("cup_flower") and has("cup2_RoyalRaceway") or
		has("cup_star") and has("cup3_RoyalRaceway") or
		has("cup_special") and has("cup4_RoyalRaceway")
	)
end

function canEnterBowsersCastle()
	return (
		has("cup_mushroom") and has("cup1_BowsersCastle") or
		has("cup_flower") and has("cup2_BowsersCastle") or
		has("cup_star") and has("cup3_BowsersCastle") or
		has("cup_special") and has("cup4_BowsersCastle")
	)
end

function canEnterDKsJungleParkway()
	return (
		has("cup_mushroom") and has("cup1_DKsJungleParkway") or
		has("cup_flower") and has("cup2_DKsJungleParkway") or
		has("cup_star") and has("cup3_DKsJungleParkway") or
		has("cup_special") and has("cup4_DKsJungleParkway")
	)
end

function canEnterYoshiValley()
	return (
		has("cup_mushroom") and has("cup1_YoshiValley") or
		has("cup_flower") and has("cup2_YoshiValley") or
		has("cup_star") and has("cup3_YoshiValley") or
		has("cup_special") and has("cup4_YoshiValley")
	)
end

function canEnterBansheeBoardwalk()
	return (
		has("cup_mushroom") and has("cup1_BansheeBoardwalk") or
		has("cup_flower") and has("cup2_BansheeBoardwalk") or
		has("cup_star") and has("cup3_BansheeBoardwalk") or
		has("cup_special") and has("cup4_BansheeBoardwalk")
	)
end

function canEnterRainbowRoad()
	return (
		has("cup_mushroom") and has("cup1_RainbowRoad") or
		has("cup_flower") and has("cup2_RainbowRoad") or
		has("cup_star") and has("cup3_RainbowRoad") or
		has("cup_special") and has("cup4_RainbowRoad")
	)
end