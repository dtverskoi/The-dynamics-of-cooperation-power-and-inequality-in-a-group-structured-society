%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is a Matlab implementation of the model for the case of
% groups with identical sizes (the degree of rivalrousness is assumed to be
% equal 1).
% This function automatically simulates the model 100 runs and shows the
% results on the number of cooperating groups Coop, the Gini index
% of inequality among them Gini, and the standard deviation of efforts
% among them StdX.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Coop,Gini,StdX] = function2(b1,b2,e,Z0,G,Runs)

%Parameters
nnn=10;            % number of individuals in each group
%G=8;              % number of groups
n=nnn*ones(G,1);   % Gx1; Group sizes
r0=ones(G,1);      % Gx1; Baseline resources for individuals. Same for all individuals in a group
%b2=10;            % Maximum of the between-group production function (Q)
%b1=20;            % Maximum of the within-group production function (P) 
c=1;               % Individual cost of contribution
X0=5;              % Half-effort of P
%Z0=50;             % Half-effort of Q
%e=0.1;            % Incumbency parameter
al=1;              % Nonlinearity of P
be=1;              % Nonlinearity of Q
mi1=0;             % Probability that individuals will mutate
mui2=0;            %    " selectively imitate
mui3=0.25;         % " choose best response
mg1=0;             % Probability that groups will mutate
mug2=0;            %    "    selectively imitate
mug3=0.25;         % " choose best response
li1=100;           % Individual rationality in imitation
li2=100;           % " in myopic response
lg1=100;           % Group rationality in imitation
lg2=100;           % " in myopic response. Must be small. Depends on b2 (RK) values. exp(lg2*RK) ~=Inf
sig=0.1;           % Random innovation in theta
K=2;               % Number of candidates for myopic response
T=4000;            % Time

iBest=[0 1];       % First index of iBest and gBest = 1 is for selective imitation and second index of iBest = 1 is for myopic optimisation without error
gBest=[0 0 1];     % gBest: [.,0,0] is K,l is finite; [.,0,1] is K finite, l infinity; [.,1,.] is K,l infinity


xi=0.1;            % maximum change in theta per each step (for cont theta only)  
psi=0;             % stochasticity in f
discr=1;           % 1 if theta is discrete

Coop=zeros(1,Runs);
Gini=zeros(1,Runs);
StdX=zeros(1,Runs);

