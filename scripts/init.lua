ENABLE_DEBUG_LOG = true

--Items
Tracker:AddItems("items/drivers.json")
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/settings.json")
Tracker:AddItems("items/cups.json")
Tracker:AddItems("items/checks.json")

-- Logic
ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/overview.json")
if PopVersion and PopVersion >= "0.23.0" then
	Tracker:AddLocations("locations/cupMushroom.json")
	Tracker:AddLocations("locations/cupFlower.json")
	Tracker:AddLocations("locations/cupStar.json")
	Tracker:AddLocations("locations/cupSpecial.json")
end

-- Layout
Tracker:AddLayouts("layouts/drivers.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/cups.json")
Tracker:AddLayouts("layouts/tabs.json")

if Tracker.ActiveVariantUID == "courseMap" then
	Tracker:AddLayouts("layouts/courseTracker.json")
else 
	Tracker:AddLayouts("layouts/cupTracker.json")
end

Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
	ScriptHost:LoadScript("scripts/autotracking.lua")
end