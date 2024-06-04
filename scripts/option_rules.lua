-- functions that are called in locations.json to determine check visibility or check count

-- 1 == main path, 2 == side path, 3 == main world
function on_path(path_value)
    if tonumber(path_value) <= tonumber(chosen_path) then
        return true
    else
        return false
    end
end


-- 0 == no orbs, 1 == main path, 2 == side path, 3 == main world
function in_orb_set(orb_value)
    if tonumber(orb_value) <= tonumber(orb_path) then
        return true
    else
        return false
    end
end


-- 0 == no bosses, 1 == main path, 2 == side path, 3 == main world
function in_boss_set(boss_value)
    if tonumber(boss_value) <= tonumber(boss_path) then
        return true
    else
        print("false")
        return false
    end
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

