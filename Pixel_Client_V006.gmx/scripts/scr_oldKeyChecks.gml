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
    else
    {
        //sprint key released, so slow down.
        if (hspd < maxSpeed)
        {
            hspd += acc*2;
        }
        else
        {   
            hspd = maxSpeed;
        }
    }
}

