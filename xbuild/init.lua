minetest.register_node("xbuild:papyrus_block", {
	description = "Papyrus block",
	tiles = {"xbuild_papblock.png"},
	is_ground_content = false,
	use_texture_alpha = true,
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = {choppy=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "xbuild:papyrus_block 3",
	recipe = {
		"default:papyrus", "default:papyrus", "default:papyrus",
		"default:papyrus", "default:papyrus", "default:papyrus",
		"default:papyrus", "default:papyrus", "default:papyrus",
	},
})