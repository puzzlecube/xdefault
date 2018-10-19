minetest.register_node("fluidz:swamp_water_source", {
	description = "Swamp Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "fluidz_swamp_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name = "fluidz_swamp_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "fluidz:swamp_water_flowing",
	liquid_alternative_source = "fluidz:swamp_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 72, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("fluidz:swamp_water_flowing", {
	description = "Flowing Swamp Water",
	drawtype = "flowingliquid",
	tiles = {"fluidz_swamp_water.png"},
	special_tiles = {
		{
			name = "fluidz_swamp_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "fluidz_swamp_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "fluidz:swamp_water_flowing",
	liquid_alternative_source = "fluidz:swamp_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 72, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
})

minetest.register_node("fluidz:acid_source", {
	description = "Acid Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "fluidz_acid_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name = "fluidz_acid_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "fluidz:acid_flowing",
	liquid_alternative_source = "fluidz:acid_source",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 16,
	post_effect_color = {a = 103, r = 30, g = 250, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
	on_step = function(pos)
		local near = {
			{pos.x-1, pos.y-1, pos.z-1},
			{pos.x, pos.y-1, pos.z-1},
			{pos.x+1, pos.y-1, pos.z-1},
			{pos.x-1, pos.y-1, pos.z},
			{pos.x, pos.y-1, pos.z},
			{pos.x+1, pos.y-1, pos.z},
			{pos.x-1, pos.y-1, pos.z+1},
			{pos.x, pos.y-1, pos.z+1},
			{pos.x+1, pos.y-1, pos.z+1}
		}
		for _,npos in pairs(near) do
			--local udata = minetest.registered_nodes[minetest.get_node(npos).name]
			--if udata ~= "air" then
			--	for __,group in pairs(udata) do
			--		if group == "sand" and "sand" == 1 then
						minetest.set_node(npos, {name = "air"})
			--		end
			--	end
			--end
		end
	end,
	on_activate = function(pos)
		local near = {
			{pos.x-1, pos.y-1, pos.z-1},
			{pos.x, pos.y-1, pos.z-1},
			{pos.x+1, pos.y-1, pos.z-1},
			{pos.x-1, pos.y-1, pos.z},
			{pos.x, pos.y-1, pos.z},
			{pos.x+1, pos.y-1, pos.z},
			{pos.x-1, pos.y-1, pos.z+1},
			{pos.x, pos.y-1, pos.z+1},
			{pos.x+1, pos.y-1, pos.z+1}
		}
		for _,npos in pairs(near) do
			--local udata = minetest.registered_nodes[minetest.get_node(npos).name]
			--if udata ~= "air" then
			--	for __,group in pairs(udata) do
			--		if group == "sand" and "sand" == 1 then
						minetest.set_node(npos, {name = "air"})
			--		end
			--	end
			--end
		end
	end,
	on_load = function(pos)
		local near = {
			{pos.x-1, pos.y-1, pos.z-1},
			{pos.x, pos.y-1, pos.z-1},
			{pos.x+1, pos.y-1, pos.z-1},
			{pos.x-1, pos.y-1, pos.z},
			{pos.x, pos.y-1, pos.z},
			{pos.x+1, pos.y-1, pos.z},
			{pos.x-1, pos.y-1, pos.z+1},
			{pos.x, pos.y-1, pos.z+1},
			{pos.x+1, pos.y-1, pos.z+1}
		}
		for _,npos in pairs(near) do
			--local udata = minetest.registered_nodes[minetest.get_node(npos).name]
			--if udata ~= "air" then
			--	for __,group in pairs(udata) do
			--		if group == "sand" and "sand" == 1 then
						minetest.set_node(npos, {name = "air"})
			--		end
			--	end
			--end
		end
	end,
})

minetest.register_node("fluidz:acid_flowing", {
	description = "Flowing Acid",
	drawtype = "flowingliquid",
	tiles = {"fluidz_acid.png"},
	special_tiles = {
		{
			name = "fluidz_acid_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "fluidz_acid_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "fluidz:acid_flowing",
	liquid_alternative_source = "fluidz:acid_source",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 16,
	post_effect_color = {a = 103, r = 30, g = 250, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
	on_step = function(pos)
		local near = {
			{pos.x-1, pos.y-1, pos.z-1},
			{pos.x, pos.y-1, pos.z-1},
			{pos.x+1, pos.y-1, pos.z-1},
			{pos.x-1, pos.y-1, pos.z},
			{pos.x, pos.y-1, pos.z},
			{pos.x+1, pos.y-1, pos.z},
			{pos.x-1, pos.y-1, pos.z+1},
			{pos.x, pos.y-1, pos.z+1},
			{pos.x+1, pos.y-1, pos.z+1}
		}
		for _,npos in pairs(near) do
			--local udata = minetest.registered_nodes[minetest.get_node(npos).name]
			--if udata ~= "air" then
			--	for __,group in pairs(udata) do
			--		if group == "sand" and "sand" == 1 then
						minetest.set_node(npos, {name = "air"})
			--		end
			--	end
			--end
		end
	end,
	on_activate = function(pos)
		local near = {
			{pos.x-1, pos.y-1, pos.z-1},
			{pos.x, pos.y-1, pos.z-1},
			{pos.x+1, pos.y-1, pos.z-1},
			{pos.x-1, pos.y-1, pos.z},
			{pos.x, pos.y-1, pos.z},
			{pos.x+1, pos.y-1, pos.z},
			{pos.x-1, pos.y-1, pos.z+1},
			{pos.x, pos.y-1, pos.z+1},
			{pos.x+1, pos.y-1, pos.z+1}
		}
		for _,npos in pairs(near) do
			--local udata = minetest.registered_nodes[minetest.get_node(npos).name]
			--if udata ~= "air" then
			--	for __,group in pairs(udata) do
			--		if group == "sand" and "sand" == 1 then
						minetest.set_node(npos, {name = "air"})
			--		end
			--	end
			--end
		end
	end,
	on_load = function(pos)
		local near = {
			{pos.x-1, pos.y-1, pos.z-1},
			{pos.x, pos.y-1, pos.z-1},
			{pos.x+1, pos.y-1, pos.z-1},
			{pos.x-1, pos.y-1, pos.z},
			{pos.x, pos.y-1, pos.z},
			{pos.x+1, pos.y-1, pos.z},
			{pos.x-1, pos.y-1, pos.z+1},
			{pos.x, pos.y-1, pos.z+1},
			{pos.x+1, pos.y-1, pos.z+1}
		}
		for _,npos in pairs(near) do
			--local udata = minetest.registered_nodes[minetest.get_node(npos).name]
			--if udata ~= "air" then
			--	for __,group in pairs(udata) do
			--		if group == "sand" and "sand" == 1 then
						minetest.set_node(npos, {name = "air"})
			--		end
			--	end
			--end
		end
	end,
})

bucket.register_liquid(
	"fluidz:swamp_water_source",
	"fluidz:swamp_water_flowing",
	"fluidz:bucket_swamp_water",
	"bucket_swamp_water.png",
	"Swamp Water Bucket",
	{water_bucket = 1}
)

bucket.register_liquid(
	"fluidz:acid_source",
	"fluidz:acid_flowing",
	"fluidz:bucket_acid",
	"bucket_acid.png",
	"Acid Bucket",
	{acid_bucket = 1}
)