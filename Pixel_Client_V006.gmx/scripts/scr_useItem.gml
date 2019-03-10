#define scr_useItem
//put script after detectKey
//script is in localPlayer step

var selectedItemxx = (global.inventoryArray[global.inventorySlot]) +spr_item_START;

if(itemKey)
    switch(selectedItemxx)
        {
        //================================================================================================================================
            case spr_item_diaper: case spr_item_diaperWet:
                if !instance_exists(obj_change_timer)
                    instance_create(x, y -100, obj_change_timer);
                break;
        //================================================================================================================================
        //================================================================================================================================
            case spr_item_energyDrink:
                hydration = hydration*3;
                
                if(spd < def_spd*2)
                    spd = spd*1.5;
                    else
                        spd = def_spd*2;
                
                global.inventoryArray[global.inventorySlot] = 0;
                scr_saveItem();
                break;
        //================================================================================================================================
        //================================================================================================================================
        //================================================================================================================================
        //================================================================================================================================
        //================================================================================================================================
            default:
                break;
        //================================================================================================================================    
        }

#define scr_saveItem
if(argument_count > 0)
    {
        var slotXX = argument[0];  //if theres an arguemnt passed, its a manually selected slot
            //note: argument0 without brackets makes the argument mandatory
    }
    else
        {
            var slotXX = global.inventorySlot;
        }

buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 19);  // saving item to server
buffer_write(global.buffer, buffer_string, global.playerUsername);  //the player sending it

    buffer_write(global.buffer, buffer_u8,  slotXX );  //what slot to update
    buffer_write(global.buffer, buffer_u16,  global.inventoryArray[slotXX] );  //whats inside the slot

network_send_packet(obClient.socket, global.buffer, buffer_tell(global.buffer));

#define scr_dropItem
if ( global.inventoryArray[global.inventorySlot] != spr_item_START )
    {
        var spawnedItemxx = instance_create(x, y, obj_itemDrop);
            spawnedItemxx.sprite_index = global.inventoryArray[global.inventorySlot] +spr_item_START;
        
        global.inventoryArray[global.inventorySlot] = spr_item_START;
        scr_saveItem();
        
    }

#define scr_takeItem
///scr_takeItem(item_sprite, destroy_item);

var itemTakexx = argument0 -spr_item_START;
var destroyItem = argument1;

var i;
for(i = 1; i < 26; i += 1)
    {
        if ( global.inventoryArray[i] == 0)
            {
                global.inventoryArray[i] = itemTakexx;
                scr_saveItem(i);
                
                if( destroyItem )  //if its 1 or true, destroy the item that called it
                    instance_destroy();
                    
                break;
            }
    }
/*
if ( global.inventoryArray[global.inventorySlot] == 0 )
    {
        global.inventoryArray[global.inventorySlot] = itemTakexx;
        scr_saveItem();
        
        if( destroyItem )  //if its 1 or true, destroy the item that called it
            instance_destroy();
    }
*/