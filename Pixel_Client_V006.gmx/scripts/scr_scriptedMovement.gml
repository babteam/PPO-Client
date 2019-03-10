//- var imove = argument0;
switch (scriptMove)
    {
        default: break; //do nothing
        
    //===========================================================================
        case 1:  //catapult
                switch(scriptMoveCount)
                    {
                        case 1: //change rooms before running other code
                                room = rm_landZone;
                                x = 300;
                                y = 0;
                                scriptMoveCount = 2;
                                break;
                    }
                
                if(x < 1480)
                    x = x + 61 - (x *0.01);
                if(y < 1000)
                    y = y + 36 + (y *0.01);
                
                image_angle -= 45;
                    
                if(x >= 1470 && y>= 1000)
                    {
                        scriptMove = 0; //disable catapulting
                        scriptMoveCount = 0;
                        image_angle = 0;
                        stunned = 0; //unstun the player after landing
                    }
                pee = pee +200;
        break;
    //===========================================================================
    }
