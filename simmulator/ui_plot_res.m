% addpted plot_res for GUI, axes etc. are already set up in GUI so only the
% plotting needs to be done
function fig_res = plot_res(C1,C2,ax_WL,ax_HP_1,ax_HP_2,ax_R,res)
    
    W = waitbar(0,'Plotting..');
    W.Position = [-600  450  270.0000   56.2500];
    
    cla(ax_WL)
    res_W_count  = sum(res(:,[1 3 5]),1); % sum of absulte win numbers
    res_r = res_W_count ./ length(res(:,1)); %relative winrates
    bar(ax_WL,res_r);
    lbl1 = join([C1.name ' wins']);
    lbl2 = join([C2.name ' wins']);
    ax_WL.XTickLabel = {lbl1 lbl2 'draw'};
    ax_WL.YTick = [0 0.25 0.5 0.75 1];
    ax_WL.YTickLabel = {0 25 50 75 100};
    ax_WL.YLim = [0 1];
    
    waitbar(0.25,W,'Plotting..');
    
    mean_HP = mean(res(:,[2 4]),1);
    std_HP = std(res(:,[2 4]),ones(length(res(:,1)),1),1);
    cla(ax_HP_1)
    ax_HP_1.NextPlot = 'add';
    H1 = histogram(ax_HP_1,res(:,2),'DisplayName','histogram');
    errorbar(ax_HP_1,mean_HP(1),max(H1.Values)/2,std_HP(1),'horizontal','o','DisplayName','mean - std');
    ax_HP_1.Title.String = join(['Remaining HP ' C1.name]);

    waitbar(0.5,W,'Plotting..');
    
    cla(ax_HP_2)
    ax_HP_2.NextPlot = 'add';
    H2 = histogram(ax_HP_2,res(:,4),'DisplayName','histogram');
    errorbar(ax_HP_2,mean_HP(2),max(H2.Values)/2,std_HP(2),'horizontal','o','DisplayName','mean - std');
    ax_HP_2.Title.String = join(['Remaining HP ' C2.name]);
    ax_HP_2.YLim = [0 max([max(max(H1.Values)*1.2 , H2.Values)*1.2])];
    ax_HP_2.XLim = [min([H2.BinLimits(1),H1.BinLimits(1)]) max([H2.BinLimits(2),H1.BinLimits(2)])];;
    
    linkaxes([ax_HP_1,ax_HP_2],'y');
    linkaxes([ax_HP_1,ax_HP_2],'x');
    
    waitbar(0.75,W,'Plotting..');
    
    mean_R = mean(res(:,6));
    std_R = std(res(:,6));
    
    cla(ax_R);
    ax_R.NextPlot = 'add';
    H3 = histogram(ax_R,res(:,6),'DisplayName','histogram');
    ax_R.YLim = [0 max(H3.Values)*1.2];
    ax_R.XLim = H3.BinLimits;
    
    close(W);
end