%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code performs simulations that are required for the Figure 5. It uses function2 for creating data.
% All the output files should be kept in the same folder. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

counter=0;          % Counter

Runs=100;            % The number of runs
XX=21;               % Total number of the main parameter (e) values

%Output
CO=zeros(6,XX);
GI=zeros(6,XX);
ST=zeros(6,XX);

for experiment=1:3      % loop for experiment
    
    if experiment==1
        for zzz=1:2             % loop for Z0
            Z0=50+250*(zzz-1);

            for ggg=1:3         % loop for G
                G=2^ggg;
                b1=20;
                b2=30;

                for eee=1:XX    % loop for e
                    counter=counter+1
                    e=0.05*(eee-1);
                    [Coop,Gini,StdX] = function2(b1,b2,e,Z0,G,Runs);

                    CO(ggg,eee)=nanmean(Coop);
                    GI(ggg,eee)=nanmean(Gini);
                    ST(ggg,eee)=nanmean(StdX);
                    CO(ggg+3,eee)=nanstd(Coop);
                    GI(ggg+3,eee)=nanstd(Gini);
                    ST(ggg+3,eee)=nanstd(StdX);
                end
            end

            if zzz==1
                dlmwrite('ex1CO.txt',CO);
                dlmwrite('ex1GI.txt',GI);
                dlmwrite('ex1ST.txt',ST);
            else
                dlmwrite('ex1ZCO.txt',CO);
                dlmwrite('ex1ZGI.txt',GI);
                dlmwrite('ex1ZST.txt',ST);
            end
        end
    end
    
    
    if experiment==2
        for bbb2=1:3             % loop for b2
            b2=10*bbb2;
            
            for eee=1:3            %loop for e
                e=0.1+0.2*(eee-1);

                for ggg=1:3         % loop for G
                    G=2^ggg;
                    Z0=50;

                    for bbb1=1:XX    % loop for b1
                        counter=counter+1
                        b1=2*(bbb1-1);
                        [Coop,Gini,StdX] = function2(b1,b2,e,Z0,G,Runs);

                        CO(ggg,bbb1)=nanmean(Coop);
                        GI(ggg,bbb1)=nanmean(Gini);
                        ST(ggg,bbb1)=nanmean(StdX);
                        CO(ggg+3,bbb1)=nanstd(Coop);
                        GI(ggg+3,bbb1)=nanstd(Gini);
                        ST(ggg+3,bbb1)=nanstd(StdX);
                    end
                end
                dlmwrite(['ex2',num2str(bbb2),num2str(eee),'CO.txt'],CO);
                dlmwrite(['ex2',num2str(bbb2),num2str(eee),'GI.txt'],GI);
                dlmwrite(['ex2',num2str(bbb2),num2str(eee),'ST.txt'],ST);
            end
        end
    end
    
    
    if experiment==3
        for zzz=1:2             % loop for Z0
            Z0=50+250*(zzz-1);
            
            for eee=1:3           %loop for e
                e=0.1+0.2*(eee-1);

                for ggg=1:3         % loop for G
                    G=2^ggg;
                    b1=20;

                    for bbb2=1:XX    % loop for b2
                        counter=counter+1
                        b2=2*(bbb2-1);
                        [Coop,Gini,StdX] = function2(b1,b2,e,Z0,G,Runs);

                        CO(ggg,bbb2)=nanmean(Coop);
                        GI(ggg,bbb2)=nanmean(Gini);
                        ST(ggg,bbb2)=nanmean(StdX);
                        CO(ggg+3,bbb2)=nanstd(Coop);
                        GI(ggg+3,bbb2)=nanstd(Gini);
                        ST(ggg+3,bbb2)=nanstd(StdX);
                    end
                end
                if zzz==1
                    dlmwrite(['ex3',num2str(eee),'CO.txt'],CO);
                    dlmwrite(['ex3',num2str(eee),'GI.txt'],GI);
                    dlmwrite(['ex3',num2str(eee),'ST.txt'],ST);
                else
                    dlmwrite(['ex3Z',num2str(eee),'CO.txt'],CO);
                    dlmwrite(['ex3Z',num2str(eee),'GI.txt'],GI);
                    dlmwrite(['ex3Z',num2str(eee),'ST.txt'],ST);
                end 
            end
        end
    end 
end
