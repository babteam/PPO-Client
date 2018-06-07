switch(catapult)
    {
        case 1: 
                //instance_create(0, 0, obj_screenFade);
                room = rm_landZone;
                x = 300;
                y = 0;
                catapult = 2;
                break;
    }

if(x < 1480)
    x = x + 61 - (x *0.01);
if(y < 1000)
    y = y + 36 + (y *0.01);

image_angle -= 45;
    
if(x >= 1470 && y>= 1000)
    {
        catapult = 0;
        image_angle = 0;
    }

