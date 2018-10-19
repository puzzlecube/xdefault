minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:andesite",
	wherein         = {"default:stone"},
	clust_scarcity  = 32 ^ 3,
	clust_size      = 16,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = 0.2,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = 3216,
		octaves = 1,
		persist = 0.64
	},
})

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:diorite",
	wherein         = {"default:stone"},
	clust_scarcity  = 32 ^ 3,
	clust_size      = 16,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = 2.1,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = -4506,
		octaves = 1,
		persist = 0.64
	},
})

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:granite",
	wherein         = {"default:stone"},
	clust_scarcity  = 32 ^ 3,
	clust_size      = 16,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -0.6,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = -1846,
		octaves = 1,
		persist = 0.64
	},
})

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:turquoise",
	wherein         = {"default:stone"},
	clust_scarcity  = 36 ^ 3,
	clust_size      = 16,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -0.6,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = -3446,
		octaves = 1,
		persist = 0.64
	},
})

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:jade",
	wherein         = {"default:stone"},
	clust_scarcity  = 36 ^ 3,
	clust_size      = 16,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -0.6,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = 6876,
		octaves = 1,
		persist = 0.64
	},
})

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:marble",
	wherein         = {"default:stone"},
	clust_scarcity  = 32 ^ 3,
	clust_size      = 16,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -0.6,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = 3942,
		octaves = 1,
		persist = 0.64
	},
})

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:basalt",
	wherein         = {"default:stone"},
	clust_scarcity  = 16 ^ 3,
	clust_size      = 26,
	y_min           = -31000,
	y_max           = 1503,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -3.6,
		scale = 4,
		spread = {x = 32, y = 32, z = 32},
		seed = 8911,
		octaves = 1,
		persist = 0.4
	},
})
--[[
minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:basalt",
	wherein         = {"default:stone"},
	clust_scarcity  = 6 ^ 2,
	clust_size      = 56,
	y_min           = -31000,
	y_max           = 1803,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -3.6,
		scale = 4,
		spread = {x = 32, y = 32, z = 32},
		seed = -8311,
		octaves = 1,
		persist = 0.4
	},
})
]]

if minetest.register_cave_biome == nil then
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "rockz:bedrock",
		wherein         = {"default:stone"},
		clust_scarcity  = 8 ^ 3,
		clust_size      = 48,
		y_min           = -15942,
		y_max           = -1084,
		noise_threshold = 0.1,
		noise_params    = {
			offset = -0.6,
			scale = 4,
			spread = {x = 32, y = 32, z = 32},
			seed = 1331,
			octaves = 1,
			persist = 0.5
		},
	})
else
	minetest.register_cave_biome({
		name = 'bedrock',
		biome_val = -66,
		ceiling_node = 'rockz:bedrock',
		floor_node = 'rockz:bedrock',
		stalactite = 'squaresville_c:stalactite',
		stalactite_chance = 12,
		stalagmite = 'squaresville_c:stalagmite',
		stalagmite_chance = 12,
		surface_depth = 48,
		underwater = true,
	})
end

minetest.register_ore({
	ore_type        = "blob",
	ore             = "rockz:whitestone",
	wherein         = {"default:stone"},
	clust_scarcity  = 32 ^ 3,
	clust_size      = 32,
	y_min           = 113,
	y_max           = 31000,
	noise_threshold = 0.1,
	noise_params    = {
		offset = 0.6,
		scale = 2,
		spread = {x = 16, y = 16, z = 16},
		seed = -3312,
		octaves = 1,
		persist = 0.14
	},
})

minetest.register_ore({
	ore_type        = "scatter",
	ore             = "rockz:stone_with_emerald",
	wherein         = {"default:stone"},
	clust_scarcity  = 8 ^ 3,
	clust_size      = 2,
	y_min           = -31000,
	y_max           = -512,
	noise_threshold = 0.1,
	noise_params    = {
		offset = -0.6,
		scale = 4,
		spread = {x = 16, y = 16, z = 16},
		seed = -1846,
		octaves = 1,
		persist = 0.64
	},
})

-- Mapgen

minetest.register_biome({
	name = "glacier",
	node_dust = "default:snowblock",
	node_top = "default:ice",
	depth_top = 2,
	node_filler = "rockz:packed_ice",
	depth_filler = 3,
	node_stone = "default:stone",
	node_water_top = "default:ice",
	depth_water_top = 10,
	node_water = "default:ice",
	node_river_water = "default:ice",
	node_riverbed = "rockz:packed_ice",
	depth_riverbed = 2,
	y_min = -8,
	y_max = 31000,
	heat_point = 0,
	humidity_point = 50,
})

minetest.register_biome({
	name = "glacier_ocean",
	node_dust = "default:snowblock",
	node_top = "rockz:packed_ice",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	--node_stone = "",
	node_water_top = "default:ice",
	depth_water_top = 2,
	--node_water = "",
	--node_river_water = "",
	y_min = -112,
	y_max = -9,
	heat_point = 0,
	humidity_point = 50,
})
--[[
minetest.override_biome({
	name = "underground",
})

minetest.register_biome({
	name = "underground",  -- the normal underground, tweaked so basalt can be cool
	--node_dust = "",
	--node_top = "",
	--depth_top = ,
	--node_filler = "",
	--depth_filler = ,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -31000,
	y_max = -113,
	heat_point = 40,
	humidity_point = 50,
})]]
--[[
minetest.register_biome({
	name = "volcanic_underground",
	--node_dust = "",
	--node_top = "",
	--depth_top = ,
	--node_filler = "",
	--depth_filler = ,
	node_stone = "rockz:basalt",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -31000,
	y_max = -112,
	heat_point = 120,
	humidity_point = 0,
})]]