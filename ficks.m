global D DR N dx T;
D=0.1;
N=20;
L=4;
Tend = 15;

dx=L/N;

c0 = zeros(N,N);
alph=1;
A=10;
for i=1:N
	for j=1:N
		x=i*dx;
		y=j*dx;
		c0(i,j)=A * e^(-alph * ( (x-L/2)^2 + (y-L/2)^2 ) );
	end
end

T = -2*eye(N,N) + diag(ones(N-1,1),1)+ diag(ones(N-1,1),-1);
T(1,N)=1;
T(N,1)=1;

DR = diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
DR(1,N)  =-1;
DR(N,1)  =1;

function YP = fun(t,y)
	global N T dx D DR;
	c=reshape(y,N,N);

	cP = D/dx^2 * (T*c + c*T);
	cP += (DR*c + c*DR)/(2*dx);

	YP = vec(cP);
end

Y0 = vec(c0);

sol = ode45(@fun,[0,Tend],Y0);

cF=reshape(sol.y(:,end),N,N);

colormap('hot'); 
imagesc(cF)
