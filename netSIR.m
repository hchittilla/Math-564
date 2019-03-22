N=6;
Nf=20;

%%%%%%%%%%%%% Define I0 here

I0 = zeros(Nf,1);
I0(1) = 1;

%%%%%%%%%%%% end define I0

%%%%%%%%%%%%%% Define p here

pin=0.9;
pout=.5;

%p = pout * ones(Nf);
%p = p + (pin-pout)*eye(Nf);

p = zeros(Nf);
%p(1:(Nf/2),(Nf/2):Nf) = pout;
%p((Nf/2):Nf,1:(Nf/2)) = pout;

p(1:(Nf/2),(Nf/2+1):Nf) = (rand(Nf/2,Nf/2) < pout);
%p((Nf/2):Nf,1:(Nf/2)) = (rand(Nf/2,Nf/2) < pout);
p = max(p,p');
p = p - diag(diag(p));

%%%%%%%%%%%%%%%% end define p

Nruns=50;
Svals = zeros(Nruns,1);
for runIdx=1:Nruns
	I = I0';
	S = N-I0';
	while max(I)>0
		qq = (1-p).^I;
		q = prod(qq,2)';
		k=binornd(S,q);
		I=S-k;
		S=k;
	end
	Svals(runIdx) = sum(S);
end
%hist(Svals);
