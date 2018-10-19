-- The rockz mod ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- License of everything LGP v3 --

-- Stones ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- dependancy based configuration

-- Enable xrockz to rockz more stuff
local enable_xrockz = true
rocks = {}
rockz.xrockz = enable_xrockz

local function deps_met(mod)
	if minetest.get_modpath(mod) then
		print(mod)
		if not minetest.setting_getbool("disable_rockz."..mod) then
			print("\t"..mod.."=true")
			return true
		else
			print("\t"..mod.."=false")
			return false
		end
	end
end

mpath = minetest.get_modpath("rockz")

-- Rock polisher
dofile(mpath.."/polisher.lua")

local stonez = {
 	{"andesite",	"Andesite",			{cracky = 2}},
	{"diorite",	"Diorite",			{cracky = 1}},
	{"granite",	"Granite",			{cracky = 1}},
	{"turquoise",	"Turquoise",			{cracky = 1}},
	{"jade",	"Jade",				{cracky = 1}},
 	{"marble",	"Marble",			{cracky = 1}},
 	{"basalt",	"Basalt",			{cracky = 2, level = 2}},
	{"whitestone",	"Whitestone",			{cracky = 1}},
	{"bedrock",	"Bedrock",			{cracky = 3, level = 3, immortal = 1}},
	{"bedrock2",	"Indestructable Bedrock",	{unbreakable = 1, immortal = 1, level=10}},
}
for _,stonetype in pairs(stonez) do
  local stonename = stonetype[1]
	local stonedesc = stonetype[2]
	--local sngroups = stonetype[3]
  local stonegroups = stonetype[3]
  stonegroups.stone = 1
  local cobblegroups = stonetype[3]
  stonegroups.cobblestone = 1
  minetest.register_node("rockz:"..stonename, {
    description = stonedesc,
    tiles = {"rockz_"..stonename..".png"},
    groups = stonegroups,
    drop = 'rockz:'..stonename.."_cobble",
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("rockz:"..stonename.."_cobble", {
    description = stonedesc.." Cobblestone",
    tiles = {"rockz_"..stonename..".png^rockz_cobble_template.png"},
    groups = cobblegroups,
    drop = 'rockz:'..stonename.."_cobble",
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("rockz:"..stonename.."_block",{
    description = stonedesc.." Block",
    tiles = {"rockz_"..stonename..".png^rockz_block_template.png"},
    groups = stonegroups,
    drop = 'rockz:'..stonename..'_block',
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("rockz:polished_"..stonename,{
    description = "Polished "..stonedesc,
    tiles = {"rockz_polished_"..stonename..".png"},
    groups = stonegroups,
    drop = 'rockz:polished_'..stonename,
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("rockz:polished_"..stonename.."_block",{
    description = "Polished "..stonedesc,
    tiles = {"rockz_polished_"..stonename..".png^rockz_block_template.png"},
    groups = stonegroups,
    drop = 'rockz:polished_'..stonename,
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("rockz:"..stonename.."_brick",{
    description = stonedesc.." Brick",
    tiles = {"rockz_"..stonename..".png^rockz_brick_template.png"},
    groups = stonegroups,
    drop = 'rockz:'..stonename..'_brick',
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("rockz:polished_"..stonename.."_brick",{
    description = "Smoothed "..stonedesc.." Brick",
    tiles = {"rockz_polished_"..stonename..".png^rockz_brick_template.png"},
    groups = stonegroups,
    drop = 'rockz:polished_'..stonename..'_brick',
    sounds = default.node_sound_stone_defaults(),
  })

  rockz.register_polishing_recipe({
    type = "polishing",
    output = "rockz:"..stonename.."_block",
    recipe = "rockz:"..stonename,
    polish_time = 30,
  })

  rockz.register_polishing_recipe({
    type = "polishing",
    output = "rockz:polished_"..stonename,
    recipe = "rockz:"..stonename.."_block",
    polish_time = 50,
  })

  -- cook cobble back into origional stone
  minetest.register_craft({
  	type = "cooking",
  	output = "rockz:"..stonename,
	recipe = "rockz:"..stonename.."_cobble"
  })
  -- for now, register regular crafts because the polisher isn't working right
  minetest.register_craft({
	output = "default:"..stonename.."_block",
	recipe = {
	  {"rockz:"..stonename, "default:gravel"}
	}
  })
  minetest.register_craft({
	output = "default:"..stonename.."_block",
	recipe = {
	  {"rockz:"..stonename, "default:gravel"}
	}
  })
  minetest.register_craft({
	output = "default:polished_"..stonename,
	recipe = {
	  {"rockz:"..stonename.."_block", "default:gravel"}
	}
  })
  minetest.register_craft({
	output = "rockz:"..stonename.."_brick 4",
	recipe = {
	  {"rockz:"..stonename, "rockz:"..stonename},
	  {"rockz:"..stonename, "rockz:"..stonename}
	}
  })
  minetest.register_craft({
	output = "rockz:polished"..stonename.."_brick 4",
	recipe = {
	  {"rockz:"..stonename.."_block", "rockz:"..stonename.."_block"},
	  {"rockz:"..stonename.."_block", "rockz:"..stonename.."_block"}
	}
  })
end

-- Overriding Ice and sediment nodes

minetest.override_item("default:ice", {
	description = "Ice",
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	drawtype = "glasslike",
	use_texture_alpha = true,
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("rockz:packed_ice", {
	description = "Packed Ice",
	tiles = {"rockz_packedice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 2, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

-- node table

local rockznodes = {
	"andesite",
	"diorite",
	"granite",
	"turquoise",
	"jade",
	"marble",
	"basalt",
	"whitestone",
	"bedrock",
  "andesite_cobble",
	"diorite_cobble",
	"granite_cobble",
	"turquoise_cobble",
	"jade_cobble",
	"marble_cobble",
	"basalt_cobble",
	"whitestone_cobble",
	"bedrock_cobble",
	"andesite_block",
	"diorite_block",
	"granite_block",
	"turquoise_block",
	"jade_block",
	"marble_block",
	"basalt_block",
	"whitestone_block",
	"bedrock_block",
	"polished_andesite",
	"polished_diorite",
	"polished_granite",
	"polished_turquoise",
	"polished_jade",
	"polished_marble",
	"polished_basalt",
	"polished_whitestone",
	"polished_bedrock",
  "polished_andesite_block",
	"polished_diorite_block",
	"polished_granite_block",
	"polished_turquoise_block",
	"polished_jade_block",
	"polished_marble_block",
	"polished_basalt_block",
	"polished_whitestone_block",
	"polished_bedrock_block",
	"andesite_brick",
	"diorite_brick",
	"granite_brick",
	"turqqoise_brick",
	"jade_brick",
	"marble_brick",
	"basalt_brick",
	"whitestone_brick",
	"bedrock_brick",
	"polished_andesite_brick",
	"polished_diorite_brick",
	"polished_granite_brick",
	"polished_turquoise_brick",
	"polished_jade_brick",
	"polished_marble_brick",
	"polished_basalt_brick",
	"polished_whitestone_brick",
	"polished_bedrock_brick",
	"packed_ice",
}

--[[local rockznodesmb = {
	"andesite",
	"diorite",
	"granite",
	"turquoise",
	"jade",
	"marble",
	"basalt",
	"whitestone",
	"bedrock",
	"andesite_block",
	"diorite_block",
	"granite_block",
	"turquoise_block",
	"jade_block",
	"marble_block",
	"basalt_block",
	"whitestone_block",
	"bedrock_block",
	"polished_andesite",
	"polished_diorite",
	"polished_granite",
	"polished_turquoise",
	"polished_jade",
	"polished_marble",
	"polished_basalt",
	"polished_whitestone",
	"polished_bedrock",
	"andesite_brick",
	"diorite_brick",
	"granite_brick",
	"turqqoise_brick",
	"jade_brick",
	"marble_brick",
	"basalt_brick",
	"whitestone_brick",
	"bedrock_brick",
	"polished_andesite_brick",
	"polished_diorite_brick",
	"polished_granite_brick",
	"polished_turquoise_brick",
	"polished_jade_brick",
	"polished_marble_brick",
	"polished_basalt_brick",
	"polished_whitestone_brick",
	"polished_bedrock_brick",
	"packed_ice",
}]]

rockznodesmb = rockznodes

local nodestowall = {
	""}

-- moreblocks stuff
if minetest.get_modpath("moreblocks") then
	for _, name in pairs(rockznodesmb) do
		local nodename = "rockz:"..name
		local ndef = minetest.registered_nodes[nodename]
		if ndef then
			local drop
			if type(ndef.drop) == "string" then
				drop = ndef.drop:sub(9)
			end
			stairsplus:register_all("rockz", name, nodename, {
				description = ndef.description,
				drop = drop,
				groups = ndef.groups,
				sounds = ndef.sounds,
				tiles = ndef.tiles,
				sunlight_propagates = true,
				light_source = ndef.light_source
			})
		end
	end
end
dofile(mpath.."/mapgen.lua")