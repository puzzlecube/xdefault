local mp = minetest.get_modpath("mineralz")
mineralz = {}

mineralz.brick_template = "mineralz_brick_template.png"
mineralz.block_template = "mineralz_block_template.png"
mineralz.pillar_template = {
	side = "mineralz_pillar_template_side.png",
	ends = "mineralz_pillar_template_end.png",
}

dofile(mp.."/crystals.lua")
dofile(mp.."/crafts.lua")
dofile(mp.."/minerals.lua")
dofile(mp.."/mapgen.lua")

-- stairs and moreblocks joys
dofile(mp.."/moreblocks.lua")