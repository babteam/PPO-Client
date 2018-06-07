//set sprite and sprite index
if (jumping || falling)
{
    sprite_index = spr_babTorso;
    image_index = 1;
    image_speed = 0;
    legSprite = -2;
}

/*  //woo comment block
if (falling)
{
    sprite_index = spr_man_jump;
    image_index = 2;
    image_speed = 0;
}
*/

if (!jumping && !falling)
{
    switch(state)
    {
        case "standing":
            sprite_index = spr_babTorso;
            image_index = 0;
            image_speed = 0;
            legSprite = -1;
            break;
        
        case "walking":
            sprite_index = spr_babTorso;
            image_index = 0;
            image_speed = 0;
            if(legSprite < 0)
                { legSprite = 8; }
            break;
        
        case "running":
            sprite_index = spr_babTorso;
            image_index = 0;
            image_speed = 0;
            if(legSprite < 20)
                { legSprite = 25; }
            break;
        
        case "ducking":
            sprite_index = spr_babTorso;
            image_index = 0;
            image_speed = 0;
            legSprite = -1;
            break;
        
        case "throwing":
            sprite_index = spr_babTorso;
            image_index = 1;
            image_speed = 0;
            legSprite = -1;
            break;
    }
}

switch (dir)
{
    case "left":
        image_xscale = -1;
    break;
    
    case "right":
        image_xscale = 1;
    break;
}
