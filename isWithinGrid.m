function ok = isWithinGrid (N, x, y)
    ok = 0;
    if (x >= 1 && y >= 1 && x <= N && y <= N)
        ok = 1;
    end
end