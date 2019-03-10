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

switch(frames)
    {
        case 0:
            rightLegSquish = (rightLegSquish + 1)*0.5;
            leftLegSquish = (leftLegSquish + 1)*0.5;
            var bothLegSquish = (rightLegSquish + leftLegSquish)*0.5;
            var walkBounce = 0;
            var armSwing = 0;
            break;
        case 1:
            rightLegSquish = (rightLegSquish + 0.7)*0.5;
            var bothLegSquish = rightLegSquish;
            var walkBounce = 1;  //to make character bob down slightly when walking
            var armSwing = 1;
            break;
        case 2:
            leftLegSquish = (leftLegSquish + 0.7)*0.5;
            var bothLegSquish = leftLegSquish;
            var walkBounce = 1;
            var armSwing = -1;
            break;
        
    }
    
    
playerType = 1;  //decide what playertype means later
switch(playerType)
    {
        default:
            switch(dir)
                {
                    case "right":
                                
                                if (peeHold == 0)
                                    {
                                        rightArmAngle = (rightArmAngle + (-35 + 40*armSwing))*0.5;
                                        leftArmAngle = (leftArmAngle + (-35 - 40*armSwing))*0.5;
                                    }
                                    else
                                        {
                                            rightArmAngle = (rightArmAngle - 10 )*0.5;
                                            leftArmAngle = (leftArmAngle - 10 )*0.5;
                                        }
                                draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x, y-41 + walkBounce, -0.25, 0.25, leftArmAngle +image_angle, skinCol, image_alpha);
                                draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x, y-41 + walkBounce, -0.25, 0.25, leftArmAngle +image_angle, outfitTopCol, image_alpha);
                                
                                draw_sprite_ext(spr_paperDoll_Parts_Head_Side, frames + 6, x, y-40 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_hair_START + hairCustom, 2, x, y-40 + walkBounce, 0.25, 0.25, image_angle, hairCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_upBody_Side, frames, x, y-31 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_lowBody_Side, frames, x, y-40 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                
                                draw_sprite_ext(spr_paperDoll_Parts_LegSide, frames, x-2, y-20, -0.25, 0.25, image_angle - 100 + 100*bothLegSquish, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_LegSide, frames, x+2, y-20, -0.25, 0.25, image_angle + 100 - 100*bothLegSquish, skinCol, image_alpha);
                                    
                                draw_sprite_ext(spr_diaper_START + diaperCustom, 2, x, y-40 + walkBounce, 0.25, 0.25, image_angle, image_blend, image_alpha);
                                
                                draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 1, x, y-40 + walkBounce, 0.25, 0.25, image_angle, outfitTopCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x+1, y-41 + walkBounce, -0.25, 0.25, rightArmAngle +image_angle, skinCol, image_alpha);
                                draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+1, y-41 + walkBounce, -0.25, 0.25, rightArmAngle +image_angle, outfitTopCol, image_alpha);
                                    
                                
                                break;
                    case "left":
                    
                                if (peeHold == 0)
                                    {
                                        rightArmAngle = (rightArmAngle + (35 + 40*armSwing))*0.5;
                                        leftArmAngle = (leftArmAngle + (35 - 40*armSwing))*0.5;      
                                    }
                                    else
                                        {
                                            rightArmAngle = (rightArmAngle + 10 )*0.5;
                                            leftArmAngle = (leftArmAngle + 10 )*0.5;      
                                        }
                                draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x, y-41 + walkBounce, 0.25, 0.25, leftArmAngle +image_angle, skinCol, image_alpha);
                                draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x, y-41 + walkBounce, 0.25, 0.25, leftArmAngle +image_angle, outfitTopCol, image_alpha);
                                
                                draw_sprite_ext(spr_paperDoll_Parts_Head_Side, frames + 6, x, y-40 + walkBounce, -0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_hair_START + hairCustom, 2, x, y-40 + walkBounce, -0.25, 0.25, image_angle, hairCol, image_alpha);
                                    
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_upBody_Side, frames, x, y-31 + walkBounce, -0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_lowBody_Side, frames, x, y-40 + walkBounce, -0.25, 0.25, image_angle, skinCol, image_alpha);
                                
                                draw_sprite_ext(spr_paperDoll_Parts_LegSide, frames, x+2, y-20, 0.25, 0.25, image_angle + 100 - 100*bothLegSquish, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_LegSide, frames, x-2, y-20, 0.25, 0.25, image_angle - 100 + 100*bothLegSquish, skinCol, image_alpha);
                                    
                                draw_sprite_ext(spr_diaper_START + diaperCustom, 2, x, y-40 + walkBounce, -0.25, 0.25, image_angle, image_blend, image_alpha);
                                
                                draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 1, x, y-40 + walkBounce, 0.25, 0.25, image_angle, outfitTopCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x-1, y-41 + walkBounce, 0.25, 0.25, rightArmAngle +image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+1, y-41 + walkBounce, 0.25, 0.25, rightArmAngle +image_angle, outfitTopCol, image_alpha);
                                break;
                    case "down":
                                draw_sprite_ext(spr_paperDoll_Parts_Head, frames, x, y-40 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_hair_START + hairCustom, 0, x, y-40 + walkBounce, 0.25, 0.25, image_angle, hairCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_upBody, frames, x, y-31 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_lowBody, frames, x, y-40 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_Leg, frames, x-3, y-20, 0.25, 0.25*rightLegSquish, image_angle + 20 - 20*rightLegSquish, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_Leg, frames, x+5, y-20, -0.25, 0.25*leftLegSquish, image_angle - 20 + 20*leftLegSquish, skinCol, image_alpha);
                                    
                                draw_sprite_ext(spr_diaper_START + diaperCustom, 0, x, y-40 + walkBounce, 0.25, 0.25, image_angle, image_blend, image_alpha);
                                
                                draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 0, x, y-40 + walkBounce, 0.25, 0.25, image_angle, outfitTopCol, image_alpha);
                                    
                                if (peeHold == 0)
                                    {
                                        rightArmAngle = (rightArmAngle + 0)*0.5;
                                        leftArmAngle = (leftArmAngle + 0)*0.5;
                                    }
                                    else
                                        {
                                                leftLegSquish = 1;
                                                rightLegSquish = 1;
                                            rightArmAngle = (rightArmAngle + 42)*0.5;
                                            leftArmAngle = (leftArmAngle - 42)*0.5;
                                        }
                                draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x-5, y-42 + walkBounce, 0.25, 0.25, rightArmAngle + 20 - 20*leftLegSquish +image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x+6, y-42 + walkBounce, -0.25, 0.25, leftArmAngle - 20 + 20*rightLegSquish +image_angle, skinCol, image_alpha);
                                    
                                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x-5, y-42 + walkBounce, 0.25, 0.25, rightArmAngle + 20 - 20*leftLegSquish +image_angle, outfitTopCol, image_alpha);
                                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+6, y-42 + walkBounce, -0.25, 0.25, leftArmAngle - 20 + 20*rightLegSquish +image_angle, outfitTopCol, image_alpha);
                    
                                break;
                    case "up":
                                
                                if (peeHold == 0)
                                    {
                                        rightArmAngle = (rightArmAngle + 0)*0.5;
                                        leftArmAngle = (leftArmAngle + 0)*0.5;
                                            var leftLegSquish2 = leftLegSquish;
                                            var rightLegSquish2 = rightLegSquish;
                                    }
                                    else
                                        {
                                                var leftLegSquish2 = 1;
                                                var rightLegSquish2 = 1;
                                            rightArmAngle = (rightArmAngle + 42)*0.5;
                                            leftArmAngle = (leftArmAngle - 42)*0.5;
                                        }
                                draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x-5, y-42 + walkBounce, 0.25, 0.25, rightArmAngle + 20 - 20*leftLegSquish2 +image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_Arm, frames, x+6, y-42 + walkBounce, -0.25, 0.25, leftArmAngle - 20 + 20*rightLegSquish2 +image_angle, skinCol, image_alpha);
                                    
                                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x-5, y-42 + walkBounce, 0.25, 0.25, rightArmAngle + 20 - 20*leftLegSquish2 +image_angle, outfitTopCol, image_alpha);
                                    draw_sprite_ext(spr_outfit_Arms, outfitTopCustom, x+6, y-42 + walkBounce, -0.25, 0.25, leftArmAngle - 20 + 20*rightLegSquish2 +image_angle, outfitTopCol, image_alpha);
                                
                                draw_sprite_ext(spr_paperDoll_Parts_Head_Back, frames, x, y-40 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_hair_START + hairCustom, 1, x, y-40 + walkBounce, 0.25, 0.25, image_angle, hairCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_upBody, frames, x, y-31 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_lowBody, frames, x, y-40 + walkBounce, 0.25, 0.25, image_angle, skinCol, image_alpha);
                                    
                                draw_sprite_ext(spr_paperDoll_Parts_Leg, frames, x-3, y-20, 0.25, 0.25*leftLegSquish, image_angle + 20 - 20*leftLegSquish, skinCol, image_alpha);
                                    draw_sprite_ext(spr_paperDoll_Parts_Leg, frames, x+5, y-20, -0.25, 0.25*rightLegSquish, image_angle - 20 + 20*rightLegSquish, skinCol, image_alpha);
                                    
                                draw_sprite_ext(spr_diaper_START + diaperCustom, 1, x, y-40 + walkBounce, 0.25, 0.25, image_angle, image_blend, image_alpha);
                                
                                draw_sprite_ext(spr_outfitTop_START + outfitTopCustom, 1, x, y-40 + walkBounce, 0.25, 0.25, image_angle, outfitTopCol, image_alpha);
                                    
                                
                    
                                break;
                }
                break;
    }
