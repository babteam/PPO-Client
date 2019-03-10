//currently placed in obClient step event
if(keyboard_check_pressed(vk_anykey))
    {
        global.controlType = 0;
        return false;
    }
else
    {
        for ( var i = gp_face1; i < gp_axisrv; i++ ) 
            {
                if ( gamepad_button_check( 0, i ) ) 
                    {global.controlType = 1; return false;}
            }
    }
