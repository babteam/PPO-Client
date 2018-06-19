//if we are moving right
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

