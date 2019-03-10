#define scr_avatar_2




draw_self();
draw_set_font(fnt_small);
draw_set_colour(c_maroon);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_text(x, y-130, string(remotePlayerId));

if(id != obj_localplayer.id)
{
    draw_text(x, y-90, string(remotePlayerName));
}


//- draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, global.skinCol, image_alpha);
//-  The shadow already drew itself what was ^ that for?

switch(peeHold)
    {
        case 0:
            peeDance = 0;
            var peeDanceR = 1;
            var peeDanceL = 1;
            break;
        
        case 1:
            peeDance = peeDance +1;
            if(peeDance > 10)
                peeDance = -10;
                
            if(peeDance < 0)
                {
                    var peeDance2 = -peeDance;
                }
                else 
                    var peeDance2 = peeDance;
            
            var peeDanceR = 0.9 +0.1*(peeDance2/10);
            var peeDanceL = 1 -0.1*(peeDance2/10);
            
            break;
    }

switch(frames)
    {
        case 0:
            rightLegSquish = (rightLegSquish + 1 +(0.01*peeHold) )*0.5;
            leftLegSquish = (leftLegSquish + 1 +(0.01*peeHold) )*0.5;
            var bothLegSquish = (rightLegSquish + leftLegSquish)*0.5;
            var walkBounce = 0;
            var armSwing = 0;
            break;
        case 1:
            rightLegSquish = (rightLegSquish + 0.7 +(0.1*peeHold) )*0.5;
            var bothLegSquish = rightLegSquish;
            var walkBounce = 4*playerSize;  //to make character bob down slightly when walking
            var armSwing = 1;
            break;
        case 2:
            leftLegSquish = (leftLegSquish + 0.7 +(0.1*peeHold) )*0.5;
            var bothLegSquish = leftLegSquish;
            var walkBounce = 4*playerSize;
            var armSwing = -1;
            break;
    }
    
/*    
playerType = 1;  //decide what playertype means later  -  you could use playerType for specific emotes, like changing mat interaction
switch(playerType)
    {
        default:
*/
        
