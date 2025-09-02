--####################################################
--###            WELCOME TO MY LUA HELL            ###
--####################################################

-- Only allow these usernames to run this script
-- You can just copy and host your own lua on github
local allowed_names = {
    MsNecro = true,
    MsNecromancer = true,
}

if not allowed_names[you.name()] then
    return -- Stop if character name doesn't match
end

-- Tracks whether we've already run startup macros
local has_run_startup = false

-- Default macros by class
local macros_by_class = {
    Necromancer = {
        "macros = M ` za.",
        "macros += M 1 zb.",
    },
    Berserker = {
        "macros = M ` zc.",
    },
}

-- Macros for specific race/class combos
local macros_by_combo = {
    ["Minotaur/Berserker"] = {
        "macros += M 2 zf.",
    },
    ["Deep Elf/Necromancer"] = {
        "macros += M 2 zg.",
    },
}

-- Apply macros from a list
local function apply_macros(macros)
    if not macros then return end
    for _, cmd in ipairs(macros) do
        crawl.setopt(cmd)
    end
end

-- Main setup
local function setup_macros(my_class, my_race)
    -- First: class defaults
    apply_macros(macros_by_class[my_class])

    -- Then: race/class overrides or extras
    local key = my_race .. "/" .. my_class
    apply_macros(macros_by_combo[key])
end

-- Runs once after class + race are available
function ready()
    if has_run_startup then return end
    if not (you.class() and you.race()) then return end

    setup_macros(you.class(), you.race())
    has_run_startup = true
end
