function get_screen( screen_name, tag_name )
  print( #tags )
  if ( screen_name > #tags ) then
    screen_name = #tags
  end
  screen_tags = tags[screen_name]
  if ( tag_name > #screen_tags ) then
    tag_name = #screen_tags
  end
  print( screen_name )
  print( tag_name )
  return tags[screen_name][tag_name]
end

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "jetbrains-phpstorm" },
        properties = { floating = true, tag = jetbrains_tag }
    },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][1] } 
    -- }

}
-- }}}