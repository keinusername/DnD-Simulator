close all
%% Setup the contestants

name = 'Eddy';
at = [15 12 12 18 9 10];% St De Co Wi In Ch
lvl = 5;
RB = 5; % all except dex
W = [1 6]; %weapon dice dice
DB = 1; %damage bonus, except strength
two_handed = 0; %1 if yes, 0 if no
AB = 1;

C1 = charac(name,at,lvl,RB,W,DB,AB,two_handed);

name = 'Oscar';
at = [15 12 12 18 9 10];% St De Co Wi In Ch
lvl = 5;
RB = 6; % all except dex
W = [1 6]; %weapon dice dice
DB = 1; %damage bonus, except strength
two_handed = 0; %1 if yes, 0 if no
AB = 1;

C2 = charac(name,at,lvl,RB,W,DB,AB,two_handed);


%%
chars = load('chars.mat');
C1 = chars.C1;
C2 = chars.C2;
res = fight(C1,C2,1000);
plot_res(C1,C2,res);

%%
close all
info = uifigure();
info.Position = [-648   498   330   160];
info.Name = 'INFO';

IT = uitable(info);

attackstring_1 = char(join(['+',string(C1.GAB + C1.AB + C1.mods(1)),'  ',string(C1.W(1)),'W',string(C1.W(2)),'+',string(C1.mods(1) + C1.DB)])); 
attackstring_2 = char(join(['+',string(C2.GAB + C2.AB + C2.mods(1)),'  ',string(C2.W(1)),'W',string(C2.W(2)),'+',string(C2.mods(1) + C2.DB)])); 
data = {C1.clas.name,C2.clas.name;
        C1.lvl,C2.lvl;
        C1.RK,C2.RK;
        C1.HP,C2.HP;
        attackstring_2,attackstring_1};
    
IT.Position = [20 20 300 140];
IT.Data = data;
IT.ColumnName = {C1.name,C2.name};
IT.RowName = {'class';'lvl';'RK';'HP';'Attack'};


%%

testf = uifigure();
testf.Position = [-648   498   330   160];
testf.Name = 'TESTF';

field = uieditfield(testf,'numeric');
field.Position = [100   120   100    22];
btn = uibutton(testf,'push','ButtonPushedFcn', @(btn,event) testf(btn,2));
btn.Position = [100  80   100    22];


% btn.ButtonPushedFcn = @(btn,event) testf(btn,field.Value);



