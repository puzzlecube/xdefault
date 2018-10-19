fullwoods = {
	"default:acacia",
	"default:aspen",
	"default:pine",
	"default:jungle",
	"default:wood",
}
woods={}
for index,wood in pairs(fullwoods) do
	local seperatorpos = wood:find(":")
	local woodname = wood:sub(seperatorpos+1, wood:len())
	table.insert(woods,woodname)
end

for _,wood in pairs(woods) do
	if wood ~= "wood" then
		doors.register("door_"..wood, {
			tiles = {{ name = "doorz_door_"..wood..".png", backface_culling = true }},
			description = wood.." Wood Door",
			inventory_image = "doorz_item_"..wood..".png",
			groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
			recipe = {
				{"default:"..wood, "default:"..wood},
				{"default:"..wood, "default:"..wood},
				{"default:"..wood, "default:"..wood},
			}
		})
	end
end