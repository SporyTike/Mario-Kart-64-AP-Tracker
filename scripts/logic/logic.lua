COURSES = {
		"LuigiRaceway", "MooMooFarm", "KoopaTroopaBeach", "KalimariDesert",
		"ToadsTurnpike", "FrappeSnowland", "ChocoMountain", "MarioRaceway",
		"WarioStadium", "SherbetLand", "RoyalRaceway", "BowsersCastle",
		"DKsJungleParkway", "YoshiValley", "BansheeBoardwalk", "RainbowRoad"
	}

DRIVERS = {
		"mario", "luigi", "peach", "toad",
		"yoshi", "donkeyKong", "wario", "bowser"
	}


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

function table.find(table_, item)
	for i=1, #table_ do
		table_item = table_[i]
		if table_item == item then
			return i
		end
	end
	return nil
end

function canEnter(course, speed)
	speed = speed or 50
	if (
		(has("cup1") and has(string.format("cup1_course1_%s", course))) or
		(has("cup2") and has(string.format("cup2_course1_%s", course))) or
		(has("cup3") and has(string.format("cup3_course1_%s", course))) or
		(has("cup4") and has(string.format("cup4_course1_%s", course)))
	) then
		return true
	end
	for cup = 1, 4 do
		for course_num = 2, 4 do
			if has(string.format("cup%d_course%d_%s", cup, course_num, course)) then
				for i=1, #COURSES do
					new_course =COURSES[i]
					if (
						has(string.format("cup%d_course%d_%s", cup, course_num-1, new_course))
						and canWin(new_course, speed)
					)then
						return canEnter(new_course, speed)
					end
				end
			end
		end
	end
	return false
end

function getBaseScore()
	if has("difficulty_no_logic") then
		return 9999
	elseif has("difficulty_basic") then
		return -6
	elseif has("difficulty_advanced") then
		return -3
	elseif has("difficulty_expert") then
		return 0
	end
end

function getDriftScore()
	max_drift = 0
	for i=1, #DRIVERS do
		driver = DRIVERS[i]
		if has(driver) then
			if has(string.format("%s_drift2", driver)) then
				return 2
			end
			if has(string.format("%s_drift1", driver)) then
				max_drift = 1
			end
		end
	end
	return max_drift
end

function getItemScore(goal)
	-- Expects either "win" or "qualify" as input
	winScore = 0
	qualifyScore = 2
	if has("item_tripleRedShell") then
		winScore = winScore + 1
		qualifyScore = qualifyScore + 1
	end
	if has("item_tripleMushroom") then
		winScore = winScore + 1
		qualifyScore = qualifyScore + 1
	end
	if has("item_redShell") then
		winScore = winScore + 0.5
	end
	if has("item_lightning") then
		winScore = winScore + 0.5
		qualifyScore = qualifyScore + 1
	end
	if has("item_star") then
		winScore = winScore + 0.5
		qualifyScore = qualifyScore + 1
	end
	if has("item_superMushroom") then
		winScore = winScore + 0.5
		qualifyScore = qualifyScore + 1
	end
	if has("item_blueShell") then
		winScore = winScore + 0.5
		qualifyScore = qualifyScore + 1
	end
	if has("item_mushroom") then
		winScore = winScore + 0.5
		qualifyScore = qualifyScore + 0.5
	end
	if goal == "win" then
		return winScore
	elseif goal == "qualify" then
		return qualifyScore
	end
end

function getFenceScore()
	if has("coloredFences_off") then
		return 8
	end

	switch_count = 1 -- One-Based Indexing Makes Me Sick
	if has("switch_blue") then
		switch_count = switch_count + 1
	end
	if has("switch_red") then
		switch_count = switch_count + 1
	end
	if has("switch_green") then
		switch_count = switch_count + 1
	end
	if has("switch_yellow") then
		switch_count = switch_count + 1
	end

	if canFeather() then
		scores = {0, 4, 6, 7, 8}
	else
		scores = {2, 5, 6, 7, 8}
	end
	return scores[switch_count]
end

