#define scr_standCheck
//detemine if we're standing
if (!leftKey && !rightKey && !downKey && !upKey) && (!jumping && !falling)
{
    if (state != "throwing")
    {
        if (duckKey)
        {
            state = "ducking";
        }
        else
        {
            state = "standing";
        }
    }
    

}


#define scr_leftCheck
//if we are moving left
if (leftKey)
{
        if (!rightKey) dir = "left";
    var maxSpeed = 0;
    if (sprintKey)
    {
        state = "running";
        maxSpeed = -runningMaxSpd;
        acc = runningAcc;
    }
    else
    {
        state = "walking";
        maxSpeed = -walkingMaxSpd;
        acc = walkingAcc;
    }
    
    if (hspd > maxSpeed)
    {
        hspd -= acc;
    }
}


#define scr_rightCheck
//if we are moving right
if (rightKey)
{
        if (!leftKey) dir = "right";
    var maxSpeed = 0;
    if (sprintKey)
    {
        state = "running";
        maxSpeed = runningMaxSpd;
        acc = runningAcc;
    }
    else
    {
        state = "walking";
        maxSpeed = walkingMaxSpd;
        acc = walkingAcc;
    }
    
    if (hspd < maxSpeed)
    {
        hspd += acc;
    }
}


#define scr_downCheck
//if we are moving down
if (downKey)
{
       if (!upKey) dir = "down";
    var maxSpeed = 0;
    if (sprintKey)
    {
        state = "running";
        maxSpeed = runningMaxSpd;
        acc = runningAcc;
    }
    else
    {
        state = "walking";
        maxSpeed = walkingMaxSpd;
        acc = walkingAcc;
    }
    
    if (vspd < maxSpeed)
    {
        vspd += acc;
    }
    
}


#define scr_upCheck
//if we are moving up
if (upKey)
{
        if (!downKey) dir = "up";
    var maxSpeed = 0;
    if (sprintKey)
    {
        state = "running";
        maxSpeed = -runningMaxSpd;
        acc = runningAcc;
    }
    else
    {
        state = "walking";
        maxSpeed = -walkingMaxSpd;
        acc = walkingAcc;
    }
    
    if (vspd > maxSpeed)
    {
        vspd -= acc;
    }
}


#define scr_jumpCheck
//if we are jumping
if (jumping)
{
    //we're still gaining altitude
    if (vspd < 0)
    {
        jumping = true;
    }
    else//we're falling
    {
        jumping = false;
        falling = true;
    }
}