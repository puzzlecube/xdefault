minetest.register_node("xbuild:papyrus_block", {
	description = "Papyrus block",
	tiles = {"xbuild_papblock.png"},
	is_ground_content = false,
	paramtype = "glasslike_framed",
	groups = {cracky = 2},
	sounds = default.node_sound_leaves_defaults(),
})
