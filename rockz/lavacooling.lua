local function search_nearby(pos,nodes)
	local found = {}
	for x = -1,1 do
		for y = -1,1 do
			for z = -1,1 do
				local offset = {x=pos.x+x,y=pos.y+y,z=pos.z+z}
				local what_is_here = minetest.get_node(offset)
				for _,node in pairs(nodes) do
					if what_is_here.name == node then
						table.insert(found, #found+1, {name=what_is_here.name, param1=what_is_here.param1, param2=what_is_here.param2, pos=offset})
					end
				end
			end
		end
	end
	if found[1] == nil then
		return nil
	else
		return found
	end
end


if true then -- minetest.settings:get_bool("enable_lavacooling") ~= false then
	if minetest.get_modpath("gloopblocks") == true then
		default.cool_lava = function(pos, node)
			local neighbors={
				source=search_nearby(pos, {"default:water_source","default:river_water_source"}),
				flowing=search_nearby(pos,{"default:water_flowing","default:river_water_flowing"}),
				ice=search_nearby(pos,{"default:ice"}),
			}
			if node.name == "default:lava_source" then
				if neighbors.source ~= nil or neighbors.flowing ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="default:obsidian"})
				elseif neighbors.ice ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="default:obsidian"})
					for _,node in pairs(neighbors.ice) do
						minetest.set_node(node.pos, {name="rockz:pumice"}) -- use rockz pumice because it is more poppy looking
					end
				end
			else -- Lava flowing
				if neighbors.source ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="gloopblocks:basalt"}) -- use gloopblocks basalt because it looks a little less like it has been there for milenia than rockz basalt does
					for _,node in pairs(neighbors.source) do
						if math.random(1,2) == 1 then
							if math.random(1,10) == 1 then
								minetest.set_node(node.pos, {name="rockz:basalt"})
							else
								minetest.set_node(node.pos, {name="default:stone"})
							end
						end
					end
				elseif neighbors.flowing ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="gloopblocks:pumice"}) -- use gloopblocks pumice because it looks less like it all just happened super high pressured and quick
				elseif neighbors.ice ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="rockz:pumice"})
					for _,node in pairs(neighbors.ice) do
						if math.random(1,3) == 1 then
							minetest.set_node(node.pos, {name="rockz:pumice"})
						end
					end
				end
			end
		end
	else
		default.cool_lava = function(pos, node)
			local neighbors={
				source=search_nearby(pos, {"default:water_source","default:river_water_source"}),
				flowing=search_nearby(pos,{"default:water_flowing","default:river_water_flowing"}),
				ice=search_nearby(pos,{"default:ice"}),
			}
			if node.name == "default:lava_source" then
				if neighbors.source ~= nil or neighbors.flowing ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="default:obsidian"})
				elseif neighbors.ice ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="default:obsidian"})
					for _,node in pairs(neighbors.ice) do
						minetest.set_node(node.pos, {name="rockz:pumice"}) -- use rockz pumice because it is more poppy looking
					end
				end
			else -- Lava flowing
				if neighbors.source ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="rockz:basalt"}) -- use gloopblocks basalt because it looks a little less like it has been there for milenia than rockz basalt does
					for _,node in pairs(neighbors.source) do
						if math.random(1,2) == 1 then
							if math.random(1,10) == 1 then
								minetest.set_node(node.pos, {name="rockz:basalt"})
							else
								minetest.set_node(node.pos, {name="default:stone"})
							end
						end
					end
				elseif neighbors.flowing ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="gloopblocks:pumice"}) -- personally I see no reason to have _cooled nodes
				elseif neighbors.ice ~= nil then
					minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
					minetest.set_node(pos, {name="rockz:pumice"})
					for _,node in pairs(neighbors.ice) do
						if math.random(1,3) == 1 then
							minetest.set_node(node.pos, {name="rockz:pumice"})
						end
					end
				end
			end
		end
	end
end

