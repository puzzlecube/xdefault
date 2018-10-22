-- Quartz

minetest.register_node("mineralz:pure_quartz", {
	description = "Pure Quartz",
	tiles = {"mineralz_pure_quartz.png"},
	drawtype = "glasslike_framed_optional",
	paramtype = "light",
	use_texture_alpha = true,
	is_ground_content = true,
	sunlight_propagates = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_glass_defaults,
})

minetest.register_node("mineralz:quartz", {
	description = "Quartz",
	tiles = {"mineralz_quartz.png"},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:quartz_block", {
	description = "Quartz Block",
	tiles = {"mineralz_quartz.png^"..mineralz.block_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:quartz_pillar", {
	description = "Quartz Pillar",
	tiles = {"mineralz_quartz.png^"..mineralz.pillar_template.ends, "mineralz_quartz.png^"..mineralz.pillar_template.ends, "mineralz_quartz.png^"..mineralz.pillar_template.side},
	paramtype="light",
	paramtype2="facedir",
	on_place = minetest.rotate_node,
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:quartz_brick", {
	description = "Quartz Brick",
	tiles = {"mineralz_quartz.png^"..mineralz.brick_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_quartz", {
	description = "Quartz Ore",
	tiles = {"default_stone.png^mineralz_quartz_ore.png"},
	is_ground_content = true,
	groups = {cracky=2,level=2},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 3,
		items = {
			items = {"mineralz:quartz_crystal"},
			rarity = 1,
		},
	},
})

minetest.register_craftitem("mineralz:quartz_crystal", {
	description = "Quartz Crystal",
	inventory_image = "mineralz_quartz_crystal.png",
	groups = {crystal=1},
})

minetest.register_craftitem("mineralz:quartz_shard", {
	description = "Quartz Crystal Shard",
	inventory_image = "mineralz_quartz_shard.png",
	groups = {crystal_shard=1},
})

-- Rose quartz

minetest.register_node("mineralz:rose_quartz", {
	description = "Rose Quartz",
	tiles = {"mineralz_rose_quartz.png"},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:rose_quartz_pillar", {
	description = "Rose Quartz Pillar",
	tiles = {"mineralz_rose_quartz.png^"..mineralz.pillar_template.ends, "mineralz_rose_quartz.png^"..mineralz.pillar_template.ends, "mineralz_rose_quartz.png^"..mineralz.pillar_template.side},
	paramtype="light",
	paramtype2="facedir",
	on_place = minetest.rotate_node,
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:rose_quartz_block", {
	description = "Rose Quartz Block",
	tiles = {"mineralz_rose_quartz.png^"..mineralz.block_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:rose_quartz_brick", {
	description = "Quartz Brick",
	tiles = {"mineralz_rose_quartz.png^"..mineralz.brick_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_rose_quartz", {
	description = "Rose Quartz Ore",
	tiles = {"default_stone.png^mineralz_rose_quartz_ore.png"},
	is_ground_content = true,
	groups = {cracky=2,level=2},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 3,
		items = {
			items = {"mineralz:rose_quartz_crystal"},
			rarity = 1,
		},
	},
})

minetest.register_craftitem("mineralz:rose_quartz_crystal", {
	description = "Rose Quartz Crystal",
	inventory_image = "mineralz_rose_quartz_crystal.png",
	groups = {crystal=1},
})

minetest.register_craftitem("mineralz:rose_quartz_shard", {
	description = "Rose Quartz Crystal Shard",
	inventory_image = "mineralz_rose_quartz_shard.png",
	groups = {crystal_shard=1},
})

-- Jet Quartz

minetest.register_node("mineralz:jet_quartz", {
	description = "Jet Quartz",
	tiles = {"mineralz_jet_quartz.png"},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:jet_quartz_pillar", {
	description = "Jet Quartz Pillar",
	tiles = {"mineralz_jet_quartz.png^"..mineralz.pillar_template.ends, "mineralz_jet_quartz.png^"..mineralz.pillar_template.ends, "mineralz_jet_quartz.png^"..mineralz.pillar_template.side},
	paramtype="light",
	paramtype2="facedir",
	on_place = minetest.rotate_node,
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:jet_quartz_block", {
	description = "Jet Quartz Block",
	tiles = {"mineralz_jet_quartz.png^"..mineralz.block_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:jet_quartz_brick", {
	description = "Jet Quartz Brick",
	tiles = {"mineralz_jet_quartz.png^"..mineralz.brick_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_jet_quartz", {
	description = "Jet Quartz Ore",
	tiles = {"default_stone.png^mineralz_jet_quartz_ore.png"},
	is_ground_content = true,
	groups = {cracky=2,level=2},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 3,
		items = {
			items = {"mineralz:jet_quartz_crystal"},
			rarity = 1,
		},
	},
})

minetest.register_craftitem("mineralz:jet_quartz_crystal", {
	description = "Jet Quartz Crystal",
	inventory_image = "mineralz_jet_quartz_crystal.png",
	groups = {crystal=1},
})

minetest.register_craftitem("mineralz:jet_quartz_shard", {
	description = "Jet Quartz Crystal Shard",
	inventory_image = "mineralz_jet_quartz_shard.png",
	groups = {crystal_shard=1},
})

-- Amethyst

minetest.register_node("mineralz:amethyst", {
	description = "Amethyst",
	tiles = {"mineralz_amethyst.png"},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:amethyst_pillar", {
	description = "Amethyst Pillar",
	tiles = {"mineralz_amethyst.png^"..mineralz.pillar_template.ends, "mineralz_amethyst.png^"..mineralz.pillar_template.ends, "mineralz_amethyst.png^"..mineralz.pillar_template.side},
	paramtype="light",
	paramtype2="facedir",
	on_place = minetest.rotate_node,
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:amethyst_block", {
	description = "Amethyst Block",
	tiles = {"mineralz_amethyst.png^"..mineralz.block_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:amethyst_brick", {
	description = "Amethyst Brick",
	tiles = {"mineralz_amethyst.png^"..mineralz.brick_template},
	is_ground_content = true,
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults,
})

minetest.register_node("mineralz:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^mineralz_amethyst_ore.png"},
	is_ground_content = true,
	groups = {cracky=2,level=2},
	sounds = default.node_sound_stone_defaults,
	drop = {
		max_items = 3,
		items = {
			items = {"mineralz:amethyst_crystal"},
			rarity = 1,
		},
	},
})

minetest.register_craftitem("mineralz:amethyst_crystal", {
	description = "Amethyst Crystal",
	inventory_image = "mineralz_amethyst_crystal.png",
	groups = {crystal=1},
})

minetest.register_craftitem("mineralz:amethyst_shard", {
	description = "Amethyst Crystal Shard",
	inventory_image = "mineralz_amethyst_shard.png",
	groups = {crystal_shard=1},
})