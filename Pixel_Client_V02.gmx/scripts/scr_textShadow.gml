var xxt = argument0;
var yyt = argument1;
var tempText = argument2;

draw_set_alpha(0.7);
draw_set_colour(c_black);

    draw_text(xxt + 2, yyt + 2, tempText);

draw_set_alpha(1);
draw_set_colour(c_white);

    draw_text(xxt, yyt, tempText);
