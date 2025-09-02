--####################################################
--###            WELCOME TO MY LUA HELL            ###
--####################################################
local has_run_startup =  --Turns off the ready()

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

function ready()
    if has_run_startup then return end
    if not (you.class() and you.race()) then return end

    setup_macros(you.class(), you.race())
    has_run_startup = true
}
