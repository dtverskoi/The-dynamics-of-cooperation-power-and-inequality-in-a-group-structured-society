%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots Figure 3 using data created by the program file
% Fig3_data.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Runs=200;
G=8;

for zzz=1:2
    Z0=50+250*(zzz-1);
    if Z0==50
        XX=41;           % Total number of the main parameter (e) values
        XL=0.5;          % Maximum value of the main parameter (e)
    else
        XX=81;
        XL=1;
    end

    for bbb=1:3
        T=readmatrix(['Tb',num2str(bbb),'Z',num2str(Z0),'.txt']);
        F=readmatrix(['Fb',num2str(bbb),'Z',num2str(Z0),'.txt']);
        X=readmatrix(['Xb',num2str(bbb),'Z',num2str(Z0),'.txt']);
       
        C1=NaN(XX,Runs);
        C2=NaN(XX,Runs);
        C3=NaN(XX,Runs);
        X1=NaN(XX,Runs,G);
        FF=NaN(XX,Runs,G);
        TT=NaN(XX,Runs,G);
        X2=NaN(XX,Runs,G);
        FF2=NaN(XX,Runs,G);
        TT2=NaN(XX,Runs,G);
        X3=NaN(XX,Runs,G);
        FF3=NaN(XX,Runs,G);
        TT3=NaN(XX,Runs,G);
        Xo=NaN(XX,Runs,G);
        Fo=NaN(XX,Runs,G);
        TTo=NaN(XX,Runs,G);
        NE=0;
        for j=1:Runs
            for i=1:XX
                f=F(G*(i-1)+1:G*(i-1)+G,j);
                th=T(G*(i-1)+1:G*(i-1)+G,j);
                sc=0;
                for k=1:G
                    if (th(k)==1)|(th(k)==0)
                        sc=sc+1;
                    end
                end
                thf=f.*th;
                thf1=[];
                thf2=NaN(1,8);
                for l=1:G
                    if thf(l)~=0
                        thf1=[thf1 thf(l)];
                        thf2(l)=thf(l);
                    end
                end
                if sc==G
                    if (size(thf1)~=0)&(max(thf1)-min(thf1)<0.005)
                        C1(i,j)=sum(T(G*(i-1)+1:G*(i-1)+G,j));
                        C2(i,j)=NaN;
                        C3(i,j)=NaN;
                        X2(i,j,:)=NaN(1,G);
                        FF2(i,j,:)=NaN(1,G);
                        TT2(i,j,:)=NaN(1,G);
                        X3(i,j,:)=NaN(1,G);
                        FF3(i,j,:)=NaN(1,G);
                        TT3(i,j,:)=NaN(1,G);

                        X1(i,j,:)=X(G*(i-1)+1:G*(i-1)+G,j);
                        FF(i,j,:)=F(G*(i-1)+1:G*(i-1)+G,j);
                        TT(i,j,:)=T(G*(i-1)+1:G*(i-1)+G,j);
                    else
                        C1(i,j)=NaN;
                        X1(i,j,:)=NaN(1,G);
                        FF(i,j,:)=NaN(1,G);
                        TT(i,j,:)=NaN(1,G);

                        if size(thf1)~=0
                            Xo(i,j,:)=X(G*(i-1)+1:G*(i-1)+G,j);
                            Fo(i,j,:)=F(G*(i-1)+1:G*(i-1)+G,j);
                            TTo(i,j,:)=T(G*(i-1)+1:G*(i-1)+G,j);
                            for k=1:G
                                if (abs(thf2(k)-max(thf1))<0.005)
                                    X2(i,j,k)=X(G*(i-1)+k,j);
                                    FF2(i,j,k)=F(G*(i-1)+k,j);
                                    TT2(i,j,k)=T(G*(i-1)+k,j);
                                else
                                    X2(i,j,k)=NaN;
                                    FF2(i,j,k)=NaN;
                                    TT2(i,j,k)=NaN;
                                end

                                if (abs(thf2(k)-min(thf1))<0.005)
                                    X3(i,j,k)=X(G*(i-1)+k,j);
                                    FF3(i,j,k)=F(G*(i-1)+k,j);
                                    TT3(i,j,k)=T(G*(i-1)+k,j);
                                else
                                    X3(i,j,k)=NaN;
                                    FF3(i,j,k)=NaN;
                                    TT3(i,j,k)=NaN;
                                end
                            end

                            C2(i,j)=nansum(TT2(i,j,:));
                            C3(i,j)=nansum(TT3(i,j,:));

                        else
                            C2(i,j)=NaN;
                            C3(i,j)=NaN;
                            X2(i,j,:)=NaN(1,G);
                            FF2(i,j,:)=NaN(1,G);
                            TT2(i,j,:)=NaN(1,G);
                            X3(i,j,:)=NaN(1,G);
                            FF3(i,j,:)=NaN(1,G);
                            TT3(i,j,:)=NaN(1,G);
                        end
                    end
                else
                    NE=NE+1;
                end
            end
        end


        E=zeros(1,XX);
        for i=1:XX
            E(i)=XL*(i-1)/(XX-1);
        end
        rs=[0.7 0.7 0.1];
        rd=[0.1 0.7 0.7];
        rc=[0.7 0.1 0.7];

        
        % Plot panel (a)
        figure
        set(gcf, 'Position',  [100, 100, 500, 400])
        hold on
        for i=1:XX
            W=NaN(1,Runs);
            Un=unique(C1(i,:));
            Un(isnan(Un))=[];
            Wo=NaN(size(Un));
            for j=1:size(Un,2)
                Wo(j)=size(find(C1(i,:)==Un(j)),2);
                W(find(C1(i,:)==Un(j)))=Wo(j)/Runs;
            end
            r1=E(i)*ones(1,Runs);
            sz=100*W;
            scatter(r1+0.0035*randn(1,Runs),C1(i,:)+0.035*randn(1,Runs),'MarkerEdgeColor',rc,'LineWidth',0.1)
        end
        plot(E,nanmean(C1,2),'Color',rc+[-0.4 -0.1 -0.4],'LineWidth',4)
        hold off
        set(gca,'FontSize',15)
        xlim([0 XL])
        ylim([0 G])
        xlabel('\epsilon','Fontsize',35)
        ylabel('C','Fontsize',30)
        csh=1;
        if zzz==1
            print(['J',num2str(bbb),num2str(csh)],'-dpng')
        else
            print(['ZJ',num2str(bbb),num2str(csh)],'-dpng')
        end
        
        
        % Plot panel (b)
        figure
        set(gcf, 'Position',  [100, 100, 500, 400])
        hold on
        RR=NaN(XX,Runs);
        for i=1:XX
            r1=E(i)*ones(1,Runs);
            L1=squeeze(X1(i,:,:).*TT(i,:,:));
            L2=squeeze(X1(i,:,:));
            L2(find(L1~=0))=NaN;
            L1(find(L1==0))=NaN;
            L1=nanmean(L1,2)';
            L2=nanmean(L2,2)';
            scatter(r1+0.0035*randn(1,Runs),L2+0.035*randn(1,Runs),'MarkerEdgeColor',rd,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),L1+0.035*randn(1,Runs),'MarkerEdgeColor',rc,'LineWidth',0.1)
            RR(i,:)=L1;
        end
        plot(E,nanmean(RR,2),'Color',rc+[-0.4 -0.1 -0.4],'LineWidth',4)
        hold off
        set(gca,'FontSize',15)
        xlim([0 XL])
        ylim([0 10])
        xlabel('\epsilon','Fontsize',35)
        ylabel('X','Fontsize',30)
        csh=2;
        if zzz==1
            print(['J',num2str(bbb),num2str(csh)],'-dpng')
        else
            print(['ZJ',num2str(bbb),num2str(csh)],'-dpng')
        end
        
        
        % Plot panel (c)
        figure
        set(gcf, 'Position',  [100, 100, 500, 400])
        hold on
        RR=NaN(XX,Runs);
        for i=1:XX
            r1=E(i)*ones(1,Runs);
            L1=squeeze(FF(i,:,:).*TT(i,:,:));
            L2=squeeze(FF(i,:,:));
            L2(find(L1~=0))=NaN;
            L1(find(L1==0))=NaN;
            L1=nanmean(L1,2)';
            L2=nanmean(L2,2)';
            scatter(r1+0.0035*randn(1,Runs),L2+0.0035*randn(1,Runs),'MarkerEdgeColor',rd,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),L1+0.0035*randn(1,Runs),'MarkerEdgeColor',rc,'LineWidth',0.1)
            RR(i,:)=L1;
        end
        plot(E,nanmean(RR,2),'Color',rc+[-0.4 -0.1 -0.4],'LineWidth',4)
        hold off
        set(gca,'FontSize',15)
        xlim([0 XL])
        ylim([0 1])
        xlabel('\epsilon','Fontsize',35)
        ylabel('f','Fontsize',30)
        csh=3;
        if zzz==1
            print(['J',num2str(bbb),num2str(csh)],'-dpng')
        else
            print(['ZJ',num2str(bbb),num2str(csh)],'-dpng')
        end
        
        
        % Plot panel (d)
        figure
        set(gcf, 'Position',  [100, 100, 500, 400])
        hold on
        for i=1:XX
            r1=E(i)*ones(1,Runs);
            scatter(r1+0.0035*randn(1,Runs),C2(i,:)+0.1+0.035*randn(1,Runs),'MarkerEdgeColor',rc,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),C3(i,:)+0.035*randn(1,Runs),'MarkerEdgeColor',rs,'LineWidth',0.1)
        end
        plot(E,nanmean(C2,2),'Color',rc+[-0.4 -0.1 -0.4],'LineWidth',4)
        plot(E,nanmean(C3,2),'Color',rs+[-0.3 -0.3 -0.1],'LineWidth',4)
        hold off
        set(gca,'FontSize',15)
        xlim([0 XL])
        ylim([0 G])
        xlabel('\epsilon','Fontsize',35)
        ylabel('C','Fontsize',30)
        csh=4;
        if zzz==1
            print(['J',num2str(bbb),num2str(csh)],'-dpng')
        else
            print(['ZJ',num2str(bbb),num2str(csh)],'-dpng')
        end
        
        
        % Plot panel (e)
        figure
        set(gcf, 'Position',  [100, 100, 500, 400])
        hold on
        RR2=NaN(XX,Runs);
        RR3=NaN(XX,Runs);
        for i=1:XX
            r1=E(i)*ones(1,Runs);
            L1=squeeze(Xo(i,:,:).*TTo(i,:,:));
            L12=squeeze(X2(i,:,:).*TT2(i,:,:));
            L13=squeeze(X3(i,:,:).*TT3(i,:,:));
            L2=squeeze(Xo(i,:,:));
            L2(find(L1~=0))=NaN;
            L12(find(L12==0))=NaN;
            L13(find(L13==0))=NaN;
            L2=nanmean(L2,2)';
            L12=nanmean(L12,2)';
            L13=nanmean(L13,2)';
            scatter(r1+0.0035*randn(1,Runs),L2+0.1-0.035*randn(1,Runs),'MarkerEdgeColor',rd,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),L13-0.1+0.035*randn(1,Runs),'MarkerEdgeColor',rs,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),L12+0.035*randn(1,Runs),'MarkerEdgeColor',rc,'LineWidth',0.1)
            RR2(i,:)=L12;
            RR3(i,:)=L13;
        end
        plot(E,nanmean(RR2,2),'Color',rc+[-0.4 -0.1 -0.4],'LineWidth',4)
        plot(E,nanmean(RR3,2),'Color',rs+[-0.3 -0.3 -0.1],'LineWidth',4)
        hold off
        set(gca,'FontSize',15)
        xlim([0 XL])
        ylim([0 10])
        xlabel('\epsilon','Fontsize',35)
        ylabel('X','Fontsize',30)
        csh=5;
        if zzz==1
            print(['J',num2str(bbb),num2str(csh)],'-dpng')
        else
            print(['ZJ',num2str(bbb),num2str(csh)],'-dpng')
        end
        
        
        % Plot panel (f)
        figure
        set(gcf, 'Position',  [100, 100, 500, 400])
        hold on
        RR2=NaN(XX,Runs);
        RR3=NaN(XX,Runs);
        for i=1:XX
            r1=E(i)*ones(1,Runs);
            L1=squeeze(Fo(i,:,:).*TTo(i,:,:));
            L12=squeeze(FF2(i,:,:).*TT2(i,:,:));
            L13=squeeze(FF3(i,:,:).*TT3(i,:,:));
            L2=squeeze(Fo(i,:,:));
            L2(find(L1~=0))=NaN;
            L12(find(L12==0))=NaN;
            L13(find(L13==0))=NaN;
            L2=nanmean(L2,2)';
            L12=nanmean(L12,2)';
            L13=nanmean(L13,2)';
            scatter(r1+0.0035*randn(1,Runs),L2+0.005+0.0035*randn(1,Runs),'MarkerEdgeColor',rd,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),L13-0.005+0.0035*randn(1,Runs),'MarkerEdgeColor',rs,'LineWidth',0.1)
            scatter(r1+0.0035*randn(1,Runs),L12+0.0035*randn(1,Runs),'MarkerEdgeColor',rc,'LineWidth',0.1)
            RR2(i,:)=L12;
            RR3(i,:)=L13;
        end
        plot(E,nanmean(RR2,2),'Color',rc+[-0.4 -0.1 -0.4],'LineWidth',4)
        plot(E,nanmean(RR3,2),'Color',rs+[-0.3 -0.3 -0.1],'LineWidth',4)

        hold off
        set(gca,'FontSize',15)
        xlim([0 XL])
        ylim([0 1])
        xlabel('\epsilon','Fontsize',35)
        ylabel('f','Fontsize',30)
        csh=6;
        if zzz==1
            print(['J',num2str(bbb),num2str(csh)],'-dpng')
        else
            print(['ZJ',num2str(bbb),num2str(csh)],'-dpng')
        end
    end
end
