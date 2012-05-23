function new_pos = floorToGrid (N, pos)
    
    x = pos(1,1);
    y = pos(1,2);
    
    if ( x < 1 )
        x = 1;   
    elseif ( x > N )
        x = N;
    end
    
    if ( y < 1 )
        y = 1;
    elseif ( y > N )
        y = N;
    end
    
    new_pos = [x,y];
end