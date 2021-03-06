var buffer = argument[0];
var msgid = buffer_read(buffer, buffer_u8);

switch(msgid)
{
    case 1: //latency request
        var time = buffer_read(buffer, buffer_u32);
        global.latency = current_time - time;
        break;
//============================================================================================================================================
    case 2: //register response
        var response = buffer_read(buffer, buffer_u8);
        
        switch(response)
        {
            case 0://failure
                scr_showNotification("Registration failed! Username already exists!");
                break;
            case 1://success
                room_goto(rm_characterLoad);
                break;
        }
        break;
//============================================================================================================================================
    case 3: //login response
        var response = buffer_read(buffer, buffer_u8);
        
        switch(response)
        {
            case 0://failure
                scr_showNotification("Login failed! Login details incorrect!");
                break;
            case 1://success
                room_goto(rm_characterLoad);
                break;
        }
        break;
//============================================================================================================================================
    case 4: //
        var whatVersion = buffer_read(buffer, buffer_u8);
        global.playerId = buffer_read(buffer, buffer_u32);
        
        if(whatVersion > global.version)
            {
                scr_showNotification("Client is outdated! Please update!");
                room_goto(rm_updateRoom);
            }
        else
            {
                scr_showNotification("Connected!");
            }
        break;
//============================================================================================================================================
    case 5: // destroy players that left the game
        var pId = buffer_read(buffer, buffer_u32);
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                instance_destroy();
            }
        }
        
        with (obj_remoteProjectile)
        {
            if (self.owner == pId)
            {
                instance_destroy();
            }
        }
        
        break;
//============================================================================================================================================
    case 6:
        var pId = buffer_read(buffer, buffer_u32);
        var pType = buffer_read(buffer, buffer_u8);
        var pName = buffer_read(buffer, buffer_string);
        
        var instance = noone;
        
        with (obj_remoteplayer)
        {
            if(remotePlayerId == pId)
            {
                instance = id;
            }
        }
        
        if (instance == noone)
        {
            //only if we're in the gameworld
            if (instance_exists(obj_localplayer))
            {
                //creat a remote player
                var remotePlayer = instance_create(room_width/2, room_height/2, obj_remoteplayer);
                remotePlayer.remotePlayerId = pId;
                remotePlayer.playerType = pType;
                remotePlayer.remotePlayerName = pName;
                
            }
        }
        else
        {
            with (instance)
            {
                instance_destroy();
            }
        }
        
        
        break;
//============================================================================================================================================
    case 7:  //update remotePlayer
        var pId = buffer_read(buffer, buffer_u32);
        var xx = buffer_read(buffer, buffer_f32);
        var yy = buffer_read(buffer, buffer_f32);
            var hair = buffer_read(buffer, buffer_u16);
            var outfitTop = buffer_read(buffer, buffer_u16);
            var outfitBottom = buffer_read(buffer, buffer_u16);
                var skin = buffer_read(buffer, buffer_u8);
            var diaper = buffer_read(buffer, buffer_u16);
            var colour = buffer_read(buffer, buffer_u32);
            var hairColour = buffer_read(buffer, buffer_u32);
            var outfitTopColour = buffer_read(buffer, buffer_u32);
            var outfitBottomColour = buffer_read(buffer, buffer_u32);
            var xxpeeHold = buffer_read(buffer, buffer_u8);
        var remoteFrames = buffer_read(buffer, buffer_u8);
        var d = buffer_read(buffer, buffer_u8);
        var rooms = buffer_read(buffer, buffer_u32);
        
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                if(rooms != room)
                    {
                        visible = false;
                    }
                else
                    {   
                        if(visible == false)
                            {
                                x = xx;
                                y = yy;
                                visible = true;
                            }
                    
                
                        self.xx = xx;
                        self.yy = yy;
                        frames = remoteFrames;
                        hairCustom = hair;
                        outfitTopCustom = outfitTop;
                        outfitBottomCustom = outfitBottom;
                        diaperCustom = diaper;
                        self.skinCustom = skin;
                        self.skinCol = colour;
                        self.hairCol = hairColour;
                        self.outfitTopCol = outfitTopColour;
                        self.outfitBottomCol = outfitTopColour;
                        
                        self.peeHold = xxpeeHold;
                        
                        switch (d)
                        {
                            case 1:
                                dir = "right";
                                    break;
                            case 2:
                                dir = "left";
                                    break;
                            case 3:
                                dir = "down";
                                    break;
                            case 4:
                                dir = "up";
                                    break;
                        }
                
                    }
            }
        }
        break;
//============================================================================================================================================
    case 8:  //player is talking to us
        var pId = buffer_read(buffer, buffer_u32);
        var text = buffer_read(buffer, buffer_string);
        
        //find owner of the message
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                //create the chat object to follow this remote player
                var chat = instance_create(x, y, obj_chat);
                chat.text = text;
                chat.owner = id; //this id comes from the 'with (obj_remoteplayer)' thats above
                chat.visible = visible;
                chat.name = remotePlayerName;
            }
        }
        break;
//============================================================================================================================================
    case 9: //packets and press space
    if (global.inGame == 1)
        {
            var npcId = buffer_read(buffer, buffer_u32);
            var xx = buffer_read(buffer, buffer_f32);
            var yy = buffer_read(buffer, buffer_f32);
            var npcType = buffer_read(buffer, buffer_u8);
            
            var npc = instance_create(xx, yy, obj_npc);
            npc.npcId = npcId;
            npc.image_index = npcType;
        }
        break;
