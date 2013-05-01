-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 5, awful.tag.viewnext),
                    awful.button({ }, 4, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

-- Initialize widget
memwidget = awful.widget.progressbar()
-- Progressbar properties
memwidget:set_width(10)
memwidget:set_height(20)
memwidget:set_vertical(true)
memwidget:set_background_color("#494B4F")
memwidget:set_border_color(nil)
memwidget:set_color("#1188FF")
memwidget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, "$1", 13)

-- Initialize widget
cpuwidget1 = awful.widget.graph()
-- Graph properties
cpuwidget1:set_width(50)
cpuwidget1:set_background_color("#494B4F")
cpuwidget1:set_color("#FF5656")
cpuwidget1:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
-- Register widget
vicious.register(cpuwidget1, vicious.widgets.cpu, "$2")

-- Initialize widget
cpuwidget2 = awful.widget.graph()
-- Graph properties
cpuwidget2:set_width(50)
cpuwidget2:set_background_color("#494B4F")
cpuwidget2:set_color("#AA9E56")
cpuwidget2:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
-- Register widget
vicious.register(cpuwidget2, vicious.widgets.cpu, "$3")

-- Initialize widget
cpuwidget3 = awful.widget.graph()
-- Graph properties
cpuwidget3:set_width(50)
cpuwidget3:set_background_color("#494B4F")
cpuwidget3:set_color("#FF2031")
cpuwidget3:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
-- Register widget
vicious.register(cpuwidget3, vicious.widgets.cpu, "$4")

-- Initialize widget
cpuwidget4 = awful.widget.graph()
-- Graph properties
cpuwidget4:set_width(50)
cpuwidget4:set_background_color("#494B4F")
cpuwidget4:set_color("#FF5957")
cpuwidget4:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
-- Register widget
vicious.register(cpuwidget4, vicious.widgets.cpu, "$5")



for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)
    
    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        s == 1 and mysystray or nil,
        s == 1 and memwidget.widget or nil,
        s == 1 and cpuwidget4.widget or nil,
        s == 1 and cpuwidget3.widget or nil,
        s == 1 and cpuwidget2.widget or nil,
        s == 1 and cpuwidget1.widget or nil,
        s == 1 and volume_widget or nil,
       -- ... ^ don't forget to add the widget to your taskbar!
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 5, awful.tag.viewnext),
    awful.button({ }, 4, awful.tag.viewprev)
))
-- }}}
