function res = fight(C1,C2,n)
    W = waitbar(0.5,'setting up..');
    W.Position = [-600  450  270.0000   56.2500];
    n_f = n;% number of iterations
    res = zeros(n_f,6); %saved results: winC1 remainingHP1 winC2 remainingHP2 draws rounds
    for n = 1:1:n_f
        waitbar(n/n_f,W,'Fighting');
    %initialize
        HP1 = C1.HP;
        HP2 = C2.HP;
        rounds = 0;
    %fight till death
        while HP1 > 0 && HP2 > 0
            [A1, D1] = C1.attack('full');
            dmg1 = sum(D1(A1 > C2.RK));
            HP2 = HP2 - dmg1;
            [A2, D2] = C2.attack('full');
            dmg2 = sum(D2(A2 > C1.RK));
            HP1 = HP1 - dmg2;
            rounds = rounds + 1;
        end
    %save results
        res(n,2) = HP1;
        res(n,4) = HP2;
        res(n,6) = rounds;
        if HP1 > 0 && HP2 <= 0
            res(n,1) = res(n,1) + 1;
        elseif HP1 <= 0 && HP2 > 0
            res(n,3) = res(n,3) + 1;
        elseif HP1 <= 0 && HP2 <= 0
            res(n,5) = res(n,5) +1;
        end
    end
    close(W);
end