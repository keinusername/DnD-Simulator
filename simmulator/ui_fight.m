function ui_fight(btn_F,ax_WL,ax_HP_1,ax_HP_2,ax_R)
    chars = load('chars.mat');
    C1 = chars.C1;
    C2 = chars.C2;
    res = fight(C1,C2,10000);
    ui_plot_res(C1,C2,ax_WL,ax_HP_1,ax_HP_2,ax_R,res);
end