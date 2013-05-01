-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}

tags[1] = awful.tag({ '⎈', '⛃', '',  '♏', 'ಠ_ಠ' }, 1, layouts[1])
if screen.count() == 2 then
	tags[2] = awful.tag({ '', '',  '♏' }, 2, layouts[1])
else
 for s = 2, screen.count() do
        -- Each screen has its own tag table.
	     tags[s] = awful.tag({ '⎈', '♏', 'ಠ_ಠ'  }, s, layouts[1])
 end
end
-- }}}
