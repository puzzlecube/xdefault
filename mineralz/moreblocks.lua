local mineralstomb = {
	"quartz",
	"quartz_block",
	"quartz_brick",
	"rose_quartz",
	"rose_quartz_block",
	"rose_quartz_brick",
	"jet_quartz",
	"jet_quartz_block",
	"jet_quartz_brick",
	"malachite_block",
	"lapis_lazuli_block",
	"emerald_block",
}

if minetest.get_modpath("moreblocks") then
	for _, name in pairs(mineralstomb) do
		local nodename = "mineralz:"..name
		local ndef = minetest.registered_nodes[nodename]
		if ndef then
			local drop
			if type(ndef.drop) == "string" then
				drop = ndef.drop:sub(9)
			end
			stairsplus:register_all("mineralz", name, nodename, {
				description = ndef.description,
				drop = drop,
				groups = ndef.groups,
				sounds = ndef.sounds,
				tiles = ndef.tiles,
				sunlight_propagates = true,
				light_source = ndef.light_source
			})
		end
	end
end

-- for those without moreblocks
-- stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds)
if minetest.get_modpath("stairs") then
	for _, name in pairs(mineralstomb) do
		local nodename = "mineralz:"..name
		local ndef = minetest.registered_nodes[nodename]
		if ndef then
			local drop
			if type(ndef.drop) == "string" then
				drop = ndef.drop:sub(9)
			end
			stairs.register_stair_and_slab(name, nodename, ndef.groups, ndef.tiles, ndef.description.." Stair", ndef.description.." Slab", ndef.sounds)
		end
	end
end