//============================================================================================================================================
    case 10:
        var pId = buffer_read(buffer, buffer_u32);
        var latency = buffer_read(buffer, buffer_u32);
        
        //find owner of the message
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                remotePlayerLatency = latency;
            }
        }
        break;
//============================================================================================================================================
    case 11:
        var pId = buffer_read(buffer, buffer_u32);
        var projectileId = buffer_read(buffer, buffer_u32);
        var xx = buffer_read(buffer, buffer_f32);
        var yy = buffer_read(buffer, buffer_f32);
        
        var projectile = noone;
        
        with (obj_remoteProjectile)
        {
            if(self.owner == pId && self.projectileId == projectileId)
            {
                projectile = id;
            }
        }
        
        if (projectile != noone)
        {
            projectile.x = xx;
            projectile.y = yy;
        }
        else
        {
            var p = instance_create(xx, yy, obj_remoteProjectile);
            p.owner = pId;
            p.projectileId = projectileId;
        }
        break;
//============================================================================================================================================
    case 12:
        var pId = buffer_read(buffer, buffer_u32);
        var projectileId = buffer_read(buffer, buffer_u32);
        
        with (obj_remoteProjectile)
        {
            if(self.owner == pId && self.projectileId == projectileId)
            {
                instance_destroy();
            }
        }
        
        break;
//============================================================================================================================================
        case 13:  //get ball position
            var owns = buffer_read(buffer, buffer_u32);
            
            with (obj_ball)
            {
                self.owner = owns;
            }
        
        break;
//============================================================================================================================================
    case 14:
        var xx = buffer_read(buffer, buffer_f32);
        var yy = buffer_read(buffer, buffer_f32);
        
        with (obj_ball)
        {
            self.x = xx;
            self.y = yy;
        }

        break;
//============================================================================================================================================
    case 16: //recieve saved user apperance from server

        global.hairCustom = buffer_read(buffer, buffer_u16);
        global.outfitTopCustom = buffer_read(buffer, buffer_u16);
        global.outfitBottomCustom = buffer_read(buffer, buffer_u16);
            global.skinCustom = buffer_read(buffer, buffer_u8);
        global.diaperCustom = buffer_read(buffer, buffer_u16);
        global.skinCol = buffer_read(buffer, buffer_u32);
        global.hairCol = buffer_read(buffer, buffer_u32);
        global.outfitTopCol = buffer_read(buffer, buffer_u32);
        global.outfitBottomCol = buffer_read(buffer, buffer_u32);
        
        if instance_exists(obj_btn_loadCharacter)
            {
                obj_btn_loadCharacter.clickable = 1;
            }
        
        break;
//============================================================================================================================================
    case 17: //someone spawned a puddle
        var xxroom = buffer_read(buffer, buffer_u8);
        var xx = buffer_read(buffer, buffer_f32);
        var yy = buffer_read(buffer, buffer_f32);
        
        if(room == xxroom)
            {
                iii = instance_create(xx, yy, obj_leakPuddle);
                    iii.localObj = 0;
            }
        else 
            {    
                ii = instance_create(xx, yy, obj_leakPuddleSpawner);
                    ii.xroom = xxroom;
            }
            
        break;
//============================================================================================================================================
    case 18:  //recieve derpy dragon updates
        var npcDerpyXX = buffer_read(buffer, buffer_f32);
        var npcDerpyYY = buffer_read(buffer, buffer_f32);
        
        if instance_exists(obj_derpyDragonNPC)
            {
                obj_derpyDragonNPC.xxx = npcDerpyXX;
                obj_derpyDragonNPC.yyy = npcDerpyYY;
            }
        
        break;
//============================================================================================================================================
    case 20: //recieve saved items
        
        var i;
        i = 25;
        repeat(25)
           {
                global.inventoryArray[i] = buffer_read(buffer, buffer_u16);
                i -= 1;
           }
           
        break;
//============================================================================================================================================
    case 21:  //update face
        var pId = buffer_read(buffer, buffer_u32);
        var Face_xx = buffer_read(buffer, buffer_u8);
        
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                        switch (Face_xx)
                        {
                            case 0:
                                self.emoteFace = spr_emoteFace_neutral;
                                    break;
                            case 1:
                                self.emoteFace = spr_emoteFace_happy;
                                    break;
                            case 2:
                                self.emoteFace = spr_emoteFace_sad;
                                    break;
                            case 3:
                                self.emoteFace = spr_emoteFace_scared;
                                    break;
                            case 4:
                                self.emoteFace = spr_emoteFace_angry;
                                    break;
                        }
                
            }
        }
        break;
//============================================================================================================================================
    case 22:  //update face
        var pId = buffer_read(buffer, buffer_u32);
        var typing_xx = buffer_read(buffer, buffer_u8);
        
        with (obj_remoteplayer)
        {
            if (remotePlayerId == pId)
            {
                self.isTyping = typing_xx;
            }
        }
        break;
//============================================================================================================================================
    case 23:  //update the time
        global.hours = buffer_read(buffer, buffer_s8);
        
        break;
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
//============================================================================================================================================
}
