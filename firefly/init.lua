minetest.register_abm({
    nodenames = {"default:grass_5"},
    interval = 5,
    chance = 5,
    action = function(pos, node)
        if ((minetest.env:get_timeofday() < 0.2) or (minetest.env:get_timeofday() > 0.8)) then
        node.name = "firefly:grass_5"
        minetest.env:add_node(pos, node)
        end
    end
})

minetest.register_abm({
    nodenames = {"firefly:grass_5"},
    interval = 5,
    chance = 5,
    action = function(pos, node)
        if ((minetest.env:get_timeofday() > 0.2) and (minetest.env:get_timeofday() < 0.8)) then
        node.name = "default:grass_5"
        minetest.env:add_node(pos, node)
        end
    end
})

minetest.register_node("firefly:grass_5", {
    description = "Grass",
    drawtype = "plantlike",
    tiles = {"default_grass_5.png"},
    inventory_image = "default_grass_5.png",
    wield_image = "default_grass_5.png",
    paramtype = "light",
    walkable = false,
    light_source = 10,
    buildable_to = true,
    is_ground_content = true,
    drop = "default:grass_1",
    groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
    sounds = default.node_sound_leaves_defaults(),
    selection_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
    },
})

minetest.register_abm({ --for particles and sounds
  nodenames = {"firefly:grass_5"},
  interval = 0.3,
  chance = 6,
  action = function(pos, node, _, _)
    local p = {x=pos.x, y=pos.y+math.random()-0.5, z=pos.z}
    minetest.add_particle(p, {x=(math.random()-0.5)*5,y=(math.random()-0.5)*5,z=(math.random()-0.5)*5}, {x=math.random()-0.5,y=math.random()-0.5,z=math.random()-0.5}, math.random(2,3), math.random(3), true, "firefly_firefly_particle.png")
  end,
})