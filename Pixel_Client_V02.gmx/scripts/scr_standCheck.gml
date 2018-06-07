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

