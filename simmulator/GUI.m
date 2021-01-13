gui = uifigure();
gui.Position = [-1300 300 1200 600];
grid = uigridlayout(gui,[20 45]);

%% set up input boxes
T1 = uitextarea(grid,'Value','Player 1 Inputvalues');
T1.Layout.Row = 1;
T1.Layout.Column = [1 7];

T2 = uitextarea(grid,'Value','Name');
T2.Layout.Row = 2;
T2.Layout.Column = [1 4];
F2 = uieditfield(grid,'text');
F2.Layout.Row = 2;
F2.Layout.Column = [5 7];

T3 = uitextarea(grid,'Value','Class');
T3.Layout.Row = 3;
T3.Layout.Column = [1 4];
F3 = uidropdown(grid);
F3.Items = {'Fighter','Monk','Druide'};
F3.Layout.Row = 3;
F3.Layout.Column = [5 7];

T4 = uitextarea(grid,'Value','Level');
T4.Layout.Row = 4;
T4.Layout.Column = [1 4];
F4 = uieditfield(grid,'numeric');
F4.Layout.Row = 4;
F4.Layout.Column = 6;

T5 = uitextarea(grid,'Value','Armorbonus');
T5.Layout.Row = 5;
T5.Layout.Column = [1 4];
F5 = uieditfield(grid,'numeric');
F5.Layout.Row = 5;
F5.Layout.Column = 6;

T6 = uitextarea(grid,'Value','Weapondice');
T6.Layout.Row = 6;
T6.Layout.Column = [1 4];
F6a = uieditfield(grid,'numeric');
F6a.Layout.Row = 6;
F6a.Layout.Column = 5;
T6a = uitextarea(grid,'Value','D');
T6a.Layout.Row = 6;
T6a.Layout.Column = 6;
F6b = uieditfield(grid,'numeric');
F6b.Layout.Row = 6;
F6b.Layout.Column = 7;

T7 = uitextarea(grid,'Value','Damagebonus');
T7.Layout.Row = 7;
T7.Layout.Column = [1 4];
F7 = uieditfield(grid,'numeric');
F7.Layout.Row = 7;
F7.Layout.Column = 6;

T8 = uitextarea(grid,'Value','Attackbonus');
T8.Layout.Row = 8;
T8.Layout.Column = [1 4];
F8 = uieditfield(grid,'numeric');
F8.Layout.Row = 8;
F8.Layout.Column = 6;

T9 = uitextarea(grid,'Value','Twohanded');
T9.Layout.Row = 9;
T9.Layout.Column = [1 4];
F9 = uicheckbox(grid);
F9.Layout.Row = 9;
F9.Layout.Column = 6;


T10 = uitextarea(grid,'Value','Player 2 Inputvalues');
T10.Layout.Row = 11;
T10.Layout.Column = [1 7];

T11 = uitextarea(grid,'Value','Name');
T11.Layout.Row = 12;
T11.Layout.Column = [1 4];
F11 = uieditfield(grid,'text');
F11.Layout.Row = 12;
F11.Layout.Column = [5 7];

T12 = uitextarea(grid,'Value','Class');
T12.Layout.Row = 13;
T12.Layout.Column = [1 4];
F12 = uidropdown(grid);
F12.Items = {'Fighter','Monk','Druide'};
F12.Layout.Row = 13;
F12.Layout.Column = [5 7];

T13 = uitextarea(grid,'Value','Level');
T13.Layout.Row = 14;
T13.Layout.Column = [1 4];
F13 = uieditfield(grid,'numeric');
F13.Layout.Row = 14;
F13.Layout.Column = 6;

T14 = uitextarea(grid,'Value','Armorbonus');
T14.Layout.Row = 15;
T14.Layout.Column = [1 4];
F14 = uieditfield(grid,'numeric');
F14.Layout.Row = 15;
F14.Layout.Column = 6;

