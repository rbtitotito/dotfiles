function run_once(prg,arg_string,pname,screen)
    if not prg then
        do return nil end
    end

    if not pname then
       pname = prg
    end

    if not arg_string then 
        awful.util.spawn_with_shell("pgrep -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
    else
        awful.util.spawn_with_shell("pgrep -u $USER -x '" .. pname .. "' || (" .. prg .. " " .. arg_string .. ")",screen)
    end
end
function get_ff_screen() local ff_screen = 1 if( #screen > 1 ) then ff_screen = 2 end return ff_screen end
ff_screen = get_ff_screen()
-- run_once("firefox",nil,nil,ff_screen)
-- run_once("/opt/google/chrome/chrome",nil,"chrome", 1)
-- run_once("pstorm", nil,nil,1)
-- run_once("sublime", nil, nil, 1)
-- run_once("xscreensaver","-no-splash")
-- run_once("pidgin",nil,nil,2)
-- run_once("wicd-client",nil,"/usr/bin/python2 -O /usr/share/wicd/gtk/wicd-client.py")