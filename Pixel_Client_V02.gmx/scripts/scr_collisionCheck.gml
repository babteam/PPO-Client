//horizontal collisions
if (place_meeting(x+hspd, y, obj_block))
{
    while (!place_meeting(x+sign(hspd), y, obj_block))
    {
        x += sign(hspd);
    }
    
    hspd = 0;
}

//set our horizontal position
x += hspd;

//vertical collisions
if (place_meeting(x, y+vspd, obj_block))
{
    while (!place_meeting(x, y+sign(vspd), obj_block))
    {
        y += sign(vspd);
    }
    
    vspd = 0;
}

//set our vertical position
y += vspd;

//slow us down
//test code  --V

if( hspd < 1 && hspd > -1 )
    hspd = 0;
else hspd = hspd*fric;  //slows us by the friction variable set in localPlayer > create

if( vspd < 1 && vspd > -1 )
    vspd = 0;
else vspd = vspd*fric;

/*
if ( hspd>0 )
    {
        if ( !rightKey || leftKey )
            {
                hspd -= runningAcc;
                
                if (hspd<0)
                    hspd = 0;
            }
        else if (!sprintKey && hspd > walkingMaxSpd)
            {
                hspd -= runningAcc;
            }
    }
else if ( hspd<0 )
    {
        if ( !leftKey || rightKey )
            {
                hspd += runningAcc;
                
                if (hspd>0)
                    hspd = 0;
            }
        else if ( !sprintKey && hspd < -walkingMaxSpd )
            {
                hspd += runningAcc;
            }
    }
    
if ( vspd>0 )
    {
        if ( !downKey || upKey )
            {
                vspd -= runningAcc;
                
                if (vspd<0)
                    vspd = 0;
            }
        else if (!sprintKey && vspd > walkingMaxSpd)
            {
                vspd -= runningAcc;
            }
    }
else if ( vspd<0 )
    {
        if ( !upKey || downKey )
            {
                vspd += runningAcc;
                
                if (vspd>0)
                    vspd = 0;
            }
        else if ( !sprintKey && vspd < -walkingMaxSpd )
            {
                vspd += runningAcc;
            }
    }
