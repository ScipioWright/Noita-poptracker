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
    print("boss value")
    print(boss_value)
    if tonumber(boss_value) <= tonumber(boss_path) then
        print("true")
        return true
    else
        print("false")
        return false
    end
end


function set_chest_count(value)
    print("setting chest counts")
    print(value)
    Tracker:FindObjectForCode("@Biome Checks/Overgrown Cavern/Chests").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Snowy Depths/Chests").AvailableChestCount = value
end


function set_pedestal_count(value)
    Tracker:FindObjectForCode("@Biome Checks/Overgrown Cavern/Pedestals").AvailableChestCount = value
    Tracker:FindObjectForCode("@Biome Checks/Snowy Depths/Pedestals").AvailableChestCount = value
end

