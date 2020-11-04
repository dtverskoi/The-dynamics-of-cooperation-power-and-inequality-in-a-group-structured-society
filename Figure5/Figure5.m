%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plot Figure 5 using data created by the program file
% Fig5_data.m. This code also uses program files boundedline.m, confplot.m,
% inpaint_nans.m, outlinebounds.m and singlepatch.m created by Kelly
% Kearney (Kelly Kearney (2020). boundedline.m (https://github.com/kakearney/boundedline-pkg), GitHub.
% Retrieved November 4, 2020).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for experiment=1:3     % loop for experiments
   if experiment==1
      for zzz=1:2      % loop for Z0
          if zzz==1
              CO=readmatrix('ex1CO.txt');
              ST=readmatrix('ex1GI.txt');
              S=readmatrix('ex1ST.txt');
            else
              CO=readmatrix('ex1ZCO.txt');
              ST=readmatrix('ex1ZGI.txt');
              S=readmatrix('ex1ZST.txt');   
          end
          B2=0:0.05:1;
          figure
          set(gcf, 'Position',  [100, 100, 1200, 200])
          subplot(1,3,1)
          [l,p] = boundedline(B2(1,:), CO(1,:), CO(4,:), '-mx', B2(1,:), CO(1,:)+0.015*ones(1,21), zeros(1,21), '-mx', B2(1,:), CO(1,:)-0.015*ones(1,21), zeros(1,21), '-mx', B2(1,:), CO(2,:), CO(5,:), '-gp', B2(1,:), CO(2,:)+0.015*ones(1,21), zeros(1,21), '-gp', B2(1,:), CO(2,:)-0.015*ones(1,21), zeros(1,21), '-gp',B2(1,:), CO(3,:), CO(6,:), '-k*', B2(1,:), CO(3,:)+0.015*ones(1,21), zeros(1,21), '-k*', B2(1,:), CO(3,:)-0.015*ones(1,21), zeros(1,21), '-k*');
          outlinebounds(l,p);
          set(gca,'FontSize',15)
          xlim([0 0.5])
          ylim([0,8])
          ylabel('C','Fontsize',20)
          xlabel('\epsilon','FontSize',25);

          subplot(1,3,2)
          [l,p] = boundedline(B2(1,:), ST(1,:), ST(4,:), '-mx', B2(1,:), ST(1,:)+0.005*ones(1,21), zeros(1,21), '-mx', B2(1,:), ST(1,:)-0.005*ones(1,21), zeros(1,21), '-mx',B2(1,:), ST(2,:), ST(5,:), '-gp', B2(1,:), ST(2,:)+0.005*ones(1,21), zeros(1,21), '-gp', B2(1,:), ST(2,:)-0.005*ones(1,21), zeros(1,21), '-gp',B2(1,:), ST(3,:), ST(6,:), '-k*', B2(1,:), ST(3,:)+0.005*ones(1,21), zeros(1,21), '-k*', B2(1,:), ST(3,:)-0.005*ones(1,21), zeros(1,21), '-k*');
          outlinebounds(l,p);
          set(gca,'FontSize',15)
          xlim([0 0.5])
          ylim([0,0.8])
          ylabel('I','Fontsize',20)
          xlabel('\epsilon','FontSize',25);
          hold off

          subplot(1,3,3)
          set(gca,'FontSize',20);
          [l,p] = boundedline(B2(1,:), S(1,:), S(4,:), '-mx', B2(1,:), S(1,:)+0.015*ones(1,21), zeros(1,21), '-mx', B2(1,:), S(1,:)-0.015*ones(1,21), zeros(1,21), '-mx', B2(1,:), S(2,:), CO(5,:), '-gp', B2(1,:), S(2,:)+0.015*ones(1,21), zeros(1,21), '-gp', B2(1,:), S(2,:)-0.015*ones(1,21), zeros(1,21), '-gp',B2(1,:), S(3,:), S(6,:), '-k*', B2(1,:), S(3,:)+0.015*ones(1,21), zeros(1,21), '-k*', B2(1,:), S(3,:)-0.015*ones(1,21), zeros(1,21), '-k*');
          outlinebounds(l,p);
          hold on
          xlim([0 0.5])
          ylim([0,6])
          set(gca,'FontSize',15)
          xlabel('\epsilon','Fontsize',25)
          ylabel('\sigma','Fontsize',20)
          hold off

          if zzz==1
              print('FigE','-dpng')
          else
              print('FigE','-dpng')
          end  
      end       
   end
   
   
   if experiment==2
      for bbb2=1:3      % loop for b2
         for eee=1:3    % loop for e
              CO=readmatrix(['ex2',num2str(bbb2),num2str(eee),'CO.txt']);
              ST=readmatrix(['ex2',num2str(bbb2),num2str(eee),'GI.txt']);
              S=readmatrix(['ex2',num2str(bbb2),num2str(eee),'ST.txt']);
              ST(isnan(ST))=0;
              S(isnan(S))=0;
              B2=0:2:40;
              figure
              set(gcf, 'Position',  [100, 100, 1200, 200])
              subplot(1,3,1)
              [l,p] = boundedline(B2(1,1:21), CO(1,1:21), CO(4,1:21), '-mx', B2(1,1:21), CO(1,1:21)+0.015*ones(1,21), zeros(1,21), '-mx', B2(1,1:21), CO(1,1:21)-0.015*ones(1,21), zeros(1,21), '-mx', B2(1,1:21), CO(2,1:21), CO(5,1:21), '-gp', B2(1,1:21), CO(2,1:21)+0.015*ones(1,21), zeros(1,21), '-gp', B2(1,1:21), CO(2,1:21)-0.015*ones(1,21), zeros(1,21), '-gp',B2(1,1:21), CO(3,1:21), CO(6,1:21), '-k*', B2(1,1:21), CO(3,1:21)+0.015*ones(1,21), zeros(1,21), '-k*', B2(1,1:21), CO(3,1:21)-0.015*ones(1,21), zeros(1,21), '-k*');
              outlinebounds(l,p);
              set(gca,'FontSize',15)
              xlim([0 30])
              ylim([0,8])
              ylabel('C','Fontsize',20)
              xlabel('b_1','FontSize',20);

              subplot(1,3,2)
              [l,p] = boundedline(B2(1,1:21), ST(1,1:21), ST(4,1:21), '-mx', B2(1,1:21), ST(1,1:21)+0.005*ones(1,21), zeros(1,21), '-mx', B2(1,1:21), ST(1,1:21)-0.005*ones(1,21), zeros(1,21), '-mx',B2(1,1:21), ST(2,1:21), ST(5,1:21), '-gp', B2(1,1:21), ST(2,1:21)+0.005*ones(1,21), zeros(1,21), '-gp', B2(1,1:21), ST(2,1:21)-0.005*ones(1,21), zeros(1,21), '-gp',B2(1,1:21), ST(3,1:21), ST(6,1:21), '-k*', B2(1,1:21), ST(3,1:21)+0.005*ones(1,21), zeros(1,21), '-k*', B2(1,1:21), ST(3,1:21)-0.005*ones(1,21), zeros(1,21), '-k*');
              outlinebounds(l,p);
              set(gca,'FontSize',15)
              xlim([0 30])
              ylim([0,0.8])
              ylabel('I','Fontsize',20)
              xlabel('b_1','FontSize',20);
              hold off

              subplot(1,3,3)
              set(gca,'FontSize',15);
              [l,p] = boundedline(B2(1,1:21), S(1,1:21), S(4,1:21), '-mx', B2(1,1:21), S(1,1:21)+0.015*ones(1,21), zeros(1,21), '-mx', B2(1,1:21), S(1,1:21)-0.015*ones(1,21), zeros(1,21), '-mx', B2(1,1:21), S(2,1:21), CO(5,1:21), '-gp', B2(1,1:21), S(2,1:21)+0.015*ones(1,21), zeros(1,21), '-gp', B2(1,1:21), S(2,1:21)-0.015*ones(1,21), zeros(1,21), '-gp',B2(1,1:21), S(3,1:21), S(6,1:21), '-k*', B2(1,1:21), S(3,1:21)+0.015*ones(1,21), zeros(1,21), '-k*', B2(1,1:21), S(3,1:21)-0.015*ones(1,21), zeros(1,21), '-k*');
              outlinebounds(l,p);
              hold on
              xlim([0 30])
              ylim([0,6])
              xlabel('b_1','Fontsize',20)
              ylabel('\sigma','Fontsize',25)
              legend([p(1) p(4) p(7)],'G=2','G=4','G=8','FontSize',15,'Location','northeast')
              hold off

              print(['Figb1e',num2str(2*eee-1),num2str(bbb2)],'-dpng')  
         end  
      end   
   end
   
   
   if experiment==3
      for zzz=1:2       % loop for Z0
         for eee=1:3    % loop for e
             if zzz==1
                CO=readmatrix(['ex3',num2str(eee),'CO.txt']);
                ST=readmatrix(['ex3',num2str(eee),'GI.txt']);
                S=readmatrix(['ex3',num2str(eee),'ST.txt']);
             else
                CO=readmatrix(['ex3Z',num2str(eee),'CO.txt']);
                ST=readmatrix(['ex3Z',num2str(eee),'GI.txt']);
                S=readmatrix(['ex3Z',num2str(eee),'ST.txt']); 
             end
             figure
             set(gcf, 'Position',  [100, 100, 1200, 200])
             B2=0:2:40;
             subplot(1,3,1)
             [l,p] = boundedline(B2(1,:), CO(1,:), CO(4,:), '-mx', B2(1,:), CO(1,:)+0.015*ones(1,21), zeros(1,21), '-mx', B2(1,:), CO(1,:)-0.015*ones(1,21), zeros(1,21), '-mx', B2(1,:), CO(2,:), CO(5,:), '-gp', B2(1,:), CO(2,:)+0.015*ones(1,21), zeros(1,21), '-gp', B2(1,:), CO(2,:)-0.015*ones(1,21), zeros(1,21), '-gp',B2(1,:), CO(3,:), CO(6,:), '-k*', B2(1,:), CO(3,:)+0.015*ones(1,21), zeros(1,21), '-k*', B2(1,:), CO(3,:)-0.015*ones(1,21), zeros(1,21), '-k*');
             outlinebounds(l,p);
             set(gca,'FontSize',10)
             xlim([0 30])
             ylim([0,8])
             xlabel('b_2','Fontsize',20)
             ylabel('C','Fontsize',20)

             subplot(1,3,2);
             [l,p] = boundedline(B2(1,4:21), ST(1,4:21), ST(4,4:21), '-mx', B2(1,4:21), ST(1,4:21)+0.005*ones(1,18), zeros(1,18), '-mx', B2(1,4:21), ST(1,4:21)-0.005*ones(1,18), zeros(1,18), '-mx',B2(1,3:21), ST(2,3:21), ST(5,3:21), '-gp', B2(1,3:21), ST(2,3:21)+0.005*ones(1,19), zeros(1,19), '-gp', B2(1,3:21), ST(2,3:21)-0.005*ones(1,19), zeros(1,19), '-gp',B2(1,2:21), ST(3,2:21), ST(6,2:21), '-k*', B2(1,2:21), ST(3,2:21)+0.005*ones(1,20), zeros(1,20), '-k*', B2(1,2:21), ST(3,2:21)-0.005*ones(1,20), zeros(1,20), '-k*');
             outlinebounds(l,p);
             set(gca,'FontSize',10)
             xlim([0 30])
             ylim([0,0.8])
             xlabel('b_2','FontSize',20)
             ylabel('I','Fontsize',20)

             subplot(1,3,3)
             [l,p] = boundedline(B2(1,4:21), ST(1,4:21), ST(4,4:21), '-mx', B2(1,4:21), ST(1,4:21)+0.005*ones(1,18), zeros(1,18), '-mx', B2(1,4:21), ST(1,4:21)-0.005*ones(1,18), zeros(1,18), '-mx',B2(1,3:21), ST(2,3:21), ST(5,3:21), '-gp', B2(1,3:21), ST(2,3:21)+0.005*ones(1,19), zeros(1,19), '-gp', B2(1,3:21), ST(2,3:21)-0.005*ones(1,19), zeros(1,19), '-gp',B2(1,2:21), ST(3,2:21), ST(6,2:21), '-k*', B2(1,2:21), ST(3,2:21)+0.005*ones(1,20), zeros(1,20), '-k*', B2(1,2:21), ST(3,2:21)-0.005*ones(1,20), zeros(1,20), '-k*');
             outlinebounds(l,p);
             set(gca,'FontSize',10)
             xlim([0 30])
             ylim([0,5])
             xlabel('b_2','FontSize',20)
             ylabel('\sigma','Fontsize',25)
             
             if zzz==1
                 print(['Fig4',num2str(eee)],'-dpng')
             else
                 print(['FigZ4',num2str(eee)],'-dpng')
             end  
         end   
      end   
   end
    
end