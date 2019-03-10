var replaceLater = 0;
switch(dir)
    {
        case "right":
                    switch(replaceLater)
                        {
                            case 0:
                                draw_sprite_ext(spr_walkRight, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 1:
                                draw_sprite_ext(spr_walkRight, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 2:
                                draw_sprite_ext(spr_walkRight, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                        }
                    break;
        case "left":
                    switch(replaceLater)
                        {
                            case 0:
                                draw_sprite_ext(spr_walkLeft, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 1:
                                draw_sprite_ext(spr_walkLeft, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 2:
                                draw_sprite_ext(spr_walkLeft, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                        }
                    break;
        case "down":
                    switch(replaceLater)
                        {
                            case 0:
                                draw_sprite_ext(spr_walkDown, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 1:
                                draw_sprite_ext(spr_walkDown, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 2:
                                draw_sprite_ext(spr_walkDown, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                        }
                    break;
        case "up":
                    switch(replaceLater)
                        {
                            case 0:
                                draw_sprite_ext(spr_walkUp, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 1:
                                draw_sprite_ext(spr_walkUp, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                            case 2:
                                draw_sprite_ext(spr_walkUp, frames, x, y, image_xscale, image_yscale, image_angle, colour, image_alpha);
                                break;
                        }
                    break;
    }
