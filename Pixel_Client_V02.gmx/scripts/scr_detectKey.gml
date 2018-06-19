if (!global.typing)
{
    rightKey    = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0);
    leftKey     = keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < 0);
    downKey     = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0);
    upKey       = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) < 0);
    
    jumpKey     = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(0, gp_face1);
    sprintKey   = keyboard_check(vk_shift)          || gamepad_button_check(0, gp_face3);
    duckKey     = keyboard_check(ord("V"));  //why is this here
}
