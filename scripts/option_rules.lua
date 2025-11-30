-- functions that are called in locations.json to determine check visibility or check count

-- 1 == main path, 2 == side path, 3 == main world
function on_path(path_value)
    return tonumber(path_value) <= tonumber(chosen_path)
end


-- 0 == no orbs, 1 == main path, 2 == side path, 3 == main world
function in_orb_set(orb_value)
    return tonumber(orb_value) <= tonumber(orb_path)
end


-- 0 == no bosses, 1 == main path, 2 == side path, 3 == main world
function in_boss_set(boss_value)
    return tonumber(boss_value) <= tonumber(boss_path)
end


function set_chest_count(value)
    Tracker:FindObjectForCode("@Biome Checks/Overgrown Cavern/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Frozen Vault/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Mines/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Coal Pits/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Fungal Caverns/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Snowy Depths/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Hiisi Base/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Underground Jungle/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Lukki Lair/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/The Vault/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Temple of the Art/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/The Tower/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Wizard's Den/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Power Plant/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Meat Realm/Chests").AvailableChestCount = value
end


function set_pedestal_count(value)
    Tracker:FindObjectForCode("@Biome Checks/Overgrown Cavern/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Frozen Vault/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Mines/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Coal Pits/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Fungal Caverns/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Snowy Depths/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Hiisi Base/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Underground Jungle/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Lukki Lair/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/The Vault/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Temple of the Art/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/The Tower/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Wizard's Den/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Power Plant/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Meat Realm/Pedestals").AvailableChestCount = value
end

-- in-game map is 70x48
-- 0, 0 is the lower left corner of the gray square at the start
-- +y is down, +x is right

-- python for doing this:
--x = -35
--full_string = ""
--map_x_ratio = .27
--map_y_ratio = .27
--for _ in range(70):
--    y = -14
--    for _ in range(48):
--        full_string += (f"{{\"name\": \"You - {x}, {y}\", \"visibility_rules\": [\"$player_position|{x}|{y}\"], "
--                        f"\"access_rules\": [], \"sections\": [{{\"name\": \"{x},{y}\"}}], "
--                        f"\"map_locations\": ["
--                        f"{{\"map\": \"map1\", \"x\": {(x + 34) * 64 + 96}, \"y\": {(y + 14) * 64 + 32}, \"shape\": \"diamond\"}}, "
--                        f"{{\"map\": \"map2\", \"x\": {int(map_x_ratio * ((x + 34) * 64 + 96)) - 56}, \"y\": {int(map_y_ratio * ((y + 14) * 64 + 32)) - 49}, \"shape\": \"diamond\"}}"
--                        f"]}},")
--        y += 1
--    x += 1
--full_string = full_string[:-1]
--full_string += "]}]"
--logger.warning(full_string)

player_x = 200
player_y = 200

function player_position(x_value, y_value)
    return player_x == tonumber(x_value) and player_y == tonumber(y_value)
end