T15 = uitextarea(grid,'Value','Weapondice');
T15.Layout.Row = 16;
T15.Layout.Column = [1 4];
F15a = uieditfield(grid,'numeric');
F15a.Layout.Row = 16;
F15a.Layout.Column = 5;
T15a = uitextarea(grid,'Value','D');
T15a.Layout.Row = 16;
T15a.Layout.Column = 6;
F15b = uieditfield(grid,'numeric');
F15b.Layout.Row = 16;
F15b.Layout.Column = 7;

T16 = uitextarea(grid,'Value','Damagebonus');
T16.Layout.Row = 17;
T16.Layout.Column = [1 4];
F16 = uieditfield(grid,'numeric');
F16.Layout.Row = 17;
F16.Layout.Column = 6;

T17 = uitextarea(grid,'Value','Attackbonus');
T17.Layout.Row = 18;
T17.Layout.Column = [1 4];
F17 = uieditfield(grid,'numeric');
F17.Layout.Row =18;
F17.Layout.Column = 6;

T18 = uitextarea(grid,'Value','Twohanded');
T18.Layout.Row = 19;
T18.Layout.Column = [1 4];
F18 = uicheckbox(grid);
F18.Layout.Row = 19;
F18.Layout.Column = 6;

%% button to generate characters from input values

btn_C = uibutton(grid);
btn_C.Text = 'Create Chars';
btn_C.Layout.Row = 10;
btn_C.Layout.Column = [2 6];
btn_C.BackgroundColor = [0.4660 0.6740 0.1880];
btn_C.ButtonPushedFcn = @(btn,event) ui_char_gen(btn_C,grid);

%% generate place holders for result plots

ax_WL = uiaxes(grid);
ax_WL.Layout.Row = [1 9];
ax_WL.Layout.Column = [20 45];
lbl1 = join(['Player 1 wins']);
lbl2 = join(['Player 2 wins']);
ax_WL.Title.String = 'Fighting results';
ax_WL.YLabel.String = '%';


ax_HP_1 = uiaxes(grid);
ax_HP_1.Layout.Row = [11 20];
ax_HP_1.Layout.Column = [20 28];
ax_HP_1.NextPlot = 'add';
ax_HP_1.YLabel.String = 'HP';
ax_HP_1.Title.String = 'Remaining HP Player 1';
ax_HP_1.Legend;

ax_HP_2 = uiaxes(grid);
ax_HP_2.Layout.Row = [11 20];
ax_HP_2.Layout.Column = [29 37];
ax_HP_2.NextPlot = 'add';
ax_HP_2.YTick = [];
ax_HP_2.Title.String = 'Remaining HP Player 2';
ax_HP_2.Legend;




ax_R = uiaxes(grid);
ax_R.Layout.Row = [11 20];
ax_R.Layout.Column = [38 45];
ax_R.NextPlot = 'add';
ax_R.YLabel.String = 'rounds';
ax_R.YTick = [];
ax_R.Title.String = 'rounds played';
ax_R.Legend;

%% button to start the fight and plot results

btn_F = uibutton(grid);
btn_F.Text = 'FIGHT!';
btn_F.Layout.Row = 10;
btn_F.Layout.Column = [7 11];
btn_F.BackgroundColor = [0.8500 0.3250 0.0980];
btn_F.ButtonPushedFcn = @(btn,event) ui_fight(btn_F,ax_WL,ax_HP_1,ax_HP_2,ax_R);

%% Attributes
%player 1
A1 = uitextarea(grid,'Value','Attributes');
A1.Layout.Row = 2;
A1.Layout.Column = [9 14];
%str
A2 = uitextarea(grid);
A2.Value = 'St';
A2.Layout.Row = 3;
A2.Layout.Column = [9 10];

A2i = uieditfield(grid,'numeric');
A2i.Layout.Row = 3;
A2i.Layout.Column = [11 12];

A2m = uitextarea(grid);
A2m.Layout.Row = 3;
A2m.Layout.Column = [13 14];

%dex
A3 = uitextarea(grid);
A3.Value = 'De';
A3.Layout.Row = 4;
A3.Layout.Column = [9 10];

A3i = uieditfield(grid,'numeric');
A3i.Layout.Row = 4;
A3i.Layout.Column = [11 12];

A3m = uitextarea(grid);
A3m.Layout.Row = 4;
A3m.Layout.Column = [13 14];

