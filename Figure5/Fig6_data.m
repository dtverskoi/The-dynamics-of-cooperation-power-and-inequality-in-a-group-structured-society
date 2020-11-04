%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code perform simulations that are required for the Figure 6. It uses function3 for creating data.
% All the output files should be kept in the same folder. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

%Parameters
Runs=100;
XX=21;
counter=0;


for ggga=1:2            %loop for ga
    ga=ggga-1;
    for bbb1=1:2
        if ga==0
            B1=bbb1*20;
            Z0=20;            
            dX1=zeros(3*XX,Runs);
            dF1=zeros(3*XX,Runs);
            dT1=zeros(3*XX,Runs);
            dX2=zeros(3*XX,Runs);
            dF2=zeros(3*XX,Runs);
            dT2=zeros(3*XX,Runs);
            dX3=zeros(3*XX,Runs);
            dF3=zeros(3*XX,Runs);
            dT3=zeros(3*XX,Runs);
            dX4=zeros(3*XX,Runs);
            dF4=zeros(3*XX,Runs);
            dT4=zeros(3*XX,Runs);
            
            for ee=1:3                   % loop for e
                e=0.3*(ee-1)+0.1;
                for bbb2=1:XX            % loop for b2
                    counter=counter+1
                    B2=8*(bbb2-1);
                    [dx,df,dt] = function3(B1,B2,e,Z0,Runs,ga);
                    
                    dX1(XX*(ee-1)+bbb2,:)=dx(1,:);
                    dF1(XX*(ee-1)+bbb2,:)=df(1,:);
                    dT1(XX*(ee-1)+bbb2,:)=dt(1,:);
                    
                    dX2(XX*(ee-1)+bbb2,:)=dx(2,:);
                    dF2(XX*(ee-1)+bbb2,:)=df(2,:);
                    dT2(XX*(ee-1)+bbb2,:)=dt(2,:);
                    
                    dX3(XX*(ee-1)+bbb2,:)=dx(3,:);
                    dF3(XX*(ee-1)+bbb2,:)=df(3,:);
                    dT3(XX*(ee-1)+bbb2,:)=dt(3,:);
                    
                    dX4(XX*(ee-1)+bbb2,:)=dx(4,:);
                    dF4(XX*(ee-1)+bbb2,:)=df(4,:);
                    dT4(XX*(ee-1)+bbb2,:)=dt(4,:);
                end
            end
 
            dlmwrite(['a0',num2str(bbb1),'X1.txt'],dX1);
            dlmwrite(['a0',num2str(bbb1),'F1.txt'],dF1);
            dlmwrite(['a0',num2str(bbb1),'T1.txt'],dT1);
            
            dlmwrite(['a0',num2str(bbb1),'X2.txt'],dX2);
            dlmwrite(['a0',num2str(bbb1),'F2.txt'],dF2);
            dlmwrite(['a0',num2str(bbb1),'T2.txt'],dT2);
            
            dlmwrite(['a0',num2str(bbb1),'X3.txt'],dX3);
            dlmwrite(['a0',num2str(bbb1),'F3.txt'],dF3);
            dlmwrite(['a0',num2str(bbb1),'T3.txt'],dT3);
            
            dlmwrite(['a0',num2str(bbb1),'X4.txt'],dX4);
            dlmwrite(['a0',num2str(bbb1),'F4.txt'],dF4);
            dlmwrite(['a0',num2str(bbb1),'T4.txt'],dT4);
        end
        
        
        if ga==1
            B1=100+200*(bbb1-1);
            for zzz=1:2           % loop for Z0
                Z0=50+250*(zzz-1);            
                dX1=zeros(3*XX,Runs);
                dF1=zeros(3*XX,Runs);
                dT1=zeros(3*XX,Runs);
                dX2=zeros(3*XX,Runs);
                dF2=zeros(3*XX,Runs);
                dT2=zeros(3*XX,Runs);
                dX3=zeros(3*XX,Runs);
                dF3=zeros(3*XX,Runs);
                dT3=zeros(3*XX,Runs);
                dX4=zeros(3*XX,Runs);
                dF4=zeros(3*XX,Runs);
                dT4=zeros(3*XX,Runs);

                for ee=1:3                   % loop for e
                    e=0.2*(ee-1)+0.1;
                    for bbb2=1:XX            % loop for b2
                        counter=counter+1
                        B2=100*(bbb2-1);
                        [dx,df,dt] = function3(B1,B2,e,Z0,Runs,ga);

                         dX1(XX*(ee-1)+bbb2,:)=dx(1,:);
                         dF1(XX*(ee-1)+bbb2,:)=df(1,:);
                         dT1(XX*(ee-1)+bbb2,:)=dt(1,:);
                         
                         dX2(XX*(ee-1)+bbb2,:)=dx(2,:);
                         dF2(XX*(ee-1)+bbb2,:)=df(2,:);
                         dT2(XX*(ee-1)+bbb2,:)=dt(2,:);
                         
                         dX3(XX*(ee-1)+bbb2,:)=dx(3,:);
                         dF3(XX*(ee-1)+bbb2,:)=df(3,:);
                         dT3(XX*(ee-1)+bbb2,:)=dt(3,:);
                         
                         dX4(XX*(ee-1)+bbb2,:)=dx(4,:);
                         dF4(XX*(ee-1)+bbb2,:)=df(4,:);
                         dT4(XX*(ee-1)+bbb2,:)=dt(4,:);
                    end
                end

                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'X1.txt'],dX1);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'F1.txt'],dF1);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'T1.txt'],dT1);

                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'X2.txt'],dX2);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'F2.txt'],dF2);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'T2.txt'],dT2);

                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'X3.txt'],dX3);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'F3.txt'],dF3);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'T3.txt'],dT3);

                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'X4.txt'],dX4);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'F4.txt'],dF4);
                dlmwrite(['a1z',num2str(zzz),num2str(bbb1),'T4.txt'],dT4);
            end
        end
    end


end