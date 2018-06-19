//if we are moving right
if (rightKey && !leftKey)
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

