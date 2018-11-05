minetest.register_node("puzzleblocks:papyrus_block", {
	description = "Papyrus block",
	tiles = {"puzzleblocks_papyrus_block.png"},
	is_ground_content = false,
	use_texture_alpha = true,
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = {choppy=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_alias("xbuild:papyrus_block", "puzzleblocks:papyrus_block")

minetest.register_craft({
	type = "shapeless",
	output = "xbuild:papyrus_block 3",
	recipe = {
		"default:papyrus", "default:papyrus", "default:papyrus",
		"default:papyrus", "default:papyrus", "default:papyrus",
		"default:papyrus", "default:papyrus", "default:papyrus",
	},
})

puzzleblock_flat = {
	{-0.5, -0.5, -0.5, -0.1875, -0.499938, 0.5}, -- Short1
	{0.1875, -0.5, -0.5, 0.5, -0.499938, 0.5}, -- Short2
	{-0.125, -0.5, -0.1875, 0.125, -0.499938, 0.1875}, -- Center
	{-0.75, -0.5, -0.1875, -0.5625, -0.499938, 0.1875}, -- Long1
	{0.5625, -0.5, -0.1875, 0.75, -0.499938, 0.1875}, -- Long2
	{-0.1875, -0.5, -0.25, -0.125, -0.499938, 0.25}, -- fit1
	{0.125, -0.5, -0.25, 0.1875, -0.499938, 0.25}, -- fit2
	{-0.8125, -0.5, -0.125, -0.5, -0.499938, 0.125}, -- fit3_O
	{0.5, -0.5, -0.125, 0.8125, -0.499938, 0.125}, -- fit4_O
	{-0.1875, -0.5, -0.5, -0.125, -0.499938, -0.4375}, -- fit5
	{0.125, -0.5, -0.5, 0.1875, -0.499938, -0.4375}, -- fit6
	{-0.1875, -0.5, 0.4375, -0.125, -0.499938, 0.5}, -- fit7
	{0.125, -0.5, 0.4375, 0.1875, -0.499938, 0.5}, -- fit8
}

minetest.register_node("puzzleblocks:paper_block", {
	description "Block of Paper",
	tiles = {"puzzleblocks_paper_block.png"},
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, paper=1},
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_craft({
	type = "shapeless",
	output = "xbuild:paper_block 1",
	recipe = {
		"default:paper", "default:paper", "default:paper",
		"default:paper", "default:paper", "default:paper",
		"default:paper", "default:paper", "default:paper",
	},
})

minetest.register_node("puzzleblocks:puzzleblock_flat", {
	description = "Puzzle block (flat)",
	tiles = {"puzzleblocks_paper_block.png"},
	drawtype = "nodebox",
	paramtype = "light",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = puzzleblock_flat
	}
})

minetest.register_craft({
	output = "xbuild:puzzleblock_flat 1",
	recipe = {
		"default:paper", "default:paper", "default:paper",
		"", "default:paper", "",
		"default:paper", "default:paper", "default:paper",
	},
})