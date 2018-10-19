-- Malachite overtaking copper ore almost all the way
minetest.register_ore({
	ore_type = "scatter",
	ore = "mineralz:stone_with_malachite",
	wherein = "default:stone_with_copper",
	clust_scarcity = 1,
	clust_num_ores = 1,
	clust_size = 1,
	y_min = -256,
	y_max = 33000,
})

minetest.register_ore({
	ore_type = "blob",
	ore = "mineralz:stone_with_quartz",
	wherein = "default:stone",
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
	wherein = "default:stone",
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
	wherein = "default:stone",
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
	wherein = "default:stone",
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