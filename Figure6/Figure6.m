%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots Figure 6 using data created by the program file
% Fig6_data.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for ggga=1:2
    ga=ggga-1;
    for bbb1=1:2
        if ga==0
            B1=bbb1*20;
            XL=40;
            EE=0:2:40;
            dX=[mean(readmatrix(['a0',num2str(bbb1),'X1.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'X2.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'X3.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'X4.txt']),2)]';
            dF=[mean(readmatrix(['a0',num2str(bbb1),'F1.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'F2.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'F3.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'F4.txt']),2)]';
            dT=[mean(readmatrix(['a0',num2str(bbb1),'T1.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'T2.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'T3.txt']),2) mean(readmatrix(['a0',num2str(bbb1),'T4.txt']),2)]';
            for ee=1:3                   % loop for e
                e=0.3*(ee-1)+0.1;
                figure
                set(gcf, 'Position',  [100, 100, 1200, 300])
                
                subplot(1,3,1)
                plot(EE,dX(1:4,21*(ee-1)+1:21*(ee-1)+21),'LineWidth',3)
                xlim([0 XL])
                ylim([0,10])
                set(gca,'FontSize',15)
                xlabel('b_2','Fontsize',30)
                ylabel('X','Fontsize',30)
                
                subplot(1,3,3)
                plot(EE,dF(1:4,21*(ee-1)+1:21*(ee-1)+21),'LineWidth',3)
                xlim([0 XL])
                ylim([0,1])
                set(gca,'FontSize',15)
                xlabel('b_2','Fontsize',30)
                ylabel('f','Fontsize',30)
                legend('5','10','15','20','Fontsize',15,'Location','northwest')
                
                subplot(1,3,2)
                plot(EE,dT(1:4,21*(ee-1)+1:21*(ee-1)+21),'LineWidth',3)
                xlim([0 XL])
                ylim([0,1])
                set(gca,'FontSize',15)
                xlabel('b_2','Fontsize',30)
                ylabel('\theta','Fontsize',25)
                
                print([num2str(B1),'e',num2str(10*e)],'-dpng') 
            end
        end
        
        
        if ga==1
            B1=100+200*(bbb1-1);
            for zzz=1:2           % loop for Z0
                Z0=50+250*(zzz-1);            
                XL=40;
                EE=0:2:40;
                dX=[mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'X1.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'X2.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'X3.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'X4.txt']),2)]';
                dF=[mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'F1.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'F2.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'F3.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'F4.txt']),2)]';
                dT=[mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'T1.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'T2.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'T3.txt']),2) mean(readmatrix(['a1z',num2str(zzz),num2str(bbb1),'T4.txt']),2)]';
                for ee=1:3                   % loop for e
                    e=0.2*(ee-1)+0.1;
                    figure
                    set(gcf, 'Position',  [100, 100, 1200, 300])
                    
                    subplot(1,3,1)
                    plot(EE,dX(1:4,21*(ee-1)+1:21*(ee-1)+21),'LineWidth',3)
                    xlim([0 XL])
                    ylim([0,10])
                    set(gca,'FontSize',15)
                    xlabel('b_2','Fontsize',30)
                    ylabel('X','Fontsize',30)
                    
                    subplot(1,3,3)
                    plot(EE,dF(1:4,21*(ee-1)+1:21*(ee-1)+21),'LineWidth',3)
                    xlim([0 XL])
                    ylim([0,1])
                    set(gca,'FontSize',15)
                    xlabel('b_2','Fontsize',30)
                    ylabel('f','Fontsize',30)
                    legend('5','10','15','20','Fontsize',15,'Location','northwest')
                    
                    subplot(1,3,2)
                    plot(EE,dT(1:4,21*(ee-1)+1:21*(ee-1)+21),'LineWidth',3)
                    xlim([0 XL])
                    ylim([0,1])
                    set(gca,'FontSize',15)
                    xlabel('b_2','Fontsize',30)
                    ylabel('\theta','Fontsize',25)
                    
                    print(['GSP',num2str(B1/100),num2str(Z0/10),'e',num2str(10*e)],'-dpng')
                end
            end
        end
    end
end
