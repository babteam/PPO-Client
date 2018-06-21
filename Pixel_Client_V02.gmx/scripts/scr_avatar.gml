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

playerType = 1;  //decide what playertype means later
switch(playerType)
    {
        default:
            switch(dir)
                {
                    case "right":
                                draw_sprite_ext(spr_paperdoll_skin1, frames + 6, x, y, image_xscale, image_yscale, image_angle, skinCol, image_alpha);
                                draw_sprite_ext(hairCustom, frames + 6, x, y, image_xscale, image_yscale, image_angle, hairCol, image_alpha);
                                draw_sprite_ext(outfitCustom, frames + 6, x, y, image_xscale, image_yscale, image_angle, outfitCol, image_alpha);
                                break;
                    case "left":
                                draw_sprite_ext(spr_paperdoll_skin1, frames + 9, x, y, image_xscale, image_yscale, image_angle, skinCol, image_alpha);
                                draw_sprite_ext(hairCustom, frames + 9, x, y, image_xscale, image_yscale, image_angle, hairCol, image_alpha);
                                draw_sprite_ext(outfitCustom, frames + 9, x, y, image_xscale, image_yscale, image_angle, outfitCol, image_alpha);
                                break;
                    case "down":
                                draw_sprite_ext(spr_paperdoll_skin1, frames, x, y, image_xscale, image_yscale, image_angle, skinCol, image_alpha);
                                draw_sprite_ext(hairCustom, frames, x, y, image_xscale, image_yscale, image_angle, hairCol, image_alpha);
                                draw_sprite_ext(outfitCustom, frames, x, y, image_xscale, image_yscale, image_angle, outfitCol, image_alpha);
                                break;
                    case "up":
                                draw_sprite_ext(spr_paperdoll_skin1, frames + 3, x, y, image_xscale, image_yscale, image_angle, skinCol, image_alpha);
                                draw_sprite_ext(hairCustom, frames + 3, x, y, image_xscale, image_yscale, image_angle, hairCol, image_alpha);
                                draw_sprite_ext(outfitCustom, frames + 3, x, y, image_xscale, image_yscale, image_angle, outfitCol, image_alpha);
                                break;
                }
                break;
    }
