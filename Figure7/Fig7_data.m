%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code performs simulations that are required for the Figure 7. It uses function4 for creating data.
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
    
    if ga==0
        for bbb2=1:2               % loop for B2
            B2=40+80*(bbb2-1);
            B1=20;
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
                for ni=1:XX            % loop for b2
                    counter=counter+1
                    nnn=2*(ni-1);
                    [dx,df,dt] = function4(B1,B2,e,Z0,Runs,ga,nnn);
                    
                    dX1(XX*(ee-1)+ni,:)=dx(1,:);
                    dF1(XX*(ee-1)+ni,:)=df(1,:);
                    dT1(XX*(ee-1)+ni,:)=dt(1,:);
                    
                    dX2(XX*(ee-1)+ni,:)=dx(2,:);
                    dF2(XX*(ee-1)+ni,:)=df(2,:);
                    dT2(XX*(ee-1)+ni,:)=dt(2,:);
                    
                    dX3(XX*(ee-1)+ni,:)=dx(3,:);
                    dF3(XX*(ee-1)+ni,:)=df(3,:);
                    dT3(XX*(ee-1)+ni,:)=dt(3,:);
                    
                    dX4(XX*(ee-1)+ni,:)=dx(4,:);
                    dF4(XX*(ee-1)+ni,:)=df(4,:);
                    dT4(XX*(ee-1)+ni,:)=dt(4,:);
                end
            end
 
            dlmwrite(['a0',num2str(bbb2),'X1.txt'],dX1);
            dlmwrite(['a0',num2str(bbb2),'F1.txt'],dF1);
            dlmwrite(['a0',num2str(bbb2),'T1.txt'],dT1);
            
            dlmwrite(['a0',num2str(bbb2),'X2.txt'],dX2);
            dlmwrite(['a0',num2str(bbb2),'F2.txt'],dF2);
            dlmwrite(['a0',num2str(bbb2),'T2.txt'],dT2);
            
            dlmwrite(['a0',num2str(bbb2),'X3.txt'],dX3);
            dlmwrite(['a0',num2str(bbb2),'F3.txt'],dF3);
            dlmwrite(['a0',num2str(bbb2),'T3.txt'],dT3);
            
            dlmwrite(['a0',num2str(bbb2),'X4.txt'],dX4);
            dlmwrite(['a0',num2str(bbb2),'F4.txt'],dF4);
            dlmwrite(['a0',num2str(bbb2),'T4.txt'],dT4);
        end
    end
    
    
    if ga==1
        B2=1500;
        B1=100;
        Z0=300;
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
            for ni=1:XX            % loop for b2
                counter=counter+1
                nnn=2*(ni-1);
                [dx,df,dt] = function4(B1,B2,e,Z0,Runs,ga,nnn);
                
                dX1(XX*(ee-1)+ni,:)=dx(1,:);
                dF1(XX*(ee-1)+ni,:)=df(1,:);
                dT1(XX*(ee-1)+ni,:)=dt(1,:);
                
                dX2(XX*(ee-1)+ni,:)=dx(2,:);
                dF2(XX*(ee-1)+ni,:)=df(2,:);
                dT2(XX*(ee-1)+ni,:)=dt(2,:);
                
                dX3(XX*(ee-1)+ni,:)=dx(3,:);
                dF3(XX*(ee-1)+ni,:)=df(3,:);
                dT3(XX*(ee-1)+ni,:)=dt(3,:);
                
                dX4(XX*(ee-1)+ni,:)=dx(4,:);
                dF4(XX*(ee-1)+ni,:)=df(4,:);
                dT4(XX*(ee-1)+ni,:)=dt(4,:);
            end
        end
        
        dlmwrite('a1X1.txt',dX1);
        dlmwrite('a1F1.txt',dF1);
        dlmwrite('a1T1.txt',dT1);
        
        dlmwrite('a1X2.txt',dX2);
        dlmwrite('a1F2.txt',dF2);
        dlmwrite('a1T2.txt',dT2);
        
        dlmwrite('a1X3.txt',dX3);
        dlmwrite('a1F3.txt',dF3);
        dlmwrite('a1T3.txt',dT3);
        
        dlmwrite('a1X4.txt',dX4);
        dlmwrite('a1F4.txt',dF4);
        dlmwrite('a1T4.txt',dT4);
    end
end