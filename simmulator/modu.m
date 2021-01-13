%generates a modifier from an attributes
function modu = modu(at)
    mod_list = -5:1:10;
    at_list = 0:1:30;
    ind = ceil(length(at_list(at_list <= at)) / 2);
    modu = mod_list(ind);
end