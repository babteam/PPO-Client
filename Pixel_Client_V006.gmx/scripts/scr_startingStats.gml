///initialize some variables

gamepad_set_axis_deadzone (0, 0.25);

name = "You";

grav = 1;

def_spd = 10; //default running speed
def_acc = 5; //default running acceleration

spd = 10; //running speed
jspd = 12;
hspd = 0;
vspd = 0;
//- xspd=0;
// -yspd=0;
state = "standing";
    state2 = 0;
dir = "right";
jumping = false;
falling = false;
fric = 0.5; //custom friction variable
walkingAcc = def_acc*0.5;
walkingMaxSpd = spd*0.5;
runningAcc = def_acc;
runningMaxSpd = spd;
terminalVelocity = 50;
animSpeed = 0;
frames=0;

isTyping = 0;

respawnxx = 100;  //set by room warps, prevents player from being stuck outside room
respawnyy = 100;

actionKey = false; //just to make sure key is declared before interract asks for it
inventory_open = -1;  // inventory is Tab key, or start on controller

stunned = 0; //how many frames you can't move for
scriptMove = 0; //what scripted movement the player is currently on
scriptMoveCount = 0; //a counter for the current script

//==========================================================
hairCustom = global.hairCustom;
outfitTopCustom = global.outfitTopCustom;
outfitBottomCustom = global.outfitBottomCustom;
skinCustom = global.skinCustom;
diaperCustom = global.diaperCustom;
skinCol = global.skinCol;
hairCol = global.hairCol;
outfitTopCol = global.outfitTopCol;
outfitBottomCol = global.outfitBottomCol;

//==========================================================
//=====       body animation variables      =====
rightArmAngle = 0;
leftArmAngle = 0;

rightLegSquish = 1;
leftLegSquish = 1;

peeDance = 0;

emoteFace = spr_emoteFace_neutral;
emoteTime = 0;

playerSize = 0.25;
faceVars = 0; //0-Neutral, 1-Happy, 2-Sad, 3-Scared, 4-Angry

fishing = 0;

//==========================================================
pee = 0;
maxPee = random_range(16000, 20000); //about 7 to 11 minutes?
hydration = 1;  //multiplier for how fast the previous reaches max

peeHold = 0;

pamperBucks = 0;


projectileCount = 0;

//===========================================================

//ask server the current game time
buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 23);
network_send_packet(obClient.socket, global.buffer, buffer_tell(global.buffer));
