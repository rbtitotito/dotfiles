 volume_widget = widget({ type = "textbox", name = "tb_volume",
                             align = "right" })
volume_widget:buttons( awful.util.table.join(
    awful.button({ }, 4, function ()  awful.util.spawn("amixer set Master 9%+") end),
     awful.button({ }, 5, function ()  awful.util.spawn("amixer set Master 9%-") end)
    )
    )
    function update_volume(widget)
        local fd = io.popen("amixer sget Master")
        local status = fd:read("*all")
        fd:close()
        
        local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
        -- volume = string.format("% 3d", volume)

        status = string.match(status, "%[(o[^%]]*)%]")

        -- starting colour
        local sr, sg, sb = 0x3F, 0x3F, 0x3F
        -- ending colour
        local er, eg, eb = 0xDC, 0xDC, 0xCC

        local ir = volume * (er - sr) + sr
        local ig = volume * (eg - sg) + sg
        local ib = volume * (eb - sb) + sb
        interpol_colour = string.format("%.2x%.2x%.2x", ir, ig, ib)
        if string.find(status, "on", 1, true) then
            volume = " <span background='#" .. interpol_colour .. "'>   </span>"
        else
            volume = " <span color='red' background='#" .. interpol_colour .. "'> M </span>"
        end
        widget.text = volume
     end

    update_volume(volume_widget)

    mytimer = timer({timeout=1})
    mytimer:add_signal("timeout", function() update_volume( volume_widget ) end)
    mytimer:start()

    -- awful.hooks.timer.register(1, function () update_volume(volume_widget) end)