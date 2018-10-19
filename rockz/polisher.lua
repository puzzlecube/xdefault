
--
-- Formspecs
--

rockz.polisher_recipes={}

--[[ Example polishing_recipe
rockz.register_polishing_recipe({
  output = "rockz:polished_turquoise",
  recipe = "rockz:turquoise_block",
  polish_time = 30,
})

-- Example sediment definition
rockz.register_sediment_recipe({
  recipe = "groups:sediment",
  dust_time = 100
})

-- Example get polishing recipe
rockz.get_craft_result({
  type="polishing"
  items="rockz:turquoise_block"
})
returns
  output={items = "rockz:turqouise_block", time = 30}
  decinput={type="polishing",items="rockz:turquoise"}
]]

function rockz.register_sediment_recipe(def)
  def.type = "sediment"
  if type(def) ~= "table" then
    return nil
  --elseif def.name == nil then
    --return nil
  elseif def.recipe == nil then
    print("nil recipe")
    return nil
  elseif def.dust_time == nil then
    print("nil dust time")
    def.dust_time = 30
  end
  print("registered new sediment")
  print("recipe = "..def.recipe)
  print("dust_time = "..def.dust_time)
  -- now that all that is checked and fixed lets actually do something with this
  table.insert(rockz.polisher_recipes,#rockz.polisher_recipes+1,def)
end

function rockz.register_polishing_recipe(def)
  def.type="polishing"
  if type(def) ~= "table" then
    return nil
  --elseif def.name == nil then
    --return nil
  elseif def.output == nil then
    print("nil output")
    return nil
  elseif def.recipe == nil then
    print("nil recipe")
    return nil
  elseif def.polish_time == nil then
    print("nil polish time")
    def.polish_time = 30
  end
  print("registered new polishing recipe")
  print("output = "..def.output)
  print("recipe = "..def.recipe)
  print("polish_time = "..def.polish_time)
  -- now that all that is checked and fixed lets actually do something with this
  table.insert(rockz.polisher_recipes,#rockz.polisher_recipes+1,def)
end

function rockz.get_craft_result(def)
  local o = {             -- output table
    time = 0,             -- output time
    items = {}            -- output items
  }
  local d = {             -- decremented input table
    type = "",            -- decremented input recipe type
    items = {}            -- decremented input items
  }
  for _,arecipe in pairs(rockz.polisher_recipes) do
    print(rockz.polisher_recipes[_].recipe)
    print(def.items)
          --print(def.time)
          print(arecipe.recipe)
          --print(def.type)
    if arecipe.type == def.type then            -- is this recipe the right type
      print("yummy")
      d.type = arecipe.type                     -- if so, then set it as decremented input type
      if arecipe.type == "polishing" then       -- is this a polishing recipe?
        --for item,iname in pairs(def.items) do
          print(arecipe.output)
          print(def.items:get_name())
          if string.match(arecipe.recipe,"group:") then
            print("it be group")
            local grouptbl = string.split(arecipe.recipe,":")
            local groupstr = grouptbl[2]
            print(groupstr)
            if minetest.get_node_group(def.items:get_name(), groupstr) > 0 then
              print("fem")
              o.items = arecipe.recipe              -- set output items
              print(o.items[1])
              o.time = recipe.dust_time             -- set output time
              print(o.time)
              d.items = arecipe.recipe              -- set decremented input items
              print(d.items[1])
              d.type = arecipe.type
              print("o.items ="..o.items)
              print("o.time ="..o.time)
              print("d.items ="..d.items)
              print("d.type ="..d.type)
            else
              print("goy")
              o = {
                items = "",
                time = 0
              }
              d = {
                items = "",
              }
              d.type = arecipe.type
              print("o.items ="..o.items)
              print("o.time ="..o.time)
              print("d.items ="..d.items)
              print("d.type ="..d.type)
            end
          elseif arecipe.recipe == def.items:get_name() then     -- if so, then check that the recipe output is the same as defined items
            print("oh chickie just died")
            o.items = arecipe.output              -- if so, then set output items
            print(o.items[1])
            o.time = arecipe.polish_time           -- set output time
            print(o.time)
            d.items = arecipe.recipe              -- set decremented input items
            print(o.items[1])
            d.type = arecipe.type
            print("o.items ="..o.items)
            print("o.time ="..o.time)
            print("d.items ="..d.items)
            print("d.type ="..d.type)
            break
            --return o,d                            -- return output and decremented input
          else
            print("beeb "..arecipe.recipe.." ~= "..def.items:get_name())
            o = {
              items = "",
              time = 0
            }
            d = {
              items = "",
            }
            d.type = arecipe.type
            print("o.items ="..o.items)
            print("o.time ="..o.time)
            print("d.items ="..d.items)
            print("d.type ="..d.type)
          end
        --end
                    return o,d                            -- return output and decremented input
      elseif arecipe.type == "sediment" then    -- is this a sediment recipe?
        --for item,iname in pairs(def.items) do
          print(arecipe.recipe)
          print(def.items:get_name())
          if string.match(arecipe.recipe,"group:") then
            print("its a group!")
            local grouptbl = string.split(arecipe.recipe,":")
            local groupstr = grouptbl[2]
            print(groupstr)
            if minetest.get_node_group(def.items:get_name(), groupstr) > 0 then
              print("oh yeah it is!")
              o.items = arecipe.recipe              -- set output items
              print(o.items[1])
              o.time = arecipe.dust_time             -- set output time
              print(o.time)
              d.items = arecipe.recipe              -- set decremented input items
              print(d.items[1])
              d.type = arecipe.type
              print("o.items ="..o.items)
              print("o.time ="..o.time)
              print("d.items ="..d.items)
              print("d.type ="..d.type)
            else
              print("nope googoo!")
              o = {
                items = "",
                time = 0
              }
              d = {
                items = "",
              }
              d.type = arecipe.type
              print("o.items ="..o.items)
              print("o.time ="..o.time)
              print("d.items ="..d.items)
              print("d.type ="..d.type)
            end
          elseif arecipe.recipe == def.items:get_name() then     -- if so, then check that the recipe item is the same
            print("Poiple me it is!")
            o.items = arecipe.recipe              -- set output items
            print(o.items[1])
            o.time = recipe.dust_time             -- set output time
            print(o.time)
            d.items = arecipe.recipe              -- set decremented input items
            print(d.items[1])
            d.type = arecipe.type
            print("o.items ="..o.items)
            print("o.time ="..o.time)
            print("d.items ="..d.items)
            print("d.type ="..d.type)
            break
          else
            print("ferrrrrrt NO!")
            o = {
              items = "",
              time = 0
            }
            d = {
              items = "",
            }
            d.type = arecipe.type
            print("o.items ="..o.items)
            print("o.time ="..o.time)
            print("d.items ="..d.items)
            print("d.type ="..d.type)
          end
        --end
        return o,d                            -- return output and decremented input
      end
    end
  end
end



--minetest.get_craft_result(


local function active_formspec(sediment_percent, item_percent)
	local formspec =
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;src;2.75,0.5;1,1;]"..
		"list[current_name;sediment;2.75,2.5;1,1;]"..
		"image[2.75,1.5;1,1;default_polisher_fire_bg.png^[lowpart:"..
		(100-sediment_percent)..":default_sand_fire_fg.png]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;dst;4.75,0.96;2,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		"listring[current_name;sediment]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;sediment;2.75,2.5;1,1;]"..
	"image[2.75,1.5;1,1;default_silver_sand.png]"..
	"image[3.75,1.5;1,1;gui_furnice_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;sediment]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive polisher
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("sediment") and inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
  print(listname)
	if listname == "sediment" then
    local is_sediment = {}
    local deci = {}
    print(stack:get_name())
    is_sediment, deci = rockz.get_craft_result({type="sediment", items=stack})
		print(deci.items)
    if is_sediment.items ~= "" then
			if inv:is_empty("src") then
				meta:set_string("infotext", "Polisher is empty")
        print("polisher is empty")
			end
      print(tostring(stack:get_count()).." sediment")
			return stack:get_count()
		else
      print("that stack is bad, denying placement")
			return 0
		end
	elseif listname == "src" then
    print(tostring(stack:get_count()).." src")
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
  --print("polisher stack stack = "..stack)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function polisher_node_timer(pos, elapsed)
	--
	-- Inizialize metadata
	--
	local meta = minetest.get_meta(pos)
	local sediment_time = meta:get_float("sediment_time") or 0
	local src_time = meta:get_float("src_time") or 0
	local sediment_totaltime = meta:get_float("sediment_totaltime") or 0

	local inv = meta:get_inventory()
	local srclist, sedimentlist

	local polishable, polished
	local sediment

	local update = true
	while update do
		update = false

		srclist = inv:get_list("src")
		sedimentlist = inv:get_list("sediment")

		--
		-- Polished
		--

		-- Check if we have polishable content
		local afterpolished
    print("srclist = "..srclist[1]:get_name())
		polished, afterpolished = rockz.get_craft_result({type = "polishing", items = srclist[1]})
		polishable = polished.time ~= 0

		-- Check if we have enough sediment to work
		if sediment_time < sediment_totaltime then
			-- The polisher is currently active and has enough sediment
			sediment_time = sediment_time + elapsed
			-- If there is a polishable item then check if it is ready yet
			if polishable then
				src_time = src_time + elapsed
				if src_time >= polished.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", polished.item) then
						inv:add_item("dst", polished.item)
            print("polisher dst stack = "..inv:get_stack("dst",1))
						inv:set_stack("src", 1, afterpolished.items[1])
            print("polisher src stack = "..inv:get_stack("src",1))
						src_time = src_time - polished.time
						update = true
					end
				end
			end
		else
			-- polisher ran out of sediment
			if polishable then
				-- We need to get new sediment
				local aftersediment
				sediment, aftersediment = rockz.get_craft_result({type = "sediment", items = {sedimentlist}})

				if sediment.time == 0 then
					-- No valid sediment in sediment list
					sediment_totaltime = 0
					src_time = 0
				else
					-- Take sediment from sediment list
					inv:set_stack("sediment", 1, aftersediment.items[1])
          print("polisher sediment stack = "..inv:get_stack("sediment",1))
					update = true
					sediment_totaltime = sediment.time + (sediment_time - sediment_totaltime)
					src_time = src_time + elapsed
				end
			else
				-- We don't need to get new sediment since there is no polishable item
				sediment_totaltime = 0
				src_time = 0
			end
			sediment_time = 0
		end

		elapsed = 0
	end

	if sediment and sediment_totaltime > sediment.time then
		sediment_totaltime = sediment.time
	end
	if srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec = inactive_formspec
	local item_state
	local item_percent = 0
	if polishable then
		item_percent = math.floor(src_time / polished.time * 100)
		if item_percent > 100 then
			item_state = "100% (output full)"
		else
			item_state = item_percent .. "%"
		end
	else
		if srclist[1]:is_empty() then
			item_state = "Empty"
		else
			item_state = "Not polishable"
		end
	end

	local sediment_state = "Empty"
	local active = "inactive "
	local result = false

	if sediment_totaltime ~= 0 then
		active = "active "
		local sediment_percent = math.floor(sediment_time / sediment_totaltime * 100)
		sediment_state = sediment_percent .. "%"
		formspec = active_formspec(sediment_percent, item_percent)
		swap_node(pos, "rockz:polisher_active")
		-- make sure timer restarts automatically
		result = true
	else
		if not sedimentlist[1]:is_empty() then
			sediment_state = "0%"
		end
		swap_node(pos, "rockz:polisher")
		-- stop timer on the inactive polisher
		minetest.get_node_timer(pos):stop()
	end

	local infotext = "polisher " .. active .. "(Item: " .. item_state .. "; sediment: " .. sediment_state .. ")"

	--
	-- Set meta values
	--
	meta:set_float("sediment_totaltime", sediment_totaltime)
	meta:set_float("sediment_time", sediment_time)
	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

--
-- Node definitions
--

minetest.register_node("rockz:polisher", {
	description = "polisher",
	tiles = {
		"rockz_polisher_top_opened.png", "rockz_polisher_top_closed.png",
		"rockz_polisher_side.png", "rockz_polisher_side.png",
		"rockz_polisher_side.png", "rockz_polisher_side.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	can_dig = can_dig,

	on_timer = polisher_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('sediment', 1)
		inv:set_size('dst', 4)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether polisher can run or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "sediment", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "rockz:polisher"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("rockz:polisher_active", {
	description = "polisher",
	tiles = {
		"rockz_polisher_top_closed.png", "rockz_polisher_top_closed.png",
		"rockz_polisher_side.png", "rockz_polisher_side.png",
		"rockz_polisher_side.png", "rockz_polisher_side.png"
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "rockz:polisher",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = polisher_node_timer,

	can_dig = can_dig,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