%consti
A4 = uitextarea(grid);
A4.Value = 'Co';
A4.Layout.Row = 5;
A4.Layout.Column = [9 10];

A4i = uieditfield(grid,'numeric');
A4i.Layout.Row = 5;
A4i.Layout.Column = [11 12];

A4m = uitextarea(grid);
A4m.Layout.Row = 5;
A4m.Layout.Column = [13 14];

%wisdom
A5 = uitextarea(grid);
A5.Value = 'Wi';
A5.Layout.Row = 6;
A5.Layout.Column = [9 10];

A5i = uieditfield(grid,'numeric');
A5i.Layout.Row = 6;
A5i.Layout.Column = [11 12];

A5m = uitextarea(grid);
A5m.Layout.Row = 6;
A5m.Layout.Column = [13 14];

%int
A6 = uitextarea(grid);
A6.Value = 'In';
A6.Layout.Row = 7;
A6.Layout.Column = [9 10];

A6i = uieditfield(grid,'numeric');
A6i.Layout.Row = 7;
A6i.Layout.Column = [11 12];

A6m = uitextarea(grid);
A6m.Layout.Row = 7;
A6m.Layout.Column = [13 14];

%charisma
A7 = uitextarea(grid);
A7.Value = 'Ch';
A7.Layout.Row = 8;
A7.Layout.Column = [9 10];

A7i = uieditfield(grid,'numeric');
A7i.Layout.Row = 8;
A7i.Layout.Column = [11 12];

A7m = uitextarea(grid);
A7m.Layout.Row = 8;
A7m.Layout.Column = [13 14];

%player2
B1 = uitextarea(grid,'Value','Attributes');
B1.Layout.Row = 12;
B1.Layout.Column = [9 14];
%str
B2 = uitextarea(grid);
B2.Value = 'St';
B2.Layout.Row = 13;
B2.Layout.Column = [9 10];

B2i = uieditfield(grid,'numeric');
B2i.Layout.Row = 13;
B2i.Layout.Column = [11 12];

B2m = uitextarea(grid);
B2m.Layout.Row = 13;
B2m.Layout.Column = [13 14];

%dex
B3 = uitextarea(grid);
B3.Value = 'De';
B3.Layout.Row = 14;
B3.Layout.Column = [9 10];

B3i = uieditfield(grid,'numeric');
B3i.Layout.Row = 14;
B3i.Layout.Column = [11 12];

B3m = uitextarea(grid);
B3m.Layout.Row = 14;
B3m.Layout.Column = [13 14];

%consti
B4 = uitextarea(grid);
B4.Value = 'Co';
B4.Layout.Row = 15;
B4.Layout.Column = [9 10];

B4i = uieditfield(grid,'numeric');
B4i.Layout.Row = 15;
B4i.Layout.Column = [11 12];

B4m = uitextarea(grid);
B4m.Layout.Row = 15;
B4m.Layout.Column = [13 14];

%wisdom
B5 = uitextarea(grid);
B5.Value = 'Wi';
B5.Layout.Row = 16;
B5.Layout.Column = [9 10];

B5i = uieditfield(grid,'numeric');
B5i.Layout.Row = 16;
B5i.Layout.Column = [11 12];

B5m = uitextarea(grid);
B5m.Layout.Row = 16;
B5m.Layout.Column = [13 14];

%int
B6 = uitextarea(grid);
B6.Value = 'In';
B6.Layout.Row = 17;
B6.Layout.Column = [9 10];

B6i = uieditfield(grid,'numeric');
B6i.Layout.Row = 17;
B6i.Layout.Column = [11 12];

B6m = uitextarea(grid);
B6m.Layout.Row = 17;
B6m.Layout.Column = [13 14];

%charisma
B7 = uitextarea(grid);
B7.Value = 'Ch';
B7.Layout.Row = 18;
B7.Layout.Column = [9 10];

B7i = uieditfield(grid,'numeric');
B7i.Layout.Row = 18;
B7i.Layout.Column = [11 12];

B7m = uitextarea(grid);
B7m.Layout.Row = 18;
B7m.Layout.Column = [13 14];