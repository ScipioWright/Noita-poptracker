-- functions that are called in locations.json to determine check visibility or check count

-- 1 == main path, 2 == side path, 3 == main world
function on_path(path_value)
    if path_value <= chosen_path then
        return true
    else
        return false
    end
end


-- 0 == no orbs, 1 == main path, 2 == side path, 3 == main world
function in_orb_set(orb_value)
    if orb_value <= orb_path then
        return true
    else
        return false
    end
end


-- 0 == no bosses, 1 == main path, 2 == side path, 3 == main world
function in_boss_set(boss_value)
    if boss_value <= boss_path then
        return true
    else
        return false
    end
end


function set_chest_count(value)
    --Tracker:FindObjectForCode("@Overgrown Cavern/Chests").AvailableChestCount = tonumber(value)
    Tracker:FindObjectForCode("@Snowy Depths/Chests").AvailableChestCount = tonumber(value)
end


function set_pedestal_count(value)
    --Tracker:FindObjectForCode("@Overgrown Cavern/Pedestals").AvailableChestCount = tonumber(value)
    Tracker:FindObjectForCode("@Snowy Depths/Pedestals").AvailableChestCount = tonumber(value)
end

