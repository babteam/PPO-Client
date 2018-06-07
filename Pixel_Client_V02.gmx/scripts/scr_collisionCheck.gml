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
        hspd = hspd*fric;
        vspd = vspd*fric;
