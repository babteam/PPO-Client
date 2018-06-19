//if we are moving down
if (downKey && !upKey)
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

