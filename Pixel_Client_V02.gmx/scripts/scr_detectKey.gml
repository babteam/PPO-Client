if (!global.typing)
{
    rightKey = keyboard_check(ord("D"));
    leftKey = keyboard_check(ord("A"));
    downKey = keyboard_check(ord("S"));
    upKey = keyboard_check(ord("W"));
    jumpKey = keyboard_check_pressed(vk_space);
    sprintKey = keyboard_check(vk_shift);
    duckKey = keyboard_check(ord("V"));
}
