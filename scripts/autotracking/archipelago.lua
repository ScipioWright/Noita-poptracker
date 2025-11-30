-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in location_mapping.lua to track locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/option_rules.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}
chosen_path = 3
orb_path = 3
boss_path = 3

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    -- note to self: slot data outputs like {"victory_condition":0, "path_option": 1, "hidden_chests":3, etc.
    -- set up the settings
    for option, name in pairs(SETTINGS_MAPPING) do
        obj = Tracker:FindObjectForCode(name)
        local value = SLOT_DATA[option]

        if name == "PathOption" then
            chosen_path = value
        elseif name == "ChestCount" then
            set_chest_count(value)
        elseif name == "PedestalCount" then
            set_pedestal_count(value)
        elseif name == "OrbPath" then
            orb_path = value
        elseif name == "BossPath" then
            boss_path = value
        end
    end

    Archipelago:SetNotify({"Noita_position_" .. Archipelago.PlayerNumber})
    Archipelago:Get({"Noita_position_" .. Archipelago.PlayerNumber})

    local refresh = Tracker:FindObjectForCode("Refresh")
    refresh.Active = not refresh.Active
end


--called when a location gets cleared
function onLocation(location_id, location_name)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end
    local v = LOCATION_MAPPING[location_id]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
end


function retrieved(key, value)
    if key == "Noita_position_" .. Archipelago.PlayerNumber then
        print(key)
        print(value)
        if value == nil then return end
        player_x = value["x"]
        player_y = value["y"]
        print(player_x)
        print(player_y)
        local refresh = Tracker:FindObjectForCode("Refresh")
        refresh.Active = not refresh.Active
    end
end


function onSetReply(key, value, _)
    if key == "Noita_position_" .. Archipelago.PlayerNumber then
        player_x = value["x"]
        player_y = value["y"]
        print(player_x)
        print(player_y)
        local refresh = Tracker:FindObjectForCode("Refresh")
        refresh.Active = not refresh.Active
    end
end


-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddRetrievedHandler("retrieved", retrieved)
Archipelago:AddSetReplyHandler("set reply handler", onSetReply)
