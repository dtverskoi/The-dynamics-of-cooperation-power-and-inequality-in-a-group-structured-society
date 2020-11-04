%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code produces Figure 4 using the program file function1.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameters
b1=10;
b2=26;
e=0.1;
Z0=50;
G=4;
T=800;
Yd=5;           % Number of bins in the figure for \theta

% Simulations
[x,theta,f] = function1(b1,b2,e,Z0,G);

% Plots
X1=squeeze(nansum(x,1));

figure
set(gcf, 'Position',  [100, 100, 600, 800])

subplot(3,1,1)
plot(1:T,X1(:,1:T),'LineWidth',1.5);
set(gca,'FontSize',20);
ylabel('X','Fontsize',30);

subplot(3,1,2)
plot(1:T,f(:,1:T),'LineWidth',1.5);
set(gca,'FontSize',20);
ylabel('f','Fontsize',30);

subplot(3,1,3)
Yp=zeros(G,T);
for i=1:Yd-1
    Yp=Yp+(theta(:,1:T)>(i/Yd))/(Yd-1);
end
Yp=[Yp zeros(G,1)];
Yp=[Yp; zeros(1,T+1)];
pc=pcolor(0:T,0.5:G+0.5,1-Yp);
colormap(gray(Yd));
set(pc,'EdgeColor','None');
xlabel('t','FontSize',30);
set(gca,'FontSize',20)
ylabel('\theta','FontSize',30);

print('5','-dpng') 