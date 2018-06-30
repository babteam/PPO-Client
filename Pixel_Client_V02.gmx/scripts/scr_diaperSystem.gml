if( diaperCustom > spr_diaper_START )
    {
        if ( pee < maxPee )
            {
                pee = pee + hydration;
            }
        else
            {
                if( (diaperCustom - spr_diaper_START)%3 > 0 )
                    diaperCustom++;  // % means modulo, divides by the number and returns the remainder instead
                    
                pee = 0;
            }
    }
    
    
if (hydration > 1)
    hydration = hydration - 0.0001;