switch(dir)
    {
        case "right":
                    
                    if (peeHold == 0)
                        {
                            if(fishing == 0)
                                {
                                    rightArmAngle = (rightArmAngle + (-35 + 40*armSwing))*0.5;
                                    leftArmAngle = (leftArmAngle + (-35 - 40*armSwing))*0.5;      
                                }
                                else
                                    {
                                        rightArmAngle = (rightArmAngle + 30)*0.5;
                                        leftArmAngle = (leftArmAngle + 30)*0.5;     
                                    }
                        }
                        else
                            {
                                rightArmAngle = (rightArmAngle - 10 )*0.5;
                                leftArmAngle = (leftArmAngle - 10 )*0.5;
                            }
                    draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x, y-164*playerSize + walkBounce, -playerSize, playerSize, leftArmAngle +image_angle, skinCol, image_alpha);
                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x, y-164*playerSize + walkBounce, -playerSize, playerSize, leftArmAngle +image_angle, outfitTopCol, image_alpha);
                    
                    draw_sprite_ext(spr_paperDoll_Parts_Head_Side, skinCustom + 6, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                    draw_sprite_ext(emoteFace, 1, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, image_blend, image_alpha);
                        draw_sprite_ext(spr_hair_START + hairCustom, 2, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, hairCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x-8*playerSize, y-80*playerSize, -playerSize, playerSize*peeDanceR, image_angle - 100 + 100*bothLegSquish , skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x+4*playerSize, y-80*playerSize, -playerSize, playerSize*peeDanceL, image_angle + 100 - 100*bothLegSquish, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_upBody_Side, skinCustom, x, y-124*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_lowBody_Side, skinCustom, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_diaper_START + diaperCustom, 2, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, image_blend, image_alpha);
                    
                    draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 1, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, outfitTopCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x+4*playerSize, y-164*playerSize + walkBounce, -playerSize, playerSize, rightArmAngle +image_angle, skinCol, image_alpha);
                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+4*playerSize, y-164*playerSize + walkBounce, -playerSize, playerSize, rightArmAngle +image_angle, outfitTopCol, image_alpha);
                        
                    
                    break;
        case "left":
        
                    if (peeHold == 0)
                        {
                            if(fishing == 0)
                                {
                                    rightArmAngle = (rightArmAngle + (35 + 40*armSwing))*0.5;
                                    leftArmAngle = (leftArmAngle + (35 - 40*armSwing))*0.5;      
                                }
                                else
                                    {
                                        rightArmAngle = (rightArmAngle - 30)*0.5;
                                        leftArmAngle = (leftArmAngle - 30)*0.5;     
                                    }
                        }
                        else
                            {
                                rightArmAngle = (rightArmAngle + 10 )*0.5;
                                leftArmAngle = (leftArmAngle + 10 )*0.5;      
                            }
                    draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x, y-164*playerSize + walkBounce, playerSize, playerSize, leftArmAngle +image_angle, skinCol, image_alpha);
                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x, y-164*playerSize + walkBounce, playerSize, playerSize, leftArmAngle +image_angle, outfitTopCol, image_alpha);
                    
                    draw_sprite_ext(spr_paperDoll_Parts_Head_Side, skinCustom + 6, x, y-160*playerSize + walkBounce, -playerSize, playerSize, image_angle, skinCol, image_alpha);
                    draw_sprite_ext(emoteFace, 1, x, y-160*playerSize + walkBounce, -playerSize, playerSize, image_angle, image_blend, image_alpha);
                        draw_sprite_ext(spr_hair_START + hairCustom, 2, x, y-160*playerSize + walkBounce, -playerSize, playerSize, image_angle, hairCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x+8*playerSize, y-80*playerSize, playerSize, playerSize*peeDanceR, image_angle + 100 - 100*bothLegSquish, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x-8*playerSize, y-80*playerSize, playerSize, playerSize*peeDanceL, image_angle - 100 + 100*bothLegSquish, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_upBody_Side, skinCustom, x, y-124*playerSize + walkBounce, -playerSize, playerSize, image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_lowBody_Side, skinCustom, x, y-160*playerSize + walkBounce, -playerSize, playerSize, image_angle, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_diaper_START + diaperCustom, 2, x, y-160*playerSize + walkBounce, -playerSize, playerSize, image_angle, image_blend, image_alpha);
                    
                    draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 1, x, y-160*playerSize + walkBounce, -playerSize, playerSize, image_angle, outfitTopCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x-4*playerSize, y-164*playerSize + walkBounce, playerSize, playerSize, rightArmAngle +image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x-4*playerSize, y-164*playerSize + walkBounce, playerSize, playerSize, rightArmAngle +image_angle, outfitTopCol, image_alpha);
                    break;
        case "down":
                    draw_sprite_ext(spr_paperDoll_Parts_Head, skinCustom, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                    draw_sprite_ext(emoteFace, 0, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, image_blend, image_alpha);
                        draw_sprite_ext(spr_hair_START + hairCustom, 0, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, hairCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x-12*playerSize, y-80*playerSize, playerSize, playerSize*rightLegSquish*peeDanceR, image_angle + 20 - 20*rightLegSquish +8*peeHold, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x+20*playerSize, y-80*playerSize, -playerSize, playerSize*leftLegSquish*peeDanceL, image_angle - 20 + 20*leftLegSquish -8*peeHold, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_upBody, skinCustom, x, y-124*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_lowBody, skinCustom, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_diaper_START + diaperCustom, 0, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, image_blend, image_alpha);
                    
                    draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 0, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, outfitTopCol, image_alpha);
                        
                    if (peeHold == 1 || fishing == 1)
                            {
                                    leftLegSquish = 1;
                                    rightLegSquish = 1;
                                rightArmAngle = (rightArmAngle + 42)*0.5;
                                leftArmAngle = (leftArmAngle - 42)*0.5;
                            }
                        else
                            {
                                rightArmAngle = (rightArmAngle + 0)*0.5;
                                leftArmAngle = (leftArmAngle + 0)*0.5;
                            }

                    draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x-20*playerSize, y-168*playerSize + walkBounce, playerSize, playerSize, rightArmAngle + 20 - 20*leftLegSquish +image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x+24*playerSize, y-168*playerSize + walkBounce, -playerSize, playerSize, leftArmAngle - 20 + 20*rightLegSquish +image_angle, skinCol, image_alpha);
                        
                        draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x-20*playerSize, y-168*playerSize + walkBounce, playerSize, playerSize, rightArmAngle + 20 - 20*leftLegSquish +image_angle, outfitTopCol, image_alpha);
                        draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+24*playerSize, y-168*playerSize + walkBounce, -playerSize, playerSize, leftArmAngle - 20 + 20*rightLegSquish +image_angle, outfitTopCol, image_alpha);
        
                    break;
        case "up":
                    
                    if (peeHold == 1 || fishing == 1)
                            {
                                var leftLegSquish2 = 1;
                                var rightLegSquish2 = 1;
                                rightArmAngle = (rightArmAngle + 42)*0.5;
                                leftArmAngle = (leftArmAngle - 42)*0.5;
                            }
                        else
                            {
                                rightArmAngle = (rightArmAngle + 0)*0.5;
                                leftArmAngle = (leftArmAngle + 0)*0.5;
                                var leftLegSquish2 = leftLegSquish;
                                var rightLegSquish2 = rightLegSquish;
                            }
                    draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x-20*playerSize, y-168*playerSize + walkBounce, playerSize, playerSize, rightArmAngle + 20 - 20*leftLegSquish2 +image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_Arm, skinCustom, x+24*playerSize, y-168*playerSize + walkBounce, -playerSize, playerSize, leftArmAngle - 20 + 20*rightLegSquish2 +image_angle, skinCol, image_alpha);
                        
                        draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x-20*playerSize, y-168*playerSize + walkBounce, playerSize, playerSize, rightArmAngle + 20 - 20*leftLegSquish2 +image_angle, outfitTopCol, image_alpha);
                        draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+24*playerSize, y-168*playerSize + walkBounce, -playerSize, playerSize, leftArmAngle - 20 + 20*rightLegSquish2 +image_angle, outfitTopCol, image_alpha);
                    
                    draw_sprite_ext(spr_paperDoll_Parts_Head, skinCustom, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_hair_START + hairCustom, 1, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, hairCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x-12*playerSize, y-80*playerSize, playerSize, playerSize*leftLegSquish*peeDanceR, image_angle + 20 - 20*leftLegSquish +8*peeHold, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_Leg, skinCustom, x+20*playerSize, y-80*playerSize, -playerSize, playerSize*rightLegSquish*peeDanceL, image_angle - 20 + 20*rightLegSquish -8*peeHold, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_paperDoll_Parts_upBody, skinCustom, x, y-124*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        draw_sprite_ext(spr_paperDoll_Parts_lowBody, skinCustom, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, skinCol, image_alpha);
                        
                    draw_sprite_ext(spr_diaper_START + diaperCustom, 1, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, image_blend, image_alpha);
                    
                    draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 2, x, y-160*playerSize + walkBounce, playerSize, playerSize, image_angle, outfitTopCol, image_alpha);
                        
                    
        
                    break;
    }
