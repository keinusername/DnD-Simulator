%input: attributs; output: modifiers
function mods = modi(ats);
    mods = zeros(1,6);
    mod_list = -5:1:10;
    at_list = 0:1:30;

    for n = 1:1:6
        a = ats(n);
        ind = ceil(length(at_list(at_list <= a)) / 2);
        mods(n) = mod_list(ind);
    end
end
    

