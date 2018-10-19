local mp = minetest.get_modpath("mineralz")
mineralz = {}

mineralz.brick_template = "mineralz_brick_template.png"
mineralz.block_template = "mineralz_block_template.png"
mineralz.pillar_template = {
	side = "mineralz_pillar_side_template.png",
	ends = "mineralz_pillar_ends_template.png",
}

dofile(mp.."/crystals.lua")