function getLevelDifficulty(course, goal)
	-- goal: Expects either "win" or "qualify" as input
	if course == "LuigiRaceway" then
		return -9999
	end
	if table.find({"MooMooFarm", "KalimariDesert", "ToadsTurnpike"}, course) then
		return 1
	end
	if table.find({"ChocoMountain", "MarioRaceway"}, course) then
		if goal == "qualify" then
			return 2
		elseif goal == "win" then
			return 3
		end
	end
	if table.find({"WarioStadium", "SherbetLand", "DKsJungleParkway"}, course) then
		return 4
	end
	if table.find({"KoopaTroopaBeach", "RoyalRaceway", "BowsersCastle", "BansheeBoardwalk"}, course) then
		return 5
	end
	if table.find({"FrappeSnowland", "RainbowRoad"}, course) then
		return 6
	end
	if course == "YoshiValley" then
		return 7
	end
end

function getTireDifficulty(course)
	difficulty = 0
	for i=1, #DRIVERS do
		driver = DRIVERS[i]
		-- Winter Tires
		if (
			table.find({"FrappeSnowland", "SherbetLand"}, course)
			and has(string.format("%s_winter", driver))
		)then
			return 2
		end
		-- Off-Road Tires
		if (
			table.find(
				{
					"KalimariDesert", "FrappeSnowland", "ChocoMountain",
					"MarioRaceway", "WarioStadium", "SherbetLand",
					"RoyalRaceway", "BowsersCastle", "DKsJungleParkway",
					"YoshiValley"
			}, course)
			and has(string.format("%s_offroad", driver))
		)then
			difficulty = 1
		end
	end
	return difficulty
end

function getDifficultyEdgeCases(course)
	difficulty = 0
	if (
		course == "KalimariDesert"
		and (has("switch_yellow") or has("coloredFences_off"))
		and has("item_star")
	) then
		return -9999
	elseif course == "DKsJungleParkway" and has("railings_DKsJungleParkway") then
		return -1
	elseif course == "YoshiValley" then
		if has("railings_YoshiValleyMainTrack") then
			difficulty = difficulty - 1
		end
		if has("railings_YoshiValleyMaze") then
			difficulty = difficulty - 1
		end
	elseif course == "BansheeBoardwalk" then
		if has("railings_BansheeBoardwalkNorth") then
			difficulty = difficulty - 2
		end
		if has("railings_BansheeBoardwalkSouth") then
			difficulty = difficulty - 0
		end
	elseif course == "RainbowRoad" then
		if has("railings_RainbowRoad1") then
			difficulty = difficulty - 2
		end
		if has("railings_RainbowRoad2") then
			difficulty = difficulty - 2
		end
		if has("railings_RainbowRoad3") then
			difficulty = difficulty - 2
		end
		if has("railings_RainbowRoad4") then
			difficulty = difficulty - 0
		end
		if has("railings_RainbowRoad5") then
			difficulty = difficulty - 1
		end
	end
	return difficulty
end

function getSpeedDifficulty(speed)
	-- Expects 50, 100, or 150 as input
	speed = tonumber(speed)
	if speed == 50 then
		return 0
	elseif speed == 100 then
		return 2
	elseif speed == 150 then
		return 3
	end
end

function getScore(goal)
	-- Expects either "win" or "qualify" as input
	return (
		getBaseScore()
		+ getItemScore(goal)
		+ getDriftScore()
		+ getFenceScore()
	)
end

function getDifficulty(speed, goal, course)
	-- speed: Expects 50, 100, or 150 as input
	-- goal: Expects either "win" or "qualify" as input
	return (
		getLevelDifficulty(course, goal)
		+ getTireDifficulty(course)
		+ getSpeedDifficulty(speed)
		+ getDifficultyEdgeCases(course)
	)
end

function canQualify(course, speed)
	speed = speed or 50
	return getScore("qualify") > getDifficulty(speed, "qualify", course)
end

function canWin(course, speed)
	speed = speed or 50
	return getScore("win") > getDifficulty(speed, "win", course)
end

function canGetTrophy(cup, speed, place)
	-- cup: Expects "cup1", "cup2", "cup3", or "cup4"
	-- Which cup is being played?
	--
	-- speed: Expects 50, 100, or 150
	-- What cc is being played?
	--
	-- place: Expects 1, 2, or 3
	-- What ranking does the player get?
	place = tonumber(place)
	wins = 0
	wins_required = {3, 2, 1}
	if hasNot(cup) then
		return false
	end
	for course_num = 1, 4 do
		for i=1, #COURSES do
			course = COURSES[i]
			if has(string.format("%s_course%d_%s", cup, course_num, course)) then
				if not (canEnter(course, speed) and canQualify(course, speed)) then
					return false
				end
				if canWin(course, speed) then
					wins = wins + 1
				end
			end
		end
	end
	return wins >= wins_required[place]
end