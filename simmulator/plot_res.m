function fig_res = plot_res(C1,C2,res)
    fig_res = figure;
    %plot win statistics
    ax_WL = subplot(2,3,[1,3]);
    res_W_count  = sum(res(:,[1 3 5]),1); % sum of absulte win numbers
    res_r = res_W_count ./ length(res(:,1)); %relative winrates
    bar(res_r);
    lbl1 = join([C1.name ' wins']);
    lbl2 = join([C2.name ' wins']);
    ax_WL.XTickLabel = {lbl1 lbl2 'draw'};
    ax_WL.Title.String = 'Fighting results';
    ax_WL.YLabel.String = '%';
    ax_WL.YLim = [0 1];
    ax_WL.YTickLabel = {0 25 50 75 100};

    %plot healt at the end of each fight statistics
    mean_HP = mean(res(:,[2 4]),1);
    std_HP = std(res(:,[2 4]),ones(length(res(:,1)),1),1);

    ax_HP_1 = subplot(2,3,4);
    ax_HP_1.NextPlot = 'add';
    H1 = histogram(res(:,2),'DisplayName','histogram');
    errorbar(mean_HP(1),max(H1.Values)/2,std_HP(1),'horizontal','o','DisplayName','mean - std');
    ax_Hp_1.YLabel.String = 'HP';
    ax_HP_1.Title.String = join(['Remaining HP ' C1.name]);
    ax_HP_1.Legend;

    ax_HP_2 = subplot(2,3,5);
    ax_HP_2.NextPlot = 'add';
    H2 = histogram(res(:,4),'DisplayName','histogram');
    errorbar(mean_HP(2),max(H2.Values)/2,std_HP(2),'horizontal','o','DisplayName','mean - std');
    ax_Hp_2.YLabel.String = 'HP';
    ax_HP_2.YTick = [];
    ax_HP_2.Title.String = join(['Remaining HP ' C1.name]);
    ax_HP_2.Legend;

    linkaxes([ax_HP_1,ax_HP_2],'y');
    linkaxes([ax_HP_1,ax_HP_2],'x');

    %plot rounds fought statistics
    mean_R = mean(res(:,6));
    std_R = std(res(:,6));

    ax_R = subplot(2,3,6);
    ax_R.NextPlot = 'add';
    H3 = histogram(res(:,6),'DisplayName','histogram');
    errorbar(mean_R,max(H3.Values)/2,std_R,'horizontal','o','DisplayName','mean - std');
    ax_R.YLabel.String = 'rounds';
    ax_R.YTick = [];
    ax_R.Title.String = 'rounds played';
    ax_R.Legend;
end