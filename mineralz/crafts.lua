local nine_craftings = {
	"quartz",
	"rose_quartz",
	"jet_quartz",
	"amethyst",
	"emerald",
}

for _,mineral in pairs(nine_craftings) do
	local mineral_fullname = "mineralz:"..mineral
	local shard = mineral_fullname.."_shard"
	local crystal = mineral_fullname.."_crystal"
	minetest.register_craft({
		type = "shapeless",
		output = crystal,
		recipe = {
			shard, shard, shard,
			shard, shard, shard,
			shard, shard, shard,
		},
	})
	minetest.register_craft({
		type = "shapeless",
		output = crystal.." 9",
		recipe = {mineral_fullname},
	})
	minetest.register_craft({
		type = "shapeless",
		output = mineral_fullname,
		recipe = {
			crystal, crystal, crystal,
			crystal, crystal, crystal,
			crystal, crystal, crystal,
		},
	})
	minetest.register_craft({
		type = "shapeless",
		output = shard.." 9",
		recipe = {crystal},
	})
end

local four_craftings = {
	"lapis_lazuli",
	"malachite",
}

for _,mineral in pairs(crystal_craftings) do
	local mineral_fullname = "mineralz:"..mineral
	local block = mineral_fullname.."_block"
	minetest.register_craft({
		type = "shapeless",
		output = block,
		recipe = {
			mineral_fullname, mineral_fullname,
			mineral_fullname, mineral_fullname,
		},
	})
	minetest.register_craft({
		type = "shapeless",
		output = mineral_fullname,
		recipe = {block},
	})
end

minetest.register_craft({
	type = "cooking",
	output = "mineralz:pure_quartz",
	recipe = "mineralz_quartz",
	cooktime = 7,
})

minetest.register_craft({
	type = "cooking",
	output = "default:copper_lump",
	recipe = "mineralz:malachite",
	cooktime = 2,
})