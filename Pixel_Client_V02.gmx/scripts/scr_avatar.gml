draw_self();
draw_set_font(fnt_small);
draw_set_colour(c_maroon);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_text(x, y-50, string(remotePlayerId));
if(id != obj_localplayer.id)
    {
        draw_text(x, y-70, string(remotePlayerName));
    }



draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);


switch(playerType)
    {
        default:
            switch(dir)
                {
                    case "right":
                                draw_sprite_ext(spr_paperdoll_skin1, frames + 6, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                draw_sprite_ext(spr_paperdoll_hair, frames + 6, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
                                break;
                    case "left":
                                draw_sprite_ext(spr_paperdoll_skin1, frames + 9, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                draw_sprite_ext(spr_paperdoll_hair, frames + 9, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
                                break;
                    case "down":
                                draw_sprite_ext(spr_paperdoll_skin1, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                draw_sprite_ext(spr_paperdoll_hair, frames, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
                                break;
                    case "up":
                                draw_sprite_ext(spr_paperdoll_skin1, frames + 3, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                draw_sprite_ext(spr_paperdoll_hair, frames + 3, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
                                break;
                }
                break;
    }