/*
                break;
    }
*/    

#define scr_face_emotes
var tempFace_xx = faceVars;

if (!global.typing)
{

    //keyboard_check_pressed
    var emote_happy = keyboard_check(vk_up)   ||  (gamepad_axis_value(0, gp_axisrv) < 0);
    var emote_sad = keyboard_check(vk_down)   ||  (gamepad_axis_value(0, gp_axisrv) > 0);
    var emote_scared = keyboard_check(vk_left)   ||  (gamepad_axis_value(0, gp_axisrh) < 0);
    var emote_angry = keyboard_check(vk_right)   ||  (gamepad_axis_value(0, gp_axisrh) > 0);
    
    
    if(emote_happy)
        {
            emoteFace = spr_emoteFace_happy;
            emoteTime = 60;
            faceVars = 1;
        }
    if(emote_sad)
        {
            emoteFace = spr_emoteFace_sad;
            emoteTime = 60;
            faceVars = 2;
        }
    if(emote_scared)
        {
            emoteFace = spr_emoteFace_scared;
            emoteTime = 60;
            faceVars = 3;
        }
    if(emote_angry)
        {
            emoteFace = spr_emoteFace_angry;
            emoteTime = 60;
            faceVars = 4;
        }
}

if(emoteTime > 0)
    {
        emoteTime--;
    }
    else
        {
            emoteFace = spr_emoteFace_neutral;
            faceVars = 0;
        }
        
if(faceVars != tempFace_xx)
    {
        buffer_seek(global.buffer, buffer_seek_start, 0);
        buffer_write(global.buffer, buffer_u8, 21);
        buffer_write(global.buffer, buffer_u32, global.playerId);
        buffer_write(global.buffer, buffer_u8, faceVars);
        
        network_send_packet(obClient.socket, global.buffer, buffer_tell(global.buffer));
    }
#define scr_is_typing
if (isTyping > 0)
    {
        var typingXX = floor((isTyping)*0.1);
        isTyping = isTyping +0.5;
            if(isTyping %10 == 0)
                isTyping = isTyping+1;
            if(isTyping >= 30)
                isTyping = 1;
        draw_sprite_ext(spr_is_typing, typingXX, x, y-100, 1, 1, image_angle, image_blend, image_alpha);
    }