function ui_char_gen(btn,grid);
%% this helps to find the right indices from the many ui objects in the grid
%     [t1,t2,f2,t3,f3,t4,f4,t5,f5,t6,f6a,t6a,f6b,t7,f7,t8,f8,t9,f9,t10,t11,f11,t12,f12,t13,f13,t14,f14,t15,f15a,t15a,f15b,t16,f16,t17,f17,t18,f18]
%     [1 , 2, 3,4 ,5 , 6, 7, 8, 9,10,11 ,12 , 13,14,15,16,17,18,19,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30  , 31 , 32 , 33,34 ,35 ,36 ,37 , 38]
%     
%     [A1 A2 A3 A4 A5 A6 A7 B1 B2 B3 B4 B5 B6 B7]
%     [41 42 45 48 51 54 57 60 61 64 67 70 73 76]
%%
    K = waitbar(0,'Generating Character...');
    K.Position = [-600  450  270.0000   56.2500];
    
    CH = grid.Children(5:end); %load the neaded infos from the GUI
    
    %assign them to the variable needed fro charac
    at = [CH(43).Value CH(46).Value CH(49).Value CH(52).Value CH(55).Value CH(58).Value];% St De Co Wi In Ch
    
    name = CH(3).Value;
    lvl = CH(7).Value;
    RB = CH(9).Value; % all except dex
    W = [CH(11).Value; CH(13).Value;]; %weapon dice dice
    DB = CH(15).Value; %damage bonus, except strength
    two_handed = CH(19).Value; %1 if yes, 0 if no
    AB = CH(15).Value;
    cn = CH(5).Value;
    
    waitbar(0.25,K,'Generating Character...');
    %geneerate character
    C1 = charac(name,at,lvl,RB,W,DB,AB,two_handed,cn);
    %get modifiers from the charac and write them in the GUI
    CH(44).Value = string(C1.mods(1));
    CH(47).Value = string(C1.mods(2));
    CH(50).Value = string(C1.mods(3));
    CH(53).Value = string(C1.mods(4));
    CH(56).Value = string(C1.mods(5));
    CH(59).Value = string(C1.mods(6)); 
    
    %repeat for second player
    waitbar(0.5,K,'Generating Character...');

    at = [CH(62).Value CH(65).Value CH(68).Value CH(71).Value CH(74).Value CH(77).Value];% St De Co Wi In Ch
    
    name = CH(22).Value;
    lvl = CH(26).Value;
    RB = CH(28).Value; % all except dex
    W = [CH(30).Value; CH(32).Value;]; %weapon dice dice
    DB = CH(34).Value; %damage bonus, except strength
    two_handed = CH(38).Value; %1 if yes, 0 if no
    AB = CH(36).Value;
    cn = CH(24).Value;
    
    waitbar(0.75,K,'Generating Character...');
    
    C2 = charac(name,at,lvl,RB,W,DB,AB,two_handed,cn);
      
    CH(63).Value = string(C2.mods(1));
    CH(66).Value = string(C2.mods(2));
    CH(69).Value = string(C2.mods(3));
    CH(72).Value = string(C2.mods(4));
    CH(75).Value = string(C2.mods(5));
    CH(78).Value = string(C2.mods(6)); 
    
    save('chars.mat','C1','C2')
    
    close(K);
end