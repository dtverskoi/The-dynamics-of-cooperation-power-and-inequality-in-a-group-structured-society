%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code perform simulations that are required for the Figure 3. It uses function1 for creating data.
% All the output files should be kept in the same folder. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

%Parameters
b1=20;            % Maximum of the within-group production function (P) 
G=8;              % The number of groups
Runs=200;           % Total number of runs for each set of parameters
T=4000;           % Time
counter=0;        % counter


for zzz=1:2           % Loop for ZO
    Z0=50+250*(zzz-1);  % Half-effort of Q
    
    if Z0==50
        XX=41;           % Total number of the main parameter (e) values
        XL=0.5;          % Maximum value of the main parameter (e)
    else
        XX=81;
        XL=1;
    end
    
    for bbb=1:3       % Loop for b2
        b2=10*bbb;    % Maximum of the between-group production function (Q)

        XZ=zeros(G*XX,Runs);
        TZ=zeros(G*XX,Runs);
        FZ=zeros(G*XX,Runs);
        
        for eee=1:XX               % Loop for e
            e=XL*(eee-1)/(XX-1);   % Incumbency parameter
            counter=counter+1
            
            for runs=1:Runs    % Loop for different runs
                [x,theta,f] = function1(b1,b2,e,Z0,G);           
                X1=squeeze(nansum(x,1));
                avX=mean(X1(:,T/2:T),2);
                avth=mean(theta(:,T/2:T),2);
                avf=mean(f(:,T/2:T),2);

                XZ(G*(eee-1)+1:G*(eee-1)+G,runs)=avX;
                TZ(G*(eee-1)+1:G*(eee-1)+G,runs)=avth;
                FZ(G*(eee-1)+1:G*(eee-1)+G,runs)=avf;
            end
        end

        dlmwrite(['Xb',num2str(bbb),'Z',num2str(Z0),'.txt'],XZ);
        dlmwrite(['Tb',num2str(bbb),'Z',num2str(Z0),'.txt'],TZ);
        dlmwrite(['Fb',num2str(bbb),'Z',num2str(Z0),'.txt'],FZ);
    end
end