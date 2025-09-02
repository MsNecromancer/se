--####################################################
--###            WELCOME TO MY LUA HELL            ###
--####################################################
local allowed_names = {
    MsNecro = true,
    MsNecromancer = true
}

-- Only enable macros if the username matches
local enabled = allowed_names[you.name()] or false
crawl.mpr("Lua: Username check, enabled = " .. tostring(enabled))

-- Turns off the ready() after first run
local has_run_startup = false

-- Default macros by class
local macros_by_class = {
    Necromancer = {
        "macros = M ` za.",
        "macros += M 1 zb."
    },
    Berserker = {
        "macros = M ` zc."
    }
}

-- Special macros for specific race/class combos
local macros_by_combo = {
    ["Minotaur/Berserker"] = {
        "macros += M 2 zf."
    },
    ["Deep Elf/Necromancer"] = {
        "macros += M 2 zg."
    }
}

-- Apply macros from a list
local function apply_macros(macros)
    if not macros then
        crawl.mpr("Lua: No macros found for this key")
        return
    end
    for _, cmd in ipairs(macros) do
        crawl.mpr("Lua: Applying macro -> " .. cmd)
        crawl.setopt(cmd)
    end
end

-- Main setup
local function setup_macros(my_class, my_race)
    crawl.mpr("Lua: Running setup_macros for " .. my_race .. " " .. my_class)

    -- First: class defaults
    crawl.mpr("Lua: Checking class defaults for " .. my_class)
    apply_macros(macros_by_class[my_class])

    -- Then: race/class overrides or extras
    local key = my_race .. "/" .. my_class
    crawl.mpr("Lua: Checking combo key -> " .. key)
    apply_macros(macros_by_combo[key])
end

-- Ready hook
function ready()
    crawl.mpr("Lua: Entered ready()")

    if not enabled then
        crawl.mpr("Lua: Username not allowed, skipping macros")
        return
    end

    if has_run_startup then
        crawl.mpr("Lua: Already initialized, skipping")
        return
    end

    if not (you.class() and you.race()) then
        crawl.mpr("Lua: Class or race not available yet")
        return
    end

    crawl.mpr("Lua: Running setup_macros now")
    setup_macros(you.class(), you.race())
    has_run_startup = true
    crawl.mpr("Lua: Macro setup complete, startup flag set")
end
