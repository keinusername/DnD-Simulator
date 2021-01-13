%necessary info for a fighter

fighter.name = 'Fighter';
fighter.TW = 10;
fighter.GAB =1:1:25;
fighter.Re = [0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6];
fighter.Wi = [0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6];
fighter.Fo = [2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12];

monk.name = 'Monk';
monk.TW = 8;
monk.GAB = [0 1 2 3 3 4 5 6 6 7 8 9 9 10 11 12 12 13 14 15];
monk.Re = [2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12];
monk.Wi = [2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12];
monk.Fo = [2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12];

druide.name = 'Druide';
druide.TW = 8;
druide.GAB = [0 1 2 3 3 4 5 6 6 7 8 9 9 10 11 12 12 13 14 15];
druide.Re = [0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6];
druide.Wi = [2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12];
druide.Fo = [2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12];



save('classinfo.mat','fighter','monk','druide');