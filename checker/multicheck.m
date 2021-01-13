function multicheck(SG,skill);
    players = {'Marl','Phip','Lino','Juli','Mari'};
    mods = [2 0 2 1 7 7 2;
        0 -1 0 6 7 10 0;
        0 0 0 8 2 7 0 ;
        -1 3 7 10 1 4 -1;
        4 1 4 4 9 9 8];
            
    skill = string(skill);
    if skill == 're'
        check = randi(20,5,1) + mods(:,4);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    elseif skill == 'su'
        check = randi(20,5,1) + mods(:,2);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    elseif skill == 'en'
        check = randi(20,5,1) + mods(:,1);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    elseif skill == 'la'
        check = randi(20,5,1) + mods(:,3);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    elseif skill == 'wi'
        check = randi(20,5,1) + mods(:,5);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    elseif skill == 'za'
        check = randi(20,5,1) + mods(:,6);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    elseif skill == 'ge'
        check = randi(20,5,1) + mods(:,7);
        check = check >= SG;
        res = table(players',check);
        disp(res);
    end
end
