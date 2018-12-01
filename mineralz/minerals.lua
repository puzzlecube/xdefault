-- Yeah it is redundantly named, so what.

minetest.register_craftitem("mineralz:emerald", {
	description = "Emerald",
	inventory_image = "mineralz_emerald.png",
})

minetest.register_node("mineralz:emerald_block", {
	description = "Block Of Emerald",
	tiles = {"mineralz_emerald_block.png"},
	is_ground_content = true,
	groups = {cracky=3,level=3},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^mineralz_emerald_ore.png"},
	is_ground_content = true,
	groups = {cracky=2,level=3},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 1,
		items = {
			items = {"mineralz:emerald"},
			rarity = 1,
		},
	},
})

minetest.register_craftitem("mineralz:lapis_lazuli", {
	description = "Lapis Lazuli",
	inventory_image = "mineralz_lapis_lazuli.png",
})

minetest.register_node("mineralz:lapis_lazuli_block", {
	description = "Block Of Lapis Lazuli",
	tiles = {"mineralz_lapis_lazuli_block.png"},
	is_ground_content = true,
	groups = {cracky=3,level=3},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_lapis_lazuli", {
	description = "Lapis Lazuli Ore",
	tiles = {"default_stone.png^mineralz_lapis_lazuli_ore.png"},
	is_ground_content = true,
	groups = {cracky=2,level=3},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 3,
		items = {
			items = {"mineralz:lapis_lazuli"},
			rarity = 1,
		},
	},
})

minetest.register_craftitem("mineralz:malachite", {
	description = "Malachite",
	inventory_image = "mineralz_malachite.png",
})

minetest.register_node("mineralz:malachite_block", {
	description = "Block Of Malachite",
	tiles = {"mineralz_malachite_block.png"},
	is_ground_content = true,
	groups = {cracky=2,level=1},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_malachite", {
	description = "Malachite Ore",
	tiles = {"default_stone.png^mineralz_malachite_ore.png"},
	is_ground_content = true,
	groups = {cracky=1,level=1},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 2,
		items = {
			items = {"mineralz:malachite"},
			rarity = 1,
		},
	},
})

minetest.register_item("mineralz:salt", {
	description = "Salt",
	inventory_image = "mineralz_salt.png",
})


minetest.register_node("mineralz:salt_block", {
	description = "Salt block",
	tiles = {"mineralz_salt_block.png"},
	is_ground_content = true,
	drawtype = "glasslike",
	paramtype = "light",
	groups = {cracky=2, level=1},
	sounds = default.node_sound_glass_defaults,
})

minetest.register_node("mineralz:sandstone_with_salt", {
	description "Sandstone with Salt",
	tiles = {"default_sandstone.png^mineralz_salt_ore.png"}.
	is_ground_content = true,
	groups = {cracky=1,level=1},
	sounds = default.node_sound_stone_defaults,
	drops = {
		max_items=2,
		items = {
			items = {"mineralz:salt"},
			rarity = 1,
		},
	},
})
