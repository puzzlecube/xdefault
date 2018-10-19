local bookshelf_formspec =                    -- to match default bookshelf
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;books;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)

local function get_bookshelf_formspec(inv)
	local formspec = bookshelf_formspec
	local invlist = inv and inv:get_list("books")
	-- Inventory slots overlay
	local bx, by = 0, 0.3
	for i = 1, 16 do
		if i == 9 then
			bx = 0
			by = by + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. bx .. "," .. by .. ";1,1;default_bookshelf_slot.png]"
		end
		bx = bx + 1
	end
	return formspec
end

--[[local defaultwoods = {
  "junglewood",
  "acacia_wood",
  "pine_wood",
  "aspen_wood"
  --default wood is not needed since there is already a bookshelf for it
}

for _,woodtype in pairs(defaultwoods) do
  minetest.register_node("bookshelvez:bookshelf_"..woodtype, {
    description = "Bookshelf "..woodtype,
    tiles = {"default_"..woodtype..".png", "default_"..woodtype..".png", "default_"..woodtype..".png", "default_"..woodtype..".png", "default_bookshelf_"..woodtype..".png", "default_bookshelf_"..woodtype..".png"},
    paramtype2 = "facedir",
    is_ground_content = false,
    groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
    sounds = default.node_sound_wood_defaults(),

    on_construct = function(pos)
      local meta = minetest.get_meta(pos)
      meta:set_string("formspec", get_bookshelf_formspec(nil))
      local inv = meta:get_inventory()
      inv:set_size("books", 8 * 2)
    end,
    can_dig = function(pos,player)
      local inv = minetest.get_meta(pos):get_inventory()
      return inv:is_empty("books")
    end,
    allow_metadata_inventory_put = function(pos, listname, index, stack)
      if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
        return stack:get_count()
      end
      return 0
    end,
    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
      minetest.log("action", player:get_player_name() .." moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
      local meta = minetest.get_meta(pos)
      meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
    end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
      minetest.log("action", player:get_player_name() .." moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
      local meta = minetest.get_meta(pos)
      meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
      minetest.log("action", player:get_player_name() .." takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
      local meta = minetest.get_meta(pos)
      meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
    end,
    on_blast = function(pos)
      local drops = {}
      default.get_inventory_drops(pos, "books", drops)
      drops[#drops+1] = "default:bookshelf_"..woodtype
      minetest.remove_node(pos)
      return drops
    end,
  })
  minetest.register_alias("default:bookshelf_"..woodtype,"bookshelvez:bookshelf_"..woodtype)
end
]]
nondefaultwoods = {}  -- new table so full names can be used
woodtextures = {}     -- provided nothing goes wrong these 2 should line up
-- TODO: Skip the nodes added by moreblocks and mods like it which add a bunch of weird looking VERY INCORREXT nodes that usually have unknown textures or half textures.
for k,v in pairs (minetest.registered_nodes) do
  curnode=v.name
  curtiles=v.tiles
  wooddesc = v.description
  local is_wood = minetest.get_node_group(curnode, "wood")      --get all other wood types
  if is_wood >= 1 then
    -- trim the modname: part of the node
    if curnode ~= "default:wood" then
      curntbl = string.split(curnode,":")
      curname = curntbl[#curntbl]  -- the end of the node name after the :
      curmod = curntbl[1]
      --table.insert(nondefaultwoods,#nondefaultwoods+1,curname)
      --table.insert(woodtextures,#woodtextures+1,curtiles)
      woodtype=curname
      woodnod=curnode
      --for _,woodtype in pairs(nondefaultwoods) do
      minetest.register_node("bookshelvez:bookshelf_"..woodtype, {
        description = wooddesc.." Bookshelf",
        tiles = {curmod.."_"..woodtype..".png", curmod.."_"..woodtype..".png", curmod.."_"..woodtype..".png", curmod.."_"..woodtype..".png", curmod.."_"..woodtype..".png^bookshelvez_bookshelf_inset.png", curmod.."_"..woodtype..".png^bookshelvez_bookshelf_inset.png"},
        paramtype2 = "facedir",
        is_ground_content = false,
        groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
        sounds = default.node_sound_wood_defaults(),

        on_construct = function(pos)
          local meta = minetest.get_meta(pos)
          meta:set_string("formspec", get_bookshelf_formspec(nil))
          local inv = meta:get_inventory()
          inv:set_size("books", 8 * 2)
        end,
        can_dig = function(pos,player)
          local inv = minetest.get_meta(pos):get_inventory()
          return inv:is_empty("books")
        end,
        allow_metadata_inventory_put = function(pos, listname, index, stack)
          if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
            return stack:get_count()
          end
          return 0
        end,
        on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
          minetest.log("action", player:get_player_name() .." moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
          local meta = minetest.get_meta(pos)
          meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
        end,
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
          minetest.log("action", player:get_player_name() .." moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
          local meta = minetest.get_meta(pos)
          meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
        end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
          minetest.log("action", player:get_player_name() .." takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
          local meta = minetest.get_meta(pos)
          meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
        end,
        on_blast = function(pos)
          local drops = {}
          default.get_inventory_drops(pos, "books", drops)
          drops[#drops+1] = "bookshelvez:bookshelf_"..woodtype
          minetest.remove_node(pos)
          return drops
        end,
      })
      minetest.register_alias("default:bookshelf_"..woodtype,"bookshelvez:bookshelf_"..woodtype)
      minetest.register_craft({
        output = "bookshelvez:bookshelf_woodtype",
        recipe = {
          {woodnod, woodnod, woodnod},
          {"default:book", "default:book", "default:book"},
          {woodnod, woodnod, woodnod}
        }
      })
    end
  end
end
minetest.register_alias("bookshelvez:bookshelf","bookshelvez:bookshelf_wood")
minetest.clear_craft({output="default:bookshelf"})
minetest.register_craft({
  output = "default:bookshelf",
  recipe = {
    {"default:wood", "default:wood", "default:wood"},
    {"default:book", "default:book", "default:book"},
    {"default:wood", "default:wood", "default:wood"}
  }
})
