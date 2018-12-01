-- Malachite overtaking copper ore almost all the way
minetest.register_ore({
	ore_type = "scatter",
	ore = "mineralz:stone_with_malachite",
	wherein = {"default:stone_with_copper"},
	clust_scarcity = 1,
	clust_num_ores = 1,
	clust_size = 1,
	y_min = -512,
	y_max = 31000,
})

minetest.register_ore({
	ore_type = "blob",
	ore = "mineralz:stone_with_quartz",
	wherein = {"default:stone"},
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 32,
	clust_size = 6,
	y_min = -33000,
	y_max = 100,
	noise_params = {
            offset = 0,
            scale = 1,
            spread = {x = 64, y = 64, z = 64},
            seed = 2314,
            octaves = 3,
            persist = 0.5,
        },
})

minetest.register_ore({
	ore_type = "blob",
	ore = "mineralz:stone_with_rose_quartz",
	wherein = {"default:stone"},
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 16,
	clust_size = 6,
	y_min = -33000,
	y_max = -10,
	noise_params = {
            offset = 0,
            scale = 1,
            spread = {x = 64, y = 64, z = 64},
            seed = 2791,
            octaves = 3,
            persist = 0.5,
        },
})

minetest.register_ore({
	ore_type = "blob",
	ore = "mineralz:stone_with_jet_quartz",
	wherein = {"default:stone"},
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 16,
	clust_size = 6,
	y_min = -33000,
	y_max = -10,
	noise_params = {
            offset = 0,
            scale = 1,
            spread = {x = 64, y = 64, z = 64},
            seed = 314,
            octaves = 3,
            persist = 0.5,
        },
})

minetest.register_ore({
	ore_type = "blob",
	ore = "mineralz:stone_with_amethyst",
	wherein = {"default:stone"},
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 32,
	clust_size = 4,
	y_min = -33000,
	y_max = 40,
	noise_params = {
            offset = 0,
            scale = 1,
            spread = {x = 64, y = 64, z = 64},
            seed = 7264,
            octaves = 3,
            persist = 0.5,
        },
})

minetest.register_ore({
	ore_type = "blob",
	ore = "mineralz:lapis_lazuli_ore",
	wherein = {"default:stone"},
	clust_scarcity = 18 * 18 * 18,
	clust_num_ores = 8,
	clust_size = 4,
	y_min = -256,
	y_max = -64,
	noise_params = {
		offset = 0,
		scale = 1,
		spread = {x=128, y=128, z=128},
		seed = 102,
		octaves = 3,
		persist = 0.7,
	},
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mineralz:lapis_lazuli_ore",
	wherein = {"default:stone"},
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size=16,
	y_min = -33000,
	y_max = -256,
})

minetest.register_ore({
	ore_type        = "scatter",
	ore             = "mineralz:stone_with_emerald",
	wherein         = {"default:stone"},
	clust_scarcity  = 8 ^ 3,
	clust_size      = 2,
	y_min           = -31000,
	y_max           = -64,
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
	ore_type = "scatter",
	ore = "mineralz:salt_ore",
	wherein = {"default:sandstone"},
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 32,
	clust_size=6,
	y_min = -33000,
	y_max = 5,
	noise_threshold=0.0625,
	noise_params    = {
		offset = 0,
		scale = 2,
		spread = {x = 32, y = 32, z = 32},
		seed = -3195,
		octaves = 1,
		persist = 0.54
	},
})