for runs=1:Runs % loop for different runs
    seedStat=0;
    %Seed
    if seedStat==0    
        rng('shuffle','twister')
        seed=rng;
    %  save seed;
    else
    %  load seed;
        if exist('seed')
            rng(seed);
        else
            rng('shuffle','twister');
            seed=rng;
        end
    end    

    % Derived quantities
    N=sum(n);                % total number of individuals in the model
    R0=r0.*n;                % Baseline resources for groups
    mi2=mi1+mui2;
    mi3=mi2+mui3;
    mg2=mg1+mug2;
    mg3=mg2+mug3;
    sigP=1/(4*G);             % Pertubations to power


    % Temporary variables
    X=NaN(1,G);                % Total individual contribution
    P=NaN(1,G);                % Within-group production
    Z=NaN(T,1);                % Total group contribution
    Q=NaN;                     % Between-group production
    fi=NaN;                    % Focal individual for imitation
    fg=NaN;                    % Focal group for imitation


    % Initialisation

    % Individual's contribution to within-group cooperation
    x=NaN(max(n),G,T);
    for i=1:G
        for j=1:n(i)
            x(j,i,1)=randi(2)-1;  % Cooperate 1, Defect 0
            %x(j,i,1)=1;
        end
    end

    % Group's contribution to between-group cooperation
    theta=NaN(G,T);
    if discr==0
    theta(:,1)=rand(G,1);
    else
    theta(:,1)=randi(2,G,1)-1;
    end

    % Powers
    f=NaN(G,T);
    % Broken stick
    f0=sort(rand(G-1,1));
    f(:,1)=sort([f0(1); diff(f0); 1-f0(end)]);
    % Equal
    %f(:,1)=1/G;


    % Resources
    % Individual
    r=NaN(max(n),G,T);         
    X=nansum(x(:,:,1),1);
    P=b1*n'.*X.^al./(X.^al+X0^al);
    Z(1,1)=P*theta(:,1);

    % Group
    R=NaN(G,T);                            
    ks=NaN(G,1);   % group characteristic (to check whether a faction belongs to cooperative coalition): 1 if P*th not equal 0
    j1=find(P'.*theta(:,1)~=0);
    ks(j1)=1;
    j2=find(P'.*theta(:,1)==0);
    ks(j2)=0;

    if Z(1,1)==0                                                               
        r(:,:,1)=r0'-c*x(:,:,1)+(1-theta(:,1)').*P./n';
        R(:,1)=R0-c*X'+(1-theta(:,1)).*P';
    else
        Q=b2*N*Z(1,1)^be/(Z(1,1)^be+Z0^be);
        if ks'*f(:,1)==0
            r(:,:,1)=r0'-c*x(:,:,1)+(1-theta(:,1)').*P./n'+Q*ks(:,1)'./((ones(1,G)*ks(:,1))*n');
            R(:,1)=R0-c*X'+(1-theta(:,1)).*P'+ks(:,1)*Q/(ones(1,G)*ks(:,1));
        else
            r(:,:,1)=r0'-c*x(:,:,1)+(1-theta(:,1)').*P./n'+Q*(f(:,1).*ks(:,1))'./((f(:,1)'*ks(:,1))*n');
            R(:,1)=R0-c*X'+(1-theta(:,1)).*P'+(f(:,1).*ks(:,1))*Q/(f(:,1)'*ks(:,1));
        end
    end

    % Outputs
    gf=NaN(T,1);
    gR=NaN(T,1);
    coop=zeros(1,T);
    gini=zeros(1,T);
    stdX=zeros(1,T);


    % Simulation
    for t=1:T-1

        X=(nansum(x(:,:,t),1))';
        I1=find((theta(:,t)==1)&(X(:,1)>0));
        coop(t)=size(I1,1);
        if coop(t)>0
            Xc=X(I1);
            stdX(t)=std(Xc);
            fc=f(I1,t);
            If=size(fc,1);
            for i=1:If
                gini(t)=gini(t)+sum(abs(fc-fc(i)));
            end
            gini(t)=gini(t)/(2*If*sum(fc));
        else
            stdX(t)=NaN;
            gini(t)=NaN;
        end

        % Individuals
        for i=1:G
            for j=1:n(i)
                ir=rand(1);
                if ir<mi1                                                       % Random mutation
                    x(j,i,t+1)=1-x(j,i,t);
                elseif ir<mi2                                                   % Selective imitation
                    fi=randi(n(i));
                    if iBest(1,1)==0
                        if rand(1)>1/(1+exp(li1*(r(fi,i,t)-r(j,i,t))))
                            x(j,i,t+1)=x(fi,i,t);
                        else
                            x(j,i,t+1)=x(j,i,t);
                        end
                    else
                        if r(fi,i,t)>r(j,i,t)
                            x(j,i,t+1)=x(fi,i,t);
                        else
                            x(j,i,t+1)=x(j,i,t);
                        end
                    end
                elseif ir<mi3                                                   % Myopic optimization
                    if x(j,i,t)==0       % Calculate rc, rd
                        X=nansum(x(:,:,t),1);
                        X(i)=X(i)+1;
                        P=b1*n'.*X.^al./(X.^al+X0^al);
                        Z(t+1,1)=P*theta(:,t);
                        rd=r(j,i,t);
                        ks=NaN(G,1);
                        j1=find(P'.*theta(:,t)~=0);
                        ks(j1)=1;
                        j2=find(P'.*theta(:,t)==0);
                        ks(j2)=0;
                        if Z(t+1,1)==0
                            rc=r0(i)-c+(1-theta(i,t))*P(i)/n(i);
                        else
                            Q=b2*N*Z(t+1,1)^be/(Z(t+1,1)^be+Z0^be);
                            if f(:,t)'*ks(:,1)==0
                                rc=r0(i)-c+(1-theta(i,t))*P(i)/n(i)+ks(i,1)*Q/((ones(1,G)*ks(:,1))*n(i));
                            else
                                rc=r0(i)-c+(1-theta(i,t))*P(i)/n(i)+f(i,t)*ks(i,1)*Q/((f(:,t)'*ks(:,1))*n(i));
                            end
                        end
                    else
                        X=nansum(x(:,:,t),1);
                        X(i)=X(i)-1;
                        P=b1*n'.*X.^al./(X.^al+X0^al);
                        Z(t+1,1)=P*theta(:,t);
                        rc=r(j,i,t);
                        ks=NaN(G,1);
                        j1=find(P'.*theta(:,t)~=0);
                        ks(j1)=1;
                        j2=find(P'.*theta(:,t)==0);
                        ks(j2)=0;
                        if Z(t+1,1)==0
                            rd=r0(i)+(1-theta(i,t))*P(i)/n(i);
                        else
                            Q=b2*N*Z(t+1,1)^be/(Z(t+1,1)^be+Z0^be);
                            if f(:,t)'*ks(:,1)==0
                                rd=r0(i)+(1-theta(i,t))*P(i)/n(i)+ks(i,1)*Q/((ones(1,G)*ks(:,1))*n(i));
                            else
                                rd=r0(i)+(1-theta(i,t))*P(i)/n(i)+f(i,t)*ks(i,1)*Q/((f(:,t)'*ks(:,1))*n(i));
                            end
                        end
                    end
                    if iBest(1,2)==0
                        if rand(1)>1/(1+exp(li2*(rc-rd)))
                            x(j,i,t+1)=1;
                        else
                            x(j,i,t+1)=0;
                        end
                    else
                        if rc>rd
                            x(j,i,t+1)=1;
                        else
                            x(j,i,t+1)=0;
                        end
                    end
                else
                    x(j,i,t+1)=x(j,i,t);
                end
            end
        end

        % Groups
        gf(t)=0;
        gR(t)=0;
        for i=1:G
            gr=rand(1);
            if gr<mg1                                                           % Random mutation
                tmp=normcdf(-theta(i,t));
                theta(i,t+1)=theta(i,t)+norminv(tmp+rand(1,1)*(normcdf(1-theta(i,t))-tmp))*sig;
            elseif gr<mg2                                                       % Selective imitation
                fg=randi(G);
                if gBest(1,1)==0
                    if rand(1)>1/(1+exp(lg1*(R(fg,t)-R(i,t))))                  % Need to discuss it (not so important right now, since this part of the code is not used)
                        theta(i,t+1)=theta(fg,t);
                    else
                        theta(i,t+1)=theta(i,t);
                    end
                else
                    if R(fg,t)>R(i,t)
                        theta(i,t+1)=theta(fg,t);
                    else
                        theta(i,t+1)=theta(i,t);
                    end
                end
            elseif gr<mg3                                                       %Myopic optimization
                X=nansum(x(:,:,t+1),1);
                P=b1*n'.*X.^al./(X.^al+X0^al);
                Z(t+1,1)=P*theta(:,t)-P(1,i)*theta(i,t);
                if gBest(1,2)==0

                    if discr==1
                        if X(i)==0
                            tK=zeros(K+1,1);
                        else
                        if rand<=0.5
                            rqn=0;
                        else
                            rqn=1;
                        end
                        tK=[rqn;1-rqn;theta(i,t)];
                        end
                    else
                        if X(i)==0
                            tK=zeros(K+1,1);
                        else
                        tK=[min(max(theta(i,t)+xi*(2*rand(K,1)-1),0),1);theta(i,t)];
                        end
                    end

                    Qtmp=b2*N*((Z(t+1,1)+tK*P(1,i)).^be)./(((Z(t+1,1)+tK*P(1,i)).^be)+Z0^be);
                    ks=NaN(G,1);
                    j1=find(P'.*theta(:,t)~=0);
                    ks(j1)=1;
                    j2=find(P'.*theta(:,t)==0);
                    ks(j2)=0;
                    KS=ones(1,G)*ks(:,1)-ks(i,1);
                    Kf=f(:,t)'*ks(:,1)-ks(i,1)*f(i,t);

                    if discr==1
                        kstmp=zeros(3,1);
                        K=2;
                    else
                        kstmp=zeros(K,1);
                    end

                    j11=find((P(i)*tK)~=0);
                    kstmp(j11)=1;
                    j22=find((P(i)*tK)==0);
                    kstmp(j22)=0;

                    tmp1=Kf+f(i,t)*kstmp;
                    ind1=find(tmp1~=0);
                    ind2=find((tmp1==0)&(Z(t+1,1)+tK*P(1,i)==0));
                    ind3=find((tmp1==0)&(Z(t+1,1)+tK*P(1,i)~=0));
                    RK(ind1)=R0(i,1)-c*X(1,i)+(1-tK(ind1))*P(1,i)+Qtmp(ind1).*kstmp(ind1)*f(i,t)./tmp1(ind1);
                    RK(ind2)=R0(i,1)-c*X(1,i)+(1-tK(ind2))*P(1,i);
                    RK(ind3)=R0(i,1)-c*X(1,i)+(1-tK(ind3))*P(1,i)+Qtmp(ind3).*kstmp(ind3)./(KS+kstmp(ind3));
                    if gBest(1,3)==0
                        for j=1:K+1
                            w(j)=1/sum(exp(lg2*(RK-RK(j))));
                        end
                        w0=find(w~=0);
                        if length(w0)>1
                            theta(i,t+1)=tK(randsample(w0,1,true,w(w0)));
                        else
                            theta(i,t+1)=tK(w0);
                        end
                    else
                        [Rm Rim]=max(RK);
                        theta(i,t+1)=tK(Rim);
                    end
                else
                    piG=@(z) -R0(i,1)+c*X(1,i)-(1-z)*P(1,i)-(b2*N*((Z(t+1,1)+z*P(1,i))^be)/(((Z(t+1,1)+z*P(1,i))^be)+Z0^be))*P(1,i)*f(i,t)*z/((P*(f(:,t).*theta(:,t)))-f(i,t)*P(1,i)*(theta(i,t)-z));
                    theta(i,t+1)=fminbnd(piG,0,1);
                end
            else
                theta(i,t+1)=theta(i,t);
            end
            gf(t)=gf(t)+sum(abs(f(:,t)-f(i,t)));
            gR(t)=gR(t)+sum(abs(R(:,t)-R(i,t)));
        end
        gf(t)=gf(t)/(2*G);
        gR(t)=gR(t)/(2*G*sum(R(:,t)));

        X=nansum(x(:,:,t+1),1);
        P=b1*n'.*X.^al./(X.^al+X0^al);
        Z(t+1,1)=P*theta(:,t+1);
        ks=NaN(G,1);
        j1=find(P'.*theta(:,t+1)~=0);
        ks(j1)=1;
        j2=find(P'.*theta(:,t+1)==0);
        ks(j2)=0;

        % Payoffs
        if Z(t+1,1)==0
            r(:,:,t+1)=r0'-c*x(:,:,t+1)+(1-theta(:,t+1)').*P./n';
            R(:,t+1)=R0-c*X'+(1-theta(:,t+1)).*P';
        else
            Q=b2*N*Z(t+1,1)^be/(Z(t+1,1)^be+Z0^be);
            if ks'*f(:,t)==0
                r(:,:,t+1)=r0'-c*x(:,:,t+1)+(1-theta(:,t+1)').*P./n'+Q*ks(:,1)'./((ones(1,G)*ks(:,1))*n');
                R(:,t+1)=R0-c*X'+(1-theta(:,t+1)).*P'+ks(:,1)*Q./(ones(1,G)*ks(:,1));
            else
                r(:,:,t+1)=r0'-c*x(:,:,t+1)+(1-theta(:,t+1)').*P./n'+Q*(f(:,t).*ks(:,1))'./((f(:,t)'*ks(:,1))*n');
                R(:,t+1)=R0-c*X'+(1-theta(:,t+1)).*P'+(f(:,t).*ks(:,1))*Q/(f(:,t)'*ks(:,1));
            end
        end


        % Powers

        y=max(R(:,t+1).*(1-e+e*f(:,t))+psi*sigP*randn(G,1),0);
        Sy=sum(y);
        if Sy~=0
            f(:,t+1)=y/Sy;
        else
            f(:,t+1)=ones(G,1)/G;
        end

     X=nansum(x(:,:,t+1),1);
        P=b1*n'.*X.^al./(X.^al+X0^al);
        Z(t+1,1)=P*theta(:,t+1);
        ks=NaN(G,1);
        j1=find(P'.*theta(:,t+1)~=0);
        ks(j1)=1;
        j2=find(P'.*theta(:,t+1)==0);
        ks(j2)=0;

        % Payoffs
        if Z(t+1,1)==0
            r(:,:,t+1)=r0'-c*x(:,:,t+1)+(1-theta(:,t+1)').*P./n';
            R(:,t+1)=R0-c*X'+(1-theta(:,t+1)).*P';
        else
            Q=b2*N*Z(t+1,1)^be/(Z(t+1,1)^be+Z0^be);
            if ks'*f(:,t+1)==0
                r(:,:,t+1)=r0'-c*x(:,:,t+1)+(1-theta(:,t+1)').*P./n'+Q*ks(:,1)'./((ones(1,G)*ks(:,1))*n');
                R(:,t+1)=R0-c*X'+(1-theta(:,t+1)).*P'+ks(:,1)*Q./(ones(1,G)*ks(:,1));
            else
                r(:,:,t+1)=r0'-c*x(:,:,t+1)+(1-theta(:,t+1)').*P./n'+Q*(f(:,t+1).*ks(:,1))'./((f(:,t+1)'*ks(:,1))*n');
                R(:,t+1)=R0-c*X'+(1-theta(:,t+1)).*P'+(f(:,t+1).*ks(:,1))*Q/(f(:,t+1)'*ks(:,1));
            end
        end

    end

    X=(nansum(x(:,:,T),1))';
        I1=find((theta(:,T)==1)&(X(:,1)>0));
        coop(T)=size(I1,1);
        if coop(T)>0
            Xc=X(I1);
            stdX(T)=std(Xc);
            fc=f(I1,T);
            If=size(fc,1);
            for i=1:If
                gini(T)=gini(T)+sum(abs(fc-fc(i)));
            end
            gini(T)=gini(T)/(2*If*sum(fc));
        else
            stdX(T)=NaN;
            gini(T)=NaN;
        end

    Coop(1,runs)=nanmean(coop(T/2:T));
    Gini(1,runs)=nanmean(gini(T/2:T));
    StdX(1,runs)=nanmean(stdX(T/2:T));
end
end
