%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots Figure 7 using data created by the program file
% Fig7_data.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ggga=1:2            
    ga=ggga-1;
    
    if ga==0
        for bbb2=1:2
            X1=readmatrix(['a0',num2str(bbb2),'X1.txt']);
            F1=readmatrix(['a0',num2str(bbb2),'F1.txt']);
            T1=readmatrix(['a0',num2str(bbb2),'T1.txt']);
            
            X2=readmatrix(['a0',num2str(bbb2),'X2.txt']);
            F2=readmatrix(['a0',num2str(bbb2),'F2.txt']);
            T2=readmatrix(['a0',num2str(bbb2),'T2.txt']);
            
            X3=readmatrix(['a0',num2str(bbb2),'X3.txt']);
            F3=readmatrix(['a0',num2str(bbb2),'F3.txt']);
            T3=readmatrix(['a0',num2str(bbb2),'T3.txt']);
            
            X4=readmatrix(['a0',num2str(bbb2),'X4.txt']);
            F4=readmatrix(['a0',num2str(bbb2),'F4.txt']);
            T4=readmatrix(['a0',num2str(bbb2),'T4.txt']);
            for ee=1:3                   
                x1=X1(XX*(ee-1)+1:XX*ee,:);
                f1=F1(XX*(ee-1)+1:XX*ee,:);
                t1=T1(XX*(ee-1)+1:XX*ee,:);
                
                x2=X2(XX*(ee-1)+1:XX*ee,:);
                f2=F2(XX*(ee-1)+1:XX*ee,:);
                t2=T2(XX*(ee-1)+1:XX*ee,:);
                
                x3=X3(XX*(ee-1)+1:XX*ee,:);
                f3=F3(XX*(ee-1)+1:XX*ee,:);
                t3=T3(XX*(ee-1)+1:XX*ee,:);
                
                x4=X4(XX*(ee-1)+1:XX*ee,:);
                f4=F4(XX*(ee-1)+1:XX*ee,:);
                t4=T4(XX*(ee-1)+1:XX*ee,:);
                
                n=linspace(0,40,21);
                
                figure
                set(gcf, 'Position',  [100, 100, 400, 900])
                cmap=colormap(lines);
                rc1=cmap(1,:);
                rc2=cmap(2,:);
                rc3=cmap(3,:);
                rc4=cmap(4,:);
                a1=[0 0.3 0.3];
                a2=[0.3 0.3 0.098];
                a3=[0.3 0.3 0.125];
                a4=[0.3 0.184 0.3];
                
                subplot(4,1,1)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),x1(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc1,'LineWidth',0.1)
                end
                plot(n,nanmean(x1,2),'Color',rc1-a1,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 10])
                xlabel('n','Fontsize',25)
                ylabel('X_1','Fontsize',25)
                
                subplot(4,1,2)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),x2(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc2,'LineWidth',0.1)
                end
                plot(n,nanmean(x2,2),'Color',rc2-a2,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 10])
                xlabel('n','Fontsize',25)
                ylabel('X_2','Fontsize',25)
                
                subplot(4,1,3)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),x3(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc3,'LineWidth',0.1)
                end
                plot(n,nanmean(x3,2),'Color',rc3-a3,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 10])
                xlabel('n','Fontsize',25)
                ylabel('X_3','Fontsize',25)
                
                subplot(4,1,4)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),x4(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc4,'LineWidth',0.1)
                end
                plot(n,nanmean(x4,2),'Color',rc4-a4,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 10])
                xlabel('n','Fontsize',25)
                ylabel('X_4','Fontsize',25)
                
                print(['J',num2str(4+8*(bbb2-1)),'aX',num2str(ee)],'-dpng')
                
                
                figure
                set(gcf, 'Position',  [100, 100, 400, 900])
                subplot(4,1,1)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),f1(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc1,'LineWidth',0.1)
                end
                plot(n,nanmean(f1,2),'Color',rc1-a1,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('f_1','Fontsize',25)
                
                subplot(4,1,2)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),f2(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc2,'LineWidth',0.1)
                end
                plot(n,nanmean(f2,2),'Color',rc2-a2,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('f_2','Fontsize',25)
                
                subplot(4,1,3)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),f3(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc3,'LineWidth',0.1)
                end
                plot(n,nanmean(f3,2),'Color',rc3-a3,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('f_3','Fontsize',25)
                
                subplot(4,1,4)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),f4(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc4,'LineWidth',0.1)
                end
                plot(n,nanmean(f4,2),'Color',rc4-a4,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('f_4','Fontsize',25)
                
                print(['J',num2str(4+8*(bbb2-1)),'aF',num2str(ee)],'-dpng')
                
                
                figure
                set(gcf, 'Position',  [100, 100, 400, 900])
                subplot(4,1,1)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),t1(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc1,'LineWidth',0.1)
                end
                plot(n,nanmean(t1,2),'Color',rc1-a1,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('\theta_1','Fontsize',25)
                
                subplot(4,1,2)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),t2(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc2,'LineWidth',0.1)
                end
                plot(n,nanmean(t2,2),'Color',rc2-a2,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('\theta_2','Fontsize',25)
                
                subplot(4,1,3)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),t3(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc3,'LineWidth',0.1)
                end
                plot(n,nanmean(t3,2),'Color',rc3-a3,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('\theta_3','Fontsize',25)
                
                subplot(4,1,4)
                hold on
                for i=1:XX
                    r1=n(i)*ones(1,Runs);
                    scatter(r1+0.35*randn(1,Runs),t4(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc4,'LineWidth',0.1)
                end
                plot(n,nanmean(t4,2),'Color',rc4-a4,'LineWidth',3.5)
                hold off
                set(gca,'FontSize',15)
                xlim([0 40])
                ylim([0 1])
                xlabel('n','Fontsize',25)
                ylabel('\theta_4','Fontsize',25)
                
                print(['J',num2str(4+8*(bbb2-1)),'aC',num2str(ee)],'-dpng')
            end
        end
    end
    
    
    if ga==0
        X1=readmatrix('a1X1.txt');
        F1=readmatrix('a1F1.txt');
        T1=readmatrix('a1T1.txt');
        
        X2=readmatrix('a1X2.txt');
        F2=readmatrix('a1F2.txt');
        T2=readmatrix('a1T2.txt');
        
        X3=readmatrix('a1X3.txt');
        F3=readmatrix('a1F3.txt');
        T3=readmatrix('a1T3.txt');
        
        X4=readmatrix('a1X4.txt');
        F4=readmatrix('a1F4.txt');
        T4=readmatrix('a1T4.txt');
        for ee=1:3
            x1=X1(XX*(ee-1)+1:XX*ee,:);
            f1=F1(XX*(ee-1)+1:XX*ee,:);
            t1=T1(XX*(ee-1)+1:XX*ee,:);
            
            x2=X2(XX*(ee-1)+1:XX*ee,:);
            f2=F2(XX*(ee-1)+1:XX*ee,:);
            t2=T2(XX*(ee-1)+1:XX*ee,:);
            
            x3=X3(XX*(ee-1)+1:XX*ee,:);
            f3=F3(XX*(ee-1)+1:XX*ee,:);
            t3=T3(XX*(ee-1)+1:XX*ee,:);
            
            x4=X4(XX*(ee-1)+1:XX*ee,:);
            f4=F4(XX*(ee-1)+1:XX*ee,:);
            t4=T4(XX*(ee-1)+1:XX*ee,:);
            
            n=linspace(0,40,21);
            
            figure
            set(gcf, 'Position',  [100, 100, 400, 900])
            cmap=colormap(lines);
            rc1=cmap(1,:);
            rc2=cmap(2,:);
            rc3=cmap(3,:);
            rc4=cmap(4,:);
            a1=[0 0.3 0.3];
            a2=[0.3 0.3 0.098];
            a3=[0.3 0.3 0.125];
            a4=[0.3 0.184 0.3];
            
            subplot(4,1,1)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),x1(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc1,'LineWidth',0.1)
            end
            plot(n,nanmean(x1,2),'Color',rc1-a1,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 10])
            xlabel('n','Fontsize',25)
            ylabel('X_1','Fontsize',25)
            
            subplot(4,1,2)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),x2(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc2,'LineWidth',0.1)
            end
            plot(n,nanmean(x2,2),'Color',rc2-a2,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 10])
            xlabel('n','Fontsize',25)
            ylabel('X_2','Fontsize',25)
            
            subplot(4,1,3)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),x3(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc3,'LineWidth',0.1)
            end
            plot(n,nanmean(x3,2),'Color',rc3-a3,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 10])
            xlabel('n','Fontsize',25)
            ylabel('X_3','Fontsize',25)
            
            subplot(4,1,4)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),x4(i,:)+0.02*randn(1,Runs),'MarkerEdgeColor',rc4,'LineWidth',0.1)
            end
            plot(n,nanmean(x4,2),'Color',rc4-a4,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 10])
            xlabel('n','Fontsize',25)
            ylabel('X_4','Fontsize',25)
            
            print(['JnX',num2str(ee)],'-dpng')
            
            
            figure
            set(gcf, 'Position',  [100, 100, 400, 900])
            subplot(4,1,1)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),f1(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc1,'LineWidth',0.1)
            end
            plot(n,nanmean(f1,2),'Color',rc1-a1,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('f_1','Fontsize',25)
            
            subplot(4,1,2)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),f2(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc2,'LineWidth',0.1)
            end
            plot(n,nanmean(f2,2),'Color',rc2-a2,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('f_2','Fontsize',25)
            
            subplot(4,1,3)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),f3(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc3,'LineWidth',0.1)
            end
            plot(n,nanmean(f3,2),'Color',rc3-a3,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('f_3','Fontsize',25)
            
            subplot(4,1,4)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),f4(i,:)+0.002*randn(1,Runs),'MarkerEdgeColor',rc4,'LineWidth',0.1)
            end
            plot(n,nanmean(f4,2),'Color',rc4-a4,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('f_4','Fontsize',25)
            
           print(['JnF',num2str(ee)],'-dpng')
            
            
            figure
            set(gcf, 'Position',  [100, 100, 400, 900])
            subplot(4,1,1)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),t1(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc1,'LineWidth',0.1)
            end
            plot(n,nanmean(t1,2),'Color',rc1-a1,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('\theta_1','Fontsize',25)
            
            subplot(4,1,2)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),t2(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc2,'LineWidth',0.1)
            end
            plot(n,nanmean(t2,2),'Color',rc2-a2,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('\theta_2','Fontsize',25)
            
            subplot(4,1,3)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),t3(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc3,'LineWidth',0.1)
            end
            plot(n,nanmean(t3,2),'Color',rc3-a3,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('\theta_3','Fontsize',25)
            
            subplot(4,1,4)
            hold on
            for i=1:XX
                r1=n(i)*ones(1,Runs);
                scatter(r1+0.35*randn(1,Runs),t4(i,:)+0.003*randn(1,Runs),'MarkerEdgeColor',rc4,'LineWidth',0.1)
            end
            plot(n,nanmean(t4,2),'Color',rc4-a4,'LineWidth',3.5)
            hold off
            set(gca,'FontSize',15)
            xlim([0 40])
            ylim([0 1])
            xlabel('n','Fontsize',25)
            ylabel('\theta_4','Fontsize',25)
            
            print(['JnT',num2str(ee)],'-dpng')
        end
    end
end